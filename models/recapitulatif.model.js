import pool from '../config/db.js';

export const getPrixBySeanceId = async (seanceId) => {
  try {
    const query = `
      SELECT 
        s.id_seance,
        c.id_cinema,
        f.id_film,
        s.prix AS prix_unitaire,
        s.date_seance,
        s.heure_debut,
        s.heure_fin,
        sa.nom_salle,
        c.nom_cinema,
        f.titre AS film_titre
      FROM Seance s
      JOIN Salle sa ON s.id_salle = sa.id_salle
      JOIN Cinema c ON sa.id_cinema = c.id_cinema
      JOIN Film f ON s.id_film = f.id_film
      WHERE s.id_seance = $1;
    `;
    const result = await pool.query(query, [seanceId]);
    return result.rows.length ? result.rows[0] : null;
  } catch (error) {
    console.error("Erreur modèle (getPrixBySeanceId):", error.message);
    throw new Error("Impossible de récupérer le prix et les infos de séance.");
  }
};
