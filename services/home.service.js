import { getFilmsDernierMercredi } from '../models/home.models.js';

export const homeService = async () => {
  const films = await getFilmsDernierMercredi();
  return films; // on retourne les films pour les envoyer à la vue
};
