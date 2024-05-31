const express = require('express');
const {join, dirname} = require('path');
const app = express();
const db = require('./db');
const { fileURLToPath } = require('url');
const indexRouter = require('./routes/route.js');
app.use('/public/', express.static(join(__dirname, 'public')));

//routes
app.use('/', indexRouter);
app.use(express.json());

app.get('/nocart', (req, res) => {
    res.sendFile(join(__dirname, '/templates/nocart.html'));
});

app.get('/cart', (req, res) => {
    res.sendFile(join(__dirname, '/templates/cart.html'));
});

app.get ('/article', (req, res) => {
    res.sendFile(join(__dirname, '/templates/article.html'));
});

// Démarrage du serveur
const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
