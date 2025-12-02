import pool from "../config/db.js";

//Fonction qui va vérifier si un film est présent dans la table seance

export const checkFilmNoReservation = async function (filmId) {
  try {
    const sql = `
      SELECT COUNT(*) AS count
      FROM reservation r
      JOIN seance s ON s.id_seance = r.id_seance
      WHERE s.id_film = $1;
    `;
    const { rows } = await pool.query(sql, [filmId]);
    const count = parseInt(rows[0].count, 10);
    // true → aucune réservation (OK pour suppression)
    return count === 0;
  } catch (error) {
    console.error("Erreur SQL checkFilmNoReservation", error);
    throw new Error("Erreur modèle checkFilmNoReservation");
  }
};


// Vérifie si le film est lié à une ou plusieurs séances
export const checkFilmHasNoSeance = async function (filmId) {
  try {
    const sql = `SELECT COUNT(*) AS count FROM seance WHERE id_film = $1;`;
    const { rows } = await pool.query(sql, [filmId]);
    const count = parseInt(rows[0].count, 10);
    return count === 0; // true = aucune séance
  } catch (error) {
    console.error("Erreur SQL checkFilmHasNoSeance", error);
    throw new Error("Erreur modèle checkFilmHasNoSeance");
  }
};


export const deleteFilmById = async function (filmId) {
    try {
        const sql = `DELETE FROM film WHERE id_film = $1 RETURNING *;`;
        const values = [filmId];
        const {rows} = await pool.query(sql,values);
        return rows[0];
    } catch(error) {
        console.error("Erreur SQL deleteFilmById",error);
        throw new Error("Erreur modèle deleteFilmById");
    }
}

