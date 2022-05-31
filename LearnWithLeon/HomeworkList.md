## DUE 5/24
COMPLETE: Start prepping THE BANK
COMPLETE: Make node-backend-simple-json more readable (see https://youtu.be/fBNz5xF-Kx4)
  ```js
  //server.js
  const http = require('http');
  const fs = require('fs')
  const url = require('url');
  const querystring = require('querystring');
  const figlet = require('figlet')

  const server = http.createServer((req, res) => {  
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

  ```
COMPLETE: Make a coinflip game where the randomization happens server side
  ```js
  // server.js
  const http = require('http');
  const fs = require('fs')
  const url = require('url');
  // const querystring = require('querystring');
  // const figlet = require('figlet')

  const server = http.createServer((req, res) => {
    const page = url.parse(req.url).pathname;
    console.log(page)
    if(page == '/'){
      fs.readFile('index.html', (err, data) => { 
        res.writeHead(200, { 'Content-Type': 'text/html'});
        res.write(data);
        res.end()
      })
    } else if(page === '/main.js'){
      fs.readFile('main.js', (err, data) => { 
        res.writeHead(200, { 'Content-Type': 'text/javascript' });
        res.write(data);
        res.end();
      })
    } else if (page == '/api'){
      res.writeHead(200, {'Content-Type': 'application/json'});
      const objToJson = {
        result : Math.floor(Math.random() * 2) === 0 ? 'HEADS' : 'TAILS'
      }
      res.end(JSON.stringify(objToJson))
    }
  });

  server.listen(8000)
  ```
  ```html
  <!-- index.html -->
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
    <h1 id="result">Result here</h1>
    <button id="coinBtn">Flip Coin</button>
    <script type="text/javascript" src="/main.js"></script>
  </body>
  </html>
  ```
  ```js
  // main.js
  document.getElementById('coinBtn').addEventListener('click', flipCoin)
  async function flipCoin(){
    const response = await fetch('/api')
    const data = await response.json()
    document.getElementById('result').innerText = data.result + '!'
  }
  ```
COMPLETE: How to handle errors with async/await
  - Try/catch
  ```js
  async function functionName(){
    try{
      const result = await fetch('/api')
      const data = await result.json()

      console.log(data)
    } catch(err){
      console.log(err)
    }
  }
  ```
COMPLETE: Setup/update node.js with node 18
(No thank you 16 is fine had issues when updating)

COMPLETE: Philip Roberts: https://www.youtube.com/watch?v=8aGhZQkoFbQ&feature=youtu.be
COMPLETE: Jake Archibald: https://www.youtube.com/watch?v=cCOL7MC4Pl0

## Bonus
Read / Do: Eloquent JS Ch. 06: https://eloquentjavascript.net/06_object.html
Read / Do: https://javascript.info/async
Do: Codewars Array Ladder (search array problems) - 8kyu, 7kyu, 6kyu, 7kyu, 8kyu  