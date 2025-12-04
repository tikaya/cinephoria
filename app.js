import 'dotenv/config';
import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import session from 'express-session';
import pool from './config/db.js';
import { sessionMiddleware } from './config/session.js';
import methodOverride from "method-override";
import { exposeUserToViews } from './middlewares/authMiddleware.js';
import csurf from "csurf";
import PgStoreFactory from "connect-pg-simple";
import * as mongoConnect from './config/mongo.js';
import { startPgListener } from "./services/pgListener.js";
import { startSyncPoller } from "./services/sync.poller.js";
import "./utils/mailer.js";
import morgan from 'morgan';
import flash from "connect-flash";
// ... le reste


// Import des routeurs

import seanceRouter from './routes/seance.routes.js';
import filmRouter  from './routes/film.routes.js';
import loginRouter from './routes/login.routes.js';
import registerRouter from './routes/register.routes.js';
import homeRouter from './routes/home.routes.js'; // <- Bien ici
import reservationRouter from './routes/reservation.routes.js';
import siegeRouter from './routes/siege.routes.js';
import recapitulatifRouter from './routes/recapitulatif.routes.js'; // <- Bien ici
import ValideRouter from './routes/valide.route.js';
import espaceRouter from './routes/espace.route.js';
import adminRouter from './routes/admin.routes.js';
import adminFilmsRouter from './routes/admin.films.routes.js';
import adminSeancesRouter from './routes/admin.seances.routes.js';
import adminSallesRouter from './routes/admin.salles.routes.js';
import adminEmployeRouter from './routes/admin.employes.js';

import routerApi from './routes/admin.api.routes.js';
import adminPwdresetRouter from './routes/admin.resetpwd.js';
import empHomeRenderRouter from './routes/employe.home.js';
import logoutRouter from "./routes/logout.route.js";
import userRouter from './routes/user.routes.js';
import avisRouter from './routes/intranet.avis.routes.js';
import forgetPwdRouter from "./routes/forgetpwd.routes.js";
import forcePwdRouter  from "./routes/forcepwd.routes.js";
import contactRouter from "./routes/contact.router.js";
import adminStatsRouter from "./routes/admin.stats.router.js";









const app = express();
// Trust proxy pour Railway/Heroku (HTTPS derrière un proxy)
app.set('trust proxy', 1);
const PgStore = PgStoreFactory(session);
const PORT = process.env.PORT || 3000;

// Pour utiliser __dirname en ES Modules
const currentFilePath = fileURLToPath(import.meta.url);
const currentDirPath = path.dirname(currentFilePath);

// -------- Middlewares globaux --------
app.use(morgan("dev"));

app.use(express.urlencoded({ extended: true }));

app.use(express.json());

app.use(methodOverride("_method")); // permet ?_method=DELETE ou <input name="_method" value="DELETE">
app.use(sessionMiddleware);
app.use((req, res, next) => {
  if (!req.session) console.error("❌ Pas de session dans cette requête :", req.url);
  next();
});
app.use((req, res, next) => {
  res.locals.currentUser = req.session.user || null;
  next();
});

app.use(flash());



// -------- Configuration EJS --------
app.set('view engine', 'ejs');

app.set('views', path.join(currentDirPath, 'views'));

// -------- Fichiers statiques --------
app.use(express.static(path.join(currentDirPath, 'public')));

// -------- Routeurs --------
app.use('/', registerRouter);
app.use('/', loginRouter);
app.use('/', homeRouter);
app.use('/', filmRouter);
app.use('/', seanceRouter);
app.use('/', reservationRouter);
app.use('/', siegeRouter);
app.use('/', recapitulatifRouter);
app.use('/reservation', ValideRouter);
app.use('/espace', espaceRouter);

app.use('/admin', adminRouter);
app.use('/admin/films', adminFilmsRouter);
app.use('/admin/seances', adminSeancesRouter);
app.use('/admin/salles', adminSallesRouter);

app.use('/', adminEmployeRouter);
app.use(routerApi);            // ✅ API stats NoSQL


app.use('/admin/resetpwd/employe', adminPwdresetRouter);
app.use(empHomeRenderRouter);
app.use(logoutRouter);
app.use(userRouter);
app.use(avisRouter);
app.use(forgetPwdRouter);
app.use(forcePwdRouter);
app.use("/", contactRouter);
app.use(adminStatsRouter);






// -------- Vérification de la BD --------
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('❌ Erreur de connexion à la base de données :', err.stack);
  } else {
    console.log('✅ Connecté à la base de données à :', res.rows[0].now);
  }
});


// ✅ AJOUTER À LA FIN de app.js
export default app;