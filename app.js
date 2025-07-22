import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import session from 'express-session';
import pool from './config/db.js';

// Import des routeurs
import seanceRouter from './routes/seance.routes.js';
import filmRouter  from './routes/film.routes.js';
import loginRouter from './routes/login.routes.js';
import registerRouter from './routes/register.routes.js';
import homeRouter from './routes/home.routes.js'; // <- Bien ici

const app = express();
const PORT = process.env.PORT || 3000;

// Pour utiliser __dirname en ES Modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// -------- Middlewares globaux --------
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(session({
  secret: 'cinephoria-secret-key', // ✅ À stocker dans un .env
  resave: false,
  saveUninitialized: false
}));

// -------- Configuration EJS --------
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// -------- Fichiers statiques --------
app.use(express.static(path.join(__dirname, 'public')));

// -------- Routes --------
app.use('/', registerRouter); // Inscription
app.use('/', loginRouter);    // Connexion
app.use('/', homeRouter);     // Page d’accueil
app.use('/',filmRouter)
app.use('/',seanceRouter);//Acceder au seance dipso pour chaque film


// -------- Vérification de la BD --------
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('❌ Erreur de connexion à la base de données :', err.stack);
  } else {
    console.log('✅ Connecté à la base de données à :', res.rows[0].now);
  }
});

// -------- Démarrage du serveur --------
app.listen(PORT, () => {
  console.log(`🚀 Serveur lancé sur http://localhost:${PORT}`);
});
