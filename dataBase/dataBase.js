const { Pool } = require('pg');

const pool = new Pool({
  user: 'informatica',
  password: '12345678',
  host: 'localhost',
  port: 5432, // default Postgres port
  database: 'informatica'
});

module.exports = {
  query: (text, params) => pool.query(text, params)
};