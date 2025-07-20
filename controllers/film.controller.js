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
