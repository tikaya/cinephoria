// db/mongo.js
import mongoose from 'mongoose';

//Définissons l'URI de connexion MOngoDB

let dbURI = 'mongodb://localhost/cinephoria';


//connectons-nous à la base de données MongoDB
mongoose.connect(dbURI);

//Écoutons les événements de connexion et affichons les sur la console
mongoose.connection.on('connected',()=>
{console.log(`✅🔗 Mongoose connecté à ${dbURI}`)});

//Écoutons la mongoose quand la connexion est branchée sur error
mongoose.connection.on('error',err=>{
    console.log('❌ Mongoose erreur de connexion : '+err);
});

//Écoutons la mongoose quand la connexion est déconnectée
mongoose.connection.on(
    'disconnected',()=> {
        console.log('❌ Mongoose déconnecté');
    }
);


async function gracefulShutdown(reason) {
  try {
    await mongoose.connection.close(false); // false = ne pas forcer, laisse finir les ops en cours
    console.log(`🔌❎ MongoDB déconnecté (${reason})`);
  } catch (e) {
    console.error('❌ Erreur fermeture Mongoose :', e);
  }
}

// ✅ Signaux (nodemon / Ctrl+C / hébergeur)
process.once('SIGUSR2', async () => {           // nodemon restart
  await gracefulShutdown('nodemon restart');
  process.kill(process.pid, 'SIGUSR2');
});
process.on('SIGINT', async () => {              // Ctrl+C
  await gracefulShutdown('SIGINT');
  process.exit(0);
});
process.on('SIGTERM', async () => {             // stop (prod, containers)
  await gracefulShutdown('SIGTERM');
  process.exit(0);
});


