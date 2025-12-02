// models/reservationsMirror.model.js
import mongoose from 'mongoose';

// Sous-schémas (⚠️ _id: false en option du Schema, pas dans les champs)
const userSchema = new mongoose.Schema({
  id: Number,
  username: String,
  email: String
}, { _id: false });

const filmSchema = new mongoose.Schema({
  id: Number,
  titre: String,
  genre: String
}, { _id: false });

const salleSchema = new mongoose.Schema({
  id: Number,
  nom: String,
  capacite: Number
}, { _id: false });

const cinemaSchema = new mongoose.Schema({
  id: Number,
  nom: String,
  ville: String
}, { _id: false });

const seanceSchema = new mongoose.Schema({
  id: Number,
  // tu peux garder les heures en string si ça vient tel quel de PG
  heureDebut: String,
  heureFin: String,
  qualite_projection: String,
  prix: Number,

  // ✅ nouveaux champs utiles pour le dashboard
  dateSeance: Date,        // s.date_seance
  showStartAt: Date,       // s.date_seance + s.heure_debut (timestamp)
  showEndAt: Date          // s.date_seance + s.heure_fin   (timestamp)
}, { _id: false });

// Schéma principal (miroir)
const reservationsMirrorSchema = new mongoose.Schema({
  _id: Number,           // = id_reservation (PG)
  nbrPlaces: Number,
  prixTotal: Number,
  etat: String,

  // ✅ sous-documents (pas des tableaux)
  user: userSchema,
  film: filmSchema,
  salle: salleSchema,
  cinema: cinemaSchema,
  seance: seanceSchema,

  sieges: [String],      // ex: ["A12","A13"]

  // ✅ timestamps métiers venant de PG
  reservedAt: Date,      // reservation.created_at
  updatedAt: Date,       // reservation.updated_at

  // ✅ timestamp de synchronisation du miroir
  syncedAt: { type: Date, default: () => new Date() }
}, {
  collection: 'reservations_mirror',
  versionKey: false      // évite __v
});

// Index utiles pour le dashboard
reservationsMirrorSchema.index({ reservedAt: -1 });
reservationsMirrorSchema.index({ "film.id": 1 });
reservationsMirrorSchema.index({ "cinema.ville": 1 });
reservationsMirrorSchema.index({ "seance.showStartAt": -1 });

export default mongoose.model('ReservationsMirror', reservationsMirrorSchema);
