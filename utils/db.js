var mysql = require('mysql');
var utils = require('../helpers/helper')
var createConnection = () => {
    return mysql.createConnection({
        host: 'sql10.freemysqlhosting.net',
        port: '3306',
        user: 'sql10291290',
        password: 'JUXhTVXnne',
        database: 'sql10291290'

    });
};
function getConnection(){
    var connection = createConnection();
    if (connection != null) {
        console.log('Success connect to db');
        return connection;
    }
    console.log('Failed connect to db');
    return null;
}
module.exports = {
    //delete by id
    deleteById: (tableName, id) => {
        return new Promise((resolve, reject) => {
            var sql = `DELETE from ${tableName} WHERE id=?`;
            var conn = createConnection();
            conn.connect();
            conn.query(sql, id, (err, value) => {
                if (err) reject(err);
                else resolve(value);
                conn.end();
            });
        })
    },
    //Find all table in db
    findAll: (tableName) => {
        return new Promise((resolve, reject) => {
            var sql = `SELECT * from ${tableName}`;
            var conn = createConnection();
            conn.connect();
            conn.query(sql, (err, value) => {
                if (err) reject(err);
                else resolve(value);
                conn.end();
            });
        })
    },
    findById: (tableName, id) => {
        return new Promise((resolve, reject) => {
            var sql = `SELECT * from ${tableName} WHERE id = ?`;
            var conn = createConnection();
            conn.connect();
            conn.query(sql, id, (err, value) => {
                if (err) reject(err);
                else {
                    resolve(value[0]);
                }
                conn.end();
            });
        });
    },
    findOne: (tableName, field, username) => {
        console.log(username);
        return new Promise((resolve, reject) => {
            var sql = `SELECT * from ${tableName} WHERE ${field} = ?`;
            var conn = createConnection();
            conn.connect();
            conn.query(sql, username, (err, value) => {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(value[0]);
                }
                conn.end();
            });
        });
    },
    add: (tableName, entity) => {
        return new Promise((resolve, reject) => {
            var sql = `insert into ${tableName} set ?`;
            var conn = createConnection();
            conn.connect();
            entity["created_at"] = utils.GetTimeNow();
            entity["updated_at"] = utils.GetTimeNow();
            conn.query(sql, entity, (error, value) => {
                conn.query(sql, enity, (error, value) => {
                    if (error) reject(error);
                    else {
                        resolve(value.InsertId);
                    }
                    conn.end();
                });
            });
        });
    },
    getConnection: getConnection
};