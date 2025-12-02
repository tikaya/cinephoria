import { getAllCinemas, getFilmsByCinemaId, getSeancesByFilmAndCinema } from "../models/reservation.model.js";


export const reservationService = async (cinemaId) => {
  try {
    const cinemas = await getAllCinemas();
    const filmsRaw = cinemaId ? await getFilmsByCinemaId(cinemaId) : [];

    const films = filmsRaw.map(f => ({
      id_film: f.id_film,
      titre: f.titre,
      genre: f.genre || null,
      poster_url: (f.poster_url && String(f.poster_url).startsWith('http')) ? f.poster_url : null
    }));

    return { cinemas, films };
  } catch (error) {
    console.error("Erreur service (reservationService):", error.message);
    throw new Error("Impossible de charger les données");
  }
};

export const getSeance = async (cinemaId, filmId, nbPlaces) => {
  try {
    return await getSeancesByFilmAndCinema(cinemaId, filmId, nbPlaces);
  } catch (error) {
    console.error("Erreur service (getSeance):", error.message);
    throw new Error("Impossible de charger les séances");
  }
};