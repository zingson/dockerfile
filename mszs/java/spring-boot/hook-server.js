/**
 * 监听http请求，执行编译脚本
 *
 * 参数：gitURL地址、分支名
 */
console.log(`*******************************************`);
const http = require('http');
const { exec } = require('child_process');
const server = http.createServer((req, res) => {
    let cmd = `sh /opt/bootstrap.sh`;
    exec(cmd, (error, stdout, stderr) => {
        if (error) {
            console.log(`stderr: ${stderr}`);
            res.end(error.message);
            return;
        }
        console.log(`stdout: ${stdout}`);
        res.end(stdout);
    });
});
server.on('clientError', (err, socket) => {
    socket.end('HTTP/1.1 400 Bad Request\r\n\r\n');
});
server.listen(39001);

