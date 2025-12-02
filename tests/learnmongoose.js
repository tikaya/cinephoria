import mongoose from "mongoose";
//Vérifions le numéro de version de mongoose
console.log("Numero de version de mongoose:", mongoose.version);
// Connectons nous au serveur MongoDB
mongoose.connect("mongodb://localhost/mydb");
mongoose.connection.on("open",()=> {
    console.log("Connexion établie avec succès");
});
mongoose.connection.on("error",()=> {
    console.error("Erreur de connexion");
});

var adresseSchema = mongoose.Schema({
    rue: String,
    ville: String,
    code_postal: String
 });

 var clientSchema = mongoose.Schema({
    nom: String,
    prenom: String,
    adresse: [adresseSchema]
 });

 var Client = mongoose.model("Client", clientSchema);
//Listons les documeent dans la collection clients


//Utilisons la mehode de classe create pour sauvegarder un document dans la collection

var b = await Client.create(
    {nom:"Sankara", prenom:"Thomas",adresse:[{rue:"10 rue des lilas",ville:"Paris",code_postal:"75000"}]});

var clients = await Client.find();
console.log(clients);