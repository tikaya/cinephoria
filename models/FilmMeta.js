// models/FilmMeta.js
import mongoose from 'mongoose';

const FilmMetaSchema = new mongoose.Schema({
  id_film:     { type: Number, index: true, unique: true },
  titre:       { type: String, required: true },
  genre:       { type: String },
  affiche_url: { type: String },
  date_import: { type: Date, default: Date.now }
}, { collection: 'film_meta' });

export default mongoose.models.FilmMeta
  || mongoose.model('FilmMeta', FilmMetaSchema);
