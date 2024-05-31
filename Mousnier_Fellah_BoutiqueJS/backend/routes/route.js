const express = require('express');
const path = require('path');
const router = express.Router();
const jersey = require('../controller/jersey');

// Route pour la page d'accueil
router.get('/accueil', (req, res) => {
    res.sendFile('./templates/index.html', {root: "../frontend"});
});

// Route pour la page de jersey
router.get('/jersey',jersey.getJersey);

module.exports = router;
