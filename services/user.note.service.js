import { isSeancePassedModel, userAlreadyNotedModel } from "../models/user.note.model.js";
import { insertUserNoteModel } from "../models/user.note.model.js";

export async function canUserRateService(idUser, idFilm, idSeance) {
  const passed = await isSeancePassedModel(idSeance);
  if (!passed) return false;

  const already = await userAlreadyNotedModel(idUser, idFilm, idSeance);
  if (already) return false;

  return true;
};



export async function insertUserNoteService(idUser, idFilm, idSeance, note, description) {
  return await insertUserNoteModel(idUser, idFilm, idSeance, note, description);
}
