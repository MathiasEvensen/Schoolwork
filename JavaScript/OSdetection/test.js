var http = require('http');
var os = require('os');
var dns = require('dns');
var tid = require('./script');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8',
  'Transfer-Encoding': 'chunked', 'X-Content-Type-Options': 'nosniff'});
  res.write('Tid: ' + tid.tid() +
  '<br>Hello World! This is a test <br>' + tid.prints());
  res.end();
}).listen(8080);
