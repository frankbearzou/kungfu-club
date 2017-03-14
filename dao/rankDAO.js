var mysql = require('mysql');
require('dotenv').config();
console.log('mysql: ', process.env.MYSQL);
var pool = mysql.createPool(process.env.MYSQL);

module.exports.queryAll = function (callback) {
  pool.getConnection(function (error, conn) {
    var sql = 'select * from rank;';
    conn.query(sql, function (error, results, fields) {
      callback(error, results);
      conn.release();
    });
  });
};