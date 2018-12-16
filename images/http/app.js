const os = require('os');
const http = require("http");

http.createServer(function (req, res) {
    res.writeHead(200, {
        'Content-Type': 'application/json'
    });
    var body = {
        request: {
            method: req.method,
            host: req.headers.host,
            url: req.url,
            http_version: req.httpVersion,
            headers: req.headers
        },
        os: {
            host_name: os.hostname(),
            platform: os.platform(),
            release: os.release(),
            arch: os.arch(),
            type: os.type(),
            eol: os.EOL,
            endianness: os.endianness(),
            tmp_dir: os.tmpdir(),
            home_dir: os.homedir(),
            free_memory: os.freemem(),
            total_memory: os.totalmem(),
            uptime: os.uptime(),
            load_avg: os.loadavg(),
            cpus: os.cpus(),
            network_interfaces: os.networkInterfaces(),
            constants: os.constants,
        }
    };
    console.log(body);
    res.end(JSON.stringify(body));
}).listen(80);