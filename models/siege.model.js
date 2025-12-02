import pool from "../config/db.js";

/**
 * Récupère les sièges d'une séance donnée,
 * en indiquant leur statut (libre ou réservé).
 */
export const getSiegeBySeanceId = async (seanceId) => {
  try {
    const query = `
      SELECT 
        si.id_siege,
        si.numero_siege,
        si.type_siege,
        si.position_x,
        si.position_y,
        CASE 
          WHEN EXISTS (
            SELECT 1 
            FROM Reservation_Siege rs
            JOIN Reservation r ON rs.id_reservation = r.id_reservation
            WHERE rs.id_siege = si.id_siege AND r.id_seance = $1
          ) THEN 'reservé'
          ELSE 'libre'
        END AS statut
      FROM Siege si
      JOIN Salle sa ON si.id_salle = sa.id_salle
      JOIN Seance s ON s.id_salle = sa.id_salle
      WHERE s.id_seance = $1
      GROUP BY si.id_siege, si.numero_siege, si.type_siege, si.position_x, si.position_y
      ORDER BY si.numero_siege;
    `;

    const result = await pool.query(query, [seanceId]);
    return result.rows;
  } catch (error) {
    console.error("Erreur modèle (getSiegeBySeanceId) :", error.message);
    throw error; // On laisse le service ou contrôleur gérer le message utilisateur
  }
};
