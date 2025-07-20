import express from "express";
import { registerController, userPostRegister } from "../controllers/register.controller.js";

const router = express.Router();

// Afficher le formulaire
router.get("/register", registerController);

// Soumettre le formulaire
router.post("/register", userPostRegister);

// Afficher la page de succès après inscription
router.get("/registerSuccess", (req, res) => {
  res.render("registerSuccess");
});

export default router;
