const http = require('http');
const fs = require('fs')
const url = require('url');
const querystring = require('querystring');
const figlet = require('figlet')

const server = http.createServer((req, res) => {
  // const page = url.parse(req.url).pathname;
  // const params = querystring.parse(url.parse(req.url).query);
  // console.log(page);
  // if (page == '/') {
  //   fs.readFile('index.html', function(err, data) {
  //     res.writeHead(200, {'Content-Type': 'text/html'});
  //     res.write(data);
  //     res.end();
  //   });
  // }
  // else if (page == '/otherpage') {
  //   fs.readFile('otherpage.html', function(err, data) {
  //     res.writeHead(200, {'Content-Type': 'text/html'});
  //     res.write(data);
  //     res.end();
  //   });
  // }
  // else if (page == '/otherotherpage') {
  //   fs.readFile('otherotherpage.html', function(err, data) {
  //     res.writeHead(200, {'Content-Type': 'text/html'});
  //     res.write(data);
  //     res.end();
  //   });
  // }
  // else if (page == '/api') {
  //   if('student' in params){
  //     if(params['student']== 'leon'){
  //       res.writeHead(200, {'Content-Type': 'application/json'});
  //       const objToJson = {
  //         name: "leon",
  //         status: "Boss Man",
  //         currentOccupation: "Baller"
  //       }
  //       res.end(JSON.stringify(objToJson));
  //     }//student = leon
  //     else if(params['student'] != 'leon'){
  //       res.writeHead(200, {'Content-Type': 'application/json'});
  //       const objToJson = {
  //         name: "unknown",
  //         status: "unknown",
  //         currentOccupation: "unknown"
  //       }
  //       res.end(JSON.stringify(objToJson));
  //     }//student != leon
  //   }//student if
  // }//else if
  // else if (page == '/css/style.css'){
  //   fs.readFile('css/style.css', function(err, data) {
  //     res.write(data);
  //     res.end();
  //   });
  // }else if (page == '/js/main.js'){
  //   fs.readFile('js/main.js', function(err, data) {
  //     res.writeHead(200, {'Content-Type': 'text/javascript'});
  //     res.write(data);
  //     res.end();
  //   });
  // }else{
  //   figlet('404!!', function(err, data) {
  //     if (err) {
  //         console.log('Something went wrong...');
  //         console.dir(err);
  //         return;
  //     }
  //     res.write(data);
  //     res.end();
  //   });
  // }
  
  // Build file path
  // Set to index.html if no req.url otherwise accept req.url
  let filePath = req.url === '/' ? 'index.html' : req.url;
  const params = querystring.parse(url.parse(req.url).query);
  // extension of file
  let extName = filePath.split('.')[1]
  // initial content type (changes based on extName)
  let contentType = 'text/html';

  switch(extName){
    case 'js':
      contentType = 'text/javascript';
      break;
    case 'css':
      contentType = 'text/css';
      break;
    case 'json':
      contentType = 'application/json';
      break;
    case 'png':
      contentType = 'image/png';
      break;
    case 'jpg':
      contentType = 'image/jpg'
      break;
  }

  // console.log(filePath)
  if(contentType = 'text/html' && extName === undefined && !filePath.includes('/api')) filePath += '.html'

  // log filepath
  console.log(filePath)
  
  // If api path
  if(filePath.includes('api')){
    if('student' in params){
      if(params['student']== 'leon'){
        res.writeHead(200, {'Content-Type': 'application/json'});
        const objToJson = {
          name: "leon",
          status: "Boss Man",
          currentOccupation: "Baller"
        }
        res.end(JSON.stringify(objToJson));
      }//student = leon
      else if(params['student'] != 'leon'){
        res.writeHead(200, {'Content-Type': 'application/json'});
        const objToJson = {
          name: "unknown",
          status: "unknown",
          currentOccupation: "unknown"
        }
        res.end(JSON.stringify(objToJson));
      }//student != leon
    }//student if
  } else {
    // Read/serve file
    fs.readFile('./'+filePath, (err, content) => { 
      if (err) {
        if (err.code == "ENOENT") {
          // Page not found
          figlet('404!!', function(err, data) {
            if (err) {
                console.log('Something went wrong...');
                console.dir(err);
                return;
            }
            res.write(data);
            res.end();
          });
        } else {
          //  Some server error
          res.writeHead(500);
          res.end(`Server Error: ${err.code}`);
        } 
      } else {
        // Success page
        res.writeHead(200, { "Content-Type": contentType });
        res.end(content, "utf8")
      }
  })
  }
});

server.listen(8000);
