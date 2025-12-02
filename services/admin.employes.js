// services/employes.service.js
import bcrypt from "bcrypt";
import * as Employe from "../models/admin.employes.js";

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/i;

export async function createEmployeService(input, { minPwd = 8 } = {}) {
  const errors = [];

  // 1) Normalisation
  const email = (input.email || "").trim().toLowerCase();
  const password = input.password || "";
  const password_confirm = input.password_confirm || "";
  const role = (input.role_employe === "ADMIN") ? "ADMIN" : "EMPLOYEE";

  // 2) Validations
  if (!email || !EMAIL_RE.test(email)) errors.push("Adresse e-mail invalide.");
  if (password.length < minPwd) errors.push(`Mot de passe trop court (min ${minPwd}).`);
  if (password !== password_confirm) errors.push("La confirmation du mot de passe ne correspond pas.");

  if (errors.length) return { ok: false, code: 422, errors };

  // 3) Hash
  const passwordHash = await bcrypt.hash(password, 12);

  // 4) Appel Modèle + mapping des erreurs DB
  try {
    const id = await Employe.insertOne({ email, passwordHash, role });
    return { ok: true, id };
  } catch (err) {
    // 23505 = unique_violation (email)
    if (err?.code === "23505") {
      return { ok: false, code: 409, errors: ["Cette adresse e-mail est déjà utilisée."] };
    }
    throw err; // laisser remonter au handler global (500)
  }
}


export async function listEmployesService({ limit = 20, offset = 0, q = null, role = null } = {}) {
  // Normalisation légère côté service
  const filters = {
    limit,
    offset,
    q: q ? q.toLowerCase() : null,
    role
  };
  const [items, total] = await Promise.all([
    Employe.listPage(filters),
    Employe.countAll(filters)
  ]);
  return { items, total };
}