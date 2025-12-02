// controllers/seance.controller.js
import { getFilmData } from "../services/seance.service.js";




export async function seanceRender(req, res) {
  try {
    const { id } = req.params;
    const { cinemaId, nbPlaces } = req.query; // ✅ on récupère les infos du lien précédent

    const data = await getFilmData(id);

    if (!data) {
      return res.status(404).render("404", { title: "Film introuvable" });
    }

    return res.render("seances", {
      title: `Séances — ${data.film.titre}`,
      film: data.film,
      filmPoster: data.film.poster_url || null,
      seances: data.seances,

      // ✅ Variables requises par ta vue EJS :
      selectedCinema: cinemaId || null,
      selectedFilm: data.film.id_film,
      nbPlaces: nbPlaces || 1,

      messages: req.flash ? req.flash() : {},
      currentUser: req.session.user,
    });
  } catch (err) {
    console.error("Erreur seanceRender:", err.message);
    return res.status(500).render("500", { title: "Erreur serveur" });
  }
}

export const showFilmSeances = seanceRender;



