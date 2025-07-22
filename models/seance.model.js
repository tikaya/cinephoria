// Importons l'objet pool depuis bd.js
import pool from "../config/db.js";

// Exportons notre fonction modèle qui retourne les séances à venir
export const filmSeance = async (filmId) => {
  try {
    const query = `
      SELECT
        s.date_seance AS date_projection,
        s.heure_debut,
        s.heure_fin,
        sa.qualite_projection,
        s.prix
      FROM seance s
      JOIN salle sa ON s.id_salle = sa.id_salle
      WHERE s.id_film = $1
        AND (s.date_seance > CURRENT_DATE 
             OR (s.date_seance = CURRENT_DATE AND s.heure_debut >= CURRENT_TIME))
      ORDER BY s.date_seance, s.heure_debut;
    `;

    const result = await pool.query(query, [filmId]);
    return result.rows.length ? result.rows : [{ message: "Aucune séance trouvée" }];
  } catch (error) {
    console.error("Erreur lors de la récupération des données :", error);
    throw error; // On laisse le service décider quoi faire (message, etc.)
  }
};

// Export du titre du film
export const filmTitre = async (filmId) => {
  try {
    const query = `
      SELECT titre 
      FROM film 
      WHERE id_film = $1;
    `;
    const result = await pool.query(query, [filmId]);
    return result.rows.length ? result.rows[0].titre : "Film inconnu";
  } catch (error) {
    console.error("Erreur lors de la récupération du titre :", error);
    throw error;
  }
};
