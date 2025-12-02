// services/siege.service.js
import { getSiegeBySeanceId } from "../models/siege.model.js";

export const siegeService = async (seanceId) => {
  try {
    const sieges = await getSiegeBySeanceId(seanceId);

    // Ajout d'une logique métier (distinction PMR et statut)
    const processed = sieges.map(s => {
      let statutFinal = s.statut; // "libre" ou "reservé"
      if (s.type_siege === "PMR" && statutFinal === "libre") {
        statutFinal = "pmr"; // Statut spécial pour les PMR
      }
      return {
        ...s,
        statut: statutFinal
      };
    });

    return processed;
  } catch (error) {
    console.error("Erreur service (siegeService):", error.message);
    throw new Error("Impossible de charger les sièges");
  }
};
