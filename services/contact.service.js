import { mailer } from "../utils/mailer.js";

export const sendContactMail = async ({ name, email, title, message }) => {

  const htmlContent = `
  <h2>Nouveau message de contact — Cinéphoria</h2>
  <p><strong>Nom :</strong> ${name || "Non renseigné"}</p>
  <p><strong>Email :</strong> ${email}</p>
  <p><strong>Titre :</strong> ${title}</p>
  <p><strong>Message :</strong></p>
  <p>${message.replace(/\n/g, "<br>")}</p>
  `;

  await mailer.sendMail({
    from: `"Cinéphoria Contact" <${process.env.GMAIL_USER}>`,
    to: process.env.GMAIL_USER,
    subject: `[CONTACT] ${title}`,
    html: htmlContent,
    replyTo: email
  });
};
