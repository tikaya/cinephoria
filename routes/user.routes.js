import {Router} from "express";
import { requireLogin } from "../middlewares/authMiddleware.js";
import {renderUserSpace} from "../controllers/renderUserSpace.js";
import { renderNoteForm, submitNoteController } from "../controllers/user.note.controller.js";
const userRouter = Router();

//Notre sub application va rendre le button <<Mon espace à user authentifié>>
userRouter.get("/user/espace",requireLogin,renderUserSpace)
userRouter.get("/user/note/:id_reservation", requireLogin, renderNoteForm);
userRouter.post("/user/note/:id_reservation", requireLogin, submitNoteController);


export default userRouter;

