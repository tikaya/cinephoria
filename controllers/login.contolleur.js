import express from 'express';

//Controller qui affiche la page de connexion
export const connectPageController = (req, res) => {
    res.render('login');
}