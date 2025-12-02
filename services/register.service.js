import bcrypt from 'bcrypt';
import validator from 'validator';
import fs from 'fs';
import nodemailer from 'nodemailer';
import { addUserInDb, isEmailUsed, isPseudoTaken } from '../models/register.models.js';

export const handleRegister = async ({ prenom, nom, pseudo, email, password }) => {
  // --- Validation (inchangée) ---
  // ... tous tes tests de champ et mot de passe ...
   if (!prenom || !/^[a-zA-ZÀ-ÿ\s-]{2,50}$/.test(prenom)) {
    throw new Error('Prénom invalide');
  }

  if (!nom || !/^[a-zA-ZÀ-ÿ\s-]{2,50}$/.test(nom)) {
    throw new Error('Nom invalide');
  }

  if (!pseudo || !/^[a-zA-Z0-9_-]{3,30}$/.test(pseudo)) {
    throw new Error('Pseudo invalide');
  }

  if (!email || !validator.isEmail(email)) {
    throw new Error('Email invalide');
  }

  if (!password || !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/.test(password)) {
    throw new Error('Mot de passe non conforme');
  }

  
  // Vérification unicité
  if (await isEmailUsed(email)) throw new Error('Email déjà utilisé');
  if (await isPseudoTaken(pseudo)) throw new Error('Pseudo déjà utilisé');

  // Hachage
  const salt = await bcrypt.genSalt(10);
  const secPass = await bcrypt.hash(password, salt);

  // Insertion en base
  const user = await addUserInDb({
    prenom,
    nom,
    pseudo,
    email,
    password: secPass
  });

  // Envoi du mail de bienvenue
  await sendConfirmationEmail(email, prenom, pseudo);

  return user; // retourne l'user inséré
};

// --- Fonction dédiée en dehors ---
export const sendConfirmationEmail = async (email, prenom, pseudo) => {
  const htmlContent = fs.readFileSync('./views/welcomeEmail.html', 'utf-8');

  const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: process.env.GMAIL_USER,
      pass: process.env.GMAIL_PASSWORD
    }
  });

  const mailOptions = {
    from: process.env.GMAIL_USER,
    to: email,
    subject: 'Bienvenue sur Cinéphoria !',
    html: htmlContent.replace('{{pseudo}}', pseudo)
  };

  await transporter.sendMail(mailOptions);
  console.log(`Email de confirmation envoyé à ${email}`);
};
