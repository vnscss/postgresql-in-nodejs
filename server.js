const express = require('express');
const cors = require('cors')
const db = require('./dataBase/dataBase.js');

const app = express();

app.use(cors());

app.use(express.json());

app.set('view engine', 'ejs');

app.set('views', './views', 'views');
app.use(express.static('./static'));

app.locals.baseURLHTTPS = "https://localhost:1337"
app.locals.baseURL = "http://localhost:1337"

app.get('/', (req, res) => {
  res.render('index');
});


app.post('/sql', async (req, res) => {
  let data = await req.body
  try {
    const result = await db.query(data.query);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.get('/get-users', async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM users;");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.get('/get-equipamento', async (req, res) => {
  try {
    const result = await db.query("SELECT * FROM equipamento;");
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.get('/:query', async (req, res) => {
  try {
    const result = await db.query(req.params.query);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(1337, () => {
  console.log('Server is running on port 1337');
});