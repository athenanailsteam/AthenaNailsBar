var db = require('../utils/db');
module.exports = {
    loadServiceDescription: (tableName, id) => {
        var conn = db.getConnection();      
        return new Promise((resolve, reject) => {
            var sql = `SELECT * from ${tableName} WHERE id_services = ${id}`;
            conn.connect();
            conn.query(sql, (err, value) => {
                if (err) reject(err);
                else resolve(value);
                conn.end();
            });
        })
    }
} 
