import { homeService } from '../services/home.service.js';

export const homeRender = async (req, res) => {
  try {
    const films = await homeService(); // on appelle le service
    res.render('home', { films }); // on envoie les films à la vue EJS
  } catch (error) {
    console.error("Erreur affichage home :", error.message);
    res.status(500).send("Erreur serveur");
  }
};
