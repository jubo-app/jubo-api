'use strict';

// const {
//   PORT
// } = process.env;
const PORT = 3000;

const hapi = require('hapi');
const server = new hapi.Server();

server.connection({port: PORT, host: '0.0.0.0'});

server.route({
    method: 'GET',
    path: '/',
    handler: (request, reply) => {
    reply('Hello World');
}
});

server.route({
    method: 'GET',
    path: '/ping',
    handler: (request, reply) => {
    reply().code(200);
}
});

server.start();
console.log("runnin server on port ", PORT);