const express = require('express');
const {join, dirname} = require('path');

const app = express();

const { fileURLToPath } = require('url');


app.use('/public/', express.static(join(__dirname, 'public')));

//routes

app.get('/', (req, res) => {
    res.sendFile(join(__dirname, '/templates/index.html'));
});


// DÃ©marrage du serveur
const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});