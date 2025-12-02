// utils/mailer.js
import nodemailer from "nodemailer";
import "dotenv/config";



// --- Normalisation & validations env
const HOST = process.env.GMAIL_HOST || "smtp.gmail.com";
const PORT = Number(process.env.GMAIL_PORT) || 587;
const SECURE = PORT === 465;

// ⚠️ IMPORTANT: Gmail → mot de passe d’application (16 chars), sans espaces
let PASS = process.env.GMAIL_PASSWORD || "";
PASS = PASS.replace(/\s+/g, ""); // supprime tous les espaces éventuels

if (!process.env.GMAIL_USER) {
  throw new Error("GMAIL_USER manquant dans .env");
}
if (!PASS) {
  throw new Error("GMAIL_PASSWORD manquant dans .env (mot de passe d’application Gmail)");
}
if (PASS.length !== 16) {
  console.warn("⚠️ GMAIL_PASSWORD ne fait pas 16 caractères. Vérifie que c’est bien un mot de passe d’application (sans espaces).");
}

export const mailer = nodemailer.createTransport({
  host: HOST,
  port: PORT,
  secure: SECURE, // true si 465, false si 587
  auth: {
    user: process.env.GMAIL_USER,
    pass: PASS,
  },
  // pool: true, // utile si tu envoies beaucoup de mails
  // tls: { servername: "smtp.gmail.com" }, // rarement nécessaire
});

// Vérification de la connexion SMTP (désactive en prod si ça te gêne)
mailer.verify()
  .then(() => console.log("📨 Mailer connecté à Gmail SMTP"))
  .catch(err => console.error("❌ Erreur connexion SMTP:", err.message));

  export const sendTempPassword = async (to, password) => {
  await mailer.sendMail({
    from: `"Cinéphoria" <${process.env.GMAIL_USER}>`,
    to,
    subject: "Cinéphoria — Mot de passe temporaire",
    html: `
      <h2>🎬 Cinéphoria</h2>
      <p>Voici votre mot de passe temporaire :</p>
      <h3>${password}</h3>
      <p>Merci de le modifier dès votre prochaine connexion.</p>
    `
  });
};
