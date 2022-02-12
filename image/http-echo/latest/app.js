const http = require("http");

http.createServer(function (req, res) {
  res.writeHead(200, {
    'Content-Type': 'application/json'
  });
  var raw = {
    method: req.method,
    url: req.url,
    httpVersion: req.httpVersion,
    headers: req.headers
  };
  res.end(JSON.stringify(raw));
}).listen(80);
