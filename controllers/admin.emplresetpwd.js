import { validationResult } from "express-validator";
import * as resetService from "../services/admin.resetPwdEmploye.js";

export const renderPwdForm = function(req,res) {
    res.render("formReset",
        {csrfToken:req.csrfToken(),
         errorMessage: null,
         successMessage:null,
         previousValues:{} 
        
        });
};



export  const handlerPwdReset = async  function(req,res) {
    //Recuperons email saisie
    const email = req.body.email;

    //Vérification express-validator
    const errors = validationResult(req); //cette fonction recupere les erreur faites pas les 
    //midllewares de express-validator
    if(!errors.isEmpty()) {
        return res.render("formReset",{
            csrfToken:req.csrfToken(),
            errorMessage:errors.array([0].msg),
            successMessage:null,
            previousValues:{email}
        })
    }
    try {
        // Appel au service métier
        await resetService.resetEmployeePassword(email);
         return res.render("formReset", {
      csrfToken: req.csrfToken(),
      errorMessage: null,
      successMessage: `Un mot de passe temporaire a été envoyé à ${email}.`,
      previousValues: {}
    });
  } catch (err) {
    return res.render("formReset", {
      csrfToken: req.csrfToken(),
      errorMessage: err.message || "Erreur lors de la réinitialisation.",
      successMessage: null,
      previousValues: { email }
    });
  }
}