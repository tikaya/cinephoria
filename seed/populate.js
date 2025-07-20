import dotenv from 'dotenv';
dotenv.config({ path: '../.env' });

import { faker } from '@faker-js/faker';
import pool from '../config/db.js';

console.log('DB_PASSWORD:', process.env.DB_PASSWORD, typeof process.env.DB_PASSWORD);

async function seed() {
  const client = await pool.connect();

  try {
    console.log('--- Nettoyage des tables ---');
    await client.query('TRUNCATE Note RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Seance RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Salle RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Film RESTART IDENTITY CASCADE');
    await client.query('TRUNCATE Cinema RESTART IDENTITY CASCADE');

    console.log('--- Insertion des données ---');

    // --- 1. CINÉMAS CINÉPHORIA (7 fixes : 5 FR, 2 BE) ---
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
      const telephone = faker.phone.number('+33#########'); // Format FR/BE
      const result = await client.query(
        `INSERT INTO Cinema (nom_cinema, ville, adresse, telephone)
         VALUES ($1, $2, $3, $4) RETURNING id_cinema`,
        [c.nom, c.ville, adresse, telephone]
      );
      cinemaIds.push(result.rows[0].id_cinema);
    }
    console.log(`Cinémas créés : ${cinemaIds.length}`);

    // --- 2. SALLES (2 à 4 par cinéma) ---
    const salleIds = [];
    for (const cinemaId of cinemaIds) {
      const sallesCount = faker.number.int({ min: 2, max: 4 });
      for (let i = 0; i < sallesCount; i++) {
        const nomSalle = `Salle ${i + 1}`;
        const capacite = faker.number.int({ min: 50, max: 300 });
        const qualite = faker.helpers.arrayElement(['HD', '4K', 'IMAX']);
        const result = await client.query(
          `INSERT INTO Salle (nom_salle, capacite, qualite_projection, id_cinema) 
           VALUES ($1, $2, $3, $4) RETURNING id_salle`,
          [nomSalle, capacite, qualite, cinemaId]
        );
        salleIds.push(result.rows[0].id_salle);
      }
    }
    console.log(`Salles créées : ${salleIds.length}`);

    // --- 3. FILMS (15, dont 5 ajoutés un mercredi) ---
    const filmIds = [];
    for (let i = 0; i < 15; i++) {
      const titre = faker.commerce.productName();
      const description = faker.lorem.paragraph();
      const ageMin = faker.number.int({ min: 0, max: 18 });
      const coupDeCoeur = faker.datatype.boolean();
      const genre = faker.music.genre();
      const affiche = faker.image.urlLoremFlickr({ category: 'cinema' });

      let dateAjout;

      if (i < 5) {
        let randomDate = faker.date.recent({ days: 30 });
        let day = randomDate.getDay(); // 0=dimanche, 3=mercredi
        let diff = (day >= 3) ? (day - 3) : (7 - (3 - day));
        randomDate.setDate(randomDate.getDate() - diff);

        // Sécuriser pour rester dans les 30 jours
        const jours = (new Date() - randomDate) / (1000 * 60 * 60 * 24);
        if (jours > 30) {
          randomDate = faker.date.recent({ days: 7 });
        }
        dateAjout = randomDate;
      } else {
        dateAjout = faker.date.recent({ days: 30 });
      }

      const result = await client.query(
        `INSERT INTO Film (titre, description, age_minimum, label_coup_de_coeur, genre, affiche_url, date_ajout) 
         VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id_film`,
        [titre, description, ageMin, coupDeCoeur, genre, affiche, dateAjout]
      );
      filmIds.push(result.rows[0].id_film);
    }
    console.log(`Films créés : ${filmIds.length}`);

    // --- 4. SÉANCES (avec date + heures cohérentes) ---
    const seanceIds = [];
    for (const filmId of filmIds) {
      const seancesCount = faker.number.int({ min: 2, max: 5 });
      for (let i = 0; i < seancesCount; i++) {
        const dateSeance = faker.date.between({ from: '2025-07-15', to: '2025-07-25' });

        // Générer heures cohérentes à partir de dateSeance
        const heureDebut = new Date(dateSeance);
        heureDebut.setHours(
          faker.number.int({ min: 10, max: 20 }),
          faker.number.int({ min: 0, max: 59 })
        );
        const heureFin = new Date(heureDebut.getTime() + 2 * 60 * 60 * 1000);

        const qualite = faker.helpers.arrayElement(['HD', '4K', 'IMAX']);
        const prix = faker.commerce.price({ min: 5, max: 20, dec: 2 });
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
        seanceIds.push(result.rows[0].id_seance);
      }
    }
    console.log(`Séances créées : ${seanceIds.length}`);

    // --- 5. NOTES (liées correctement au film de la séance) ---
    const validUsers = [1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12];
    for (const seanceId of seanceIds) {
      // Récupérer le film lié à la séance
      const filmRow = await client.query(`SELECT id_film FROM Seance WHERE id_seance = $1`, [seanceId]);
      const filmId = filmRow.rows[0].id_film;

      const notesCount = faker.number.int({ min: 3, max: 7 });
      for (let i = 0; i < notesCount; i++) {
        const note = faker.number.int({ min: 0, max: 10 });
        const commentaire = faker.lorem.sentence();
        const valide = faker.datatype.boolean();
        const userId = faker.helpers.arrayElement(validUsers);
        await client.query(
          `INSERT INTO Note (note, commentaire, valide_par_employe, id_user, id_film, id_seance)
           VALUES ($1, $2, $3, $4, $5, $6)`,
          [note, commentaire, valide, userId, filmId, seanceId]
        );
      }
    }
    console.log('--- Données générées avec succès ! ---');

  } catch (err) {
    console.error('Erreur lors de l’insertion :', err);
  } finally {
    client.release();
    pool.end();
  }
}

seed();
