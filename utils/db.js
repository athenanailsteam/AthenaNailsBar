var mysql = require('mysql');
var createrConnection = ()=>{
    return mysql.createConnection({
        host: 'localhost',
        port: '3306',
        user: 'root',
        password: 'root',
        database:'athena_nails'

    });
};
module.exports = {
    load : sql => {
        return new Promise((resolve, reject) =>{
            var connection = createrConnection();
            connection.connect();
            connection.query(sql, (error, results, fields)=>{
                if(error){
                    reject(error);
                }
                else{
                    resolve(results);
                }
                connection.end();
            });
        });
    }
};