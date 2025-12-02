import {jest} from '@jest/globals';
// MOCK DE MODULE EN ESM : utilise un module de mock séparé
const getUserByEmailMock = jest.fn();
const bcryptCompareMock = jest.fn();

jest.unstable_mockModule("../models/login.model.js",() => ({
    getUserByEmail : getUserByEmailMock,
}));

jest.unstable_mockModule("bcrypt", () => ({
    compare: bcryptCompareMock,
}));

import {loginUserService} from "../services/login.service.js";
afterEach(() => {
  jest.clearAllMocks();
});

test('Retourne erreur si un utilisateur inconnu tente de se connecter', async () => {
  getUserByEmailMock.mockResolvedValueOnce(null); // <-- ici, pas d'objet !
  const result = await loginUserService("tikaya1999@gmail.com","azerty");
  expect(result).toEqual({error:"Identifiants invalides"});
});



test('Retourne erreur si le mot de passe est incorrect', async () => {
    getUserByEmailMock.mockResolvedValueOnce({
    id_user: 1,
    username: "tikaya",
    email: "tikaya1999@gmail.com",
    prenom_user: "Tikaya",
    nom_user: "Tikaya",
    password: "fakehash" // <-- ce champ doit être là
});

        // simulons que la comparaison du mot de passe échoue
        bcryptCompareMock.mockResolvedValueOnce(false);
        const result  = await loginUserService("tikaya1999@gmail.com","azerty");
        expect(result).toEqual({error:"Identifiants invalides"});
});


test('Retourne les données de l’utilisateur si la connexion est réussie', async () => {
   getUserByEmailMock.mockResolvedValueOnce({
    id_user: 1,
    username: "tikaya",
    email: "tikaya1999@gmail.com",
    prenom_user: "Tikaya",
    nom_user: "Tikaya",
    password: "azerty" // <-- ce champ doit être là
});

    // simulons que la comparaison du mot de passe réussit
    bcryptCompareMock.mockResolvedValueOnce(true);
    const result = await loginUserService("tikaya1999@gmail.com","azerty");
    expect(result).toEqual({
        id: 1,  
        username: "tikaya",
        email: "tikaya1999@gmail.com",
        prenom: "Tikaya",
        nom: "Tikaya",
    });
});