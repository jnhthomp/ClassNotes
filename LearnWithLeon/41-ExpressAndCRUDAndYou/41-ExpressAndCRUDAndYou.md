# Express & CRUD & You
Slides: https://slides.com/leonnoel/100devs2-express-crud-cohort-2
MATERIALS: https://github.com/100devs/rap-names-express
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
https://twitter.com/leonnoel/status/1535011532551049216
Like and Retweet the Tweet
!checkin

## Submitting Work
API Homework
https://docs.google.com/forms/d/e/1FAIpQLSekI0suV5s-5PYTcS6cCLDXAtZRl3SKTlk4SRZmDbv591vGiQ/viewform?usp=send_form

## Codewars
Please set your repos to private*

*If you want, who am I to tell you how to live your life...
## Homework (Review)
(should be done)

Jake Archibald: https://www.youtube.com/watch?v=cCOL7MC4Pl0
Philip Roberts: https://www.youtube.com/watch?v=8aGhZQkoFbQ&feature=youtu.be
Zell Liew: https://zellwk.com/blog/crud-express-mongodb/
## Summer Break (Review)
Break, Catch Up, Professional Stuff, 100Hours Project, and Hitlist

## Backend! (Review)

## NODE.js BABY (Review)
Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.

Aka: the same shit that lets you run JS in the browser can now be used to run JS on Servers, Desktops, and elsewhere

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

## Mongo DB (Review)
Mongo DB is a great database that is easy for us to learn and use because everything in it is an object
There are are two keywords to keep in mind when using MongoDB

Document: An object containing data, think of this like a row on a SQL table
Collection: A group of document objects, think of this like a SQL table
## EJS (Review)
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

These can be used to create small templates so that we can more easily dynamically insert data into an html structure after it is fetched from the db

Does this violate seperation of concerns?
No. 
This is not javascript. The end result of this file running is javascript.
It allows us to generate html using javascript but will end up as html

## Rap Names (Review)
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

## Connect To DB (Review)
```js
let db, // Initialize db
    dbConnectionStr = 'mongodb+srv://demo:demo@cluster0.2wapm.mongodb.net/rap?retryWrites=true&w=majority', // Database connection (provided by MongoDB)
    dbName = 'rap' // Name of collection so we don't have ot hardcode it later

// Connect to database
MongoClient.connect(dbConnectionStr, { useUnifiedTopology: true }) // unified topology avoids a warning
    .then(client => {
        // Once connected to database log connection
        console.log(`Connected to ${dbName} Database`)
        // save the connected client object and database we will use as a var 
        // (if using multiple databases maybe able to save multiple connections under different vars)
        db = client.db(dbName)
    })
```

This is how we start a connection with our MongoDB database

## Use .env
- Create .env file
  ```env
  # /.env
  DB_STRING=mongodb+srv://demo:demo@cluster0.2wapm.mongodb.net/rap?retryWrites=true&w=majority
  ```
- Add .env to .gitignore
  ```gitignore
  # /.gitignore
  .env
  node_modules
  ```
- In terminal add var to heroku app (can be done online or in terminal)
  ```bash
  heroku config:set DB_STRING=mongodb+srv://demo:demo@cluster0.2wapm.mongodb.net/rap?retryWrites=true&w=majority
  ```
## Connect To DB (with env variables)
```js
let db,
    dbConnectionStr = process.env.DB_STRING,
    dbName = 'rap'

MongoClient.connect(dbConnectionStr, { useUnifiedTopology: true })
    .then(client => {
        console.log(`Connected to ${dbName} Database`)
        db = client.db(dbName)
    })
```

This is how we start a connection with our MongoDB database
## Setup Server (Review)
```js
app.set('view engine', 'ejs')
app.use(express.static('public')) /* Magic!*/
app.use(express.urlencoded({ extended: true })) // https://stackoverflow.com/a/51844327/9059589 - Allows incoming data to be strings, arrays, or objects with nested objects
app.use(express.json()) // Parses incoming json requests (such as in a head) and adds them to req.body to be accessed

app.listen(process.env.PORT || PORT, ()=>{
    console.log(`Server running on port ${PORT}`)
})
```

After connecting to the db we want to let our app know that we will be rendering ejs files
The second line will alow anything in your public folder to have a path automatically without having to manually create those paths

After the setup we start listening on a port (either a defined one or environment provided one)
## API - GET (Review)
```js
app.get('/',(request, response)=>{
    db.collection('rappers').find().toArray()
    .then(data => {
        response.render('index.ejs', { info: data })
    })
    .catch(error => console.error(error))
})
```

Now we are setting a route for when someone navigates to the root of our application
aka: www.website.com or www.website.com/

We start by making a request to the database and finding all documents in the named collection
Then that list of documents (objects) is converted into an array of objects
This returns a promise so we can chain `.then` to process the data from that promise

This is where it can get tricky
We are going to render `index.ejs` and pass in an object containing data for variables used within `index.ejs`
So we will pass in the data array under the key `info`
This allows us to access this array within `index.js` by using the `info` variable
(Will cover more shortly)

Render will make this ejs file run with the passed in data which will generate a static html page that is sent as the response


## API - POST (Review)
```js
app.post('/addRapper', (request, response) => {
    db.collection('rappers').insertOne(request.body) // async insert request containing the object we want to submit
    .then(result => { // When submitted successfully
        console.log('Rapper Added') // log success
        response.redirect('/') // Redirect to homepage (triggers 'refresh' which will include the newly added item)
    })
    .catch(error => console.error(error))
})
```

This will allow us to add new documents to a collection
Our server will listen for a request to `/addRapper` which will be triggered by a fetch request in our js
When we send the post request we also include data to send as well such as information about the requester
This also includes the infomration that they want to submit

Remember the lines from our setup will include that information to submit as a part of `request.body`
See these lines from above:
```js
app.use(express.urlencoded({ extended: true })) // https://stackoverflow.com/a/51844327/9059589 - Allows incoming data to be strings, arrays, or objects with nested objects
app.use(express.json()) // Parses incoming json requests (such as in a head) and adds them to req.body to be accessed
```

After the item is submitted to the db the user is redirected to the homepage
When this renders it will ask the server for all the documents in the collection which will now include any that were just added

But where does the data come from?
In the html (ejs in this case) we can have a form that looks like this:
```html
<form action="/addRapper" method="POST">
  <input type="text" placeholder="Stage Name" name="stageName" />
  <input type="text" placeholder="Birth Name" name="birthName" />
  <input type="submit"/>
</form>
```

Notice that the action is the same as the route
They have to be the same for this to work

Notice that the two inputs also have different names
These names are how we can get data from the request
So when we make the request to the server 
it will be able to be accessed by `request.body.stageName` and `request.body.birthName` by the server

You can see the other information that is sent along with this form by logging the request object itself in the server

## Create EJS File (Review)
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

Here we start a simple for loop to loop through the `info` variable (remember we passed an array of objects into `info`)
For each one we will create a new `<li>` each containing information from the object at the current index in `info`

This will output all the rappers that were retrieved from the database each as their own `<li>`
This will all evaluate out to an html file listing the rappers and be rendered to an html page

## Create Public Folder/Files (Review)
Simply creating public folder stucture will allow you to link to any files within that folder in index.html or other files
This is enabled by the magic line mentioned earlier
```js
app.use(express.static('public')) /* Magic!*/
```

## API - DELETE (Review)
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

The last action is delete
This work sby using the `deleteOne()` method which accepts an object with a key/value assignment
This will fetch a list of all of the documents that have properties matching the passed object
In this case it will get a list of all the rappers with a given stage name
Then it will delete the first document that has a matching key/property value

## Push To Heroku (Review)
Put all of our code onto heroku so that it can be hosted
```bash
$heroku login -i #No -i if using two factor auth
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