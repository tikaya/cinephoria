// models/cinema.model.js
import pool from "../config/db.js";

//Fonction qui va lister toutes les cinema existant dans notre BDD 
export const getListCinema = async function() {

  try {const sql =`SELECT *  FROM cinema ORDER BY nom_cinema ASC ;`;
  const {rows} = await pool.query(sql);
  return rows;
  } catch (error) {
    console.error("Erreur modèle getListCinema:",error);
    throw new Error("Impossible de récuperer la liste des cinemas");
  }
} 


//Fonction qui va exécuter la requete SQL permettant la création d'une salle en BDD
export const createSalle = async function(nom_salle,capacite,qualite_projection,id_cinema){
  try {
    //Commande SQL de création de salle
    const sql = `INSERT INTO 
                salle (nom_salle,capacite,qualite_projection,id_cinema)
                VALUES($1,$2,$3,$4)
                RETURNING *`;
    //Tableau de valeur
    const values = [nom_salle,capacite,qualite_projection,id_cinema];

    //Communiquons avec le serveur PostgreSQL
    const {rows} = await pool.query(sql,values);

    return rows[0];
  } catch(error){
    console.error("Erreur de la fonction modèle createSalle: ",error);
    throw new Error("Impossible de créer une salle dans la BDD");
  }
};


// Fonction qui vérifie qu'un nom de salle est unique dans un cinéma donné
export const uniqueNameSalle = async function (nom_salle, id_cinema) {
  try {
    // ✅ Requête SQL correcte
    const sql = `
      SELECT COUNT(*) AS nbr_salle
      FROM salle
      WHERE LOWER(nom_salle) = LOWER($1)
      AND id_cinema = $2
    `;

    // ✅ Valeurs à injecter
    const values = [nom_salle, id_cinema];

    // ✅ Attendre la réponse du serveur PostgreSQL
    const { rows } = await pool.query(sql, values);

    // ✅ Extraire le nombre de salles trouvées
    const nbr_salle = parseInt(rows[0].nbr_salle, 10);

    // ✅ Retourne true si aucune salle trouvée → nom unique
    return nbr_salle === 0;

  } catch (error) {
    console.error("Erreur du modèle uniqueNameSalle :", error);
    throw new Error("Impossible de vérifier l’unicité du nom de salle pour ce cinéma.");
  }
};


//Fonction qui va vérifier que le cinéma choisi existe en BDD
export const isCinemaExistYet = async function(id_cinema) {
  try {
    //Commande SQL qui va vérifier que la séanc existe 
    const sql = `SELECT COUNT(*) AS nbr_cinema FROM cinema WHERE id_cinema = $1`;
    //Tableau de valeur
    const values = [id_cinema];
    //Exécutions en BDD
    const {rows} = await pool.query(sql,values);
    const nbr_cinema_exist = parseInt(rows[0].nbr_cinema);
    return nbr_cinema_exist > 0;

  } catch(error){
    console.error("Erreur modèle isCinemaExistYet: ",error);
    throw new Error("Imppossible de vérifier l'existence du cinéma choisi");
  }
};


//Fonction qui va retourner toutes les salles de la BDD
export const getAllSalles = async function() {
  try {
    const sql = `SELECT * FROM salle`;
    const {rows} = await pool.query(sql);
    return rows;
  }catch(error){
    console.error("Erreur modèle getAllSalle:",error);
    throw new Error("Impossible de récuperer les salle");
  }
};


//Fonction qui va récuperer les données à charger dans le rendu formulaire
export const getHallDataById = async function(id_salle) {
  try {
    //Commande SQL de récuperation de data (via jointure table salle et cinema):
    const sql = `SELECT 
                  s.nom_salle,
                  s.capacite,
                  s.qualite_projection,
                  c.nom_cinema,
                  s.id_cinema
                FROM salle AS s
                JOIN cinema AS c 
                ON s.id_cinema = c.id_cinema
              WHERE s.id_salle = $1;`;
    //Tableau de valeur
    const values = [id_salle];
    //Stokons les données (objet type tableau de d'objet) recueillies dans la variable const
    const {rows} = await pool.query(sql,values);
    return rows[0] || null;
  } catch(error){
    console.error("❌ Erreur dans getHallDataById :",error);
    throw new Error("Impossible de récupérer les données de la salle");
  }
};


//Fonction qui fdournir tous les données cinema (nom et id)$
export const recoverAllCinemaData = async function () {
  try {
    const sql = `SELECT 
                  id_cinema,
                  nom_cinema
                FROM cinema
                ORDER BY nom_cinema ASC;
                  `;
    const {rows} = await pool.query(sql);
    return rows ;
  } catch(error){
    console.error("Erreur dans recoverAllCinemaData ",error);
    throw new Error("Impossible de récupérer la liste des cinema");
  }
};

//Fonction qui va vérifier si le nom de la salle existe pas déja dans la table pour le cinema choisir:
export const isNameSalleNotExistInCinema = async function(nom_salle,id_salle,id_cinema) {
  try {
    const sql = `SELECT COUNT(*) AS nbr_salle
                 FROM salle
                 WHERE nom_salle = $1
                  AND id_cinema =$2
                  AND id_salle <> $3;
          `;
      //Tableau des valeurs
      const values = [nom_salle,id_cinema,id_salle];

      //Assignons la réference de l'objet dans la variable rows
      const {rows} = await pool.query(sql,values);

      //Assignons dans la variable nbr_salle une copie de la valeur primitive number 
      const nb_salle = parseInt(rows[0].nbr_salle,10);
      return (nb_salle === 0); // Renvoi tous condition vérifiée
  }catch(erreur){
    console.error("❌Erreur dans isNameSalleNotExistInCinema :",erreur);
    throw new Error("Vérification d'unicité du nom de salle impossible. ");
  }
};


//Fonction qui la mettre à jour une salle 

export const updateSalleById = async function (
  id_cinema,
  nom_salle,
  capacite,
  qualite_projection,
  id_salle) 
  {
      try {
        //Commande SQL de MaJ de la salle
        const sql =`UPDATE salle
                    SET 
                      id_cinema = $1,
                      nom_salle = $2,
                      capacite = $3,
                      qualite_projection = $4
                    WHERE id_salle = $5
                    RETURNING *; 
                    
                    `;
          //Tableau de valeurs
          const values = [id_cinema,nom_salle,capacite,qualite_projection,id_salle];

          //Assignons la référence de l'objet dans la variable rows
          const {rows} = await pool.query(sql,values);
          //Renvoi un objet ou une valeur null
          return rows[0] ||null      
      }catch(erreur){
        console.error("Erreur dans updateSalleById :",erreur);
        throw new Error("Mise à jour de la salle impossible. ");
      }
  };


  //Modèle qui va récuperer une liste de données (info sur les salle)

  export const getInfoSalleForDelete = async function() {
    try {
      const sql = `SELECT 
                    s.*, 
                    c.nom_cinema
                   FROM 
                   salle  s    
                   JOIN   
                   cinema  c
                   ON s.id_cinema = c.id_cinema
                  ORDER BY s.nom_salle`;

      const {rows} = await pool.query(sql);
      if(rows.length === 0) {
        return [];
      }
      return rows;
    } catch(error) {
      console.error("Erreur dans modèle getInfoSalleForDelete:",error);
      throw new Error("Impossible de récupérer les salles depuis la base.")
    }
  };



/* ============================================================
   1️⃣ Vérifier que la salle existe réellement
   ------------------------------------------------------------
   Retourne true si la salle existe, false sinon
=============================================================== */
export const checkSalleExists = async function (id_salle) {
  try {
    const sql = `
      SELECT 1 
      FROM salle
      WHERE id_salle = $1
    `;
    const { rows } = await pool.query(sql, [id_salle]);

    return rows.length > 0; // true si trouvée
  } catch (error) {
    console.error("Erreur dans checkSalleExists:", error);
    throw new Error("Impossible de vérifier l'existence de la salle.");
  }
};


/* ============================================================
   2️⃣ Vérifier qu'il n'y a AUCUNE séance future dans cette salle
   ------------------------------------------------------------
   Retourne true si aucune séance future, false sinon
=============================================================== */
export const checkNoSeanceFutureInSalle = async function (id_salle) {
  try {
    const sql = `
      SELECT COUNT(*) AS nbr_seances
      FROM seance
      WHERE id_salle = $1
      AND (
            date_seance > CURRENT_DATE
        OR (date_seance = CURRENT_DATE AND heure_debut >= CURRENT_TIME)
      )
    `;
    const { rows } = await pool.query(sql, [id_salle]);
    const nbr_seances = parseInt(rows[0].nbr_seances);

    return nbr_seances === 0;
  } catch (error) {
    console.error("Erreur dans checkNoSeanceFutureInSalle:", error);
    throw new Error("Impossible de vérifier les séances futures.");
  }
};


/* ============================================================
   3️⃣ Vérifier qu'il n'y a pas de séance EN COURS maintenant
   ------------------------------------------------------------
   Retourne true si aucune séance en cours, false sinon
=============================================================== */
export const checkNoSeanceEnCoursInSalle = async function (id_salle) {
  try {
    const sql = `
      SELECT COUNT(*) AS seances_en_cours
      FROM seance
      WHERE id_salle = $1
        AND date_seance = CURRENT_DATE
        AND CURRENT_TIME BETWEEN heure_debut AND heure_fin
    `;
    const { rows } = await pool.query(sql, [id_salle]);
    const enCours = parseInt(rows[0].seances_en_cours);

    return enCours === 0;
  } catch (error) {
    console.error("Erreur dans checkNoSeanceEnCoursInSalle:", error);
    throw new Error("Impossible de vérifier les séances en cours.");
  }
};


/* ============================================================
   4️⃣ Suppression de la salle
   ------------------------------------------------------------
   ⚠️ ATTENTION : ON DELETE CASCADE supprime aussi tous les sièges
=============================================================== */
export const deleteSalle = async function (id_salle) {
  try {
    const sql = `
      DELETE FROM salle 
      WHERE id_salle = $1
      RETURNING id_salle
    `;
    const { rows } = await pool.query(sql, [id_salle]);

    return rows.length > 0; // true si la salle a été supprimée
  } catch (error) {
    console.error("Erreur dans deleteSalle:", error);
    throw new Error("Impossible de supprimer la salle.");
  }
};




