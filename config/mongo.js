// db/mongo.js
import mongoose from 'mongoose';

// Utilise la variable d'environnement ou fallback sur localhost (pour dev sans Docker)
let dbURI = process.env.MONGODB_URI || 'mongodb://localhost:27017/cinephoria';

mongoose.connect(dbURI);

mongoose.connection.on('connected', () => {
  console.log('✅ MongoDB connecté sur', dbURI);
});

mongoose.connection.on('error', err => {
  console.log('❌ MongoDB erreur:', err);
});