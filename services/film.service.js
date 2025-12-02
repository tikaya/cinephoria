// services/film.service.js
import { filmFilter } from "../models/film.model.js"
import { getAllCinemas } from "../models/cinema.model.js";
import { getAllGenres } from "../models/film.model.js";
import * as filmModel from '../models/film.model.js';


export const fetchFilmsWithFilters = async (filters) => {
  const { cinemaId, genre, date } = filters;

  const films = await filmFilter(cinemaId || null, genre || null, date || null);
  const cinemas = await getAllCinemas();
  const genres = await getAllGenres();

  return { films, cinemas, genres };
};



function validate(input) {
  const errors = [];
  const titre = (input.titre || '').trim();
  const description = (input.description || '').trim();
  const genre = (input.genre || '').trim();

  if (!titre) errors.push({ field: 'titre', message: 'Titre obligatoire' });
  if (!description) errors.push({ field: 'description', message: 'Description obligatoire' });
  if (!genre) errors.push({ field: 'genre', message: 'Genre obligatoire' });

  const age = input.age_minimum !== null && input.age_minimum !== undefined
    ? Number(input.age_minimum) : null;
  if (age !== null && (!Number.isInteger(age) || age < 0)) {
    errors.push({ field: 'age_minimum', message: 'Âge minimum doit être un entier ≥ 0' });
  }

  return { errors, data: { ...input, titre, description, genre, age_minimum: age } };
}

function wrapPgError(err) {
  // 23505: unique_violation (titre, uq lower(titre))
  if (err.code === '23505') {
    const e = new Error('Un film avec ce titre existe déjà');
    e.expose = [{ field: 'titre', message: 'Titre déjà utilisé (insensible à la casse)' }];
    return e;
  }
  // 23514: check_violation (age_minimum >= 0)
  if (err.code === '23514') {
    const e = new Error('Âge minimum invalide (contrainte)');
    e.expose = [{ field: 'age_minimum', message: 'Âge minimum doit être ≥ 0' }];
    return e;
  }
  return err;
}

export async function list({ page = 1, q = '' }) {
  const pageSize = 12;
  const offset = (page - 1) * pageSize;
  return filmModel.list({ q, limit: pageSize, offset });
}

export async function create(input) {
  const { errors, data } = validate(input);
  if (errors.length) {
    const e = new Error('Validation échouée'); e.expose = errors; throw e;
  }
  try {
    return await filmModel.insert(data);
  } catch (err) {
    throw wrapPgError(err);
  }
}

export async function getById(id) {
  return filmModel.findById(id);
}

export async function update(id, input) {
  const { errors, data } = validate(input);
  if (errors.length) {
    const e = new Error('Validation échouée'); e.expose = errors; throw e;
  }
  try {
    await filmModel.update(id, data);
  } catch (err) {
    throw wrapPgError(err);
  }
}

export async function remove(id) {
  try {
    await filmModel.remove(id);
  } catch (err) {
    // 23503: foreign_key_violation (séances existantes)
    if (err.code === '23503') {
      throw new Error("Suppression refusée : des séances référencent ce film");
    }
    throw err;
  }
}

import { getFilmFullDetailsModel } from "../models/film.model.js";

export async function getFilmDetailsService(idFilm) {
  return await getFilmFullDetailsModel(idFilm);
}
