import { checkDuplicateFilm, insertFilm,filmRecup } from "../models/employe.insert.films.js";
import {getDataFilm} from "../models/employe.load.film.js";
import { updateFilmData } from "../models/employe.load.film.js";
import { listFilms,listSalles,verifyFilmAndSalleExistence,checkSalleAvailability,insertSeance,getAllSeances,getSeanceById,checkSalleAvailabilityForUpdate,updateSeance,isSeanceExist,deleteSeanceById,checkSeanceReservations } from "../models/employe.gestionSeance.model.js";
import { checkFilmNoReservation, checkFilmHasNoSeance, deleteFilmById } from "../models/employe.delete.film.js";
import { th } from "@faker-js/faker";
import { get } from "mongoose";
import { getListCinema } from "../models/emp.hubsalle.model.js";
/**
 * Valide les données d’un film, puis l’insère si tout est correct.
 * @returns {Promise<{film?: object, errors: string[]}>}
 */
export const validateFormFilm = async function (
  titreClean,
  genreClean,
  descriptionClean,
  afficheUrlClean,
  ageMin,
  coupDeCoeur
) {
  const errors = [];

  // 1️⃣ Champs obligatoires
  if (!titreClean || titreClean.trim() === "") {
    errors.push("Le titre du film est obligatoire.");
  }
  if (!genreClean || genreClean.trim() === "") {
    errors.push("Le genre du film est obligatoire.");
  }
  if (!descriptionClean || descriptionClean.trim() === "") {
    errors.push("La description du film est obligatoire.");
  }

  // 2️⃣ Longueurs minimales / maximales
  if (titreClean && titreClean.length > 150) {
    errors.push("Le titre est trop long (150 caractères max).");
  }
  if (descriptionClean && descriptionClean.length < 20) {
    errors.push("La description doit contenir au moins 20 caractères.");
  }
  if (genreClean && genreClean.length > 50) {
    errors.push("Le genre est trop long (50 caractères max).");
  }

  // 3️⃣ Âge minimum
  if (ageMin != null) {
    if (isNaN(ageMin)) {
      errors.push("L'âge minimum doit être un nombre.");
    } else if (ageMin < 0) {
      errors.push("L'âge minimum doit être positif.");
    }
  }

  // 4️⃣ URL de l'affiche (si fournie)
  if (afficheUrlClean) {
    try {
      new URL(afficheUrlClean);
    } catch {
      errors.push("L'URL fournie pour l'affiche n'est pas valide.");
    }
  }

  // 🛑 Si erreurs → retour immédiat
  if (errors.length > 0) {
    return { errors };
  }

  // 5️⃣ Vérifie la duplicité
  const existeDeja = await checkDuplicateFilm(titreClean);
  if (existeDeja) {
    return { errors: ["Un film avec ce titre existe déjà."] };
  }

  // 6️⃣ Insertion
  try {
    const filmInsert = await insertFilm(
      titreClean,
      genreClean,
      descriptionClean,
      afficheUrlClean,
      ageMin,
      coupDeCoeur
    );

    return { film: filmInsert, errors: [] };
  } catch (error) {
    console.error("Erreur lors de l'insertion du film :", error);
    throw new Error("Erreur lors de l'insertion du film.");
  }
};


export const getFilms = async function() {

   const filmDB = await filmRecup();
   return filmDB;
}


export const loadFilm = async function (filmId) {
  try {
    const dataFilm = await getDataFilm(filmId);

    // Vérification facultative
    if (!dataFilm) {
      throw new Error(`Film introuvable (id = ${filmId})`);
    }

    return dataFilm;
  } catch (error) {
    console.error("Erreur dans loadFilm:", error.message);
    throw new Error("Impossible de charger les données du film.");
  }
};

export const updateFilm = async function (
  titre,
  description,
  age_minimum,
  label_coup_de_coeur,
  genre,
  affiche_url,
  filmId
) {
  try {
    const data = await updateFilmData(
      titre,
      description,
      age_minimum,
      label_coup_de_coeur,
      genre,
      affiche_url,
      filmId
    );

    if (!data) {
      console.error("Aucune donnée retournée lors de la mise à jour du film.");
      throw new Error(`Échec de la mise à jour du film (id = ${filmId})`);
    }

    return data;

  } catch (error) {
    console.error("Erreur dans updateFilm:", error.message);
    throw new Error("Impossible de mettre à jour les données du film.");
  }
};


//Fonction qui va  verifier si tous es tok pour la suppression et supprimer un film

// ✅ Service : suppression sécurisée d’un film
export const deleteFilmByIdService = async function (filmId) {
  try {
    // 🧩 Conversion sécurisée de l’ID en entier
    const filmIdInt = parseInt(filmId, 10);
    if (isNaN(filmIdInt)) {
      throw new Error("ID de film invalide.");
    }

    // 🔍 Vérification des contraintes métier
    const noReservation = await checkFilmNoReservation(filmIdInt);
    const noSeance = await checkFilmHasNoSeance(filmIdInt);

    // ⚠️ Si le film est encore lié → on empêche la suppression
    if (!noReservation || !noSeance) {
      throw new Error("❌ Suppression impossible : le film est encore lié à des réservations ou à des séances.");
    }

    // 🗑️ Suppression autorisée
    const deletedFilm = await deleteFilmById(filmIdInt);

    return deletedFilm;

  } catch (error) {
    console.error("Erreur dans deleteFilmByIdService :", error.message);
    throw new Error(error.message || "Erreur interne lors de la suppression du film.");
  }
};


// ✅ Service : récupération des films et salles pour la création d'une séance
export const getFilmsSallesForSeance = async function () {
  try {
    const films = await listFilms();
    const salles = await listSalles();
    return { films, salles };
  } catch (error) {
    console.error("Erreur dans getFilmsSallesForSeance :", error.message);
    throw new Error("Impossible de récupérer les films et salles pour la création de séance.");
  }
};

// ✅ Service : liste des qualités de projection (statique pour MVP)
export const getQualityProjection = function () {
  return ["2D", "3D", "4K", "IMAX", "4DX"];
};


// ✅ Service de création de séance avec validation complète
export const validateAndCreateSeance = async function (
  id_film,
  id_salle,
  date_seance,
  heure_debut,
  heure_fin,
  prix,
  qualite_projection
) {
  try {
    // 1️⃣ Vérification disponibilité de la salle
    const isSalleAvailable = await checkSalleAvailability(
      id_salle,
      date_seance,
      heure_debut,
      heure_fin
    );

    if (!isSalleAvailable) {
      throw new Error("❌ La salle est déjà occupée pour le créneau horaire sélectionné.");
    }

    // 2️⃣ Vérifier existence du film et de la salle
    const existenceValid = await verifyFilmAndSalleExistence(id_film, id_salle);

    if (!existenceValid.filmExists) {
      throw new Error("🎞️ Le film sélectionné n'existe pas.");
    }
    if (!existenceValid.salleExists) {
      throw new Error("🏛️ La salle sélectionnée n'existe pas.");
    }

    // 3️⃣ Vérification des heures cohérentes
    if (heure_fin <= heure_debut) {
      throw new Error("⏱️ L'heure de fin doit être après l'heure de début.");
    }

    // 4️⃣ Vérification du prix
    if (isNaN(prix) || prix <= 0) {
      throw new Error("💰 Le prix de la séance doit être un nombre positif.");
    }

    // 5️⃣ Vérification de la date (ne peut pas être passée)
    const today = new Date();
    const seanceDate = new Date(date_seance);

    // On ne compare que la partie "date", sans les heures pour éviter les faux négatifs
    const todayStr = today.toISOString().split("T")[0];
    const seanceDateStr = seanceDate.toISOString().split("T")[0];

    if (seanceDateStr < todayStr) {
      throw new Error("📅 La date de la séance ne peut pas être antérieure à aujourd'hui.");
    }

    // 6️⃣ Tout est OK → insertion en base
    const seanceInsert = await insertSeance(
      id_film,
      id_salle,
      date_seance,
      heure_debut,
      heure_fin,
      prix,
      qualite_projection
    );

    console.log("✅ Séance créée avec succès :", seanceInsert);

    return seanceInsert;

  } catch (error) {
    console.error("Erreur dans validateAndCreateSeance :", error.message);
    throw new Error(error.message || "Erreur interne lors de la création de la séance.");
  }
};


// Fonction qui va récuperer le tableau de seances et la rendre au controller

export const getAllSeancesService = async function () {
  try {
    const seancesList = await getAllSeances();
    if(!seancesList) {
      throw new Error("Aucune séance trouvée.");
      
    }
    return seancesList;
  } catch (error) {
    console.error("Erreur dans getAllSeancesService :", error.message);
    throw new Error("Impossible de récupérer les séances.");
  }
}

export const getSeanceByIdService = async function (seanceId) {
  try {
    // Obtenons la liste de tous les films pour notre formulaire d'édition
    const films = await listFilms();

    // Obtenons la liste de toutes les salles pour notre formulaire d'édition
    const salles = await listSalles();

    // Obtenons les qualités disponibles
    const qualityProjections = getQualityProjection();

    // Obtenons les données de la séance sélectionnée
    const seanceData = await getSeanceById(seanceId);

    // Vérification
    if (!seanceData) {
      throw new Error("Séance introuvable pour l'ID fourni.");
    }

    // On renvoie tout ce qu'il faut pour le rendu EJS
    return {
      seanceData,
      listFilms: films,
      listSalles: salles,
      qualityProjections
    };
  } catch (error) {
    console.error("Erreur dans getSeanceByIdService :", error.message);
    throw new Error("Impossible de récupérer la séance par ID.");
  }
};


export const updateSeanceService = async function (
  id_seance,
  id_film,
  id_salle,
  date_seance,
  heure_debut,
  heure_fin,
  prix,
  qualite_projection
) {
  try {
    // 1️⃣ Vérification de la disponibilité de la salle
    const isSalleAvailable = await checkSalleAvailabilityForUpdate(
      id_salle,
      date_seance,
      heure_debut,
      heure_fin,
      id_seance
    );

    if (!isSalleAvailable) {
      throw new Error("❌ La salle est déjà occupée pour le créneau horaire sélectionné.");
    }

    // 2️⃣ Vérification de l’existence du film et de la salle
    const { filmExists, salleExists } = await verifyFilmAndSalleExistence(id_film, id_salle);

    if (!filmExists) throw new Error("🎞️ Le film sélectionné n'existe pas.");
    if (!salleExists) throw new Error("🏛️ La salle sélectionnée n'existe pas.");

    // 3️⃣ Vérification de la cohérence des horaires
    if (heure_fin <= heure_debut) {
      throw new Error("⏱️ L'heure de fin doit être après l'heure de début.");
    }

    // 4️⃣ Vérification du prix
    if (isNaN(prix) || prix <= 0) {
      throw new Error("💰 Le prix de la séance doit être un nombre positif.");
    }

    // 5️⃣ Vérification de la date (ne peut pas être passée)
    const todayStr = new Date().toISOString().split("T")[0];
    const seanceDateStr = new Date(date_seance).toISOString().split("T")[0];
    if (seanceDateStr < todayStr) {
      throw new Error("📅 La date de la séance ne peut pas être antérieure à aujourd'hui.");
    }

    // 6️⃣ Tout est valide → mise à jour en base
    const seanceUpdated = await updateSeance(
      heure_debut,
      heure_fin,
      prix,
      qualite_projection,
      id_salle,
      id_film,
      date_seance,
      id_seance
    );

    if (!seanceUpdated) {
      throw new Error("⚠️ Aucune séance trouvée avec cet identifiant.");
    }

    console.log("✅ Séance mise à jour avec succès :", seanceUpdated);
    return seanceUpdated;

  } catch (error) {
    console.error("Erreur dans updateSeanceService :", error.message);
    throw new Error(error.message || "Erreur interne lors de la mise à jour de la séance.");
  }
};



export const deleteSeanceService = async function (id_seance) {
  try {
    // 1️⃣ Vérifier si la séance existe
    const seanceExist = await isSeanceExist(id_seance);
    if (!seanceExist) {
      throw new Error("❌ La séance n'existe pas dans la base de données.");
    }

    // 2️⃣ Vérifier qu’elle n’a pas déjà été réservée
    const hasNoReservation = await checkSeanceReservations(id_seance);
    if (!hasNoReservation) {
      throw new Error("⚠️ Impossible de supprimer : la séance est déjà réservée.");
    }

    // 3️⃣ Supprimer la séance
    const seanceDelete = await deleteSeanceById(id_seance);
    if (!seanceDelete) {
      throw new Error("⚠️ Séance introuvable ou impossible à supprimer.");
    }

    console.log("✅ Séance supprimée :", seanceDelete);
    return seanceDelete;

  } catch (error) {
    console.error("Erreur service deleteSeanceService :", error);
    throw new Error(error.message || "Erreur interne lors de la suppression de la séance.");
  }
};



// Service qui récupère la liste des cinémas pour précharger le formulaire de création de salle
export const getCinemaData = async function() {
  try {
    const cinemaData = await getListCinema();

    // Vérifie si la requête a renvoyé un tableau vide
    if (!cinemaData || cinemaData.length === 0) {
      throw new Error("Aucun cinéma trouvé dans la base de données.");
    }

    // Si tout est OK → retourne la liste
    return cinemaData;

  } catch (error) {
    console.error("Erreur service getCinemaData :", error.message);
    throw new Error("Impossible de récupérer la liste des cinémas.");
  }
};



