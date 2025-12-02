import { 
  findById,
  getFutureSeancesForFilm,
  getValidatedAvisForFilm,
  getFilmAvisStats
} from "../models/film.model.js";

export async function getFilmFullDetailsService(idFilm) {
  // 1. Film
  const film = await findById(idFilm);
  if (!film) return null;

  // 2. Séances
  const seances = await getFutureSeancesForFilm(idFilm);

  // 3. Avis validés
  const avis = await getValidatedAvisForFilm(idFilm);

  // 4. Statistiques
  const stats = await getFilmAvisStats(idFilm);

  return {
    film,
    seances,
    avis,
    avgNote: Number(stats.avg_note || 0),
    nbAvis: Number(stats.nb_avis || 0)
  };
}
