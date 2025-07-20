//importons le router d'express
import {Router} from 'express';
import { connectPageController } from '../controllers/login.contolleur.js';

// Creation d'une instance de la classe Router
const loginRouter = Router();

loginRouter.get('/login',connectPageController);




// Exportons le router au point d'utilisation dans app.js
export default loginRouter;