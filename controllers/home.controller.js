// controllers/home.controller.js
import { homeService } from '../services/home.service.js';

export const homeRender = async (req, res) => {
  try {
    if (req.session?.user?.role === "ADMIN") {
      return res.redirect("/admin");
    }

    // Lis les filtres de la query
    const q = (req.query.q || "").trim();
    const coup_de_coeur = !!req.query.coup_de_coeur;

    // Si ton service accepte des filtres, passe-les (sinon garde homeService() tel quel)
    const films = await homeService({ q, coup_de_coeur });

    res.render("home", {
      films,
      q,
      coup_de_coeur, // << évite l’erreur EJS
    });
  } catch (error) {
    console.error("Erreur affichage home :", error);
    res.status(500).send("Erreur serveur");
  }
};
