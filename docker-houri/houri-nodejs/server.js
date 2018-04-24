/**
 * curl命令
 * 示例：
 * https://docs.docker.com/develop/sdk/examples/#run-a-container
 * 文档：
 * https://docs.docker.com/engine/api/v1.37/#operation/ContainerArchive
 */
console.log(`Init ******************************************`);

const http = require('http');
const { exec } = require('child_process');

const server = http.createServer((req, res) => {
    let _x = `-X ${req.method}`;
    let apiName = req.url;
    let _d = ""; //POST数据
    if(_d != ""){ _d = `-d '${_d}'`; }
    let cmd = `curl --unix-socket /var/run/docker.sock -H "Content-Type: application/json" ${_d} ${_x} http:/v1.37${apiName}`;
    console.log(`HTTP: ${cmd}`);
    exec(cmd, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            res.end(error.message);
            return;
        }
        console.log(`stdout: ${stdout}`);
        console.log(`stderr: ${stderr}`);
        res.end(stdout);
    });
});
server.on('clientError', (err, socket) => {
    socket.end('HTTP/1.1 400 Bad Request\r\n\r\n');
});
server.listen(8000);
