// --- SERVICE (recapitulatif.service.js) ---
import { getPrixBySeanceId } from "../models/recapitulatif.model.js";

export const getRecapitulatif = async (seanceId, nbrPlaces, sieges = []) => {
  try {
    if (!seanceId || isNaN(seanceId)) {
      throw new Error("ID de séance invalide.");
    }
    if (!nbrPlaces || isNaN(nbrPlaces) || nbrPlaces <= 0) {
      throw new Error("Le nombre de places doit être un entier positif.");
    }

    const seanceInfo = await getPrixBySeanceId(seanceId);
    if (!seanceInfo) throw new Error("Séance introuvable.");

    const totalPrix = parseFloat(seanceInfo.prix_unitaire) * nbrPlaces;

    return {
      id_seance: seanceInfo.id_seance,
      id_cinema: seanceInfo.id_cinema,
      id_film: seanceInfo.id_film,
      prix_unitaire: parseFloat(seanceInfo.prix_unitaire),
      date_seance: seanceInfo.date_seance,
      heure_debut: seanceInfo.heure_debut,
      heure_fin: seanceInfo.heure_fin,
      nom_salle: seanceInfo.nom_salle,
      nom_cinema: seanceInfo.nom_cinema,
      film_titre: seanceInfo.film_titre,
      nbr_places: nbrPlaces,
      total_prix: parseFloat(totalPrix.toFixed(2)),
      sieges: sieges // On garde ce qui vient du contrôleur
    };
  } catch (error) {
    console.error("Erreur service (getRecapitulatif):", error.message);
    throw new Error("Impossible de générer le récapitulatif de la séance.");
  }
};
