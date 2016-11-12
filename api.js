const jsonServer = require('json-server');
const server = jsonServer.create();

server.use(jsonServer.defaults());

const router = jsonServer.router('db.json');
server.use(router);

console.log('Listen at 4000');
server.listen(4000);
