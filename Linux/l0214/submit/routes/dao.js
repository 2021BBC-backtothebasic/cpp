const getConn = require("./db");

exports.getId = (id)=>{
  return new Promise((resolve, reject) => {
        getConn((conn) => {
            try {
                let sQuery = "select count(*) from id where ="+id;
                conn.query(sQuery, (err, result) => { resolve(result) });
                conn.release();
            } catch (err) { console.err(err); }
        })
    })
}

exports.addUser = (id, pw)=>{
  return new Promise((resolve, reject) => {
        getConn((conn) => {
            try {
                    let sQuery = `INSERT INTO id (id, pw) VALUES ('${id}', ${pw})`;
                conn.query(sQuery, (err, result) => { resolve(result) });
                conn.release();
            } catch (err) { console.err(err); }
        })
    })
}
