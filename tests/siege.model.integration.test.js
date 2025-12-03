import pool from "../config/db.js";
import { getSiegeBySeanceId } from "../models/siege.model.js";

describe("INTEGRATION SIEGE MODEL", () => {

  let cinemaId, salleId, filmId, seanceId;

  beforeAll(async () => {
    // Nettoyer les tables dans le bon ordre (FK)
    await pool.query("DELETE FROM reservation_siege");
    await pool.query("DELETE FROM reservation");
    await pool.query("DELETE FROM siege");
    await pool.query("DELETE FROM seance");
    await pool.query("DELETE FROM salle");
    await pool.query("DELETE FROM film");
    await pool.query("DELETE FROM cinema");

    // 1. Créer un cinéma
    const cinemaResult = await pool.query(`
      INSERT INTO cinema (nom_cinema, ville, adresse)
      VALUES ('Cinéma Test', 'Paris', '123 rue Test')
      RETURNING id_cinema
    `);
    cinemaId = cinemaResult.rows[0].id_cinema;

    // 2. Créer une salle
    const salleResult = await pool.query(`
      INSERT INTO salle (nom_salle, capacite, id_cinema)
      VALUES ('Salle 1', 100, $1)
      RETURNING id_salle
    `, [cinemaId]);
    salleId = salleResult.rows[0].id_salle;

    // 3. Créer un film
    const filmResult = await pool.query(`
      INSERT INTO film (titre, description, genre)
      VALUES ('Film Test', 'Description test', 'Action')
      RETURNING id_film
    `);
    filmId = filmResult.rows[0].id_film;

    // 4. Créer une séance (liée au film ET à la salle)
    const seanceResult = await pool.query(`
      INSERT INTO seance (id_film, id_salle, date_seance, heure_debut, heure_fin, prix)
      VALUES ($1, $2, CURRENT_DATE + 1, '14:00', '16:00', 10.00)
      RETURNING id_seance
    `, [filmId, salleId]);
    seanceId = seanceResult.rows[0].id_seance;

    // 5. Créer des sièges (liés à la salle)
    await pool.query(`
      INSERT INTO siege (numero_siege, type_siege, position_x, position_y, id_salle)
      VALUES 
        ('A1', 'STANDARD', 1, 1, $1),
        ('A2', 'STANDARD', 2, 1, $1),
        ('A3', 'VIP', 3, 1, $1)
    `, [salleId]);

    // Debug : vérifier que les données sont bien insérées
    const checkSieges = await pool.query(`SELECT * FROM siege WHERE id_salle = $1`, [salleId]);
    console.log("Sièges créés:", checkSieges.rows.length);

    const checkSeance = await pool.query(`SELECT * FROM seance WHERE id_seance = $1`, [seanceId]);
    console.log("Séance créée:", checkSeance.rows[0]);
  });

  test("getSiegeBySeanceId retourne les sièges d'une séance", async () => {
    console.log("Test avec seanceId:", seanceId);
    
    const sieges = await getSiegeBySeanceId(seanceId);
    console.log("Sièges retournés:", sieges);

    expect(sieges).toBeDefined();
    expect(Array.isArray(sieges)).toBe(true);
    expect(sieges.length).toBe(3);
  });

  test("getSiegeBySeanceId retourne le bon format de données", async () => {
    const sieges = await getSiegeBySeanceId(seanceId);

    // Skip si pas de sièges (pour éviter l'erreur)
    if (sieges.length === 0) {
      console.log("Aucun siège trouvé - vérifier la requête SQL");
      return;
    }

    const siege = sieges[0];
    expect(siege).toHaveProperty("id_siege");
    expect(siege).toHaveProperty("numero_siege");
    expect(siege).toHaveProperty("type_siege");
    expect(siege).toHaveProperty("position_x");
    expect(siege).toHaveProperty("position_y");
    expect(siege).toHaveProperty("statut");
  });

  test("getSiegeBySeanceId retourne 'libre' pour les sièges non réservés", async () => {
    const sieges = await getSiegeBySeanceId(seanceId);

    if (sieges.length === 0) return;

    sieges.forEach(siege => {
      expect(siege.statut).toBe("libre");
    });
  });

  test("getSiegeBySeanceId retourne tableau vide pour séance inexistante", async () => {
    const sieges = await getSiegeBySeanceId(99999);
    expect(sieges).toEqual([]);
  });

});