import { Router } from "express";
import { seanceRender } from "../controllers/seance.controller.js";

const seanceRouter = Router();

seanceRouter.get("/film/:id", seanceRender);

export default seanceRouter;
