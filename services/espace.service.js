import { findReservationById } from "../models/espace.model.js";

export const getReservationByUser = async (userId) => {
  if (!userId) {
    throw new Error("Service getReservationsByUserId → ID utilisateur manquant");
  }

  if (typeof userId !== "number") {
    throw new Error("Service getReservationsByUserId → ID utilisateur invalide (attendu : number)");
  }

  const reservations = await findReservationById(userId);
  return reservations;
};
