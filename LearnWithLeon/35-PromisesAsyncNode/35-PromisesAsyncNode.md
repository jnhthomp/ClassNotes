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

## My Birthday Wish:
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
## Synchronous
Waiting for them to come to the door

## Asynchronous
Moving onto the next house

## Javascript is
single-threaded
Synchronous aka processes

one operation at a time

## If synchronous, how do we do stuff like make an api request and keep scrolling or clicking
## Things should block
## THE ENVIRONMENT
## Not This
## THIS
## Our JS is running in a browser
Browsers have a BUNCH of APIs we can use that are async and enable us to keeping looking a cute cat photos while those operations are being processed asynchronously

## Common browser APIs
DOM (Document Object Model) API: https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model

*the DOM (Document Object Model) is essentially the API one uses to manipulate an HTML (or XML) document -- usually using JavaScript: https://stackoverflow.com/questions/2726554/what-is-the-difference-between-javascript-and-dom


## ! USUALLY !

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
setTimeout()

## DID I STUTTER?
setTimeout and setInterval are not part of the Javascript specification...
Most environments include them...
like all browsers and Node.js

## Live Leon Footage
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
```

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
## EVENT LOOP
Thursday

## What if it is pay day?
## I only want to move onto the third house after the second house has paid me
Real world this would be getting data back from an API ect...

## Callbacks
The Old School Way

## You can have a function that takes another function as an argument
aka Higher Order Function

## You have seen this a million times
addEventListener('click', callback)

## A Callback is the function that has been passed as an argument
Callbacks are not really "a thing" in JS
just a convention 

## Let's Get Paid
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
```

## Callback fires when async task or another function is done
## Let's Get Paid By Everyone
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

## Welcome To Hell
Callback Hell

## What if there was a more readable way to handle async code
## Promise
## A promise is an object that represents the eventual completion or failure of an async operation and its value
## An object that MAY have a value in the future
## A promise can have three possible states
1. pending: initial state, neither fulfilled nor rejected.
2. fulfilled: meaning that the operation was completed successfully.
3. rejected: meaning that the operation failed.

## .then()
A promise object method that runs after the promise "resolves"

## .then(value)
Whatever value the promise object has gets passed as an argument

## We've Seen This Before
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
API returns a JSON object that we can use within our apps

## Fetch returns a Promise
Like a bunch of Web APIs running async code
https://developer.mozilla.org/en-US/docs/Web/API

## Let's see those
three states
```js
const promise = new Promise((resolve, reject) => {
    const error = false
    if(!error){
        resolve('Promise has been fullfilled')
    }else{
        reject('Error: Operation has failed')
    }
})
console.log(promise)
promise
    .then(data => console.log(data))
    .catch(err => console.log(err))
```

## Let's Get Paid By Everyone
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
houseOne()
    .then(data => console.log(data))
    .then(houseTwo)
    .then(data => console.log(data))
    .then(houseThree)
    .then(data => console.log(data))
    .catch(err => console.log(err))
```

## Chaining Don't Read Good
## I want my asynchronous code to look sychronous
## Async / Await
## A way to handle async responses
## Promises Under The Hood
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

```js
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

## I Need Something Real
## Let's Code
An API request using Async/Await

## APIs
Fetch Fido, Fetch!
```js
async function getACuteDogPhoto(){
    const res = await fetch('https://dog.ceo/api/breeds/image/random')
    const data = await res.json()
    console.log(data)
}
getACuteDogPhoto()
```

## Backend BABY
## Does Javascript have access to the DOM natively (built in)?
## Javascript needed Web APIs to handle async and a bunch of stuff in the Browser 
## JS is sandboxed in the browser
## JS is a language that can only do what the hosting environment allows
## What Do Servers Need?
## Disk Access
(hardrive/ssd)
&&
Network Access
(internet, request / responses)

## What if there was a hosting environment that allowed JS to have disk and network access
Music & Light Warning - Next Slide

## NODE.js BABY
## Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
## The same shit that lets you run JS in the browser can now be used to run JS on Servers, Desktops, and elsewhere
## True Story
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
Tuesday

## Install Node
https://nodejs.org/en/

## Releases?
https://nodejs.org/en/about/releases/
LTS, Current, Nightly?

## Let's Code
Simple Node Server

## Just HTTP & FS
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

Music & Light Warning - Next Slide

## You are now a Software Engineer that can build Fullstack Web Applications
## Let's Look More Complex Backend
## How could we clean this up?
## Homework
Do: Start prepping THE BANK
Do: Complete Your Professional Links
Do: Make node-backend-simple-json more readable
Do: Make a coinflip game where the randomization happens server side