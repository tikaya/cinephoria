import dotenv from 'dotenv';
dotenv.config({ path: '../.env' });

import { faker } from '@faker-js/faker';
import pool from '../config/db.js';

async function seed() {
  const client = await pool.connect();

  try {
    console.log('--- Nettoyage des tables ---');
    await client.query('TRUNCATE Reservation_Siege RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Siege RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Reservation RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Note RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Seance RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Salle RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Film RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Cinema RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Utilisateur RESTART IDENTITY CASCADE');

    console.log('--- Insertion des données ---');

    // --- 0. UTILISATEURS ---
    const userIds = [];
    for (let i = 0; i < 10; i++) {
      const nom = faker.person.lastName();
      const prenom = faker.person.firstName();
      const email = faker.internet.email();
      const username = faker.internet.userName();
      const motdepasse = 'hashed_password';
      const result = await client.query(
        `INSERT INTO Utilisateur (nom_user, prenom_user, username, email, mot_de_passe)
         VALUES ($1, $2, $3, $4, $5) RETURNING id_user`,
        [nom, prenom, username, email, motdepasse]
      );
      userIds.push(result.rows[0].id_user);
    }

    // --- 1. CINÉMAS ---
    const villes = [
      { nom: 'Cinéphoria Nantes', ville: 'Nantes' },
      { nom: 'Cinéphoria Bordeaux', ville: 'Bordeaux' },
      { nom: 'Cinéphoria Paris', ville: 'Paris' },
      { nom: 'Cinéphoria Toulouse', ville: 'Toulouse' },
      { nom: 'Cinéphoria Lille', ville: 'Lille' },
      { nom: 'Cinéphoria Charleroi', ville: 'Charleroi' },
      { nom: 'Cinéphoria Liège', ville: 'Liège' },
    ];
    const cinemaIds = [];
    for (const c of villes) {
      const adresse = faker.location.streetAddress();
      const telephone = faker.phone.number('+33#########');
      const result = await client.query(
        `INSERT INTO Cinema (nom_cinema, ville, adresse, telephone)
         VALUES ($1, $2, $3, $4) RETURNING id_cinema`,
        [c.nom, c.ville, adresse, telephone]
      );
      cinemaIds.push(result.rows[0].id_cinema);
    }

    // --- 2. SALLES + SIÈGES (capacite = nbSieges) ---
    const salleIds = [];
    const salleSieges = {}; // Associer salle -> sièges pour plus tard
    for (const cinemaId of cinemaIds) {
      const sallesCount = faker.number.int({ min: 2, max: 4 });
      for (let i = 0; i < sallesCount; i++) {
        const nbSieges = faker.number.int({ min: 50, max: 200 }); // Capacité réelle
        const nomSalle = `Salle ${i + 1}`;
        const qualite = faker.helpers.arrayElement(['HD', '4K', 'IMAX']);

        const salleResult = await client.query(
          `INSERT INTO Salle (nom_salle, capacite, qualite_projection, id_cinema) 
           VALUES ($1, $2, $3, $4) RETURNING id_salle`,
          [nomSalle, nbSieges, qualite, cinemaId]
        );
        const salleId = salleResult.rows[0].id_salle;
        salleIds.push(salleId);

        const sieges = [];
        for (let j = 0; j < nbSieges; j++) {
          const numero = `${String.fromCharCode(65 + Math.floor(j / 10))}${(j % 10) + 1}`;
          const type = faker.helpers.arrayElement(['STANDARD', 'PMR']);
          const posX = faker.number.int({ min: 0, max: 20 });
          const posY = faker.number.int({ min: 0, max: 20 });

          const siegeResult = await client.query(
            `INSERT INTO Siege (numero_siege, type_siege, position_x, position_y, id_salle)
             VALUES ($1, $2, $3, $4, $5) RETURNING id_siege`,
            [numero, type, posX, posY, salleId]
          );
          sieges.push(siegeResult.rows[0].id_siege);
        }
        salleSieges[salleId] = sieges; // Stocker les sièges de la salle
      }
    }

    // --- 3. FILMS ---
    const filmIds = [];
    for (let i = 0; i < 15; i++) {
      const titre = faker.commerce.productName();
      const description = faker.lorem.paragraph();
      const ageMin = faker.number.int({ min: 0, max: 18 });
      const coupDeCoeur = faker.datatype.boolean();
      const genre = faker.music.genre();
      const affiche = faker.image.urlLoremFlickr({ category: 'cinema' });
      const dateAjout = faker.date.recent({ days: 30 });

      const result = await client.query(
        `INSERT INTO Film (titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url, date_ajout) 
         VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id_film`,
        [titre, description, ageMin, coupDeCoeur, genre, affiche, dateAjout]
      );
      filmIds.push(result.rows[0].id_film);
    }

    // --- 4. SÉANCES ---
    const seanceIds = [];
    const seancePrix = {};
    for (const filmId of filmIds) {
      const seancesCount = faker.number.int({ min: 2, max: 5 });
      for (let i = 0; i < seancesCount; i++) {
        const dateSeance = faker.date.between({ from: '2025-07-15', to: '2025-12-25' });
        const heureDebut = new Date(dateSeance);
        heureDebut.setHours(faker.number.int({ min: 10, max: 20 }), faker.number.int({ min: 0, max: 59 }));
        const heureFin = new Date(heureDebut.getTime() + 2 * 60 * 60 * 1000);

        const qualite = faker.helpers.arrayElement(['HD', '4K', 'IMAX']);
        const prix = parseFloat(faker.commerce.price({ min: 5, max: 20, dec: 2 }));
        const salleId = faker.helpers.arrayElement(salleIds);

        const result = await client.query(
          `INSERT INTO Seance (date_seance, heure_debut, heure_fin, qualite_projection, prix, id_salle, id_film)
           VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id_seance`,
          [
            dateSeance.toISOString().split('T')[0],
            heureDebut.toTimeString().slice(0, 8),
            heureFin.toTimeString().slice(0, 8),
            qualite,
            prix,
            salleId,
            filmId
          ]
        );
        const idSeance = result.rows[0].id_seance;
        seanceIds.push(idSeance);
        seancePrix[idSeance] = prix;
      }
    }

    // --- 5. NOTES ---
    for (const seanceId of seanceIds) {
      const filmRow = await client.query(`SELECT id_film FROM Seance WHERE id_seance = $1`, [seanceId]);
      const filmId = filmRow.rows[0].id_film;
      const notesCount = faker.number.int({ min: 3, max: 7 });
      for (let i = 0; i < notesCount; i++) {
        const note = faker.number.int({ min: 0, max: 10 });
        const commentaire = faker.lorem.sentence();
        const valide = faker.datatype.boolean();
        const userId = faker.helpers.arrayElement(userIds);
        await client.query(
          `INSERT INTO Note (note, commentaire, valide_par_employe, id_user, id_film, id_seance)
           VALUES ($1, $2, $3, $4, $5, $6)`,
          [note, commentaire, valide, userId, filmId, seanceId]
        );
      }
    }

    // --- 6. RÉSERVATIONS (max 40 % de sièges réservés par séance, sans doublons) ---
    const etats = ['payée', 'en attente', 'annulée'];

    for (const idSeance of seanceIds) {
      const salleRow = await client.query(`SELECT id_salle FROM Seance WHERE id_seance = $1`, [idSeance]);
      const salleId = salleRow.rows[0].id_salle;

      const tousLesSieges = salleSieges[salleId];
      const nbMaxReserves = Math.floor(tousLesSieges.length * 0.4); // 40% max

      const siegesReserves = faker.helpers.shuffle(tousLesSieges).slice(0, nbMaxReserves);

      let indexSiege = 0;
      while (indexSiege < siegesReserves.length) {
        const idUser = faker.helpers.arrayElement(userIds);
        const nbPlaces = faker.number.int({ min: 1, max: Math.min(6, siegesReserves.length - indexSiege) });
        const prixTotal = (seancePrix[idSeance] * nbPlaces).toFixed(2);
        const etat = faker.helpers.arrayElement(etats);

        const reservationResult = await client.query(
          `INSERT INTO Reservation (nombre_places, prix_total, etat, id_user, id_seance)
           VALUES ($1, $2, $3, $4, $5) RETURNING id_reservation`,
          [nbPlaces, prixTotal, etat, idUser, idSeance]
        );
        const idReservation = reservationResult.rows[0].id_reservation;

        const siegesPourReservation = siegesReserves.slice(indexSiege, indexSiege + nbPlaces);
        for (const idSiege of siegesPourReservation) {
          await client.query(
            `INSERT INTO Reservation_Siege (id_reservation, id_siege) VALUES ($1, $2)`,
            [idReservation, idSiege]
          );
        }
        indexSiege += nbPlaces;
      }
    }

    // --- Vérification automatique ---
    console.log('--- Vérification des données ---');

    const doublons = await client.query(`
      SELECT r.id_seance, rs.id_siege, COUNT(*) AS nb
      FROM Reservation_Siege rs
      JOIN Reservation r ON rs.id_reservation = r.id_reservation
      GROUP BY r.id_seance, rs.id_siege
      HAVING COUNT(*) > 1;
    `);
    console.log(doublons.rowCount ? `⚠️ Doublons détectés: ${doublons.rowCount}` : '✔️ Aucun doublon par siège.');

    const capaciteCheck = await client.query(`
      SELECT sa.id_salle, sa.capacite, COUNT(si.id_siege) AS nb_sieges
      FROM Salle sa
      LEFT JOIN Siege si ON sa.id_salle = si.id_salle
      GROUP BY sa.id_salle, sa.capacite
      HAVING sa.capacite != COUNT(si.id_siege);
    `);
    console.log(capaciteCheck.rowCount ? `⚠️ Incohérences capacité: ${capaciteCheck.rowCount}` : '✔️ Capacités OK.');

    console.log('--- Données générées avec succès ! ---');

  } catch (err) {
    console.error('Erreur lors du seed :', err);
  } finally {
    client.release();
    pool.end();
  }
}

seed();
