# Javascript - More API Review
Slides: https://slides.com/leonnoel/100devs2-more-api-review
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Review - Functions && Loops
Review - Arrays
Review - Objects
Review - Basic APIs
Learn - More API work
Homework - OOP

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1513992949884809219
Like and Retweet the Tweet
!checkin

## You Are Not Alone! (Review)
Whatever issues you are having in class right now someone else is having them too
Ask for help in discord!

## Health First (Review)
Class may start taking a toll since we will be coding more
Take care of yourself

## No Networking Until May (Review)
We are focusing on coding instead of networking until may
May 3 is when networking will start again

## Client Deadline: May 3rd (Review)
Client deadline has also been extend until May 3rd

## Client Alternatives (Review)
If you cannot get a paid client right now
(due to either being unable to find one or unable to take on a paid client)

## Grassroots Volunteer* (Review)
Find a grassroots campaign near you and see if they need a webpresence
Instead of being paid they should be an ENTHUSIASTIC reference
Still go through the proposal/contract process with them

## Free Software / Open Source (Review)
https://www.firsttimersonly.com/
Contains a list of website that aggregate project issues
There should be some that are easy enough to contribute to for the first time

## Codewars !Clan
Don't forget to be doing codewars every day
Use the following clan to join the 100Dev clan 
(past full string as clan name)

Clan: 
#100Devs - leonnoel.com/twitch

## Programming (Review)
## What is a program? (Review)
A program is a set of instructions that you write to tell a computer what to do

## What is a programming? (Review)
Programming is the task of writing those instructions in a language that the computer can understand.

Javascript is readable by humans but it does need to be broken down by the browser so that the computer itself can understand it

## JAVASCRIPT (Review)
JS is a language that we will use to tell the computer what to do
You don't need to get it tonight
Just take in the concepts and ideas and worry about the execution later
We will go deep on this the next couple classes

## Loops (Review)
What are loops?
- Repeat an action some number of times!
- Three main types of loops in Javascript
- For, while, and do while loops
- Each type offers a different way to determine the start and end points of a loop

## Loops - For (Review)
```js
for ([initialExpression]; [conditionExpression]; [incrementExpression]){
  //do stuff 
}
```
Iniitial expression: Where does the loop start?
Condition expression: Where does the loop stop?
Increment expression: How does the loop change?

```js
for (let i = 1; i < 5; i++) {
  console.log(i)
}
```
In the above loop we are creating a variable and setting it to 1
Then as long as that variable is less than 5 we do stuff in the block (log the variable)
After that value is logged increase it by 1
This will cause it to print the number 1, 2, 3, 4

Because the first time we start this loop i is one
Since 1 is less than 5 the value is logged
Then the value is increased by 1 to 2
Now since 2 is less than 5 the value is logged
Then the value is increased by 1 to 3 etc...

## Arrays (Review)
What are arrays?

## Toasters (Review)
Think of arrays as toasters
They have slots that you fill with different data or can be empty
It is a single thing that can hold a lot of other stuff
A single data type that can hold other data and data types inside
Arrays are as big (or small) as you need them to be
An array with 4 items will have a lenth of 4 and an array with 400 items will have a length of 400

## Arrays (Review)
- A data structure to store ordered collections!
- Array elements are numbered starting with zero
  - Each item in the array is a new element and gets an indx
  - What can confuse people is that the first number that is used to identify the first element gets an id of 0 instead of 1
  - Why? Don't worry about it right now just know that this is how it works
  - `[0, 1, 2, 3, 4...]`
- Arrays have many methods to manage the order of elements
- Can be created by a constructor or literal notation

There are a couple of gotchas with arrays
Each item in the array is a new element
What can confuse people is that the number for each element

## Declaring Arrays (Review)
There are a few different ways to declare arrays
Array Constructor:
```js
let newArr = new Array()
```
Don't worry about this way too much, it isn't as common

Literal Notation
```js
let newArr = []
```
This is how you LITERALLLY create an array
You just have to assign a variable to square brackets

Instead of having an empty array we can add values to it when we declare it
They can hold ANY data type that we have used so far
```js
let newArr = ['Zebra', true, 21]
```

REMEMBER
Arrays are populated with elements
Elements can be of any type

🚨 WARNING 🚨
🚨Empty spaces leave an empty element 🚨

## Array Indexing (Review)
See this array and note the index number for each element written below
```js
['nyc', 'la', 'syd', 'ldn']
// 0,    1,     2,     3
``` 

Elements can be accessed by their index numbers
```js
newArr = ['Zebra',,true,21]

console.log( newArr[0] )  //Zebra
console.log( newArr[1] )  //undefined (see empty space in array)
console.log( newArr[2] )  //true
console.log( newArr[3] )  //21
```
Notice that the first element is at the 0th index and so on

Elements can be updated by using the index at that position
```js
newArr = ['Zebra',,true,21]

newArr[1] = 'Bob'

console.log( newArr ) //=> ['Zebra','Bob',true,21]
```

Like any other variable you can overwrite whole arrays by assigning an array to a different array
```js
let cars = ['Honda', 'Toyota', 'Ford', 'Tesla']
let nums = [1,2,3]
cars = nums
console.log( cars ) //=> [1,2,3]
```

## Array Length (Review)
How do you determine how many elements are in your array?
Arrays come with some goodies and functions built in
One of them is the length property
```js
console.log( newArr.length ) //4
```
## Array Iteration (Review)
We can go through an array and pull values out by using a for loop
```js
let bestColors = ['green','blue','yellow','black']
// Iterates through an array passing in the value and index of each element 
for(let i = 0; i < bestColors.length;i++){
  console.log( bestColors[i] )
}
```
Above we create an array
Then we do a for loop that runs as many times as there are elements in the array
Then for each iteration (starting at 0) it logs the value at that index

Since this is so common we can do this much more directly instead of having to use the iterator to match an index
```js
let bestColors = ['green','blue','yellow','black']
// Iterates through an array passing in the value and index of each element 
bestColors.forEach((element, index, array)=> console.log(element))
//=>'green'
//=>'blue'
//=>'yellow'
//=>'black'
```
`forEach` is a function that can be run on arrays
It will do whatever function we pass in as an argument for every element in the array
This function has access to several variables 
One of which is the current element in the loop

## Objects (Review)
What are objects?

- Objects are a collection of variables and functions!
- Objects represent the attributes and behavior of something used in a program
- Object variables are called properties and object functions are called methods
- Objects store "keyed" collections

## Think of a physical object (Review)
What are it's attributes and behaviors?

## How about a stopwatch (Review)
What are its attributes and behaviors? 

Attributes:
- color
- brand
- model
- minutes value
- seconds value
- milliseconds value

Behaviors
- Can start counting time
- Can count a lap
- reset time
- change modes
- beep

## Stopwatch Object (Review)
Properties (attributes):
Might contain a variable to represent hours, another to represent minutes, and another to represent seconds. 

Methods (behaviors):
Might also contain functions that manipulate those values, such as "start ()" and "stop ()".

## Stopwatch Object (Review)
```js
// Create an object with literal notation
let stopwatch = {}

// Add currentTime property and give it a value of 12
stopwatch.currentTime = 12

// Add tellTime function
stopwatch.tellTime = function(time){
  console.log(`The current time is ${time}.`)
}

// Call tellTime function on stopwatch object and pass in the current time of the stopwatch
stopwatch.tellTime(stopwatch.currentTime)
```

## Objects (Review)
What if we want to make
a lot of objects?

Like a car what if we wanted to make a lot of cars?
We would need  a car factory

## Car Factory? (Review)
Constructors then Classes
These are like factories that can create a bunch of objects

First we will learn constructors, then classes

A constructor is something that takes in values for properties
Then these values are assigned to properties in the object being created

## Car Factory (Review)
Constructor
```js
// Constructors are functions
// (Best practice is to capitalize contructor functions)
function MakeCar(carMake,carModel,carColor,numOfDoors){
  // Assign arguments to the object being created's properties
  this.make = carMake
  this.model = carModel
  this.color = carColor
  this.doors = numOfDoors
  this.honk = function(){
    alert('BEEP BEEP FUCKER')
  }
  this.lock = function(){
    alert(`Locked ${this.doors} doors!`)
  }
}

// all the constructor function while creating an object with new keyword
// Also pass in values that are used in construction
let hondaCivic = new MakeCar('Honda','Civic','Silver', 4)
let teslaRoadster = new MakeCar('Tesla','Roadster', 'Red', 2)

// Now all the properties and methods from constructor are available to hondaCivic and teslaRoadster
console.log(`HONDA-  
  Make: ${hondaCivic.make} 
  Model: ${hondaCivic.model} 
  Color: ${hondaCivic.color}
  Doors: ${hondaCivic.doors}`)
hondaCivic.honk()
hondaCivic.lock()

console.log(`Tesla-  
  Make: ${teslaRoadster.make} 
  Model: ${teslaRoadster.model} 
  Color: ${teslaRoadster.color}
  Doors: ${teslaRoadster.doors}`)
teslaRoadster.honk()
teslaRoadster.lock()
```

What if we forgot something?
We forgot enable bluetooth!
We can use a prototype to provide fallback values and properties
```js
let teslaRoadster = new MakeCar('Tesla','Roadster', 'Red', 2)

console.log( teslaRoadster.bluetooth )  //undefined

MakeCar.prototype.bluetooth = true

// The prototype will change ALL objects that use that contructor
console.log(teslaRoadster.bluetooth) //true 
console.log(hondaCivic.bluetooth) //true
```
A prototype is another object that is used as a fallback source of properties


Why does `.toString()` work?!?
```js
let teslaRoadster = new MakeCar('Tesla','Roadster', 'Red', 2)

console.log( teslaRoadster.doors.toString() )  // "2" not 2
```

Because of the prototype inheritance chain our object will continue to look up to see if a parent has that method or property
`.toString()` is a part of the object prototype and so all objects have access to this method
A prototype is another object that is used as a fallback source of properties

## Car Factory (Review)
Look Ma! New syntax!
This is just a new way to make a constructor
Nothing changes under the hood
```js
class MakeCar{
  constructor(carMake,carModel,carColor,numOfDoors){
    this.make = carMake
    this.model = carModel
    this.color = carColor
    this.doors = numOfDoors
  }
  honk(){
    alert('BEEP BEEP FUCKER')
  }
  lock(){
    alert(`Locked ${this.doors} doors!`)
  }
}

let hondaCivic = new MakeCar('Honda','Civic','Silver', 4)

let teslaRoadster = new MakeCar('Tesla','Roadster', 'Red', 2)
```
Classes are like templates for objects!

## Let's Code
Objects - Netflix TV Shows
See 'class27-materials/objects-netflix-tv-shows'
Follow the instructions and complete in 3 minutes:
```js
// Create a Netflix TV Show class with a constructor 
// that makes Netflix TV Shows with 4 properties and 3 methods
```

Solution:
```js
// Create a Netflix TV Show class with a constructor 
// that makes Netflix TV Shows with 4 properties and 3 methods
class NetflixTvShow{
  constructor(title, description, category, rating) {
    this.title = title
    this.description = description
    this.category = category
    this.rating = rating
  }

  play(){
    console.log(`Now playing: ${this.title}`)
  }

  recommend(){
    console.log(`Watch ${this.title} about ${this.description}!`)
  }

  addToList(){
    console.log(`${this.title} added to your list`)
  }
}
```
To use this class in the browser
In the browser console do:
```js
// Create object
let bojackHorseman = new NetflixTvShow('Bojack Horseman', 'A horse walks into a bar and the bartender asks, "Why the long face?"', 'Comedy', 99)

// View object and properties
bojackHorseman
bojackHorseman.title
bojackHorseman.description
bojackHorseman.category
bojackHorseman.rating

// Access methods
bojackHorseman.play()
bojackHorseman.recommend()
bojackHorseman.addToList()
```

## APIs (Review)
What are APIs?

## APIs (Review)
A simple interface for some complex action!
Think of a restaurant menu! Remember those...
Lets one thing communicate with another thing without having to know how things are implemented.

Think of your webcam 
If you want to turn it off you could do that by unplugging it
Instead you are usually provided an interface to turn off the camera (a button)
This is a simple interface that handles the complex action of turning off the camera

APIs are similar
You can use them to make a simple request and cause a complex action
It might return something to you or it might trigger something
We don't really care about how it happens we just want the action to happen

Restaurants give you a simple interface to get food
They give you a menu 
This lets you say something simple to the server
Then back in the kitchen it will be prepared for you and brought out complete
You don't care or know what is going back in the kitchen you just want to get something back after a simple request

Usually when you get something back from an API it will come in the form oof json
```
        |---Request--->|
YourApp |              | API 
        |<-----JSON----|
```

Fetch Fido, Fetch!
Here is an example of how to make a fetch request to a url
When you use an api you  usually make what is called a fetch request
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

## APIs (Review)
Stop trying to make Fetch happen!
```js
const url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      console.log(data)
    })
    .catch(err => {
        console.log(`error ${err}`)
    });
```
Some APIs need Query Parameters to return the correct data

## Let's Code
NASA PHOTOS

See 'class27-materials/api-template'
When you click the button it will grab the value in the input
Then it will plug that value into the url
Then it will make a fetch request with that url
```js
//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  const url = 'https://pokeapi.co/api/v2/pokemon/'+choice

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

Change this so that it will work with NASA's Astronomy Picture of the Day API
If you signup for an api key you should get a link that you can use to query NASA's api

```js
//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  // NASA APOD API URL
  // https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE
  const url = `https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE${choice}`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

If we see the object there is an explanation and image that we can show on the page
Lets use these and add them to our page when we get that object
```js
//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  // NASA APOD API URL
  // https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE
  const url = `https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE${choice}`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        // Add image
        document.querySelector('img').src = data.hdurl
        // Add explanation text
        document.querySelector('h3').innerText = data.explanation
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

Now lets make it so you can enter a date and get a photo back
If we want to do that we need to collect the input
We can get a date picker by changing the input in our html
```html
<input type="date" name="" value="">
```

Now if we console.log this we can see how our date is stored
```js
//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  // NASA APOD API URL
  // https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE
  const url = `https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE${choice}`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        document.querySelector('img').src = data.hdurl
        document.querySelector('h3').innerText = data.explanation
        console.log(document.querySelector('input').value) // => 2022-04-12
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

This will log
```js
//=> 2022-04-05
```

The NASA API want the string just like this as a url parameter to 
Except we need to add this as another query parameter
In order to do this we use the ampersand
```js
//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  // NASA APOD API URL
  // https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE
  const url = `https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE&date=${choice}`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        document.querySelector('img').src = data.hdurl
        document.querySelector('h3').innerText = data.explanation
        console.log(document.querySelector('input').value)
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

There is one issue
If we search 2/3/2021 we get an error
This is because this is actually a video not a photo
Sometimes the photo of the day is a video
We need to figure out a way to solve this
We can use a conditional to check the media type before we add the media to our dom
In that case we will need something in our html that will accept video
We will use an iframe
```html
<h2>NASA APOD</h2>
<img src="img/pokemon.jpeg" alt="">
<iframe src="" frameborder="0"></iframe>
<h3>Explanation</h3>
```

Now we can use a conditional to check the media type of our data
Then we can append the photo/video to the correct element
Remember to clear the src for the non-used element
```js
//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  // NASA APOD API URL
  // https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE
  const url = `https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE&date=${choice}`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        if(data.media_type === 'image'){
          document.querySelector('img').src = data.hdurl  
          document.querySelector('iframe').src = ''
        } else {
          document.querySelector('iframe').src = data.url
          document.querySelector('img').src = ''
        }
        document.querySelector('img').src = data.hdurl
        document.querySelector('h3').innerText = data.explanation
        console.log(document.querySelector('input').value)
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

## Local Storage
Local storage is another api that lets us do something complex
This is a simple method we can use to store stuff in the users browser
This will make data persist across browser sessions

What does this mean?
This means we can build an app, the user can come in and do things
Then they can leave and come back later and they will still be able to access that data

This can let us start to build apps that are a little bit more real
Currently our apps reset whenever we reload
With local storage we can make that data persistent on refresh

One example is wordle (NYTimes puzzle game)
If you solve a puzzle, close, and come back then your session will still be saved
Any guesses you made will still be there

This is because of local storage
You can see this by using inspect and going to the application tab
Then under storage click local storage
This contains everything that NYTimes is storing on your PC through wordle
This is an object that they can pull from whenever needed

If you go to the console you can be reckless and clear your local storage by using
```js
localStorage.clear()
```
Now we lost our session and some of the data in the application tab is gone

There are other actions we can take on local storage
(not all inclusive)
You can test the methods below in the browser

## Put Item Into Local Storage
```js
localStorage.setItem('bestFriend', 'Bob')
```

## Get Item Out Of Local Storage
```js
localStorage.getItem('bestFriend') //=> 'Bob'
```
## Remove Item In Local Storage
```js
localStorage.removeItem('bestFriend', 'Bob')
```

## Remove All In Local Storage
```js
localStorage.clear()
```

## Let's Code
Local botScore Button
See 'class27-materials/local-storage-botScore-button'
```js
//Create a button that adds 1 to a botScore stored in localStorage 
```

Solution:
```js
//Create a button that adds 1 to a botScore stored in localStorage 
document.querySelector('button').addEventListener('click', addToScore);

// When the button is clicked start this function
function addToScore(){
  // Check if there is a value for score in loacl storage
  if(localStorage.getItem('score')){
    // If so then get the current value, add one, and update
    let localScore = localStorage.getItem('score');
    localStorage.setItem('score', +localScore + 1)
    console.log(localStorage.getItem('score'))
  } else{
    // If no value in local storage initialize to 1
    localStorage.setItem('score', 1)
  }
}
```

This will only start working after we click
We can refactor this to initialize the score on page load
```js
//Create a button that adds 1 to a botScore stored in localStorage 
document.querySelector('button').addEventListener('click', addToScore);

if(!localStorage.getItem('score')){
  localStorage.setItem('score', 0)
}

function addToScore(){
    let localScore = localStorage.getItem('score');
    localStorage.setItem('score', +localScore + 1)
    console.log(localStorage.getItem('score'))
}
```

## Let's Code
A Card Game
Create a copy of the api template to do this activity
We are going to build a card game called war

The way this works is you are playing against someone else and you both draw cards
We want to compare those cards and the one with the higher card wins
That person takes both cards
If there is a tie then each will put 3 cards down, then, they flip the fourth and the winner takes all

Instead of having to code all of our card logic we can use a deck of cards api to simplify some of the work
See: https://www.deckofcardsapi.com/

First lets see what we can get from them
Try testing their api in postman
```
GET: https://www.deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1
Returns:
  {
    "success": true,
    "deck_id": "6eiuqtek8to1",
    "remaining": 52,
    "shuffled": true
  }
```

Now we can use this deck id to get a specific deck with a draw action
```
GET: https://www.deckofcardsapi.com/api/deck/6eiuqtek8to1/draw/?count=2
Returns:
  {
    "success": true,
    "deck_id": "6eiuqtek8to1",
    "cards": [
        {
            "code": "JH",
            "image": "https://deckofcardsapi.com/static/img/JH.png",
            "images": {
                "svg": "https://deckofcardsapi.com/static/img/JH.svg",
                "png": "https://deckofcardsapi.com/static/img/JH.png"
            },
            "value": "JACK",
            "suit": "HEARTS"
        },
        {
            "code": "2D",
            "image": "https://deckofcardsapi.com/static/img/2D.png",
            "images": {
                "svg": "https://deckofcardsapi.com/static/img/2D.svg",
                "png": "https://deckofcardsapi.com/static/img/2D.png"
            },
            "value": "2",
            "suit": "DIAMONDS"
        }
    ],
    "remaining": 50
  }
```

We can see that this returned a draw from that deck 

Now that we have tested the api we can get started working on the game

First we will create the game area in html
```js
<body>
  <h1>Card Game!</h1>

  <button>Deal Two Cards</button>
  
  <h2>Player 1</h2>
  <img id="player1" src="" alt="playing card">
  <h2>Player 2</h2>
  <img id="player2" src="" alt="playing card">
  <script type="text/javascript" src="js/main.js"></script>
</body>
```

Now the first thing we need is to get a deck id
The app only works if we get a deck id
Then we can use it draw cards

To get that deck id we had to use the first api request
We will do a fetch outside of the click event because the click will draw cards
We want the deck to initialize when the page loads (for now at least)
```js
let deckId = ''
fetch('https://www.deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1')
  .then(res=> res.json())
  .then(data => {
    console.log(data)
  })
  .catch(err => {
    console.log(`error ${err}`)
  })
```
This will get a new deck every time the page loads for homework save the deck id to local storage

Now we want to save the deck id to the variable we saved
```js
...
  .then(data => {
    console.log(data)
    deckId = data.deck_id
  })
  ...
```

Now lets try to add the draw two cards function just like in postman
We can use the `deck_Id` to plug in the current deck
```js
document.querySelector('button').addEventListener('click', drawTwo)

function drawTwo(){
  const url = `https://www.deckofcardsapi.com/api/deck/${deckId}/draw/?count=2`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

Now lets try getting these cards to show up in the dom
```js
function drawTwo(){
  const url = `https://www.deckofcardsapi.com/api/deck/${deckId}/draw/?count=2`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        document.querySelector('#player1').src = data.cards[0].image
        document.querySelector('#player2').src = data.cards[1].image
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

Now we can draw cards but we aren't doing any comparison to see who won
(Add a result h3 to index.html)
We only care about the number so lets get the value of each card
We want to assignt this value to variables for each player
```js
function drawTwo(){
  const url = `https://www.deckofcardsapi.com/api/deck/${deckId}/draw/?count=2`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        document.querySelector('#player1').src = data.cards[0].image
        document.querySelector('#player2').src = data.cards[1].image
        let player1Val = +data.cards[0].value
        let player2Val = +data.cards[1].value
        if(player1Val > player2Val){
          document.querySelector('h3').innerText = 'Player 1 wins!'
        } else if(player1Val < player2Val){
          document.querySelector('h3').innerText = 'Player 2 wins!'
        } else {
          document.querySelector('h3').innerHTML = 'WAR!'
        }

      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

One thing is that we will need to convert the face cards to numbers
We can create a helper function for this
```js
function convertToNum(val){
  if(val === 'ACE'){
    return 14
  } else if(val === 'KING'){
    return 13
  } else if (val === 'QUEEN') {
    return 12
  } else if (val === 'JACK') { 
    return 11
  } else {
    // Val must still be converted to num
    return +val
  }
}
```

Then we can call this function when getting the values
```js
function drawTwo(){
  const url = `https://www.deckofcardsapi.com/api/deck/${deckId}/draw/?count=2`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        document.querySelector('#player1').src = data.cards[0].image
        document.querySelector('#player2').src = data.cards[1].image
        // Convert cards to numbers
        let player1Val = convertToNum(data.cards[0].value)
        let player2Val = convertToNum(data.cards[1].value)
        if(player1Val > player2Val){
          document.querySelector('h3').innerText = 'Player 1 wins!'
        } else if(player1Val < player2Val){
          document.querySelector('h3').innerText = 'Player 2 wins!'
        } else {
          document.querySelector('h3').innerHTML = 'WAR!'
        }

      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}
```

## Let's Code
A Book Tracker
