require('dotenv').config();

const express = require('express');

const cors = require('cors')


// crear servidor express
const app = express();

//config cors
app.use(cors())

// lectura y parseo del body
app.use(express.json());

// Node Server
const server = require('http').createServer(app);

// module.exports.io = require('socket.io')(server);
// require('./sockets/socket');


// Rutas
app.use('/api/zigzag', require('./routes/zigzag'));
app.use('/api/trinity', require('./routes/trinity'));
// app o server testear postmand luego probar si da el socket
server.listen(process.env.PORT, () => {
    console.log('Servidor corriendo en puerto ' + process.env.PORT);
});