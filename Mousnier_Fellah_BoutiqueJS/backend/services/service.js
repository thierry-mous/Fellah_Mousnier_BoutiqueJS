const db = require('../db');



function  getAllJerseys() {
    db.query("SELECT * FROM jersey", (err, results) => {
        if (err) {
            console.log(err);
            return;
        }
        return results;
    });
}
module.exports = {
    getAllJerseys: getAllJerseys
};
