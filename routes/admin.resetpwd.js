import { Router } from "express";//Importons le module Routeur de Express nous 
import { requireAdmin } from "../middlewares/authMiddleware.js";
import { handlerPwdReset, renderPwdForm } from "../controllers/admin.emplresetpwd.js";
import { body } from "express-validator";
import csurf  from "csurf";

//midlleware de protection attaque CSRF
const csrfProtect = csurf();
//middleware de vérifiaction saisie email 
const validateEmail = body("email").isEmail().withMessage("Adresse e-mail invalide.");

//Creation de notre mini application (son job: permettre à admin de rénitialiser un mdp employé )
const adminPwdresetRouter = Router();
//Quand le client utilise le verbe GET sur URL ("/form") Alors on execute les midlleware 
// require  Admin csrfProtect et renderPwdForm
adminPwdresetRouter.get("/form",requireAdmin,csrfProtect,renderPwdForm);

export default adminPwdresetRouter;


adminPwdresetRouter.post("/traitement",requireAdmin,csrfProtect,validateEmail,handlerPwdReset);
