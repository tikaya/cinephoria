import { getFilmFullDetailsService } from "../services/film.details.service.js";

export async function renderFilmDetails(req, res) {
  const idFilm = req.params.id;  // <-- FIX

  try {
    const data = await getFilmFullDetailsService(idFilm);

    if (!data) {
      return res.status(404).send("Film introuvable.");
    }

    const { film, seances, avis, avgNote, nbAvis } = data;

    res.render("film_details", {
      title: `${film.titre} – Cinéphoria`,
      currentUser: req.session.user || null,
      film,
      seances,
      avis,
      avgNote,
      nbAvis
    });

  } catch (err) {
    console.error("[renderFilmDetails]", err);
    res.status(500).send("Erreur interne lors de l'affichage du film.");
  }
}
