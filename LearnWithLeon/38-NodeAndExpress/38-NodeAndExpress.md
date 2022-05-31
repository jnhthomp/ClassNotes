# Node & Express
Slides: https://slides.com/leonnoel/100devs2-fancy-js-terms-and-node
No class 37 (Project class)
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Review - Event Loop 
Learn - CRUD
Learn - Express
Learn - Build your own API 
Homework - Build your own API

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1531750076422402049
Like and Retweet the Tweet
!checkin

## Live CAR Class
And we are talking about the agency
FRIDAY
6:00pm EST

## Office Hours
SUNDAY
1:00pm EST

## Networking (Review)
Alternatives?
1 coffee chat this week

## USE THE SHEET! (Review)
NOW WITH TWO TABS!: Google Sheet: https://docs.google.com/spreadsheets/d/1Be-6gYvrfi8l-M0RnObzdysRIG7N7Yyu6rIF0OHw0Q4/edit#gid=1771441293

The new tab allows you to keep track of companies that we want to work at, adding them to our hitlist and finding their point of contact at those companies

## Grab The Checklist (Review)
The professional checklist is used to organize setup all of your professional documents/profiles
Use this to make sure your professional presence is setup well
Much of what is discussed follows this checklist
Checklist: https://docs.google.com/document/d/1L2vTX3qvLhoGHeG5cVD2ljCfRGr1uJ_Gf-hNZj9KzTg/edit

This was created by Stephanie from Resilient Coders
Give Stephanie A Follow: https://twitter.com/scastanos_
Thank you!

## PUSH EVERY DAY (Review)
## Submitting Work (Review)
Freelancing Submission: https://docs.google.com/forms/d/e/1FAIpQLSeVqfClPktHdfm-JX2jyKz-QFI6e55D3Gw1EKKVkwf7KO410w/viewform

Checklist, 100Hours Project, Codewars: https://docs.google.com/forms/d/e/1FAIpQLSdhpDy8HzDDpwMlnpwB5lWNU_92UNiCZq11gj_1Ik6MGzVkjg/viewform

## Homework
(should be done)

Jake Archibald: https://www.youtube.com/watch?v=cCOL7MC4Pl0
Philip Roberts: https://www.youtube.com/watch?v=8aGhZQkoFbQ
Zell Liew: https://zellwk.com/blog/crud-express-mongodb/

## Spaced Repetition (Review)
Ali Abdaal: https://youtu.be/Z-zNHHpXoMM
Taking into account on how to reset the forgetting curve we will used spaced repetition
This means after we cover something we will retouch on the concept little later so that we can reset the curve and retain better

This is much more effective than studying something really hard just once

## Backend! (Review)
Butt first!

## Javascript is single-threaded (Review)
Synchronous aka processes
one operation at a time

## Things should block (Review)
## THE ENVIRONMENT (Review)
## Not This (Review)
(pic of the planet)

## THIS (Review)
The browser!

## Our JS is running in a browser (Review)
Browsers have a BUNCH of APIs we can use that are async and enable us to keeping looking a cute cat photos while those operations are being processed asynchronously

```js
function houseOne(){
    console.log('Paper delivered to house 1')
}
function houseTwo(){
    setTimeout(() => console.log('Paper delivered to house 2'), 0)
}
function houseThree(){
    console.log('Paper delivered to house 3')
}
houseOne()
houseTwo()
houseThree()
```

## EVENT LOOP (Review)
## Time for some data structures (Review)
## Queue (Review)
Like a real queue, the first element which was added to the list, will be the first element out.

This is called a FIFO (First In First Out) structure. 

## Queue Example (Review)
```js
let queue = []
queue.push(2) // queue is now [2] 
queue.push(5) // queue is now [2, 5] 
let i = queue.shift() // queue is now [5] 
alert(i) // displays 2
```

## Stack (Review)
The first pancake made, is the last pancake served.

This is called a stack.

The first element which was added to the list, will be the last one out. This is called a LIFO (Last In First Out) structure.

## Stack Example (Review)
```js
let stack = []
stack.push(2) // stack is now [2] 
stack.push(5) // stack is now [2, 5] 
let = stack.pop() // stack is now [2] 
alert(i) // displays 5
```

## Back To Getting Got (Review)
## JS IS RUNNING IN THE BROWSER (Review)
V8 Engine
(Parse Code > Runnable Commands)

Window Runtime (Hosting Environment)

Gives Us Access To Web APIs

Passes stuff to Libevent (Event Loop)
This is how the browser handles multiple tasks at once

## The Event Loop monitors the Callback Queue and Job Queue and decides what needs to be pushed to the Call Stack. (Review)

What does this mean?
Watch the two videos from the homework and this will make more sense

When it is time to execute js we know it is single threaded
This thread can be referred to as the call stack
When we put things on the stack it is handled Last In First Out (LIFO)

On the call stack is a thread called `main()` which has the js we have written
Imagine we have this code
```js
//code
console.log('first')
setTimeout(()=> console.log('Second'), 0)
console.log('third')
```

When the first line is executed that log function gets added to the call stack
```
Callstack

log('first')
main()
```

Since it is a STACK that log will be executed and resolved before returning to `main()`

Once that log is removed from the call stack our program can return to `main()` 
the next line on `main()` runs which is our `setTimeout()` so that gets added to the call stack
```
Callstack

setTimeout()
main()
```
Now `setTimeout()` is async and a web api so `setTimeout()` is handed over to a web api stack and removed from the callstack
This allows these processes to be handled by the environment or other server or whatever the async task involves
```
Call Stack        Web APIs
              =>
main()            setTimeout()
```
Then after the WebAPI has completed the returned promise is sent to the Task Queue while the next line is added to the call stack

```
Call Stack        Web APIs          Task Queue
              =>                =>
log('third')                       setTimeout() (cb or promise)
main()                             
```

Then the log is going to be triggered which will clear the callstack since `main()` is now complete
However the `setTimeout()` is still in the task queue
Once the call stack is empty the promise from `setTimeout` is added to the callstack
```
Call stack

setTimeout() (cb or promise)
```

Now the program has gone through the all commands and emptied the call stack and task queue so the program stops

## Backend BABY (Review)
## Does Javascript have access to the DOM natively (built in)? (Review)
No.

So Javascript needed Web APIs to handle async and a bunch of stuff in the Browser 

JS is sandboxed in the browser this means it can't access anything on your computer that the browser (or environment) does not allow it to access

JS is a language that can only do what the hosting environment allows

## What Do Servers Need? (Review)
- Disk Access (hardrive/ssd)
  - The files they are serving have to actually exist on that server and they need to be able to access them
  - Normally js can't access files because then any website on the computer could access your files (this is an example of sandboxed)
- Network Access (internet, request / responses)
  - Javascript needs to be able to listen for requests and respond to them

Javascript can't do these things out of the box. 
JS needs a browser or environment that will allow these two actions with an API

## What if there was a hosting environment that allowed JS to have disk and network access (Review)
Lucky for us there is

Music & Light Warning - Next Slide

## NODE.js BABY (Review)
Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.

Aka: the same shit that lets you run JS in the browser can now be used to run JS on Servers, Desktops, and elsewhere

## True Story (Review)
Remember how Jeff Goldblum saved the world with reverse engineering in Independence day?
Our computers don't actually undertand js
V8 does!

V8 can translate our javascript to something our computer can understand and interact with our computers
This allows us to create a server
V8 Engine Does All The Heavy Lifting

## Engine Vs. Compiler (Review)
An engine is more than a compiler such has handle memory management and garbage collecting
This will be discussed more in the future

## And just like the browser's Web APIs Node come with a bunch of stuff (Review)

## Built in Modules (Review)
(libraries or collections of functions)
 

HTTP (network access)
FS (file system access)

## Access to millions of packages via NPM (Review)
https://www.npmjs.com/
(groupings of one or more custom modules)

## Not Web APIs, but C/C++ APIs (Review)
Because we are not in the browser
But C/C++ can be understood by the computer so we use these APIs
These are generally much faster than a web api

Node is fast because C/C++ are fast

## Let's Code (Review)
Simple Node Server

Here is an example of a simple node server with just two node modules
Just HTTP & FS

http: will give us access to the network
fs: will give us access to the file system
```js
const http = require('http')
const fs = require('fs')
http.createServer((req, res) => {
  fs.readFile('demofile.html', (err, data) => {
    res.writeHead(200, {'Content-Type': 'text/html'})
    res.write(data)
    res.end()
  })
}).listen(8000)
```
Here we can see that the http module has a method called create server built in
This accepts a callback function that has access to requests that are made and a response object

We can run this by including a `demofile.html` in the folder with this js code
Then we move to the directory with this js file and run it with
```
node nameOfFile.js
```

You should see that the program is running because you don't have a new line in the terminal
Now if you go to 'localhost:8000' in your browser you will see the html file that you included

Music & Light Warning - Next Slide

## Let's Look (Review)
More Complex Backend
See 'class36-materials/node-backend-simple-json`
```js
// server.js
const http = require('http');
const fs = require('fs')
const url = require('url');
const querystring = require('querystring');
const figlet = require('figlet')

const server = http.createServer((req, res) => {
  const page = url.parse(req.url).pathname;
  const params = querystring.parse(url.parse(req.url).query);
  console.log(page);
  if (page == '/') {
    fs.readFile('index.html', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.write(data);
      res.end();
    });
  }
  else if (page == '/otherpage') {
    fs.readFile('otherpage.html', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.write(data);
      res.end();
    });
  }
  else if (page == '/otherotherpage') {
    fs.readFile('otherotherpage.html', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.write(data);
      res.end();
    });
  }
  else if (page == '/api') {
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
  }//else if
  else if (page == '/css/style.css'){
    fs.readFile('css/style.css', function(err, data) {
      res.write(data);
      res.end();
    });
  }else if (page == '/js/main.js'){
    fs.readFile('js/main.js', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/javascript'});
      res.write(data);
      res.end();
    });
  }else{
    figlet('404!!', function(err, data) {
      if (err) {
          console.log('Something went wrong...');
          console.dir(err);
          return;
      }
      res.write(data);
      res.end();
    });
  }
});

server.listen(8000);
```

Here we can see a server with several pages setup but there is a lot of code repetition

To run this server in your computer simply use `$node server.js` in the terminal while in the project directory
You may get an error because there is a module that is not included with node and (probably) not installed called `figlet`
`figlet` allows you to enter a string and it will output ascii art that can be displayed
This is used for the 404 page for this project
In order to install this module
Within the project directory run `$npm install figlet`

Then navigate to 'localhost:8000' in the browser to be sure everything works right

Here is an explanation of how everything works
```js
// server.js
const http = require('http'); // module that can run a server
const fs = require('fs') // module that allows access to the local file system
const url = require('url'); // module to parse url requests
const querystring = require('querystring'); // 
const figlet = require('figlet') // module that outputs ascii art

const server = http.createServer((req, res) => {
  // Find the page that was requestsed
  // req.url = website.com/pagename
  // .pathname = pagename
  const page = url.parse(req.url).pathname;
  // parse queries in the url string
  // website.com/pagename?=string+to+search
  // .query = 'string to search'
  const params = querystring.parse(url.parse(req.url).query);
  // Output the requested page to the console
  console.log(page);
  // Homepage (no path)
  if (page == '/') {
    fs.readFile('index.html', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.write(data);
      res.end();
    });
  }
  // website.com/otherpage
  else if (page == '/otherpage') {
    fs.readFile('otherpage.html', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.write(data);
      res.end();
    });
  }
  // website.com//otherotherpage
  else if (page == '/otherotherpage') {
    fs.readFile('otherotherpage.html', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.write(data);
      res.end();
    });
  }
  // website.com/api
  else if (page == '/api') {
    // Get string from params value
    if('student' in params){
      // Check search is 'leon'
      if(params['student']== 'leon'){
        // Tell recipient that the content will be json
        res.writeHead(200, {'Content-Type': 'application/json'});
        // Create object with data
        const objToJson = {
          name: "leon",
          status: "Boss Man",
          currentOccupation: "Baller"
        }
        res.end(JSON.stringify(objToJson));
      }
      //student != leon
      else if(params['student'] != 'leon'){
        res.writeHead(200, {'Content-Type': 'application/json'});
        const objToJson = {
          name: "unknown",
          status: "unknown",
          currentOccupation: "unknown"
        }
        // Package object data as json and send as response
        res.end(JSON.stringify(objToJson));
      }//student != leon
    }//student if
  }//else if
  // Non-html pages being requested
  // Must still be served by the server when requested within index.html
  else if (page == '/css/style.css'){
    fs.readFile('css/style.css', function(err, data) {
      res.write(data);
      res.end();
    });
  }else if (page == '/js/main.js'){
    fs.readFile('js/main.js', function(err, data) {
      res.writeHead(200, {'Content-Type': 'text/javascript'});
      res.write(data);
      res.end();
    });
  }else{
    figlet('404!!', function(err, data) {
      if (err) {
          console.log('Something went wrong...');
          console.dir(err);
          return;
      }
      res.write(data);
      res.end();
    });
  }
});

server.listen(8000);
```

## How could we clean this up?
There are a lot of if statements here
How could this be cleaner?
Figure it out for homework

## Express
## But First
Blast To The Past

## How Does The Internet Work
"It is a set of rules that allow programs to talk to each other. The developer creates the API on the server and allows the client to talk to it."
https://www.smashingmagazine.com/2018/01/understanding-using-rest-api/

## CRUD
Create (post) - Make something
Read (get) - Get Something
Update (put) - Change something
Delete (delete) - Remove something

## Instagram
What are some Create (post) requests?
What are some Read (get) requests?
What are some Update (put) requests?
What are some Delete (delete) requests?

## Coffee Chat & Professional Review
leonnoel.com/instagram: https://www.instagram.com/leonnoel/

## Let's Build An App with Express
## Express
Fast, unopinionated, minimalist web framework for Node.js

With a myriad of HTTP utility methods and middleware at your disposal, creating a robust API is quick and easy.

## TONIGHT WE BUILD
## Key Steps
## Setting Up The Project
```bash
mkdir api-project
cd api-project
npm init 
npm install express --save
```

## Serving Up HTML
```bash
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
})
```

## Serving Up JSON
```bash
app.get('/api/savage', (request, response) => {
  response.json(object)
})
```

## Push To Heroku
```bash
heroku login -i
heroku create simple-rap-api
echo "web: node server.js" > Procfile
git add . 
git commit -m "changes"
git push heroku main
```

## Homework
Do: Start prepping THE BANK
Do: Complete Your Professional Links
Create: Heroku, Mongo Atlas, and Postman Accounts
Read: Node.js and Express (Fullstack Open)
Do: Make Your Own API and Push To Heroku