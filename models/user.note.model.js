import pool from "../config/db.js";

// Vérifie si la séance est passée
export async function isSeancePassedModel(idSeance) {
  const query = `
    SELECT date_seance, heure_fin
    FROM seance
    WHERE id_seance = $1
  `;
  const result = await pool.query(query, [idSeance]);

  if (!result.rowCount) return false;

  const { date_seance, heure_fin } = result.rows[0];

  // Convertir date PG en AAAA-MM-DD
  const dateLocal = date_seance.toISOString().split("T")[0];

  // Extraire hh:mm:ss
  const [hh, mm, ss] = heure_fin.split(":");

  // Créer date complète sans UTC
  const finalDate = new Date(
    dateLocal + "T" + hh + ":" + mm + ":" + ss
  );

  // Forcer en date locale
  const localFinal = new Date(
    finalDate.getFullYear(),
    finalDate.getMonth(),
    finalDate.getDate(),
    finalDate.getHours(),
    finalDate.getMinutes(),
    finalDate.getSeconds()
  );

  return localFinal < new Date();
}


// Vérifie si l'utilisateur a déjà noté cette séance
export async function userAlreadyNotedModel(idUser, idFilm, idSeance) {
  const query = `
    SELECT 1
    FROM note
    WHERE id_user = $1
      AND id_film = $2
      AND id_seance = $3
    LIMIT 1
  `;
  const result = await pool.query(query, [idUser, idFilm, idSeance]);
  return result.rowCount > 0;
}

export async function getReservationDetailsModel(idReservation) {
  const query = `
    SELECT 
      r.id_reservation,
      r.id_user,
      r.id_seance,
      f.id_film,
      f.titre,
      s.date_seance,
      s.heure_debut,
      s.heure_fin
    FROM reservation r
    JOIN seance s ON s.id_seance = r.id_seance
    JOIN film f ON f.id_film = s.id_film
    WHERE r.id_reservation = $1
    LIMIT 1
  `;
  const result = await pool.query(query, [idReservation]);
  return result.rows[0];
};

export async function insertUserNoteModel(idUser, idFilm, idSeance, note, description) {
  const query = `
    INSERT INTO note (id_user, id_film, id_seance, note, commentaire)
    VALUES ($1, $2, $3, $4, $5)
  `;
  await pool.query(query, [idUser, idFilm, idSeance, note, description]);
};