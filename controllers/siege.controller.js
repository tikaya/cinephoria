import { siegeService } from "../services/siege.service.js";
import pool from "../config/db.js"; 

export const renderSiegesPage = async (req, res) => {
  try {
    const seanceId = parseInt(req.query.seanceId, 10);
    let cinemaId = req.query.cinemaId || "";
    let filmId = req.query.filmId || "";
    const nbPlaces = req.query.nbPlaces ? parseInt(req.query.nbPlaces, 10) : 1;

    if (!seanceId) {
      return res.status(400).send("Paramètres manquants ou invalides.");
    }

    // Toujours récupérer les IDs depuis la base si ce ne sont pas des nombres
    if (isNaN(parseInt(cinemaId, 10)) || isNaN(parseInt(filmId, 10))) {
      const query = `
        SELECT c.id_cinema, f.id_film
        FROM Seance s
        JOIN Salle sa ON s.id_salle = sa.id_salle
        JOIN Cinema c ON sa.id_cinema = c.id_cinema
        JOIN Film f ON s.id_film = f.id_film
        WHERE s.id_seance = $1
      `;
      const result = await pool.query(query, [seanceId]);
      if (result.rows.length) {
        cinemaId = result.rows[0].id_cinema.toString();
        filmId = result.rows[0].id_film.toString();
      } else {
        return res.status(404).send("Séance introuvable.");
      }
    }

    const sieges = await siegeService(seanceId);

    res.render("sieges", {
      sieges,
      seanceId,
      selectedCinema: cinemaId,
      selectedFilm: filmId,
      nbPlaces
    });
  } catch (error) {
    console.error("Erreur contrôleur (renderSiegesPage):", error.message);
    res.status(500).send("Impossible de charger les sièges.");
  }
};
