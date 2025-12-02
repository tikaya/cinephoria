import pool from "../config/db.js";

export async function getReservationsByUserModel(idUser) {
  const query = `
    SELECT 
      r.id_reservation,
      r.id_seance,
      r.nombre_places,
      r.prix_total,
      r.etat,
      s.date_seance,
      s.heure_debut,
      s.heure_fin,
      f.id_film,
      f.titre
    FROM reservation r
    JOIN seance s ON r.id_seance = s.id_seance
    JOIN film f ON s.id_film = f.id_film
    WHERE r.id_user = $1
    ORDER BY s.date_seance DESC
  `;

  const result = await pool.query(query, [idUser]);
  return result.rows;
}
