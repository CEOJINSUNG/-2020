var http = require('http');
var fs = require('fs');

function send404Message(response){
    response.writeHead(404, {"Content-Type" : "text/plain" });
    response.write("404..")
    response.end();
}

function onRequest(request, response){
    if(request.method == 'GET' && request.url == '/'){
        response.writeHead(200, {"Content-Type" : "text/html"});
        fs.createReadStream("./public/test_main.html").pipe(response);
    } else {
        send404Message(response);
    }
}
http.createServer(onRequest).listen(8888);
console.log("Server Created");