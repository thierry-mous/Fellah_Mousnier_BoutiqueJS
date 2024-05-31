const express = require('express');
const {join, dirname} = require('path');

const app = express();

const { fileURLToPath } = require('url');


app.use('/public/', express.static(join(__dirname, 'public')));

//routes

app.get('/', (req, res) => {
    res.sendFile(join(__dirname, '/templates/index.html'));
});

app.get('/nocart', (req, res) => {
    res.sendFile(join(__dirname, '/templates/nocart.html'));
});

app.get('/cart', (req, res) => {
    res.sendFile(join(__dirname, '/templates/cart.html'));
});

app.get ('/article', (req, res) => {
    res.sendFile(join(__dirname, '/templates/article.html'));
});

app.get ('/category', (req, res) => {
    res.sendFile(join(__dirname, '/templates/category.html'));
});

// DÃ©marrage du serveur
const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});