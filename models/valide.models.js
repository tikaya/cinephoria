import pool from "../config/db.js";

// 🔹 Transaction : création d'une réservation + insertion des sièges associés
export const reserverAvecSieges = async (id_user, id_seance, sieges, nombre_places, prix_total) => {
  const client = await pool.connect(); // ← autorisé ici car c'est une transaction
  try {
    await client.query("BEGIN");

    const insertReservationQuery = `
      INSERT INTO reservation (id_user, id_seance, prix_total, nombre_places, etat)
      VALUES ($1, $2, $3, $4, 'EN_ATTENTE')
      RETURNING id_reservation
    `;
    const res = await client.query(insertReservationQuery, [
      id_user,
      id_seance,
      prix_total,
      nombre_places,
    ]);

    const id_reservation = res.rows[0].id_reservation;

    const insertSiegeQuery = `
      INSERT INTO reservation_siege (id_reservation, id_siege)
      VALUES ($1, $2)
    `;

    for (const id_siege of sieges) {
      await client.query(insertSiegeQuery, [id_reservation, id_siege]);
    }

    await client.query("COMMIT");
    return id_reservation;
  } catch (err) {
    await client.query("ROLLBACK");
    console.error("Erreur dans la transaction réservation + sièges :", err);
    throw err;
  } finally {
    client.release(); // ← libère toujours la connexion
  }
};

// 🔹 Requête simple → pas besoin de .connect()
export const findSeanceById = async (id_seance) => {
  const query = `
    SELECT EXISTS (
      SELECT 1 FROM seance WHERE id_seance = $1
    )
  `;

  try {
    const result = await pool.query(query, [id_seance]); // ← suffisant
    return result.rows[0].exists;
  } catch (error) {
    console.error("Erreur model (findSeanceById) :", error.message);
    throw new Error("Impossible de vérifier l'existence de la séance");
  }
};

export const findSiegesByIds = async (ids_sieges) => {
  const query = `
    SELECT id_siege 
    FROM siege 
    WHERE id_siege = ANY($1)
  `;

  try {
    const result = await pool.query(query, [ids_sieges]); // ← pas de .connect()
    return result.rows;
  } catch (error) {
    console.error("Erreur model (findSiegesByIds) :", error.message);
    throw new Error("Impossible de vérifier si les sièges existent");
  }
};

export const checkSiegesAlreadyReserved = async (ids_sieges, id_seance) => {
  const query = `
    SELECT rs.id_siege
    FROM reservation_siege rs
    JOIN reservation r ON rs.id_reservation = r.id_reservation
    WHERE r.id_seance = $1 AND rs.id_siege = ANY($2)
  `;

  try {
    const result = await pool.query(query, [id_seance, ids_sieges]); // ← simple SELECT
    return result.rows;
  } catch (error) {
    console.error("Erreur model (checkSiegesAlreadyReserved):", error.message);
    throw new Error("Impossible de vérifier si les sièges sont déjà réservés");
  }
};
