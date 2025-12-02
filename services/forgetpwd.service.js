import bcrypt from "bcrypt";
import { findUserByEmail, updatePassword } from "../models/user.model.js";
import { sendTempPassword } from "../utils/mailer.js";

const generatePassword = (length = 10) => {
  const chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789@#";
  let pwd = "";
  for (let i = 0; i < length; i++) {
    pwd += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return pwd;
};

export const forgotPasswordService = async (email) => {
  const user = await findUserByEmail(email);
  if (!user) throw new Error("Aucun compte associé à cet email.");

  const tempPassword = generatePassword(10);
  const hash = await bcrypt.hash(tempPassword, 10);

  await updatePassword(user.id_user, hash, true);
  await sendTempPassword(user.email, tempPassword);
};
