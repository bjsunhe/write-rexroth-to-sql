const mysql = require('mysql');
const fs=require('fs')

// Create a MySQL connection
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'Cool1234567890-',
  database: 'bmg'
});

// Connect to MySQL
connection.connect(err => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');



  const festo_round_cylinder=JSON.parse(fs.readFileSync('./rexroth-product.json'))





  // SQL query to insert data into the table
  festo_round_cylinder.forEach(item=>{
  
  const insertQuery = 'INSERT INTO rexroth_varioflow_products SET ?';

  // Execute the insert query
  connection.query(insertQuery, item, (err, results) => {
    if (err) {
      console.error('Error inserting data:', err);
    } else {
      console.log('Data inserted successfully');
    }

    // Close the MySQL connection
    //connection.end();
  });
  
  })
});
