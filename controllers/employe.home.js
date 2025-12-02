// Importation du service pour valider et insérer les films
import { parse } from "dotenv";
import { validateFormFilm, validateAndCreateSeance ,getAllSeancesService,getSeanceByIdService,updateSeanceService, deleteSeanceService} from "../services/employe.films.js";

// Importation du service qui permet de récuperer tous les film de la BD
import { getFilms,updateFilm,deleteFilmByIdService} from "../services/employe.films.js";

//Importons expression de function loadFilm pour recuperer les données du film selectionné

import {loadFilm,getFilmsSallesForSeance,getQualityProjection} from "../services/employe.films.js";

// importons le service de recuperation des info de séance
import {getCinemaData } from "../services/employe.films.js";
// Page d’accueil employé
export const renderHomeEmp = function (request, response) {
  response.render("home_emp");
};

// Vue centrale de gestion des films
export const renderHandlerFilms = function (request, response) {
  response.render("films_emp_hub");
};

// Formulaire de création de film
export const renderFormCreateFilms = function (request, response) {
  response.render("films_new", {
    csrfToken: request.csrfToken(),
    currentUser: request.session.user,
    old: {},
    errors: [],
  });
};

// Traitement du formulaire de création de film
export const renderNewFilm = async function (request, response) {
  // 1️⃣ Extraction et nettoyage des champs du formulaire
  const {
    titre = "",
    genre = "",
    description = "",
    age_minimum = "",
    label_coup_de_coeur,
    affiche_url = "",
  } = request.body;

  const titreClean = titre.trim();
  const genreClean = genre.trim();
  const descriptionClean = description.trim();
  const afficheUrlClean = affiche_url.trim();
  const ageMin = age_minimum ? parseInt(age_minimum, 10) : null;
  const coupDeCoeur = label_coup_de_coeur === "true";

  // 2️⃣ Validation + insertion via le service
  const { film, errors } = await validateFormFilm(
    titreClean,
    genreClean,
    descriptionClean,
    afficheUrlClean,
    ageMin,
    coupDeCoeur
  );

  // 3️⃣ En cas d’erreurs → réaffichage du formulaire
  if (errors.length > 0) {
    return response.status(400).render("films_new", {
      errors,
      old: request.body,
      csrfToken: request.csrfToken(),
      currentUser: request.session.user,
    });
  }

  // 4️⃣ Si insertion réussie → succès
  console.log("✅ Film inséré :", film);
  return response.status(201).render("films_success", {
    film,
    currentUser: request.session.user,
  });
};


//Rendu de tous les films à l'employé partie modification de film

export const renderAllFilms = async function(req,res) {
  try {
    const films = await getFilms();
    res.render("all_films",
      {films,
        currentUser:req.session.user
      });
  }catch(error) {
    console.error("Erreur lors de la récupératrion des films",error);
    res.status(500).send("Erreur serveur lors de la récupération de films")
  }
}

export const renderAllFilmsForDelete = async function (req, res) {
  try {
    // 1️⃣ Récupérer les films
    const films = await getFilms();

    // 2️⃣ Lire les messages flash UNE SEULE FOIS
    const messages = {
      success: req.flash("success"),
      error: req.flash("error")
    };

    // 3️⃣ Envoyer au EJS
    res.render("all_films_delete", {
      films,
      currentUser: req.session.user,
      csrfToken: req.csrfToken(),
      messages
    });

  } catch (error) {
    console.error("❌ Erreur renderAllFilmsForDelete :", error);
    res.status(500).render("error", {
      message: "Erreur serveur lors de la récupération des films.",
    });
  }
};

export const loadFormFilm = async function (req, res) {
  try {
    const filmId = parseInt(req.params.id, 10);
    if (isNaN(filmId)) {
      return res.status(400).render("error", { message: "ID de film invalide." });
    }

    const film = await loadFilm(filmId);
    if (!film) {
      return res.status(404).render("error", { message: "Film introuvable." });
    }

    // ⚠️ req.csrfToken() n’existe que si csurf est bien configuré
    const csrfToken = typeof req.csrfToken === "function" ? req.csrfToken() : null;

    return res.render("film_form_edit", { film, csrfToken });
  } catch (err) {
    console.error("Erreur loadFormFilm:", err);
    return res.status(500).render("error", { message: "Impossible de charger le formulaire du film." });
  }
};


export const submitUpdateFilm = async function (req, res) {
  try {
    // 🎬 Extraction et nettoyage des champs
    const filmId = parseInt(req.params.id, 10);
    let {
      titre,
      description,
      age_minimum,
      label_coup_de_coeur,
      genre,
      affiche_url
    } = req.body;

    titre = titre?.trim();
    description = description?.trim();
    genre = genre?.trim();
    affiche_url = affiche_url?.trim();
    age_minimum = age_minimum ? parseInt(age_minimum, 10) : null;
    label_coup_de_coeur = req.body.label_coup_de_coeur === "on";

    // 🧩 Validation de base
    if (!titre || !genre || !description) {
      return res.status(400).render("error", {
        message: "Les champs titre, genre et description sont obligatoires."
      });
    }

    // ⚙️ Appel du service de mise à jour
    const filmUpdate = await updateFilm(
      titre,
      description,
      age_minimum,
      label_coup_de_coeur,
      genre,
      affiche_url,
      filmId
    );

    // 🧱 Vérification du retour
    if (!filmUpdate) {
      return res.status(500).render("error", {
        message: "Échec de la mise à jour du film."
      });
    }

    // ✅ Affichage succès
    return res.render("update_success", { film: filmUpdate });

  } catch (error) {
    console.error("Erreur lors de la soumission de la mise à jour du film:", error);
    return res.status(500).render("error", {
      message: "Impossible de traiter la mise à jour du film."
    });
  }
};



export const deleteFilm = async function (req, res) {
  try {
    // 1️⃣ Conversion sécurisée de l’ID reçu depuis l’URL
    const filmIdParam = parseInt(req.params.id, 10);
    if (isNaN(filmIdParam)) {
      return res.status(400).render("error", {
        message: "ID de film invalide pour la suppression.",
      });
    }

    // 2️⃣ Appel du service de suppression
    const deletedFilm = await deleteFilmByIdService(filmIdParam);

    // 3️⃣ Si le film n’a pas été trouvé (par ex. déjà supprimé)
    if (!deletedFilm) {
      req.flash("error", "⚠️ Film introuvable ou déjà supprimé.");
      return res.redirect("/intranet/getAllFilms/delete");
    }

    // 4️⃣ Si tout est OK → message de succès et redirection
    req.flash("success", `🎬 Le film « ${deletedFilm.titre} » a été supprimé avec succès.`);
    return res.redirect("/intranet/getAllFilms/delete");

  } catch (error) {
    console.error("Erreur lors de la suppression du film :", error);

    // 5️⃣ Si erreur métier (ex : film encore lié à séance/réservation)
    req.flash("error", error.message || "Impossible de supprimer le film.");
    return res.redirect("/intranet/getAllFilms/delete");
  }
};

//Hnadler qui rend la vue de gestion des séances (creation , modification et suppression)
export const hubSeanceRender = function(req,res) {
  res.render("seance_emp_hub",{currentUser:req.session.user});
}

//Handler qui rend le formulaire de creation de séance intelligente
export const renderFormCreateSeance = async function (req, res) {
  try {
    // 1️⃣ Récupération des films et salles disponibles
    const { films, salles } = await getFilmsSallesForSeance();
    const qualites = getQualityProjection(); // cohérent avec ta nomenclature

    // 2️⃣ Rendu de la vue avec toutes les données nécessaires
    res.render("seance_create_form", {
      films,
      salles,
      qualites,
      csrfToken: req.csrfToken(),
      currentUser: req.session.user,
       old: {},              // 👈 ajout obligatoire
      errorMessage: null,   // 👈 optionnel, évite erreurs ejs
      successMessage: null,  // 👈 idem
      success:req.flash("success") || [],
      error:req.flash("error") || [],      
    });

  } catch (error) {
    console.error("Erreur lors de la récupération des films et salles pour la création de séance :", error);
    res.status(500).render("error_seance_emp", {
      message: "Erreur serveur lors du chargement du formulaire de création de séance.",
    });
  }
};


//Handler qui va traiter la soumission du formulaire de création de séance
export const createSeance = async function (req, res) {
  try {
    // 1️⃣ Extraction et nettoyage des champs du formulaire
    const {
       id_film,
      id_salle,
      date_seance,
      heure_debut,
      heure_fin,
      prix,
      qualite_projection
    } = req.body;

    const seanceCree = await validateAndCreateSeance(
      parseInt(id_film, 10),
      parseInt(id_salle, 10),
      date_seance,
      heure_debut,
      heure_fin,
      parseFloat(prix),
      qualite_projection
    );
     req.flash("success", `🎬 Séance créée avec succès pour le film ${seanceCree.id_film}.`);
    res.redirect("/intranet/seances/create");
  } catch (error) {
  console.error("Erreur lors de la création de la séance :", error);

  // On conserve les valeurs saisies pour pré-remplir le formulaire
  const old = {
    id_film: req.body.id_film,
    id_salle: req.body.id_salle,
    date_seance: req.body.date_seance,
    heure_debut: req.body.heure_debut,
    heure_fin: req.body.heure_fin,
    prix: req.body.prix,
    qualite_projection: req.body.qualite_projection
  };

  // On recharge les listes nécessaires
  const { films, salles } = await getFilmsSallesForSeance();
  const qualites = getQualityProjection();

  // On renvoie la même vue avec les anciennes données et le message d’erreur
  res.status(400).render("seance_create_form", {
    films,
    salles,
    qualites,
    csrfToken: req.csrfToken(),
    currentUser: req.session.user,
    errorMessage: error.message,
    old,
    success:req.flash("success") || [],
    error:req.flash("error") || [],
  });
}
};

export const  ListSeanceRender = async function (req, res) {
  try {
    const seances = await getAllSeancesService();
    if(!seances || seances.length ===0) {
      return res.status(404).render("error_seance_emp",{
        message:"Aucune séance n'existe dans la base de données."
      }); 
    }
    res.render("all_seances_emp",{
      seances,
      currentUser:req.session.user,
      success:req.flash("success") || [],
      error:req.flash("error") || []
    });
  } catch (error) {
    console.error("Erreur lors de la récupération des séances :", error);
    res.status(500).render("error_seance_emp",{
      message:"Erreur serveur lors de la récupération des séances.",
      success:req.flash("success") || [],
      error:req.flash("error") || [],
    });
  }
};

export const editFormSeance = async function (req,res) {
  try {
    const seanceId = parseInt(req.params.id,10);
    if(isNaN(seanceId)){
      return res.status(400).render("error_seance_emp",{
        message:"ID de séance invalide."
      });
    }
    const qualityProjections =  getQualityProjection();
    const {seanceData,listFilms,listSalles} = await getSeanceByIdService(seanceId);
    if(!seanceData) {
      return res.status(404).render("error_seance_emp",{
        message:"Données introuvables pour la séance sélectionnée.",
        success:req.flash("success") || [],
        error:req.flash("error") || [],
      });
    } 
    res.render("seance_edit_form",{
      titlePage:"Modifier la séance",
      seance:seanceData,
      films:listFilms,
      salles:listSalles,
      qualites:qualityProjections,
      csrfToken:req.csrfToken(),
      currentUser:req.session.user,
      success:req.flash("success") || [],
      error:req.flash("error") || [],
    });
      
  } catch (error) {
    console.error("Erreur lors du rendu du formulaire d'édition de séance :",error.message);
    res.status(500).render("error_seance_emp",{
      message:"Erreur serveur lors du chargement du formulaire d'édition de séance.",
      success:req.flash("success") || [],
      error:req.flash("error") || [],
    });
  }
}


export const renderSeanceUpdate = async function (req,res) {
  try {
    // 1️⃣ Extraction et nettoyage des champs
    const seance_id = parseInt(req.params.id,10);
    let {
      id_film,
      id_salle,
      date_seance,
      heure_debut,
      heure_fin,
      prix,
      qualite_projection  
    } = req.body;
    
    id_film = parseInt(id_film,10);
    id_salle = parseInt(id_salle,10);
    prix = parseFloat(prix); 

    //Appel du service de mise à jour
    const seanceUpdate = await updateSeanceService(
      seance_id,
      id_film,
      id_salle,
      date_seance,
      heure_debut,
      heure_fin,
      prix,
      qualite_projection
    );
    //Verifions si la varibale seanceUpdate est nulle donc echec de la mise à jour
    if(!seanceUpdate){
      req.status(500).flash("error","Échec de la mise à jour de la séance.");
      return res.redirect(`/intranet/seances/${seance_id}/edit/`);
    }

    //Sinons si la variable contient les données mises à jour
    req.flash("success",`🎬 La séance ID ${seanceUpdate.id_seance} a été mise à jour avec succès.`);
    return res.redirect("/intranet/seances/all");

  } catch (error) {
    console.error("Erreur lors de la soumission de la mise à jour de la séance:", error);
    req.flash("error","Impossible de traiter la mise à jour de la séance.");
    return res.redirect(`/intranet/seances/${req.params.id}/edit/`);
  }
};


export const renderAllSeancesToDelete = async function(req,res) {
 
 try {
    // Appel du service qui va recupérer tous les seance existantes
    const seances = await getAllSeancesService();

    // La fonction précedente doit retourner un tableau d'objet non vide
    //Si ce n'est pas le cas : alors il ya forcement une erreur

    if(!seances || seances.length ===0) {

      //Alors on va retouner à utilisateur une page d'erreur

      return res.status(404).render("error_seance_delete_emp",{
        message:"Aucune séance n'existe dans la base de données."
      })
      }
    //Sinon on va rendre la vue qui affiche toutes les séances à supprimer
    return res.render("all_seances_delete_emp",{
      seances,
      currentUser:req.session.user,
      csrfToken:req.csrfToken(),
      success:req.flash("success") || [],
      error:req.flash("error") || []
    });
  } catch (error) {

   console.error("Erreur lors de la récuperation des séances",error.message);
    res.status(500).render("error_seance_delete_emp",{
    message:"Erreur serveur lors de la récupération des séances."
  });
  }

  } 




export const renderDeleteSeance = async function (req, res) {
  try {
    // 1️⃣ Récupération de l'ID
    const seance_id = parseInt(req.params.id, 10);

    // 2️⃣ Vérification que l'ID est bien un entier
    if (isNaN(seance_id)) {
      return res.status(400).render("error_seance_delete_emp", {
        message: "⚠️ ID de séance invalide.",
      });
    }

    // 3️⃣ Appel du service de suppression
    const deletedSeance = await deleteSeanceService(seance_id);

    // 4️⃣ Si la suppression n’a rien retourné
    if (!deletedSeance) {
      return res.status(400).render("error_seance_delete_emp", {
        message: "⚠️ Suppression impossible de la séance.",
        success:req.flash("success") || [],
        error:req.flash("error") || [],
      });
    }

    // 5️⃣ Message flash + redirection
    req.flash("success", `🎬 La séance ID ${seance_id} a été supprimée avec succès.`);
    return res.redirect("/intranet/seances/all/delete");

  } catch (error) {
    console.error(`Erreur lors de la suppression de la séance (ID ${req.params.id}) :`, error.message);
    req.flash("error", error.message || "❌ Impossible de traiter la suppression de la séance.");
    return res.redirect("/intranet/seances/all/delete");
  }
};


//Handler qui va rendre la page HUB pour salle à l'employé
export const renderHubSalle = function(req,res) {
  res.render("salle_emp_hub",{
    success:req.flash("success"),
    error:req.flash("error")});
}



// Afficher le formulaire de création de salle
export const renderFormCreateSalle = async function(req, res) {
  try {
    // 1️⃣ Récupération des qualités de projection (liste statique)
    const qualites_projection = getQualityProjection();

    // 2️⃣ Récupération de la liste des cinémas (pour le <select>)
    const cinemas = await getCinemaData();

    // 3️⃣ Vérification des données
    if (!cinemas || cinemas.length === 0) {
      throw new Error("Impossible de charger le formulaire : aucun cinéma trouvé.");
    }

    // 4️⃣ Rendu de la vue EJS
   return res.render("form_create_salle", {
  cinemas,
  old:{},
  qualites: qualites_projection,
  csrfToken: req.csrfToken(),
  currentUser: req.session.user,
  success:req.flash("success") || [],
  error:req.flash("error") || [],
 
});


  } catch (error) {
    console.error("❌ Impossible d'afficher le formulaire de création de salle :", error.message);
    return res.status(500).render("error_salle_emp", {
      message: "Impossible d'afficher le formulaire de création de salle.",
      success:req.flash("success") || [],
    error:req.flash("error") || [],
    });
  }
};

import { isCapacitePositif,createSalleService,isQualiteInList} from "../services/emp.salle.service.js";


export const SubmitCreateSalle = async function(req, res) {
  try {
    // 🧩 1. Récupération des données saisies
    let { nom_salle, capacite, qualite_projection, id_cinema } = req.body;

    // 🧹 2. Normalisation
    nom_salle = nom_salle?.trim();
    qualite_projection = qualite_projection?.toUpperCase().trim();
    id_cinema = parseInt(id_cinema, 10);
    capacite = parseInt(capacite, 10);

    // ⚠️ 3. Vérification des conversions numériques
    if (isNaN(id_cinema)) throw new Error("Choisir un cinéma valide.");
    if (isNaN(capacite)) throw new Error("La capacité doit être un nombre.");

    // 💪 4. Vérification de la capacité positive
    if (!isCapacitePositif(capacite)) {
      throw new Error("La capacité de la salle doit être supérieure à zéro.");
    }

    // 🎥 5. Vérification de la qualité homologuée
    if (!isQualiteInList(qualite_projection)) {
      throw new Error("La qualité de projection choisie doit être homologuée.");
    }

    // 🚀 6. Création effective via le service
    await createSalleService(nom_salle, capacite, qualite_projection, id_cinema);

    // 🎉 7. Message de succès + redirection
    req.flash("success", `🎬 La salle "${nom_salle}" a été créée avec succès.`);
    return res.redirect("/intranet/salle/createform");

  } catch (error) {
    console.error("Erreur contrôleur SubmitCreateSalle :", error);
    req.flash("error", error.message || "❌ Impossible de traiter la création de la salle.");
    return res.redirect("/intranet/salle/createform");
  }
};

// controllers/emp.salle.controller.js
import { getSalles } from "../services/emp.salle.service.js";

// Fonction qui renvoie toutes les salles de la BDD au client (pour modification ultérieure)
export const renderAllSalles = async function(req, res) {
  try {
    // Récupération via le service
    const salles = await getSalles();

    // Rendu de la page EJS
    return res.render("all_salle_emp", {
      salles,
      currentUser: req.session.user,
      success: req.flash("success"),
      error: req.flash("error"),
      success:req.flash("success") || [],
    error:req.flash("error") || [],
      
    });

  } catch (error) {
    console.error("❌ Erreur contrôleur renderAllSalles :", error);
    req.flash("error", error.message || "❌ Impossible d'accéder à la liste des salles.");
    return res.redirect("/intranet/get/salleHub");
  }
};

import { hallDataByIdService,cinemaListService ,updateSalleService} from "../services/emp.salle.service.js";

export const renderFormEditSalleById = async (req, res) => {
  try {
    const id_salle = parseInt(req.params.id_salle, 10);
    if (isNaN(id_salle)) {
      console.warn("⚠️ ID de salle invalide :", req.params.id_salle);
      return res.status(400).render("error_salle_edit", {
        message: "Identifiant de salle invalide.",
        csrfToken: req.csrfToken(),
        currentUser: req.session.user,
        success:req.flash("success") || [],
        error:req.flash("error") || [],
      });
    }

    // 1) Récupère la salle (avec nom_cinema, id_cinema…)
    const salle = await hallDataByIdService(id_salle);
    if (!salle) {
      return res.status(404).render("error_salle_edit", {
        message: "Salle introuvable.",
        csrfToken: req.csrfToken(),
        currentUser: req.session.user,
        success:req.flash("success") || [],
    error:req.flash("error") || [],
      });
    }

    // 2) Récupère tous les cinémas (id + nom) pour le <select>
    const cinemas = await cinemaListService(); // renvoie [{id_cinema, nom_cinema}, …]

    // 3) (Optionnel) Qualités de projection si tu veux les proposer
    const qualites = getQualityProjection();

    return res.render("emp_edit_salle", {
      csrfToken: req.csrfToken(),
      currentUser: req.session.user,
      salle,       // objet de la salle courante
      cinemas,     // liste pour le select
      qualites,    // liste pour le select de qualité
      id_salle,
      success: req.flash("success"),
      error: req.flash("error"),
    });
  } catch (error) {
    console.error("❌ Erreur dans renderFormEditSalleById :", error);
    return res.status(500).render("error_salle_edit", {
      message: "Erreur interne lors du chargement du formulaire.",
      csrfToken: req.csrfToken(),
      currentUser: req.session.user,
      success:req.flash("success") || [],
    error:req.flash("error") || [],
    });
  }
};



export const renderUpdateSalle = async function (req, res, next) {
  
  // Déclarons les variables avant le try
  let id_cinema, nom_salle, capacite, qualite_projection, id_salle;

  try {

    // Assignons les copies de valeurs à nos variables
    ({
      id_cinema,
      nom_salle,
      capacite, 
      qualite_projection,
      id_salle
    } = req.body);

    // Appelons le service pour traiter la mise à jour 
    const update = await updateSalleService(
      id_cinema,
      nom_salle,
      capacite,
      qualite_projection,
      id_salle
    );

    // Message flash de succès
    req.flash("success", `Mise à jour de la salle « ${nom_salle} » effectuée.`);
    
    // Redirection cohérente après mise à jour
    return res.redirect(`/intranet/salles/${id_salle}/edit`);

  } catch (error) {

    // Message flash d’erreur
    req.flash("error", `Mise à jour de la salle « ${nom_salle} » impossible !`);
    
    // Redirection de fallback ERREUR
    return res.status(500).redirect(`/intranet/salles/${id_salle}/edit`);
  }
};


// Fonction qui renvoie toutes les salles à supprimer
import {listSalleService } from "../services/emp.salle.service.js";

export const renderAllSallesForDelete = async function (req, res) {
  try {
    //Appelons le service pour récuperer la liste de salle
    const salles = await listSalleService();

    //Si la liste est vide on va retourner une erreur
    if(salles.length === 0) {
      return res.render("error_salle_get",{
        message:"Aucune salle disponible.",
        currentUser:req.session.user,
        success:req.flash("success") || [],
        error : req.flash("error") || []});
    }
    return res.render("list_salle_emp_delete.ejs",{
      currentUser:req.session.user,
      salles:salles,
      csrfToken:req.csrfToken(),
      success:req.flash("success") || [],
      error:req.flash("error") || [],
    });



  } catch (error) {
    req.flash("error", "Impossible d'afficher la liste des salles.");
    return res.status(500).redirect("/intranet/get/salleHub");
  }
};


import { deleteSalleService } from "../services/emp.salle.service.js";

export const deleteSalleController = async function (req, res) {
  try {
    const id_salle = parseInt(req.params.id);

    // Vérification : ID valide ?
    if (isNaN(id_salle)) {
      req.flash("error", "Identifiant de salle invalide.");
      return res.redirect("/intranet/salles/all/delete"); 
    }

    // Appel du service
    const result = await deleteSalleService(id_salle);

    // Erreur métier (prévisible)
    if (!result.success) {
      req.flash("error", result.message);
      return res.redirect("/intranet/salles/all/delete");
    }

    // Succès
    req.flash("success", "Salle supprimée avec succès.");
    return res.redirect("/intranet/salles/all/delete");

  } catch (error) {
    console.error("Erreur dans deleteSalleController:", error);

    req.flash("error", "Erreur interne : impossible de supprimer la salle.");
    return res.redirect("/intranet/salles/all/delete");
  }
};
