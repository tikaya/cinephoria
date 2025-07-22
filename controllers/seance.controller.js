import { getFilmData } from "../services/seance.service.js";

export const seanceRender = async (req, res) => {
  try {
    const filmId = req.params.id;
    const { seances, titre } = await getFilmData(filmId);

    res.render("film-seances.ejs", {
      seances,
      filmTitre: titre
    });
  } catch (error) {
    console.error("Erreur lors du rendu de la vue :", error);
    res.status(500).send("Erreur serveur");
  }
};
