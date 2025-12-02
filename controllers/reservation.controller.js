import { reservationService, getSeance } from "../services/reservation.service.js";

// Page de réservation (cinéma + films)
export const renderReservationPage = async (req, res) => {
  try {
    const cinemaId = req.query.cinemaId ? parseInt(req.query.cinemaId, 10) : null;

    if (cinemaId && isNaN(cinemaId)) {
      return res.status(400).send("Paramètre cinéma invalide.");
    }

    const { cinemas, films } = await reservationService(cinemaId);

    res.render("reservation", {
      cinemas,
      films,
      selectedCinema: cinemaId || ""
    });
  } catch (error) {
    console.error("Erreur contrôleur (renderReservationPage):", error.message);
    res.status(500).send("Le site est temporairement indisponible.");
  }
};

// Page des séances (film choisi + nb places)
export const renderSeancesPage = async (req, res) => {
  try {
    const cinemaId = req.query.cinemaId ? parseInt(req.query.cinemaId, 10) : null;
    const filmId = req.query.filmId ? parseInt(req.query.filmId, 10) : null;
    const nbPlaces = req.query.nbPlaces ? parseInt(req.query.nbPlaces, 10) : 1;

    if (!cinemaId || !filmId || isNaN(nbPlaces) || nbPlaces <= 0) {
      return res.status(400).send("Paramètres manquants ou invalides.");
    }

    const seances = await getSeance(cinemaId, filmId, nbPlaces);

    res.render("seances", {
      seances,
      selectedCinema: cinemaId,
      selectedFilm: filmId,
      nbPlaces
    });
  } catch (error) {
    console.error("Erreur contrôleur (renderSeancesPage):", error.message);
    res.status(500).send("Impossible de charger les séances.");
  }
};
