import express from "express";
import { handleRegister } from "../services/register.service.js"; 

// GET : Affiche le formulaire d'inscription
export const registerController = (req, res) => {
  res.render("register", {
    errorMessage: null,
    previousValues: {} 
  });
};

// POST : Enregistre un nouvel utilisateur
export const userPostRegister = async (req, res) => {
  try {
    await handleRegister(req.body); 
    // Après inscription, rediriger vers la page de succès
    res.redirect("/registerSuccess");
  } catch (error) {
    console.error("Erreur d'inscription:", error.message);
    res.status(400).render("register", {
      errorMessage: error.message,
      previousValues: req.body
    });
  }
};
