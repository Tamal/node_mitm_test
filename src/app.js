const express = require('express');
const app = express();

const PORT = 3002;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get('/', async (req, res) => {
  res.send({ message: 'Welcome to enrich client API!' });
});

const NODE_ENV = process.env.NODE_ENV || 'development';

app.listen(PORT, async () => {
  console.log(
    'Node Server is running on port %d in %s NODE_ENV...',
    PORT,
    NODE_ENV
  );
});
