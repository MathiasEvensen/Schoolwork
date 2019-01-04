var mysql = require('mysql');

var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  port: '3306',
  database: 'sakila'
});

conn.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
  console.log('connected as id ' + conn.threadId);
  var sql = "select * from country;";
  conn.query(sql, function(err, result, fields){
    if(err) throw err;
    console.log(result);
    //console.log(fields[2].country_id);
  });
  conn.end();
});

//select * from sakila.actor;
