import pool from "../config/db.js";

/**
 * Récupère les films avec filtres et regroupe les séances/cinémas
 * pour éviter les doublons.
 */
export const filmFilter = async (cinemaId = null, genre = null, date = null) => {
  const query = `
    SELECT 
      f.id_film,
      f.titre,
      f.description,
      f.age_minimum,
      f.label_coup_de_coeur,
      f.genre,
      f.affiche_url,
      COALESCE(ROUND(AVG(n.note) / 2, 1), 0) AS note_moyenne,
      
      -- On regroupe les séances/cinémas dans un tableau JSON
      COALESCE(JSON_AGG(DISTINCT JSONB_BUILD_OBJECT(
        'cinema', c.nom_cinema,
        'date', s.date_seance,
        'heure_debut', s.heure_debut,
        'heure_fin', s.heure_fin
      )) FILTER (WHERE s.id_seance IS NOT NULL), '[]') AS seances

    FROM Film f
    LEFT JOIN Note n ON n.id_film = f.id_film
    LEFT JOIN Seance s ON s.id_film = f.id_film
    LEFT JOIN Salle sa ON sa.id_salle = s.id_salle
    LEFT JOIN Cinema c ON c.id_cinema = sa.id_cinema

    WHERE 
      ($1::INT IS NULL OR c.id_cinema = $1)
      AND ($2::TEXT IS NULL OR f.genre = $2)
      AND ($3::DATE IS NULL OR s.date_seance = $3)

    GROUP BY 
      f.id_film, f.titre, f.description, f.age_minimum,
      f.label_coup_de_coeur, f.genre, f.affiche_url
    ORDER BY f.titre;
  `;

  const result = await pool.query(query, [cinemaId, genre, date]);
  return result.rows;
};

/** Récupère la liste des genres distincts */
export const getAllGenres = async () => {
  const result = await pool.query(`
    SELECT DISTINCT genre 
    FROM Film
    ORDER BY genre;
  `);
  return result.rows.map(row => row.genre);
};
