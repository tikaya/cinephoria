// services/resetEmployeePassword.js
import bcrypt from "bcrypt";
import crypto from "crypto";
import { mailer } from "../utils/mailer.js";
import * as EmployeModel from "../models/adminPwdResetEmp.js";

export async function resetEmployeePassword(email) {
  if (!email) throw new Error("Email requis.");

  // 1) Vérifier l'existence de l'employé
  const employe = await EmployeModel.findByEmail(email);
  if (!employe) {
    // 200 “anonymisé” possible pour ne pas révéler si l'email existe
    throw new Error("Aucun employé trouvé avec cet email.");
  }

  // 2) Générer un mot de passe temporaire (aléatoire, lisible)
  // 12 caractères URL-safe, mélange correct
  const tempPwd = crypto.randomBytes(9).toString("base64url").slice(0, 12);

  // 3) Hasher et enregistrer
  const hash = await bcrypt.hash(tempPwd, 12);
  await EmployeModel.updatePassword(employe.id_employe, hash);

  // Recommandé : marquer “doit changer le mot de passe au 1er login”
  if (EmployeModel.markMustChangePassword) {
    await EmployeModel.markMustChangePassword(employe.id_employe, true);
  }

  // 4) Envoyer l’email
  const info = await mailer.sendMail({
    from: `"Cinéphoria" <${process.env.GMAIL_USER}>`,
    to: email,
    subject: "Réinitialisation de votre mot de passe",
    text:
`Bonjour${employe.prenom ? " " + employe.prenom : ""},

Un mot de passe temporaire vient d'être généré pour votre compte Cinéphoria.

Mot de passe temporaire : ${tempPwd}

Par mesure de sécurité, ce mot de passe expirera prochainement et devra être changé à la première connexion.
Si vous n'êtes pas à l'origine de cette demande, contactez l'administrateur immédiatement.

— L'équipe Cinéphoria`,
    html:
`<p>Bonjour${employe.prenom ? " " + employe.prenom : ""},</p>
<p>Un mot de passe temporaire vient d’être généré pour votre compte <strong>Cinéphoria</strong>.</p>
<p><strong>Mot de passe temporaire :</strong> <code>${tempPwd}</code></p>
<p>Par mesure de sécurité, ce mot de passe expirera prochainement et devra être changé à la première connexion.</p>
<p>Si vous n’êtes pas à l’origine de cette demande, contactez l’administrateur immédiatement.</p>
<p>— L’équipe Cinéphoria</p>`,
  });

  // 5) Ne retourne pas le mot de passe en clair !
  return { messageId: info.messageId };
}
