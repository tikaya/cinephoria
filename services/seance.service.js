// importons la fonction model filmSeance depuis la couche model
import { filmSeance, filmTitre } from "../models/seance.model.js";

// exportons la function service qui prend une entrée (filmId)
export const getFilmData = async(filmId)=>{
    const seances = await filmSeance(filmId);
    const titre = await filmTitre(filmId);
    return {seances, titre};
}
