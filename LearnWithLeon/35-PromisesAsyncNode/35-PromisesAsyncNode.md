# Promises Async Node
Slides: https://slides.com/leonnoel/100devs2-promises-async-node
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Learn - Callbacks 
Learn - Promises
Learn - Async
Learn - Node 
Homework - Simple Coin Flip

## Questions
About last class or life

## Office Hours
SUNDAY
1:00pm EST

## !newsletter
There was a giveaway in the newsletter today for VIP so make sure you are subscribed to the newsletter
## My Birthday Wish:
Leon's birthday wish is to follow the streamteam on twitch and twitter

twitch.tv/verolafox | twitter.com/hufflepuffcodes
twitch.tv/mayanwolfe | twitter.com/mayanwolfe
twitch.tv/helloitsrufio | twitter.com/helloitsrufio

## Fresh Start (Review)
If you missed some homework or checkins and want to be part of the things at the end of the program (job board, references, #100Devs verification)

Don't worry. There is a fresh start starting now.
Missing homework and checkins do not matter
Slate is clean.
Going forward there is an expectation that you turn in hw and use checkins

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

## Backend!
Butt first!

## Let's Deliver Some Papers
To conceptualize the backend we will think of delivering papers

We can do this one of two ways
1. Synchronous
2. Asyncrhonous
## Synchronous
We would get their paper and wait for them to come to the door before moving on to the next house

## Asynchronous
We would throw the paper and go to the next house and deliver theirs


## Javascript is
single-threaded
Synchronous aka processes

one operation at a time

## If synchronous, how do we do stuff like make an api request and keep scrolling or clicking
## Things should block
## THE ENVIRONMENT
## Not This
(pic of the planet)
## THIS
The browser!
## Our JS is running in a browser
Browsers have a BUNCH of APIs we can use that are async and enable us to keeping looking a cute cat photos while those operations are being processed asynchronously

## Common browser APIs
DOM (Document Object Model) API: https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model

*the DOM (Document Object Model) is essentially the API one uses to manipulate an HTML (or XML) document -- usually using JavaScript: https://stackoverflow.com/questions/2726554/what-is-the-difference-between-javascript-and-dom


## ! USUALLY !
Technically it could be done with otherways but the browsers use javascript

## WAIT
WHAT THE FUCK
Actual words Leon said when figuring all this shit out...

## So, yeah, JS can do a lot of "blocking" stuff in the browser because it is handing that stuff off to async
Web APIs

## BUT
We are going to need to know how to handle responses coming back from those Web APIs
JS does this with callbacks, promises,
and eventually async/await

## Call stack, Call Back Queue, Web API, Event Loop
Tuesday

## Let's Deliver Some Papers
So let's say we wanted to write a program to deliver papers
This is traditional kind of way we would do it synchronously
```js
function houseOne(){
    console.log('Paper delivered to house 1')
}
function houseTwo(){
    console.log('Paper delivered to house 2')
}
function houseThree(){
    console.log('Paper delivered to house 3')
}

houseOne()
houseTwo()
houseThree()
```

## Let's Use A Web API 
like `setTimeout()`

## DID I STUTTER?
Yes `setTimeout()` is a web api
`setTimeout()` and `setInterval()` are not part of the Javascript specification...
Most environments include them...
like all browsers and Node.js

But it is not built into js itself
We only have access to this method because we are running it in the browser

This makes sense because if js is blocking and synchronous how would these work?


## Back to the code

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
We will discuss this more in detail next class

## What if it is pay day?
We want to get paid by each house before moving on to the next one

For example: 
I only want to move onto the third house after the second house has paid me
In the real world this would be getting data back from an API ect...

We don't want to keep running our code until we get a response back from the API we are making a request to
Usually this is because we are doing something with the response
Think of requesting a json object and trying to use data inside
We can't do that until we get the json within the response

## Callbacks
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

## Let's Get Paid
So we can organize our code to only go to the next house after visiting the first house by using callbacks
```js
function houseOne(){
    console.log('Paper delivered to house 1')
}
function houseTwo(callback){
    setTimeout(() => {
        console.log('Paper delivered to house 2')
        callback()
    }, 3000)
}
function houseThree(){
    console.log('Paper delivered to house 3')
}

houseOne()
houseTwo(houseThree)
//=>'Paper delivered to house 1'
// (wait three seconds)
//=>'Paper delivered to house 2'
//=> 'Paper delivered to house 3'
```
Here `houseOne()` is called then `houseTwo` is called as normal
However we pass the function for `houseThree` in as an argument for `houseTwo`
So whenever the timeout is complete we then call this function that was passed within `houseTwo`
This allows us to be sure that `houseThree` isn't called until the timout is complete from `houseTwo`

NOTICE: We did not do this when passing the function in as a callback 
(See the parenthesis were we pass `callback` into `houseTwo`)
This is because when we include '()' it tells js to execute that function
If we just want to reference the function we do not include the ()
```js
function houseTwo(callback()){
    setTimeout(() => {
        console.log('Paper delivered to house 2')
        callback()
    }, 3000)
}
function houseThree(){
    console.log('Paper delivered to house 3')
}
```
## Callback fires when async task or another function is done
Notice that we were able to wait for the async task to complete before we triggered the callback function which is what we wanted

## Let's Get Paid By Everyone
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
## Welcome To Hell
Callback Hell
When you have too many nested callbacks it can be hard to follow and see what is going on
Especially if other developers want to get involved and make changes

## What if there was a more readable way to handle async code?
Luckily there is and it uses a special kind of object  called a promise

## Promise
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

## .then()
This is a special method attached to the promise object
When it resolves as fulfilled this method fires

## .then(value)
Whatever value the promise object has gets passed as an argument and can be accessed as an argument inside of the callback you put in then
```js
promise.then(data=> console.log(data))
```
Here whenever the promise is fulfilled the data from that promise will be logged to the console

## .catch()
This is another special method attached to the promise object
It only fires when the promise resolves as rejected

## .catch(value)
Much like then you can access the rejected promise
```js
promise
    .then(data => console.log(data)) // promise is fulfilled
    .catch(err => console.log(err)) // promise is rejected
```

## We've Seen This Before
Luckily we have been using promises for a while now!

## APIs
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

## Fetch returns a Promise
Like a bunch of Web APIs running async code
https://developer.mozilla.org/en-US/docs/Web/API

## Let's see those three states


```js
const promise = new Promise((resolve, reject) => {
    const error = false // change to true to see rejected state
    if(!error){
        resolve('Promise has been fullfilled')
    }else{
        reject('Error: Operation has failed')
    }
})
console.log(promise) // promise is pending
promise
    .then(data => console.log(data)) // promise is fulfilled
    .catch(err => console.log(err)) // promise is rejected
```

## Let's Get Paid By Everyone
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

## Chaining Don't Read Good
It isn't as bad as callback hell but could be better
But it would be better if we could make our  asynchronous code to look sychronous
## Async / Await
This is a newer way to handle async responses
They are still promises Under The Hood

Syntactic sugar on top of promises, making asynchronous code easier to write and to read afterwards
https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Promises

## Await waits for an async process to complete inside an Async Function
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

## I Need Something Real
Now lets build a real application using async/await
## Let's Code
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

## Backend BABY
Now that we understand promises and how to handle them we are ready for the backend

## Does Javascript have access to the DOM natively (built in)?
No.

So Javascript needed Web APIs to handle async and a bunch of stuff in the Browser 

JS is sandboxed in the browser this means it can't access anything on your computer that the browser (or environment) does not allow it to access

JS is a language that can only do what the hosting environment allows

## What Do Servers Need?
- Disk Access (hardrive/ssd)
  - The files they are serving have to actually exist on that server and they need to be able to access them
  - Normally js can't access files because then any website on the computer could access your files (this is an example of sandboxed)
- Network Access (internet, request / responses)
  - Javascript needs to be able to listen for requests and respond to them

Javascript can't do these things out of the box. 
JS needs a browser or environment that will allow these two actions with an API
## What if there was a hosting environment that allowed JS to have disk and network access
Lucky for us there is

Music & Light Warning - Next Slide

## NODE.js BABY
Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.

Aka: the same shit that lets you run JS in the browser can now be used to run JS on Servers, Desktops, and elsewhere

## True Story
Remember how Jeff Goldblum saved the world with reverse engineering in Independence day?
Our computers don't actually undertand js
V8 does!

V8 can translate our javascript to something our computer can understand and interact with our computers
This allows us to create a server
V8 Engine Does All The Heavy Lifting

## And just like the browser's Web APIs Node come with a bunch of stuff
## Built in Modules
(libraries or collections of functions)
 

HTTP (network access)
FS (file system access)

## Access to millions of packages via NPM
https://www.npmjs.com/
(groupings of one or more custom modules)

## Call stack, Call Back Queue, Node Modules, Event Loop
There is so much we can get into with Node.
We will Tuesday

## Install Node
Part of the homework is to setup our environment (aka node)
https://nodejs.org/en/

## Releases?
https://nodejs.org/en/about/releases/
- LTS: the version that is going to be supported for the longest
- Current: the most recent stable version that is being built
- Nightly: newest and most actively developed could potentially have issues

As a team it is important to choose the right version for the project based on the release schedule

## Let's Code
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

## You are now a Software Engineer that can build Fullstack Web Applications
## Let's Look at a More Complex Backend
See 'clas35-materials/node-backend-simple-json'

## How could we clean this up?
There are a lot of if statements here
How could this be cleaner?
Figure it out for homework

## Homework
Do: Start prepping THE BANK
Do: Complete Your Professional Links
Do: Make node-backend-simple-json more readable
Do: Make a coinflip game where the randomization happens server side
Do: How to handle errors with async/await
Do: Setup/update node.js with node 18