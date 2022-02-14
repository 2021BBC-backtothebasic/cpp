const mysql = require("mysql");
require("dotenv").config();


const db = require('mysql');

const config = {
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PWD,
  database: process.env.DB,
    
}
const pool = db.createPool(config);


let getConnection = function (callback) {
  pool.getConnection((error, connection) => {
    callback(error, connection);
    connection.release();
  })
}


module.exports = getConnection;