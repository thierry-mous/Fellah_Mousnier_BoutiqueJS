let service = require('../services/service.js');
const express = require('express');
const app = express();

function getJersey(req, res) {
    app.get('/jersey', (req, res) => {
        try {
            // Appeler la méthode getJersey du service
            const jerseyData = service.getAllJerseys(req, res);
            res.json(jerseyData);
        } catch (err) {
            console.error(err);
            res.status(500).send('Erreur du serveur');
        }
    });
}
