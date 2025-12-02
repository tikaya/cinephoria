import { getReservationsByUserModel } from "../models/user.reservation.model.js";

export async function getReservationsByUserService(idUser) {
  try {
    return await getReservationsByUserModel(idUser);
  } catch (error) {
    console.error("[SERVICE] getReservationsByUserService:", error);
    return [];
  }
}
