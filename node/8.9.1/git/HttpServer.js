/**
 * Http服务监听接口，执行自动部署项目脚本
 * */



const http = require('http');

const server = http.createServer((req, res) => {
    res.end();
});
server.on('clientError', (err, socket) => {
    socket.end('HTTP/1.1 400 Bad Request\r\n\r\n');
});
server.listen(6611);









