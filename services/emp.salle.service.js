//Fonction qui va vérifier que la capacité est est > 0
export const isCapacitePositif =  function(capacite) {
  try{
    //Si la capacité est  > 0 on retourne un booléèn true au programme sinon false 
    if( isNaN(capacite) || capacite <= 0) {
      return false; 
    }
    return true;
  } catch(error){
    console.error("Erreur fonction service isCapacitePositif :",error);
    throw new Error("Impossible de vérifier si la capacité est supérieur strictement à zero");
  }
};

export const isQualiteInList = function (qualite_projection) {
  if (
    !qualite_projection ||
    !["2D", "3D", "4K", "IMAX", "4DX"].includes(qualite_projection.toUpperCase())
  ) {
    throw new Error("La qualité choisie n'est pas correcte !");
  }
  return true;
};

import { isCinemaExistYet,uniqueNameSalle,createSalle,  } from "../models/emp.hubsalle.model.js";

export const createSalleService = async function(nom_salle,capacite,qualite_projection,id_cinema){
  try {
    //Protégeons le service contre les champs manquants
    if(!nom_salle || !capacite || !qualite_projection || !id_cinema) {
      throw new Error("Certains champs nécessaires sont manquants.");
    }
    //Vérifions que le cinema existe en BDD avant de créer
    const cinemaExisting = await isCinemaExistYet(id_cinema);
    if(!cinemaExisting){
     throw new Error("Veuillez choisir un cinéma valide.");
    }
    //Verifions que le nom soit unique dans le cinema choisi
    const uniqueName = await uniqueNameSalle(nom_salle, id_cinema);
    if(!uniqueName){
      throw new Error("Ce nom de salle existe déjà dans le cinéma sélectionné.");
    }

    //Si tous ceci est est bon on va creer la salle
    const salle = await createSalle(nom_salle,capacite,qualite_projection,id_cinema);
    return salle;
  } catch(error){
    console.error("Erreur service createSalleService :",error);
   throw new Error("Impossible de créer une nouvelle salle.");
  }
};


// services/emp.hubsalle.service.js
import { getAllSalles } from "../models/emp.hubsalle.model.js";

// Fonction qui va appeler le modèle pour récupérer les enregistrements sur les salles
export const getSalles = async function() {
  try {
    const salles = await getAllSalles();

    // Si la référence stockée dans salles pointe vers une valeur undefined, vide ou un tableau vide
    if (!salles || salles.length === 0) {
      throw new Error("Aucune salle trouvée dans la base de données.");
    }

    // Tri par id_salle croissant
    return salles.sort((a, b) => a.id_salle - b.id_salle);

  } catch (error) {
    console.error("Erreur service getSalles :", error);
    throw new Error(`Impossible de récupérer les salles : ${error.message}`);
  }
};

//Fonction service qui va rendre exprimer en valeur la données sur la salle choisie
import { getHallDataById,recoverAllCinemaData  } from "../models/emp.hubsalle.model.js";
export const hallDataByIdService = async function(id_salle){
  try {
    //On va appeler le modèle pour qu'il nous retourne la donnée sur la salle
    const dataSalle = await getHallDataById(id_salle);

    //Si dataSalle fait réference à un objet null , vide , inexistant , undefined 
    if(!dataSalle){
      //Arreter la fonction et lancé une erreur au controlleur
      throw new Error("Aucune donnée récuperer pour cette salle.");
    }
    return dataSalle;
  } catch(error){
    console.error("❌ Erreur daans hallDataByIdService :",error);
    throw new Error("Impossible de  récupérer les informations de la salle. ");
  }
};

export const cinemaListService = async function(){
  try {
    //Appelons le modèle recoverAllCinemaData
    const cinemaInfoList = await recoverAllCinemaData();
    if( cinemaInfoList.length === 0){
      throw new Error("Aucune donnée récuperer pour les cinémas. ");
    }
    return cinemaInfoList;
  }catch(error){
    console.error("❌ Erreur dans recoverAllCinemaData :",error);
    throw new Error("Impossible de récupérer la liste des cinema. ");
  }
};


//Fonction qui va MaJ la salle
import {isNameSalleNotExistInCinema, updateSalleById} from "../models/emp.hubsalle.model.js";

export const updateSalleService = async function(
  id_cinema,
  nom_salle,
  capacite,
  qualite_projection,
  id_salle
) {
  try {
    if (!nom_salle || nom_salle.trim().length < 2) {
      throw new Error("Le nom de la salle est invalide.");
    }

    const capaciteNum = Number(capacite);
    if (isNaN(capaciteNum) || capaciteNum < 10 || capaciteNum > 1000) {
      throw new Error("La capacité doit être comprise entre 10 et 1000.");
    }

    const validQualite = isQualiteInList(qualite_projection);
    if (!validQualite) {
      throw new Error("La qualité de projection est invalide.");
    }

    const isSalleNameUnique = await isNameSalleNotExistInCinema(
      nom_salle,
      id_salle,
      id_cinema
    );

    if (!isSalleNameUnique) {
      throw new Error("Le nom de la salle existe déjà dans ce cinéma.");
    }

    const updatedSalle = await updateSalleById(
      id_cinema,
      nom_salle,
      capaciteNum,
      qualite_projection,
      id_salle
    );

    if (!updatedSalle || Object.keys(updatedSalle).length === 0) {
      throw new Error("Impossible de mettre à jour la salle.");
    }

    return updatedSalle;

  } catch (erreur) {
    console.error("❌ Erreur dans updateSalleService:", erreur);
    throw new Error("Impossible de mettre à jour la salle.");
  }
};


//Fonction qui va retourner la liste des salles pour suppression
import {getInfoSalleForDelete} from "../models/emp.hubsalle.model.js";

export const listSalleService = async function () {
  try {
     //Appelons le modèle getInfoSalleForDelete 
    const salleList = await getInfoSalleForDelete();
    return salleList;

  } catch(error) {
    console.error("Erreur dans service listSalleService: ",error);
    throw error
  }
 
};

import {
  checkSalleExists,
  checkNoSeanceFutureInSalle,
  checkNoSeanceEnCoursInSalle,
  deleteSalle
} from "../models/emp.hubsalle.model.js";

/* ============================================================
   SERVICE : Suppression d'une salle de cinéma
   ------------------------------------------------------------
   Retourne un objet :
   {
     success: boolean,
     message: string
   }
=============================================================== */
export const deleteSalleService = async function (id_salle) {
  try {
    // 1️⃣ Vérifier que la salle existe
    const exists = await checkSalleExists(id_salle);
    if (!exists) {
      return {
        success: false,
        message: "Salle introuvable."
      };
    }

    // 2️⃣ Vérifier qu'il n'y a AUCUNE séance future
    const noFuture = await checkNoSeanceFutureInSalle(id_salle);
    if (!noFuture) {
      return {
        success: false,
        message: "Impossible de supprimer : la salle contient encore des séances à venir."
      };
    }

    // 3️⃣ Vérifier qu'il n'y a PAS de séance en cours
    const noEnCours = await checkNoSeanceEnCoursInSalle(id_salle);
    if (!noEnCours) {
      return {
        success: false,
        message: "Impossible de supprimer : une séance est actuellement en cours dans cette salle."
      };
    }

    // 4️⃣ Tout est OK → suppression
    const deleted = await deleteSalle(id_salle);

    if (!deleted) {
      return {
        success: false,
        message: "Erreur inconnue : la salle n'a pas pu être supprimée."
      };
    }

    // 5️⃣ Succès
    return {
      success: true,
      message: "Salle supprimée avec succès."
    };

  } catch (error) {
    console.error("Erreur dans deleteSalleService:", error);
    throw new Error("Erreur interne du service de suppression de salle.");
  }
};

