
import { da } from "@faker-js/faker";
import pool from "../config/db.js";

// ✅ Fonction qui récupère tous les films disponibles dans la base
export const listFilms = async function() {
  try {
    const sql = `
      SELECT id_film, titre
      FROM film
      ORDER BY titre ASC;
    `;
    const { rows } = await pool.query(sql);
    return rows; // tableau [{ id_film, titre }, ...]
  } catch (error) {
    console.error("Erreur lors de la récupération des films :", error);
    throw new Error("Erreur modèle : impossible de récupérer la liste des films.");
  }
};

// ✅ Fonction qui récupère les salles disponibles dans la base
export const listSalles = async function() {
    try {
        const sql =` SELECT 
    s.id_salle,
     s.nom_salle,
    c.nom_cinema
    FROM salle s
    JOIN cinema c ON s.id_cinema = c.id_cinema
ORDER BY c.nom_cinema, s.nom_salle;
`;
const {rows} = await pool.query(sql);
return rows; //tableau [{id_salle,nom_salle,nom_cinema},...]
    } catch (error) {
        console.error("Erreur lors de la récupération des salles :", error);
        throw new Error("Erreur modèle : impossible de récupérer la liste des salles.");
    }
}

//Fonction qui va vérifier si la salle sélectionée est deja occupé à intervale  d'heure 
// par une autre séance
 
export const checkSalleAvailability = async function (id_salle, date_seance, heure_debut, heure_fin) {
    try {
      const sql = `
      SELECT COUNT(*) AS conflit
      FROM seance
      WHERE id_salle = $1
        AND date_seance = $2
        AND (
              heure_debut < $4
          AND heure_fin   > $3
        );
    `;
    const values = [id_salle,date_seance,heure_debut,heure_fin];
    const {rows} = await pool.query(sql,values);
    const conflit = parseInt(rows[0].conflit,10);
    return conflit === 0; //True si aucun conflit (salle dispo pour le creanux horaire) , false sinon

    } catch (error) {
        console.error("Erreur SQL checkSalleAvailability :", error);
        throw new Error("Erreur modèle : impossible de vérifier la disponibilité de la salle.");
    }
}

export const verifyFilmAndSalleExistence = async function (id_film, id_salle) {
  try {
    const sql = `
      SELECT 
        (SELECT COUNT(*) FROM film WHERE id_film = $1) AS film_exists,
        (SELECT COUNT(*) FROM salle WHERE id_salle = $2) AS salle_exists
    `;
    const values = [id_film, id_salle];
    const { rows } = await pool.query(sql, values);

    const filmExists = parseInt(rows[0].film_exists, 10) > 0;
    const salleExists = parseInt(rows[0].salle_exists, 10) > 0;

    return { filmExists, salleExists };

  } catch (error) {
    console.error("Erreur SQL verifyFilmAndSalleExistence :", error);
    throw new Error("Erreur modèle : impossible de vérifier l'existence du film et de la salle.");
  }
};


export const insertSeance = async function (
  id_film,
  id_salle,
  date_seance,
  heure_debut,
  heure_fin,
  prix,
  qualite_projection
) {
  try {
    const sql = `
      INSERT INTO seance
        (id_film, id_salle, date_seance, heure_debut, heure_fin, prix, qualite_projection)
      VALUES ($1, $2, $3, $4, $5, $6, $7)
      RETURNING *;
    `;

    const values = [
      id_film,
      id_salle,
      date_seance,
      heure_debut,
      heure_fin,
      prix,
      qualite_projection,
    ];

    const { rows } = await pool.query(sql, values);
    return rows[0]; // retourne la séance insérée

  } catch (error) {
    console.error("Erreur SQL insertSeance :", error);
    throw new Error("Erreur modèle : impossible d'insérer la séance.");
  }
};


//Fonction qui va charger tous les seances existantes dans la BDD

export const getAllSeances = async function () {
  try {
    const sql = `
    SELECT s.*, f.titre AS film_titre, sa.nom_salle, c.nom_cinema
FROM seance s
JOIN film f ON s.id_film = f.id_film
JOIN salle sa ON s.id_salle = sa.id_salle
JOIN cinema c ON sa.id_cinema = c.id_cinema
ORDER BY s.date_seance DESC, s.heure_debut DESC;
`;

    const {rows} = await pool.query(sql);
    return rows; //tableau [{seance1},{seance2},...]
  } catch (error) {
    console.error("Erreur SQL getAllSeances:",error);
    throw new Error("Erreur modèle : impossible de récupérer les séances.");
  }
}

//Fonction qui va recuperer les données pour une seance selectionnée
export const  getSeanceById = async function (seanceId) {
  try {
    const sql = `SELECT s.*, f.titre AS film_titre, sa.nom_salle, c.nom_cinema
                  FROM seance s
                  JOIN film f ON s.id_film = f.id_film
                  JOIN salle sa ON s.id_salle = sa.id_salle
                  JOIN cinema c ON sa.id_cinema = c.id_cinema
                  WHERE s.id_seance = $1
                  ORDER BY s.date_seance DESC, s.heure_debut DESC;`;
    const values = [seanceId];
    const {rows} = await pool.query(sql,values);
    return rows[0]; //objet seance
  } catch (error) {
    console.error("Erreur SQL getSeanceById:",error);
    throw new Error("Erreur modèle : impossible de récupérer la séance par ID.");
  }
}



//Fonction qui va mettre à jour une séance existante
export const updateSeance = async function(heure_debut,heure_fin,prix,qualite_projection,id_salle,id_film,date_seance,id_seance) {
  //Le sql de mise à jour sera ici
  const sql = `UPDATE seance 
  SET heure_debut = $1, 
  heure_fin = $2, 
  prix = $3, 
  qualite_projection = $4,
  id_salle=$5, 
  id_film=$6,
  date_seance=$7
  WHERE id_seance = $8
  RETURNING *;`;

  //Donnons à postgres les valeurs à injecter dans le sql
  const values = [heure_debut,heure_fin,prix,qualite_projection,id_salle,id_film,date_seance,id_seance];
  try {
    const {rows} = await pool.query(sql,values);
    return rows[0];
  
  } catch (error) {
    console.error("Erreur SQL updateSeance:",error);
    throw new Error("Erreur modèle : impossible de mettre à jour la séance.");
  }
}

//Fonction qui va vérifier si la salle sélectionée est deja occupé à intervale  d'heure 
// par une autre séance en exluant interieurement la séance en cours de modification
 
export const checkSalleAvailabilityForUpdate = async function (id_salle, date_seance, heure_debut, heure_fin,id_seance) {
    try {
      const sql = `
      SELECT COUNT(*) AS conflit
      FROM seance
      WHERE id_salle = $1
        AND date_seance = $2
        AND (
              heure_debut < $4
          AND heure_fin   > $3
        )
        AND id_seance <> $5;
    `;
    const values = [id_salle,date_seance,heure_debut,heure_fin,id_seance];
    const {rows} = await pool.query(sql,values);
    const conflit = parseInt(rows[0].conflit,10);
    return conflit === 0; //True si aucun conflit (salle dispo pour le creanux horaire) , false sinon

    } catch (error) {
        console.error("Erreur SQL checkSalleAvailability :", error);
        throw new Error("Erreur modèle : impossible de vérifier la disponibilité de la salle.");
    }
}


//Fonction qui va vérifier que il y'a aucune séance existente dans 
// la table reservation avant de supprimer une séance
export const checkSeanceReservations = async function (id_seance) {
  try {
    const sql = `SELECT COUNT(*) AS nbr_reservations
                FROM reservation
                WHERE id_seance = $1;`;
    const values = [id_seance];
    const {rows} = await pool.query(sql,values);
    const nbr_reservation  = parseInt(rows[0].nbr_reservations,10);
    return nbr_reservation === 0; //True si aucune reservation , false sinon
  }
  catch (error) {
  console.error("Erreur SQL checkSeanceReservations :", error);
  throw new Error("Erreur modèle : impossible de vérifier les réservations pour la séance.");
}
} 

//Fonction qui va supprimer une séance dans la BDD

export const deleteSeanceById = async function (id_seance) {
  try {
    const sql = `DELETE FROM seance
                 WHERE id_seance = $1
                 RETURNING *;`
    const values = [id_seance];
    const {rows} = await pool.query(sql,values);
    return rows[0];
  } catch (error) {
    console.error("Erreur SQL deleteSeanceById:",error);
    throw new Error("Erreur modèle: impossible de supprimer la séance.");
  }
}

//Fonction qui vérifie si la seance à supprimer existe déja !
export const isSeanceExist = async function(id_seance) {
  
  try {
    const sql = `SELECT COUNT(*) AS nb_seances FROM seance WHERE id_seance = $1;`;
  const values = [id_seance];
  const {rows} = await pool.query(sql,values);
  const nb_seance = parseInt(rows[0].nb_seances,10);
  return nb_seance === 1; // doit etre un booléen true
  } catch (error) {
    console.error("Erreur modèle isSeanceExist:",error);
    throw new Error("Erreur modèle : impossible d’obtenir le décompte des séances.");
  }
}



