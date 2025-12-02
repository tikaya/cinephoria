import pool from "../config/db.js";


//Fonction permettant inssertion du film
export const insertFilm =async function(
    titreClean,
    genreClean,
    descriptionClean,
    afficheUrlClean,
    ageMin,
    coupDeCoeur
) {
    const query = `
    INSERT INTO film (
      titre,
      description,
      genre,
      age_minimum,
      label_coup_de_coeur,
      affiche_url
    )
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *;
  `;

  // ⚠️ Ordre cohérent avec les colonnes dans la requête
  const values = [
    titreClean,         // $1 → titre
    descriptionClean,   // $2 → description
    genreClean,         // $3 → genre
    ageMin,             // $4 → age_minimum
    coupDeCoeur,        // $5 → label_coup_de_coeur
    afficheUrlClean     // $6 → affiche_url
  ];

    
    try {
        const {rows} = await pool.query(query,values);
        return rows[0];
    } catch (error) {
        console.error("Erreur SQL insertFilm",error)
        throw new Error("Erreur modèle insertfilm");
    }

};

//Fonction permettant de vérifier que le titre est unique (existe pas déja dans la DB)

export const checkDuplicateFilm = async function (titreClean) {
    const query = `SELECT 1 FROM film WHERE lower(titre) = lower($1)`;
    const {rowCount} = await pool.query(query,[titreClean]);
    return rowCount > 0;
};


export const filmRecup = async function() {
  const query = `SELECT * FROM film`;
  const {rows} = await pool.query(query);
  return rows;
}