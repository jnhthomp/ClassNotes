# Javascript - API Fun
Class 25 was a resume review where Leon looked over resume's from other students
No notes were distributed/taken
Slides: https://slides.com/leonnoel/100devs-javascript-api-fun
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Review - Objects
Learn - Basic APIs
Homework - Build APIs

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1512181260801949696
Like and Retweet the Tweet
!checkin

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

## !youtube (Review)
Youtube lectures were a little behind but they should be caught up now

## !Merch
New merch up with r/place designs

## THANK YOU

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

## Let's Code (Review)
Objects - Lost Galaxy
See 'class26-materials/objects-lost-galaxy'
Instead of a dog object do a pizza object
```js
//Create a pizza object that has four properties and three methods
```

Solution:
```js
//Create a pizza object that has four properties and three methods
const pizza = {
  toppings: ['pepperoni', 'pineapple'],
  size: 'large',
  crust: 'stuffed',
  sauce: 'red',

  addTopping(newTopping) {
    this.toppings.push(newTopping)
  },

  removeTopping(toppingIndex) {
    this.toppings = this.toppings.filter((topping, i) => i !== toppingIndex)
  },

  submitOrder(){
    console.log(`Making ${this.size} ${this.crust} crust pizza with ${this.sauce} sauce and ${this.toppings.join(',')}`);
  }
  
};
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

## Let's Code
Objects - Tony Hawk Pro Skater
See: 'class26-materials/objects-constructor-fun'

Follow the instructions to make a constructor for the pizza object we designed earlier
```js
//Create a constructor with 4 properties and 3 methods
```

Solution:
```js
//Create a constructor with 4 properties and 3 methods
function Pizza (size, crust, sauce){
  this.toppings = []
  this.size = size
  this.crust = crust
  this.sauce = sauce

  this.addTopping = function(newTopping){

    this.toppings.push(newTopping);
  }

  this.removeTopping = function(toppingIndex){
    this.toppings = this.toppings.filter((topping,i) => i !== toppingIndex)
  }

  this.submitOrder = function(){
    console.log(`Making ${this.size} ${this.crust} crust pizza with ${this.sauce} sauce and ${this.toppings.join(', ')}`);
  }
}

// Make a pizza
let dominos = new Pizza('large', 'traditional', 'bbq')
console.log(dominos)

// Add toppings
dominos.addTopping('pepperoni')
dominos.addTopping('pineapple')
dominos.addTopping('mushroom')
console.log(dominos.toppings)

// Remove a topping
dominos.removeTopping(dominos.toppings.indexOf('pineapple'))
console.log(dominos.toppings)

// Submit order
dominos.submitOrder()
```

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

## Let's Code
DOG PHOTOS!
See 'class26-materials/objects-dog-photos'
Follow the instructions (use the previous slide as a reference)
```js
//Get a dog photo from the dog.ceo api and place the photo in the DOM
```

Solution:
```js
//Get a dog photo from the dog.ceo api and place the photo in the DOM
fetch("https://dog.ceo/api/breeds/image/random")
  .then(res => res.json()) // parse response as JSON
  .then(data => {
    console.log(data);
    document.querySelector('img').src = data.message
  })
  .catch(err => {
    console.log(`error ${err}`)
  });
```

## APIs
Stop trying to make Fetch happen!
```
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
EVERYBODY! SHOTS! SHOTS! SHOTS!
See: 'class26-materials/objects-shots'
```js
// The user will enter a cocktail. 
// Get a cocktail name, photo, and instructions 
// and place them in the DOM
```

Solution:
```js
//The user will enter a cocktail. Get a cocktail name, photo, and instructions and place them in the DOM


let url = `https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${'margarita'}`


function fetchDrinks(){
  fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      // Save a random drink data
      let drink = data.drinks[Math.ceil(Math.random() * data.drinks.length - 1)]
      console.log(drink)
      // Add drink details to dom
      document.querySelector('h2').innerText = drink.strDrink
      document.querySelector('h3').innerText = drink.strInstructions
    })
    .catch(err => {
      console.log(`error ${err}`)
    });
}

// Event listener on button to retrieve input, update url and perform fetch request with new url
document.querySelector('button').addEventListener('click', (e) => {
  url = `https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${document.querySelector('input').value}`
  fetchDrinks()
})

fetchDrinks()
//
// function to perform or async fetch action
function fetchDrinks(search = 'margarita'){ // base url
  const url = `https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${search}`
  fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      // Save a random drink from returned drinks array
      let drink = data.drinks[Math.ceil(Math.random() * data.drinks.length - 1)]
      // console.log(drink)
      // Add drink data to DOM
      document.querySelector('h2').innerText = drink.strDrink
      document.querySelector('img').src = drink.strDrinkThumb
      document.querySelector('h3').innerText = drink.strInstructions
    })
    .catch(err => {
      console.log(`error ${err}`)
    });
}

// On button click make new fetch function with input as search param/argument
document.querySelector('button').addEventListener('click', (e) => {
  fetchDrinks(document.querySelector('input').value)
})

// Fetch default drink method on page load
fetchDrinks()
```

## Let's Code
NASA PHOTOS

## Homework
Do: Make the cocktailDB api work with spaces between the names!
Do: Find three APIs and build three simple apps using those APIs (Not all of these work, but it is a start: https://github.com/public-apis/public-apis)
Do: Codewars Daily!
Do: Anki Daily!
DO: Get NASA picture of the day api working

Want to push?
Do: Make a rotating list of drinks (an automatic carousel) from the cocktailDB
Do: Make the NASA API handle all the data types including video
Do: Add an API to your portfolio website
Do: A 7kyu Codewars