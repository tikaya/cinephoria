// routes/film.routes.js
import { Router } from "express";
import { filmRender } from "../controllers/film.controller.js";

const filmRouter = Router();

// On utilise GET pour récupérer et filtrer
filmRouter.get("/films", filmRender);

export default filmRouter;
