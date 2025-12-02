import {Router} from "express";

import { requireEmployee   } from "../middlewares/authMiddleware.js";//importons ce middleware authentification
//Importons ici le handler final ou midlware final
import { renderHomeEmp } from "../controllers/employe.home.js";
//Importons le handler de reponse final pour la vue de gestion de films
import { renderHandlerFilms,hubSeanceRender } from "../controllers/employe.home.js";
import { renderFormCreateFilms,renderFormCreateSeance,createSeance,ListSeanceRender,editFormSeance,renderSeanceUpdate,renderAllSeancesToDelete,renderDeleteSeance} from "../controllers/employe.home.js";
import {renderNewFilm } from "../controllers/employe.home.js";
import {renderAllFilms,renderAllFilmsForDelete} from "../controllers/employe.home.js";
import {loadFormFilm,submitUpdateFilm,deleteFilm} from  "../controllers/employe.home.js";
import {renderHubSalle,renderFormCreateSalle,SubmitCreateSalle,renderAllSalles,renderFormEditSalleById,renderUpdateSalle,renderAllSallesForDelete,deleteSalleController } from "../controllers/employe.home.js";
import csurf  from "csurf";


//On va stocker dans une constante la valeur de premiere classe issue de csruf
const csrufMidleware = csurf();
const empHomeRenderRouter = Router(); //Creation de la mini application express

//Montons des midlleware et handler request sur la mini app EmpHomeRenderRouter
// pour un verbe HTTP GET et URL (/employe/home)

empHomeRenderRouter.get('/employe/home',requireEmployee,renderHomeEmp);

//Route partie: GESTION DES FILMS
empHomeRenderRouter.get('/intranet/films',requireEmployee,renderHandlerFilms);
empHomeRenderRouter.get('/intranet/films/create',requireEmployee,csrufMidleware,renderFormCreateFilms);
empHomeRenderRouter.post('/intranet/films',requireEmployee,csrufMidleware,renderNewFilm)


//Route pour Modifier un film (l'éditer)
// a) Partie qui s'occupe de affichage de tous les films dans la BD
empHomeRenderRouter.get("/intranet/getAllFilms",requireEmployee,renderAllFilms);
 
// a.1)Partie qui rend tous les films à l'employé pour suppression
empHomeRenderRouter.get("/intranet/getAllFilms/delete",requireEmployee,csrufMidleware,renderAllFilmsForDelete)

// b) Partie qui s'occupe de la récuperation d'une ressource formulaire qui estr préremplir des données du film
empHomeRenderRouter.get("/intranet/films/edit/:id",requireEmployee,csrufMidleware,loadFormFilm)


//c)La mini application va soumettre et modifier un film dans la BDD
empHomeRenderRouter.post("/intranet/films/update/:id",requireEmployee,csrufMidleware,submitUpdateFilm);

//d) Notre mini application va supprimer un film dans la BDD
empHomeRenderRouter.post("/intranet/films/:id/delete",requireEmployee,csrufMidleware,deleteFilm);

//e) Notre mini application va rendre la page de gestion des séeance
empHomeRenderRouter.get("/intranet/seances/hub",requireEmployee,hubSeanceRender);

//f) Notre mini application va rendre la page de formulaire de création de séance intelligente
empHomeRenderRouter.get("/intranet/seances/create",requireEmployee,csrufMidleware,renderFormCreateSeance);

//g) Nous allons avec notre sub-app traiter la soumission du formulaire de création de séance
empHomeRenderRouter.post("/intranet/seances/create",requireEmployee,csrufMidleware,createSeance)

//h)Notre subAPP va rendre tous les séances existantes dans la BDD
empHomeRenderRouter.get("/intranet/seances/all",requireEmployee,ListSeanceRender);

//i) Notre subApp va fournir à l'employé un formulaire d'édition de la séance sélectionnée
empHomeRenderRouter.get("/intranet/seances/:id/edit",requireEmployee,csrufMidleware,editFormSeance);

//j) Notre subApp va traiter la soumission du formulaire d'édition de séance
empHomeRenderRouter.post("/intranet/seances/:id/update",requireEmployee,csrufMidleware,renderSeanceUpdate);

// k) Notre subapp va rendre tous les séances existantes dans la BDD à supprimer 
empHomeRenderRouter.get("/intranet/seances/all/delete",requireEmployee,csrufMidleware,renderAllSeancesToDelete);

// m) Notre subapp  va supprime  la séance dans la BDD
empHomeRenderRouter.post("/intranet/seances/:id/delete",requireEmployee,renderDeleteSeance);

// Notre subApplication va rendre la page de Gestion de salle pour l'employé
empHomeRenderRouter.get("/intranet/get/salleHub",requireEmployee,renderHubSalle);

// Notre subAPP va rendre un formulaire de création de salle à l'employé
empHomeRenderRouter.get("/intranet/salle/createform",requireEmployee,csrufMidleware,renderFormCreateSalle)

// Notre subAPP va creer la salle 
empHomeRenderRouter.post("/intranet/create/salle",requireEmployee,SubmitCreateSalle);

// Notre SubApp va rendre une vue pour affcher tous les salles à modifier 
empHomeRenderRouter.get("/intranet/get/allsalle/edit",requireEmployee,renderAllSalles);

//Notre sous application qui va afficher la rendre le formulaire d'édition de salle
empHomeRenderRouter.get("/intranet/salles/:id_salle/edit",requireEmployee,csrufMidleware,renderFormEditSalleById);

//Notre sous app va mettre à jour une salle de notre choix
empHomeRenderRouter.post("/intranet/salles/:id_salle/update",requireEmployee,renderUpdateSalle);

//Notre sous app qui va afficher tous les salles à supprimer
empHomeRenderRouter.get("/intranet/salles/all/delete",requireEmployee,csrufMidleware,renderAllSallesForDelete);

//Notre sous app va supprimer une salle spécifiée par l'employé
empHomeRenderRouter.post("/intranet/salles/:id/delete",requireEmployee,deleteSalleController );

export default empHomeRenderRouter;