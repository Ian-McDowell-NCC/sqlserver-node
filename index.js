// Tutorial for sql parts: https://www.sqlservertutorial.net/nodejs-sql-server/nodejs-sql-server-connect/
//Tutorial for express (server) parts: https://expressjs.com/en/starter/hello-world.html
//Node.js docs: https://nodejs.org/api/
import express from 'express'
import sql from 'mssql';
import { config } from './config.js';
import { runSQLfile, runSingleQuery } from './query.js';
import 'dotenv/config';

//set up localhost for frontend
const app = express()
const port = 3000
app.use(express.static('public'))

//output port to log
app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})

//verify connection to databse
const connect = async () => {
  try {
    await sql.connect(config);
    console.log('Connected to the database!');
  } catch (err) {
    console.error(err);
  }
};

connect();

//runSQLfile('./queries.sql');
const result = await runSingleQuery(`SELECT * FROM Reservation`);
//console.log(result[0])

//send data to frontend as json
app.get('/api/data', (req, res) => {
  res.json(result)
})
