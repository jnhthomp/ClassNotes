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
Remember from our previous lectures when we covered:
"What is the internet?"
The internet is like a series of pipes

"It is a set of rules that allow programs to talk to each other. The developer creates the API on the server and allows the client to talk to it."
https://www.smashingmagazine.com/2018/01/understanding-using-rest-api/

When you go to a website you are making a request to a server with the url that you use
The url leads to a server and can have parameters such as what page is wanted

www.neopets.com/merch

www.neopets.com is the server

/merch is a parameter for what page is requested

A server needs to be able to see this url and execute responses based on that request

## CRUD
There are 4 primary ways to interact with a database
These are pretty much the only things you have to do on the database for any full scale application

Create (post) - Make something
Read (get) - Get Something
Update (put) - Change something
Delete (delete) - Remove something

## Instagram
What are some Create (post) requests?
  - Think of adding a new post on instagram
    A post request may include the images themself, information on who is posting them, and the description for the image along with maybe location data
What are some Read (get) requests?
  - Thinking of logging onto instagram and seeing a list of images in your feed
    Each request asks instagram for the current data for a given post and returns it as a response
What are some Update (put) requests?
  - Think about someone making a comment on a post
    Those comments may be stored with the post itself 
    This post would need to be updtaed with new comments or likes everytime someone comments or likes a post
What are some Delete (delete) requests?
  - Think of deleting a post from instagram
    You are removing the image and all the associated data for that post from instagram

## Coffee Chat & Professional Review
This is Leons old insta
leonnoel.com/instagram: https://www.instagram.com/leonnoel/

## Let's Build An App with Express
## Express
Fast, unopinionated, minimalist web framework for Node.js

With a myriad of HTTP utility methods and middleware at your disposal, creating a robust API is quick and easy.

## TONIGHT WE BUILD
Tonight we will make an API from scratch!

## Key Steps
There are a few key steps when making a project

## Setting Up The Project
Create a folder
Move into the folder
`npm init` to make a new project and create package.json
Install express to the project
```bash
$mkdir api-project
$cd api-project
$npm init 
$npm install express --save
```

## Serving Up HTML
Setup responses for get requests for html pages
```js
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
})
```

## Serving Up JSON
Respone with json data instead of files
```js
app.get('/api/savage', (request, response) => {
  response.json(object)
})
```

## Push To Heroku
Put all of our code onto heroku so that it can be hosted
```bash
$heroku login -i 
$heroku create simple-rap-api
$echo "web: node server.js" > Procfile
$git add . 
$git commit -m "changes"
$git push heroku main
```

## The gang builds an api
We are going to make a rap name api which will let you enter a rapper name and get their birth name back
First we have to setup our project and create a folder
```bash
$mkdir rap-names-api
```

Then move into the folder
```bash
$cd rap-names-api
```

Next we have to make this an npm project and create the package.json
```bash
$npm init
```
This will start a prompt that will ask you several questions
You can just hit enter for all of the questions for now

When finished you will get a package.json file that looks like this:
```json
{
  "name": "rap-names-api",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```
Feel free to fill out any of the info that you want

Now we can start building our application

First since we know we will need express we will install it
`$npm install express --save`

This will add express to package.json and create a node_modules folder
This will hold all the modules needed for the express module

Now we can create the server.js file that will run
`$touch server.js`

Now we have to add express to our server
```js
// server.js
const express = require('express')
```

This will impor the express module which gives us access to `express()`
This function has many other subfunctions available to it and in order to access them easily we will set it equal to a variable for easier access
```js
// server.js
const express = require('express')
const app = express()
```
Whenever you see `app.` somewhere in the program just know that it is really `express()`

Now we want to set up the server to hear a request and generate a response
To do this in express we do this by preparing a get request
This is done with `app.get()`
With `app.get()` we can pass in what we want to listen for (the route) as well as an arrow function
This arrow function will have access to two variables automatically called `request` and `response`
```js
// server.js
const express = require('express')
const app = express()

app.get('/', (req, res) => { 
  
})
```

Now this function will be used in order to process the get request and handle the response

For now we just have to worry about the response which is sending a file
This is easy in express by using `response.sendFile()` we can tell it what file to use and create it
```js
// server.js
const express = require('express')
const app = express()

app.get('/', (request, response) => { 
  response.sendFile(__dirname + '/index.html')
})
```
Note the `__dirname` this is shorthand that gives access to the path that `server.js` is stored

Now we have to make index.html
```bash
$touch index.html
```

Then add some html boilerplate
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rap Names API</title>
</head>
<body>
  <h1>Rap Names API</h1>
</body>
</html>
```

Now we just have to tell the server to listen like we did before
Instead of hardcoding the port we will use a variable at the top of our file so it is easier to change
This will also let us use decide between using this or an environment variable easier when we host
As well as the port number we can provide another arrow function for what to do when the server starts
In this case we will just add a `console.log` letting us know our server is running
```js
// server.js
const express = require('express')
const app = express()
const PORT = 8000

app.get('/', (request, response) => { 
  response.sendFile(__dirname + '/index.html')
})

app.listen(PORT, () => { 
  console.log(`Listening on ${PORT}...`)
})
```

Now we should be able run our server and see if we can load the page

We have a very simple server setup which is sending an html file
We want to create an api though...

We want to respond with json not html

So lets make a new path that will be our api path
This time instead of sending a file we want to send json
express makes that easy with `response.json()`
```js
app.get('/api', (req, res) => { 
  res.json()
})
```

This will be empty json though
We will need to create an object to send
For now we will just create a normal object
```js
const savage = {
  'age': 29,
  'birthName': 'Sh??yaa Bin Abraham-Joseph',
  'birthLocation':  'London, England'
}
```
For now lets just respond with that object
```js
// server.js
const { response } = require('express')
const express = require('express')
const app = express()
const PORT = 8000

const savage = {
  'age': 29,
  'birthName': 'Sh??yaa Bin Abraham-Joseph',
  'birthLocation':  'London, England'
}

app.get('/', (req, res) => { 
  res.sendFile(__dirname + '/index.html')
})

app.get('/api', (req, res) => { 
  res.json(savage)
})

app.listen(PORT, () => { 
  console.log(`Listening on ${PORT}...`)
})

```

Remember to stop your server then re-run it
Then navigate to 'localhost:8000/api'
You should see the json being returned

Lets try hitting this api with Postman
Make sure it is installed first it will not work on localhost in the web version
Then make a get request to the same url
You should get the data back

Right now we have a simple api running with just 2 get requests
But we aren't really here for just 1 rapper
We want multiple rappers like a real api

Lets add a few more for a couple of rappers and then use 'Dylan' for everyone else
```js
// server.js
const { response } = require('express')
const express = require('express')
const app = express()
const PORT = 8000

const rappers = {
  '21 Savage': {
    'age': 29,
    'birthName': 'Sh??yaa Bin Abraham-Joseph',
    'birthLocation':  'London, England'
  },
  'Chance the Rapper': {
    'age': 29,
    'birthName': 'Chancelor Bennett',
    'birthLocation': 'Chicago, Illinois'
  },
  'Dylan': {
    'age': 29,
    'birthName': 'Dylan',
    'birthLocation': 'Dylan'
  }

}

app.get('/', (req, res) => { 
  res.sendFile(__dirname + '/index.html')
})

app.get('/api', (req, res) => { 
  res.json(rappers)
})

app.listen(PORT, () => { 
  console.log(`Listening on ${PORT}...`)
})
```

Now we should be able to see our new data when querying the '/api' path

Next we want to return just a specific rapper's name as a result
The way we want to do it is to check the url for a rapper name
For example: 'localhost:8000/api/Chance+the+Rapper' should only return data about 'Chance the Rapper'

There is ane asy way to get this information in express by simply doing this to the get address
```js
app.get('/api/:rapperName', (req, res) => { 
  res.json(rappers)
})
```

Now you can access and use `rapperName` via `request.params.rapperName` within our arrow function to get whatever was added to the url
We can see this by `console.log(request.params.rapperName)`
```js
app.get('/api/:rapperName', (req, res) => { 
  console.log(req.params.rapperName)  
  res.json(rappers)
})
```
If you run a request to 'localhost:8000/api/Chance+the+Rapper'
You should see 'Chance+the+Rapper' logged to the console running the server

Now we want to see if the parameter passed in exists within our rappers object
Leon didn't take care of this but we will need to parse the url in a way that replaces the '+' signs with ' '
Then we can see if there are any objects in `rappers` that matches the string from the url
```js
app.get('/api/:rapperName', (req, res) => { 
  // console.log(req.params.rapperName)  
  
  // parse name and convert '+' to ' '
  let name = req.params.rapperName
  while(name.indexOf('+') >= 0){
    name = name.replace('+', ' ')
  }
  // console.log(name) // Parsed name with spaces instead of '+'
  // If the rapper name exists
  if(rappers[name]){
    // return the rapper obj as json
    res.json(rappers[name])
  } else{
    // Otherwise return default Dylan obj as json
    res.json(rappers['Dylan'])
  }
})
```

Now if we make a request to 'localhost:8000/api/Chance+the+Rapper' we will only get data back about 'Chance the Rapper'
If you put a name that doesn't exist in our object (or misspell) we will get 'Dylan' as intended

One mistake our users might run into is case sensitivity
We can make sure our casing matches by changing the keys in the json to be lowercase
Then convert the name to lowercase before checking for the key
This means no matter whether the user types in uppercase or lowercase the same result will be returned
```js
// server.js
const { request } = require('express')
const { response } = require('express')
const express = require('express')
const app = express()
const PORT = 8000

const rappers = {
  '21 savage': {
    'age': 29,
    'birthName': 'Sh??yaa Bin Abraham-Joseph',
    'birthLocation':  'London, England'
  },
  'chance the rapper': {
    'age': 29,
    'birthName': 'Chancelor Bennett',
    'birthLocation': 'Chicago, Illinois'
  },
  'dylan': {
    'age': 29,
    'birthName': 'Dylan',
    'birthLocation': 'Dylan'
  }
}

app.get('/', (req, res) => { 
  res.sendFile(__dirname + '/index.html')
})

app.get('/api/:rapperName', (req, res) => { 
  // console.log(req.params.rapperName)  
  let name = req.params.rapperName.toLowerCase()
  while(name.indexOf('+') >= 0){
    name = name.replace('+', ' ')
  }
  // console.log(name)
  if(rappers[name]){
    res.json(rappers[name])
  } else{
    res.json(rappers['dylan'])
  }
})

app.listen(PORT, () => { 
  console.log(`Listening on ${PORT}...`)
})
```

Now we have an actual backend api that we can build off of!

We can add a front end to this application that makes these requests by updating our index.html and adding an index.js to handle an input submission
First add an input and submit button to the html as well as a field to add the birthname to
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rap Names API</title>
</head>
<body>
  <h1>Rap Names API</h1>
  <form id="searchRapper">
    <input type="text">
    <button type="submit">Submit</button>
  </form>
  <h2>Birth Name: </h2>
</body>
</html>
```

Now we need to add some client side js
That way whenever a user enters a name and submits it, js can make a fetch request to our server
We can create that easily
```bash
$mkdir js
$touch js/main.js
```

Then we have to link it in the index.html
```html
<body>
  <h1>Rap Names API</h1>
  <form id="searchRapper">
    <input type="text">
    <button type="submit">Submit</button>
  </form>
  <h2>Birth Name: </h2>
  <script src="js/main.js"></script>
</body>
```

But this won't just work
We have to set up our server to SERVE the main.js file that is being linked
index.js requests it but our server is not setup to return that page
We can just add another get request to our server and include this page
```js
app.get('/js/main.js', (req, res) => {
  res.sendFile(__dirname + '/js/main.js')
})
```

If we have a simple alert in the js file we should be able to see tha the application is working and js is being linked

Now we can add an `onSubmit` event to our form, make a fetch request inside, and update the dom with the retrieve value
(Not going into detail as this has been covered plenty)
```js
// js/main.js
document.getElementById('searchRapper').addEventListener('submit', (event) => { 
  event.preventDefault()
  let name = event.target[0].value;
  
  while(name.indexOf(' ') >= 0){
    name = name.replace(' ', '+')
  }

  fetch(`/api/${name}`)
    .then(res => res.json())
    .then(data => document.querySelector('h2').innerHTML = `Birth Name: ${data.birthName}`)
})
```

Now that we have an application we want to host it on the internet so other people can access it online
One way to do this is a platform called heroku which can make hosting full stack applications easy

First lets host this code on git/create a git repo for it
```bash
$git init
```

Then make a .gitignore file so we don't track the node_modules file
```bash
$echo "node_modules" > .gitignore
```

Now add all of these git changes as a commit
```bash
$git add *
$git commit -m "initial commit"
```

Now we can push this to a git repo online if you want

We also want to put this on heroku
If we do this we will run into an error
This is because we are only setup to use port 8000
Heroku may not want to use this port
We need to add an or statement to assign the port number if it exists
```js
const PORT = process.env.PORT || 8000
```
Now the process running our server will be checked before assigning 8000 this will allow heroku to set any ports it needs for listening

Now lets push our project to heroku
First make sure you have a heroku account and make sure you have heroku cli installed to your terminal
```bash
$heroku login # if you have two factor auth
$heroku login -i # if you don't have two factor auth
```
This command will open your browser to log you in on your cli 

Now that we are logged in to heroku we are going to create a new application from the command line 
(can also be done in the browser but then you have to link your app to it by adding a new remote origin)
To do this use:
```bash
$heroku create your-app-name
```

Now we have to tell heroku what file to run whenever the application is run
We have been doing this by using `$node server js` to start our application but heroku doesn't know that is the correct command
To tell it that we create something called a procfile and include the command to start the application inside
We can create a procfile with the command inside with:
```bash
$echo "web: node server.js" > Procfile
```

Now add any changes and commit them
```bash
$git add *
$git commit -m "Heroku changes"
```

Now we push to heroku
```bash
$git push heroku main
```

Once this process is done your site is live and hosted online for anyone to view
You can preview your site by using the following:
```bash
$heroku open # may not work in wsl, but will give a clickable link (use ctrl + click)
```

You could even access your api by using the link to your project
For example mine would be
```
https://jtdev-simple-rap-api.herokuapp.com/api/chance+the+rapper
```
To get info on 'Chance the Rapper'

If you want to build an app on your local machine using this hosted api then you need to enable CORS

There is a module we can use to handle this for us
```bash
$npm install corse
```

Then in our server we need to import it and use it
```js
// server.js
const express = require('express')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8000

app.use(cors)
...
```

Now if you push this to heroku you can make fetch requests on your local machine to this api
This means any client in the world could use this api to get data

Complete code:
```js
// /js/main.js
document.getElementById('searchRapper').addEventListener('submit', (event) => { 
  event.preventDefault()
  let name = event.target[0].value;
  
  while(name.indexOf(' ') >= 0){
    name = name.replace(' ', '+')
  }

  fetch(`/api/${name}`)
    .then(res => res.json())
    .then(data => document.querySelector('h2').innerHTML = `Birth Name: ${data.birthName}`)
})
```
```.gitignore
# .gitignore
node_modules
```
```html
<!-- index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rap Names API</title>
</head>
<body>
  <h1>Rap Names API</h1>
  <form id="searchRapper">
    <input type="text">
    <button type="submit">Submit</button>
  </form>
  <h2>Birth Name: </h2>
  <script src="js/main.js"></script>
</body>
</html>
```
```json
# package.json
{
  "name": "rap-names-api",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.18.1"
  }
}
```
```js
// server.js
const express = require('express')
const app = express()
const cors = require('cors')
const PORT = process.env.PORT || 8000

app.use(cors)

const rappers = {
  '21 savage': {
    'age': 29,
    'birthName': 'Sh??yaa Bin Abraham-Joseph',
    'birthLocation':  'London, England'
  },

  'chance the rapper': {
    'age': 29,
    'birthName': 'Chancelor Bennett',
    'birthLocation': 'Chicago, Illinois'
  },

  'dylan': {
    'age': 29,
    'birthName': 'Dylan',
    'birthLocation': 'Dylan'
  }
}

app.get('/', (req, res) => { 
  res.sendFile(__dirname + '/index.html')
})

app.get('/js/main.js', (req, res) => {
  res.sendFile(__dirname + '/js/main.js')
})

app.get('/api/:rapperName', (req, res) => { 
  // console.log(req.params.rapperName)  
  let name = req.params.rapperName.toLowerCase()
  while(name.indexOf('+') >= 0){
    name = name.replace('+', ' ')
  }
  // console.log(name)
  if(rappers[name]){
    res.json(rappers[name])
  } else{
    res.json(rappers['dylan'])
  }
})

app.listen(PORT, () => { 
  console.log(`Listening on ${PORT}...`)
})
```

## Homework
Do: Start prepping THE BANK
Do: Complete Your Professional Links
Create: Heroku, Mongo Atlas, and Postman Accounts
Read: Node.js and Express (Fullstack Open)
Do: Make Your Own API and Push To Heroku