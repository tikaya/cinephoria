import bcrypt from "bcrypt";
import { updatePassword } from "../models/user.model.js";

export const changePasswordService = async (id_user, newPassword) => {
  const hash = await bcrypt.hash(newPassword, 10);
  await updatePassword(id_user, hash, false);
};


