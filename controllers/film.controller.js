// controllers/film.controller.js
import { fetchFilmsWithFilters } from "../services/film.service.js";

export const filmRender = async (req, res) => {
  const { cinemaId, genre, date } = req.query;

  try {
    const { films, cinemas, genres } = await fetchFilmsWithFilters({ cinemaId, genre, date });

    res.render("film", {
      films,
      cinemas,
      genres,
      selectedCinema: cinemaId || "",
      selectedGenre: genre || "",
      selectedDate: date || ""
    });
  } catch (err) {
    console.error("Erreur dans filmRender:", err.message);
    res.status(500).send("Erreur serveur lors du rendu des films.");
  }
};
import { getFilmDetailsService } from "../services/film.service.js";

export const filmDetailsRender = async (req, res) => {
  const { id } = req.params;

  try {
    const film = await getFilmDetailsService(id);

    if (!film) {
      return res.status(404).render("404", { message: "Film non trouvé" });
    }

    res.render("film_details", {
      title: film.titre,
      film,
      currentUser: req.session.user || null
    });

  } catch (err) {
    console.error("Erreur filmDetailsRender:", err);
    res.status(500).send("Erreur serveur sur la fiche film.");
  }
};
