import { getRecapitulatif } from "../services/recapitulatif.service.js";
import pool from "../config/db.js"; // si tu as besoin de requêtes complémentaires

export const renderRecapitulatif = async (req, res) => {
  try {
    // 1) Lire les identifiants de base
    const seanceId = Number.parseInt(req.query.seanceId ?? req.body.seanceId, 10);
    const cinemaId = req.query.cinemaId ? Number.parseInt(req.query.cinemaId, 10) : null;
    const filmId   = req.query.filmId   ? Number.parseInt(req.query.filmId, 10)   : null;

    if (!Number.isInteger(seanceId) || seanceId <= 0) {
      return res.status(400).send("ID de séance invalide.");
    }

    // 2) Accepter nbPlaces OU nbrPlaces, depuis query OU body
    const rawPlaces = req.query.nbrPlaces ?? req.query.nbPlaces
                   ?? req.body.nbrPlaces ?? req.body.nbPlaces;

    // 3) Sièges choisis depuis l'URL (on nettoie)
    const siegesParam = (req.query.sieges ?? req.body.sieges ?? "").trim();
    const sieges = siegesParam
      ? Array.from(new Set( // dédoublonne
          siegesParam.split(",").map(s => s.trim()).filter(Boolean)
        ))
      : [];

    // 4) Labels lisibles (optionnels)
    const labelsParam = (req.query.labels ?? req.body.labels ?? "").trim();
    const labels = labelsParam
      ? labelsParam.split(",").map(s => s.trim()).filter(Boolean)
      : [];

    // 5) Nombre de places : priorité au param propre, sinon à la sélection réelle
    let nbrPlaces = Number.parseInt(rawPlaces, 10);
    if (!Number.isInteger(nbrPlaces) || nbrPlaces <= 0) {
      if (sieges.length > 0) {
        nbrPlaces = sieges.length; // on fait primer la sélection réelle
      } else {
        return res.status(400).send("Le nombre de places doit être un entier positif.");
      }
    }

    // 6) Cohérence finale : si différent, on s'aligne sur la réalité
    if (sieges.length > 0 && sieges.length !== nbrPlaces) {
      console.warn("[recap] nbPlaces != nb sièges sélectionnés", { nbPlaces: nbrPlaces, len: sieges.length });
      nbrPlaces = sieges.length;
    }

    // 7) Debug utile (enlève après validation)
    console.log("[recap] inputs", {
      seanceId, cinemaId, filmId, nbrPlaces,
      siegesCount: sieges.length, labelsCount: labels.length
    });

    // 8) Appel métier : génère le récap (prix, film, séance, etc.)
    const recapitulatif = await getRecapitulatif(seanceId, nbrPlaces, sieges);

    // 9) Rendu de la page
    res.render("recapitulatif", {
      recapitulatif,
      selectedCinema: cinemaId || "",
      selectedFilm: filmId || "",
      nbrPlaces,
      sieges,
      labels,
      isAuthenticated: !!req.session.user,
      request: req // si ta vue en a besoin
    });

  } catch (error) {
    console.error("Erreur contrôleur (renderRecapitulatif):", error);
    res.status(500).send("Impossible de générer le récapitulatif de la séance.");
  }
};
