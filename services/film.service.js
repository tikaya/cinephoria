// services/film.service.js
import { filmFilter } from "../models/film.model.js"
import { getAllCinemas } from "../models/cinema.model.js";
import { getAllGenres } from "../models/film.model.js";

export const fetchFilmsWithFilters = async (filters) => {
  const { cinemaId, genre, date } = filters;

  const films = await filmFilter(cinemaId || null, genre || null, date || null);
  const cinemas = await getAllCinemas();
  const genres = await getAllGenres();

  return { films, cinemas, genres };
};
