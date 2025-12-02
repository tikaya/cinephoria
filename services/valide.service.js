import { 
  findSeanceById,
  findSiegesByIds,
  checkSiegesAlreadyReserved,
  reserverAvecSieges
} from "../models/valide.models.js";

import { syncOne } from "../services/syncOne.js"; // ✅ ajoute l'import

export const createReservationWithChecks = async (id_user, id_seance, sieges, prix_total) => {
  try {
    // 1) Vérifier la séance
    const seance = await findSeanceById(id_seance);
    if (!seance) throw new Error("Séance introuvable");

    // 2) Vérifier que les sièges existent
    const siegeReturn = await findSiegesByIds(sieges);
    if (siegeReturn.length !== sieges.length) {
      throw new Error("Certains sièges sont invalides");
    }

    // 3) Vérifier qu'ils ne sont pas déjà réservés
    const siege_reserve = await checkSiegesAlreadyReserved(sieges, id_seance);
    if (siege_reserve.length > 0) {
      throw new Error("Un ou plusieurs sièges sont déjà réservés.");
    }

    // 4) Créer la réservation (INSERT + liaisons sièges)
    const nombre_places = sieges.length;

    // ⬇️ Important: 'reserverAvecSieges' doit retourner l'ID PG créé
    //    Par ex: { id_reservation: 123, ... } ou juste 123
    const newReservation = await reserverAvecSieges(
      id_user,
      id_seance,
      sieges,
      nombre_places,
      prix_total
    );

    // 5) Sync miroir Mongo **après** l’écriture PG réussie
    const id =
      typeof newReservation === "object"
        ? (newReservation.id_reservation || newReservation.id)
        : newReservation;

    if (Number.isFinite(id)) {
      await syncOne(id); // ✅ relit en PG (fetchReservationById) puis upsert Mongo
    } else {
      console.warn("⚠️ Impossible de synchroniser: id_reservation non retourné par reserverAvecSieges");
    }

    return newReservation;

  } catch (error) {
    console.error("Erreur service (createReservationWithChecks):", error.message);
    throw new Error("Impossible de créer la réservation.");
  }
};
