# Express & CRUD
Slides: https://slides.com/leonnoel/100devs2-express-crud
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Review - CRUD 
Review - Express
Learn - Post & Delete
Learn - Build your APP
Homework - Build your own APP

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1534286728218804224
Like and Retweet the Tweet
!checkin

## Submitting Work
https://docs.google.com/forms/d/e/1FAIpQLSekI0suV5s-5PYTcS6cCLDXAtZRl3SKTlk4SRZmDbv591vGiQ/viewform?usp=send_form

## Homework
(should be done)

Jake Archibald: https://www.youtube.com/watch?v=cCOL7MC4Pl0
Philip Roberts: https://www.youtube.com/watch?v=8aGhZQkoFbQ&feature=youtu.be
Zell Liew: https://zellwk.com/blog/crud-express-mongodb/

## Summer Break
Break, Catch Up, Professional Stuff, 100Hours Project, and Hitlist

## Backend!

## NODE.js BABY (Review)
Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.

Aka: the same shit that lets you run JS in the browser can now be used to run JS on Servers, Desktops, and elsewhere

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

## How could we clean this up? (Review)
There are a lot of if statements here
How could this be cleaner?
Figure it out for homework

## Express (Review)
Fast, unopinionated, minimalist web framework for Node.js

With a myriad of HTTP utility methods and middleware at your disposal, creating a robust API is quick and easy.

## But First (Review)
Blast To The Past

## How Does The Internet Work (Review)
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

## CRUD (Review)
There are 4 primary ways to interact with a database
These are pretty much the only things you have to do on the database for any full scale application

Create (post) - Make something
Read (get) - Get Something
Update (put) - Change something
Delete (delete) - Remove something

## Mongo DB

## EJS
(Embedded Javascript Templates)
```html
  <h1>Current Rappers</h1>
  <ul class="rappers">
  <% for(let i=0; i < info.length; i++) {%>
      <li class="rapper">
          <span><%= info[i].stageName %></span>
          <span><%= info[i].birthName %></span>
          <span class='del'>delete</span>
      </li>
  <% } %>
  </ul>

  <h2>Add A Rapper:</h2>
```

## Rap Names
What are some Read (get) requests?
What are some Create (post) requests?
What are some Delete (delete) requests?
What are some Update (put) requests?

## Let's Build An App with Express (Review)

## Key Steps (Review)
There are a few key steps when making a project

## Setting Up The Project (Review)
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

## Connect To DB
```js
let db,
    dbConnectionStr = 'mongodb+srv://demo:demo@cluster0
    .2wapm.mongodb.net/rap?retryWrites=true&w=majority',
    dbName = 'rap'

MongoClient.connect(dbConnectionStr, { useUnifiedTopology: true })
    .then(client => {
        console.log(`Connected to ${dbName} Database`)
        db = client.db(dbName)
    })
```

## Setup Server
```js
app.set('view engine', 'ejs')
app.use(express.static('public'))
app.use(express.urlencoded({ extended: true }))
app.use(express.json())



app.listen(process.env.PORT || PORT, ()=>{
    console.log(`Server running on port ${PORT}`)
})
```

## API - GET
```js
app.get('/',(request, response)=>{
    db.collection('rappers').find().toArray()
    .then(data => {
        response.render('index.ejs', { info: data })
    })
    .catch(error => console.error(error))
})
```

## API - POST
```js
app.post('/addRapper', (request, response) => {
    db.collection('rappers').insertOne(request.body)
    .then(result => {
        console.log('Rapper Added')
        response.redirect('/')
    })
    .catch(error => console.error(error))
})
```

## Create EJS File
```js
<h1>Current Rappers</h1>
<ul class="rappers">
<% for(let i=0; i < info.length; i++) {%>
    <li class="rapper">
        <span><%= info[i].stageName %></span>
        <span><%= info[i].birthName %></span>
        <span class='del'>delete</span>
    </li>
<% } %>
</ul>

<h2>Add A Rapper:</h2>
```

## Create Public Folder/Files

## API - DELETE
```js
app.delete('/deleteRapper', (request, response) => {
    db.collection('rappers').deleteOne({stageName: request.body.stageNameS})
    .then(result => {
        console.log('Rapper Deleted')
        response.json('Rapper Deleted')
    })
    .catch(error => console.error(error))

})
```

## Push To Heroku (Review)
Put all of our code onto heroku so that it can be hosted
```bash
$heroku login -i 
$heroku create simple-rap-api
$echo "web: node server.js" > Procfile
$git add . 
$git commit -m "changes"
$git push heroku main
```

## Let's Code
Rap Names App

## Homework
Do: Start prepping THE BANK
Do: Complete Your Professional Links
Create: Heroku, Mongo Atlas, and Postman Accounts
Read: https://zellwk.com/blog/crud-express-mongodb
Do: Make Your Own APP and Push To Heroku