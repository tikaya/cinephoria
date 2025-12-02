import pool  from "../config/db.js";

//Function qui va retouner les données du film selectionner par employé

export const getDataFilm = async function (filmId) {
  const query = `
    SELECT
      id_film,
      titre,
      description,
      age_minimum,
      label_coup_de_coeur,
      genre,
      affiche_url
    FROM film
    WHERE id_film = $1;
  `;

  const values = [filmId];

  try {
    const { rows } = await pool.query(query, values);

    // 🟡 Vérification : aucun film trouvé
    if (rows.length === 0) {
      throw new Error(`Aucun film trouvé avec l'id ${filmId}`);
    }

    return rows[0];
  } catch (error) {
    // 🟥 Journalisation (utile pour le débogage)
    console.error("Erreur SQL dans getDataFilm:", error);

    // 🟨 Relance une erreur propre, plus lisible pour le contrôleur
    throw new Error("Impossible de récupérer les données du film.");
  }
};




export const updateFilmData = async function (
  titre,
  description,
  age_minimum,
  label_coup_de_coeur,
  genre,
  affiche_url,
  filmId
) {
  const query = `
    UPDATE film
    SET 
      titre = $1,
      description = $2,
      age_minimum = $3,
      label_coup_de_coeur = $4,
      genre = $5,
      affiche_url = $6
    WHERE id_film = $7
    RETURNING *;
  `;

  const values = [
    titre,
    description,
    age_minimum,
    label_coup_de_coeur,
    genre,
    affiche_url,
    filmId
  ];

 try {
  const { rows } = await pool.query(query, values);
  if (rows.length === 0) {
    console.warn(`⚠️ Aucun film trouvé avec id_film = ${filmId}`);
    return null;
  }
  return rows[0];
} catch (error) {
  console.error("❌ Erreur SQL dans updateFilmData:", error);
  throw error; // ✅ on renvoie l’erreur brute, pas un message générique
}

};
