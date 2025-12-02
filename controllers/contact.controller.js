import { sendContactMail } from "../services/contact.service.js";

export const renderContactPage = (req, res) => {
  res.render("contact", {
    errorMessage: null,
    successMessage: null,
    formData: {}
  });
};

export const submitContactForm = async (req, res) => {
  const { name, email, title, message } = req.body;

  if (!title || !message || !email) {
    return res.render("contact", {
      errorMessage: "Veuillez remplir tous les champs obligatoires.",
      successMessage: null,
      formData: req.body
    });
  }

  try {
    await sendContactMail({ name, email, title, message });

    res.render("contact", {
      errorMessage: null,
      successMessage: "Votre message a bien été envoyé au cinéma ✅",
      formData: {}
    });

  } catch (error) {
    console.error("CONTACT ERROR:", error);

    res.render("contact", {
      errorMessage: "Erreur lors de l’envoi du message.",
      successMessage: null,
      formData: req.body
    });
  }
};
