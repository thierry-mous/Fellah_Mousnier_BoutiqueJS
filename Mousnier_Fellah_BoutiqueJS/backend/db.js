const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',       // Adresse de l'hôte MySQL
    user: 'root',            // Nom d'utilisateur MySQL (par défaut 'root' pour WAMP)
    password: '',            // Mot de passe MySQL (par défaut vide pour WAMP)
    database: 'famous bdd'       // Nom de la base de données à laquelle vous voulez vous connecter
});

// Établir la connexion
connection.connect((err) => {
    if (err) {
        console.error('Erreur de connexion à la base de données:', err.stack);
        return;
    }
    console.log('Connecté à la base de données ');
});

// Exporter la connexion pour l'utiliser dans d'autres fichiers
module.exports = connection;
