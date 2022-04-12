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

Clan: #100Devs - leonnoel.com/twitch

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
NASA PHOTOS

## Local Storage
## Local Storage
Allows you to store data across browser sessions

## Put Item Into Local Storage
```js
localStorage.setItem('bestFriend', 'Bob')
```

## Get Item Out Of Local Storage
```js
localStorage.getItem('bestFriend', 'Bob')
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

## Let's Code
A Card Game

## Let's Code
A Book Tracker
