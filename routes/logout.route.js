import { Router } from "express";
import {logoutUser} from "../controllers/auth.controller.js";
//Creation d'une instance de la fonction constrcuteur  Router l'objet creer ce trouve dans la variable logoutRouter
const logoutRouter =  Router();

//Router qui va deconecter utilisateur (employé,admin,client)
logoutRouter.get("/logout",logoutUser);

//Exportons cette varibale logoutRouter afin qu'elle soit importable dans d'autre module
export default logoutRouter;