// routes/film.routes.js
import { Router } from "express";
import { filmRender } from "../controllers/film.controller.js";
import { renderFilmDetails } from "../controllers/film.details.controller.js";

const filmRouter = Router();

// 🔹 Page catalogue
filmRouter.get("/films", filmRender);

// 🔹 Nouvelle page : fiche film
filmRouter.get("/films/:id", renderFilmDetails);


export default filmRouter;
