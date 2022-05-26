# Fancy JS terms & Node
Slides: https://slides.com/leonnoel/100devs2-fancy-js-terms-and-node
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Learn - JS All Lies 
Learn - Call Stack / Task Queue
Learn - Event Loop
Learn - Node 
Homework - Coin Flip & RPS

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1529213324633657345
Like and Retweet the Tweet
!checkin

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
## Submitting Work

Freelancing Submission: https://docs.google.com/forms/d/e/1FAIpQLSeVqfClPktHdfm-JX2jyKz-QFI6e55D3Gw1EKKVkwf7KO410w/viewform

Checklist, 100Hours Project, Codewars: https://docs.google.com/forms/d/e/1FAIpQLSdhpDy8HzDDpwMlnpwB5lWNU_92UNiCZq11gj_1Ik6MGzVkjg/viewform

## Spaced Repetition (Review)
Ali Abdaal: https://youtu.be/Z-zNHHpXoMM
Taking into account on how to reset the forgetting curve we will used spaced repetition
This means after we cover something we will retouch on the concept little later so that we can reset the curve and retain better

This is much more effective than studying something really hard just once

## Thank You
Philip Roberts: https://www.youtube.com/watch?v=8aGhZQkoFbQ&feature=youtu.be
Jake Archibald: https://www.youtube.com/watch?v=cCOL7MC4Pl0
Watch These Videos (Homework)

Tonights topics are covered really well by the above two videos
They are absolutely critical to watch 
Almost every Node developer has watched these

## Backend!
Butt first!

## Javascript is single-threaded (Review)
Synchronous aka processes
one operation at a time

## If synchronous, how do we do stuff like make an api request and keep scrolling or clicking (Review)
## Things should block

## THE ENVIRONMENT (Review)

## Not This (Review)
(pic of the planet)

## THIS (Review)
The browser!

## Our JS is running in a browser (Review)
Browsers have a BUNCH of APIs we can use that are async and enable us to keeping looking a cute cat photos while those operations are being processed asynchronously

## Common browser APIs (Review)
DOM (Document Object Model) API: https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model

*the DOM (Document Object Model) is essentially the API one uses to manipulate an HTML (or XML) document -- usually using JavaScript: https://stackoverflow.com/questions/2726554/what-is-the-difference-between-javascript-and-dom

## WAIT (Review)
WHAT THE FUCK
Actual words Leon said when figuring all this shit out...

## So, yeah, JS can do a lot of "blocking" stuff in the browser because it is handing that stuff off to async Web APIs (Review)

## BUT (Review)
We are going to need to know how to handle responses coming back from those Web APIs
JS does this with callbacks, promises,
and eventually async/await

## Callbacks (Review)
This is the Old School Way
It allowed you to wait for a response and then do something else

This works because you can have a function that takes another function as an argument
aka Higher Order Function

We have done this many times:
`addEventListener('click', callback)`
The second argument is a funcion and is received as an argument

A Callback is just a function that has been passed as an argument
Callbacks are not really "a thing" in JS
just a convention 

## Callback fires when async task or another function is done 
Notice that we were able to wait for the async task to complete before we triggered the callback function which is what we wanted

## Let's Get Paid By Everyone (Review)
We want to go to house one and deliver/get paid and move on to two, and then three

Now each of these have been nested
```js
function houseOne(){
    setTimeout(() => {
        console.log('Paper delivered to house 1')
        setTimeout(() => {
            console.log('Paper delivered to house 2')
            setTimeout(() => {
                console.log('Paper delivered to house 3')
            }, 3000)
        }, 4000)
    }, 5000)
}
houseOne()
```

As you may be able tell this is pretty aweful and hard to read

## Welcome To Hell (Review)
Callback Hell
When you have too many nested callbacks it can be hard to follow and see what is going on
Especially if other developers want to get involved and make changes

## What if there was a more readable way to handle async code? (Review)
Luckily there is and it uses a special kind of object  called a promise

## Promise (Review)
A promise is an object that represents the eventual completion or failure of an async operation and its value

Simply...
It is an object that MAY have a value in the future

A promise can have three possible states
1. pending: initial state, neither fulfilled nor rejected.
  - Will have this status when you first make an api call but a response has not been received yet
  - Think of calling `setTimeout()` but the browser hasn't completed waiting the time specified
2. fulfilled: meaning that the operation was completed successfully.
  - This is the status when a successful response is received
  - Think of calling `setTimeout()` and the browser has completed the wait, it will change the promise object to a fulfilled state after the time is up
3. rejected: meaning that the operation failed.
  - This is the status when a failed response is received
  - Think of making an api call but the api didn't have any data to return because of a bad url or something

## .then() (Review)
This is a special method attached to the promise object
When it resolves as fulfilled this method fires

## .then(value) (Review)
Whatever value the promise object has gets passed as an argument and can be accessed as an argument inside of the callback you put in then
```js
promise.then(data=> console.log(data))
```
Here whenever the promise is fulfilled the data from that promise will be logged to the console

## We've Seen This Before (Review)
Luckily we have been using promises for a while now!

## APIs (Review)
Fetch Fido, Fetch!
```js
fetch("https://dog.ceo/api/breeds/image/random")
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      console.log(data)
    })
    .catch(err => {
        console.log(`error ${err}`)
    });
```
Fetch is a web api that returns a promise just like `setTimeout()` and `setInterval()`
The promise that it returns is either successful data retrieval and the data requested or a failure object

## Fetch returns a Promise (Review)
Like a bunch of Web APIs running async code
https://developer.mozilla.org/en-US/docs/Web/API

## Let's Get Paid By Everyone (Review)
Now we can use promises to deliver the paper and only move on when the promise is resolved (we get paid)
```js
function houseOne(){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            // promise resolves after waiting
            resolve('Paper delivered to house 1')
        }, 1000)
    })
}
function houseTwo(){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            // promise resolves after waiting
            resolve('Paper delivered to house 2')
        }, 5000)
    })
}
function houseThree(){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            // promise resolves after waiting
            resolve('Paper delivered to house 3')
        }, 2000)
    })
}

houseOne()
    .then(data => console.log(data))
    .then(houseTwo)
    .then(data => console.log(data))
    .then(houseThree)
    .then(data => console.log(data))
    .catch(err => console.log(err))
```

Now `houseOne()` is called which creates a promise
When it is resolved (the timer completes)
The string from `resolve()` within `houseOne()` is returned
We can use `.then()` to capture and output that data and call the next house
The chain continues like this until all houses are complete
If there was an error for one of the houses the `catch()` method would be activated

## Chaining Don't Read Good (Review)
It isn't as bad as callback hell but could be better
But it would be better if we could make our  asynchronous code to look sychronous

## Async / Await (Review)
This is a newer way to handle async responses
They are still promises Under The Hood

Syntactic sugar on top of promises, making asynchronous code easier to write and to read afterwards
https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Promises

## Await waits for an async process to complete inside an Async Function (Review)
```js
function houseOne(){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('Paper delivered to house 1')
        }, 1000)
    })
}
function houseTwo(){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('Paper delivered to house 2')
        }, 5000)
    })
}
function houseThree(){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve('Paper delivered to house 3')
        }, 2000)
    })
}
async function getPaid(){
    const houseOneWait = await houseOne()
    const houseTwoWait = await houseTwo()
    const houseThreeWait = await houseThree()
    console.log(houseOneWait)
    console.log(houseTwoWait)
    console.log(houseThreeWait)
}
getPaid()
```

Now we ahve marked `getPaid()` as an `async` function
This allows us to use await inside
Whenever we call await before our async methods we store the response in a variable

The difference here is that js will not go on to the next line until the promise resolves 
It will AWAIT the response of the promise before moving on

## I Need Something Real (Review)
Now lets build a real application using async/await

## Let's Code (Review)
An API request using Async/Await

Fetch Fido, Fetch! can easily be converted from a `.then()` chain to async await because fetch returns a promise
```js
async function getACuteDogPhoto(){
    const res = await fetch('https://dog.ceo/api/breeds/image/random')
    const data = await res.json()
    console.log(data)
}
getACuteDogPhoto()
```

But how do we handle errors?
Figure it out for homework!

## Let's Use A Web API (Review)
like `setTimeout()`

## DID I STUTTER? (Review)
Yes `setTimeout()` is a web api
`setTimeout()` and `setInterval()` are not part of the Javascript specification...
Most environments include them...
like all browsers and Node.js

But it is not built into js itself
We only have access to this method because we are running it in the browser

This makes sense because if js is blocking and synchronous how would these work?

## Back to the code (Review)
Now house 1 is normal but house 2 has a timeout of 3 seconds
If we run this what can we expect to happen?
```js
function houseOne(){
    console.log('Paper delivered to house 1')
}
function houseTwo(){
    setTimeout(() => console.log('Paper delivered to house 2'), 3000)
}
function houseThree(){
    console.log('Paper delivered to house 3')
}
houseOne()
houseTwo()
houseThree()

// Because of setTimeout() on houseTwo we can expect the following
//=> 'Paper deliverd to house 1'
//=> 'Paper delivered to house 3'
// (after 3 seconds)
//=> 'Paper delivered to house 2'
```

Even more funky,
Let's reduce the settimeout to 0
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

// Because of setTimeout() on houseTwo we can expect the following
//=> 'Paper deliverd to house 1'
//=> 'Paper delivered to house 3'
//=> 'Paper delivered to house 2'
```
It works this way because the async nature of `setTimeout()`
This is because of something called the event loop that manages which processes will run and the order the will run in

In short what happens is that `houseOne()` runs immediately because it is handled by built in js functions
Then when `houseTwo()` is called it hands the task off to the browser to handlt the `setTimout()` call
Even though the call completes quicly js moves onto the next set of instructions while the browser processes this api request
Then the browser will respond with the timeout completing but only after js has moved on to `houseThree()`

## EVENT LOOP
## Time for some data structures
## Queue
Like a real queue, the first element which was added to the list, will be the first element out.

This is called a FIFO (First In First Out) structure. 

## Queue Example
```js
let queue = []
queue.push(2) // queue is now [2] 
queue.push(5) // queue is now [2, 5] 
let i = queue.shift() // queue is now [5] 
alert(i) // displays 2
```

## Stack
The first pancake made, is the last pancake served.

This is called a stack.

The first element which was added to the list, will be the last one out. This is called a LIFO (Last In First Out) structure.

## Stack Example
```js
let stack = []
stack.push(2) // stack is now [2] 
stack.push(5) // stack is now [2, 5] 
let = stack.pop() // stack is now [2] 
alert(i) // displays 5
```

## Back To Getting Got
## JS IS RUNNING IN THE BROWSER
V8 Engine
(Parse Code > Runnable Commands)

Window Runtime (Hosting Environment)

Gives Us Access To Web APIs

Passes stuff to Libevent (Event Loop)
This is how the browser handles multiple tasks at once

## The Event Loop monitors the Callback Queue and Job Queue and decides what needs to be pushed to the Call Stack.

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

## Backend BABY
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

## Engine Vs. Compiler
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

## Not Web APIs, but C/C++ APIs
Because we are not in the browser
But C/C++ can be understood by the computer so we use these APIs
These are generally much faster than a web api

Node is fast because C/C++ are fast

## Install Node (Review)
Part of the homework is to setup our environment (aka node)
https://nodejs.org/en/

## Releases? (Review)
https://nodejs.org/en/about/releases/
- LTS: the version that is going to be supported for the longest
- Current: the most recent stable version that is being built
- Nightly: newest and most actively developed could potentially have issues

As a team it is important to choose the right version for the project based on the release schedule

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

## You are now a Software Engineer that can build Fullstack Web Applications (Review)
## Let's Look
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

## Homework
Do: Start prepping THE BANK
Do: Complete Your Professional Links
Do: Make node-backend-simple-json more readable
Do: Make a coinflip game where the randomization happens server side