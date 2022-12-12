const express = require('express');
const app = express();

app.get('/status', (req, res) => {
    res.json({ status: 'OK' });
});

const port = 8000;
app.listen(port, () => console.log(`Server listening on port ${port}.`));