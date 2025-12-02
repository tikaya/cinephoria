// config/session.js
import session from 'express-session';
import connectPgSimple from 'connect-pg-simple';
import pool from '../config/db.js';

const PgStore = connectPgSimple(session);

const IS_PROD = process.env.NODE_ENV === 'production';

export const sessionMiddleware = session({
  name: 'sid',                              // ← nom explicite
  secret: process.env.SESSION_SECRET || 'change-me-in-prod',
  resave: false,
  saveUninitialized: false,
  store: new PgStore({
    pool,
    createTableIfMissing: true,
    // tableName: 'session' // par défaut
  }),
  cookie: {
    httpOnly: true,                          // ← empêche JS de lire le cookie
    sameSite: 'lax',                         // ← OK pour la plupart des flows
    secure: IS_PROD,                         // ← true seulement en HTTPS
    maxAge: 1000 * 60 * 60 * 24 * 7          // ← 7 jours
  }
});
