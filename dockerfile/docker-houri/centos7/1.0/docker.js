/**
 * 使用命令行对docker进行操作
 */
console.log(`docker.js ******************************************`);

const http = require('http');
const { exec } = require('child_process');

var msProcess = {
    //执行命令
    docker:function (cmd,output) {
        exec(cmd, (error, stdout, stderr) => {
            if (error) {
                console.error(`exec error: ${error}`);
                output(error.message);
                return;
            }
            console.log(`stdout: ${stdout}`);
            console.log(`stderr: ${stderr}`);
            output(stdout);
        });
    }
};

const server = http.createServer((req, res) => {
    console.log(req.method);
    res.writeHead(200,"Success",{"Content-Type":"text/plain"});
    if (req.url === '/docker' && req.method === 'POST'){
        var data = '';
        req.on('data',function (chunk) {
            data += chunk;
        });
        req.on('end',function () {
            console.log(`post data:${data}`);
            msProcess.docker(data,function (out) {
                res.end(out);
            });
        });
    }else{
        res.end(`{"error":"A request that cannot be processed. ${req.url}  ${req.method}"}`);
    }
});
server.on('clientError', (err, socket) => {
    socket.end('HTTP/1.1 400 Bad Request\r\n\r\n');
});
server.listen(80);

