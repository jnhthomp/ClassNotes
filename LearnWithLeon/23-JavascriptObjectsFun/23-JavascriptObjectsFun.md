# Javascript - Objects Fun
Slides: https://slides.com/leonnoel/100devs2-javascript-objects-fun-time
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Review - Functions && Loops
Review - Arrays
Learn - Objects
Learn - Basic APIs
Homework - Object City Yall
## Questions
About last class or life
## Checking In

Like and Retweet the Tweet
!checkin
## You Are Not Alone!
Whatever issues you are having in class right now someone else is having them too
Ask for help in discord!

## Trough Of Sorrow (Review)
Why does not everyone do it?
It takes a really long time
This is called the trough of sorrow (see slide pic): https://slides.com/leonnoel/100devs2-html-the-basics#/5

Leon says it can feel good to buy udemy courses but a lot of people don't finish them
I've found them very helpful myself

For a lot of people the novelty wears off and it takes a while through pursuing other means of education
Don't get too focused on getting a FAANG job - instead focus on getting A job
(Don't try to go straight to playing for the NFL - play some rec league first)

To make it through the trough of sorrow you will take about ~20 weeks of not feeling great and learning
Then some wiggles of soft hope
This is when you start getting responses for jobs and maybe even a few interviews
It is a good idea to apply to 60 companies
This doesn't mean just clicking apply this means networking with real people and talking with them
A few of them will go absolutely terrible and be absolutely bombed (10?)
Most will be alright (40?)
Then maybe 10 of them will go great 
Out of those ten maybe you will get 2 offers
Don't get discouraged and don't set your hopes too high

Right now it is about getting the tools we need to get to the point where we can apply

## Health First
Class may start taking a toll since we will be coding more
Take care of yourself
## No Networking Until May
We are focusing on coding instead of networking until may
May 3 is when networking will start again

## Client Deadline: May 3rd
Client deadline has also been extend until May 3rd

## Client Alternatives
If you cannot get a paid client right now
(due to either being unable to find one or unable to take on a paid client)

## Grassroots Volunteer*
Find a grassroots campaign near you and see if they need a webpresence
Instead of being paid they should be an ENTHUSIASTIC reference
Still go through the proposal/contract process with them

## Free Software / Open Source
https://www.firsttimersonly.com/
Contains a list of website that aggregate project issues
There should be some that are easy enough to contribute to for the first time

## Live Portfolio & Resume Review
Monday
6:30pm EST

## !youtube
Youtube lectures were a little behind but they should be caught up now

## !newsletter
There was a form for a raffle in today's newsletter

## Welcome, helloitsrufio
https://www.twitch.tv/helloitsrufio
Tomorrow @ 6:30pm ET! 
Doing codewars if you want to hangout and learn

## Microsoft
Sponsored Stream
Thursday Mar. 31st


Thursday 6:30pm ET

## https://aka.ms/learnwithleon 
Do intro to github before class thursday
Give microsoft email to enter a raffle for a laptop

## Friday With Friends
Friday 6pm ET on Discord!
Chat with mods and previous students

## /r/place
Saturday All Day
Try to get a place in the r/place game
There will be a channel on discord for people to organize and lockdown a section

## Office Hours
Sunday - 1pm ET

## Mentor Monday
Portfolio / Resume Review Part 1 6:00pm
There will be a place for people who want to be mentors/support the community
They will learn how to give portfolio/resume reviews
Then they will give these reviews to others

## BEST WEEK EVER END?
Gotta be a banger
Something big is going down?
Tuesday 6:30pm ET

## !Merch
If you want to buy merch
https://streamlabs.com/learnwithleon/merch

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

## Variables (Review)
What are variables?
Variables are something we can use to tell our program to remember values for us to use later on
???
The entity we use to store the value is called a variable

One of the things a computer needs is memory to store stuff
We use this memory to store values as variables so we can access them when we need them

There are a couple of different steps for using a variable
1. Declaration: `let age`
  `let` is a keyword that tells the computer to prepare a new space in memory
  Then the word after is the name of that space in memory
  So we just told the computer to create a new space in memory called age but we didn't add any thing to that space
2. Assignment: `age = 25`
  After the space has been assigned in memory we can put a value in that space
  Here we are putting 25 in that space in memory that we named 'age'

We could do this seperately like above 
```js
let age;
age = 25;
```
OR
Both at the same time:
```js
let age = 25;
```

Lets practice
We will create a variable called location
```js
let location;
```
Then the next step is to assign a location to that variable
```js
location = 'Boston';
```
or in one line
```js
let location = 'Boston';d
```

The cool thing is we can then use these variables in place of data
We could say:
```js
console.log(`Bob is ${age}`); //=> 'Bob is 25'
console.log(`Bob is not in ${location}`); //=> 'Bob is not in Boston
```

## Conditional Syntax (Review)
We care about these comparisons so we can make conditional statements
We can make decisions based on these comparisions
It boils down to if what is inside of the parenthesis we do what is inside of curly braces
```js
if(condition is true) {
  //Do cool stuff
}
```

There are three steps you can have with conditional syntax
When you hit something true you stop and do not move on
However if a condition is not true then you move on to the next if statement in the chain if there is one
`else` is used without a condition and runs if everything else above it was false
```js
if(condition is true) {
  //Do this cool stuff AND STOP
}else if(condition is true){ // if above was false
  //Do this other cool stuff
}else{ // if both above were false
  //Default cool stuff
}
```

Let's look at this in action
```js
// Declare and assign a variable
const pizza = "Dominos" // const: variable value will NEVER change & cannot change

// Check if the pizza value is papa johns
if (pizza === "Papa Johns") {
  console.log("Scram!")
  // It is not 'Papa Johns' so we move on
} else if(pizza === "Dominos") {
  // It does equal 'Dominoes' in value AND type so message is printed
  console.log("All aboard the train to flavor town")
} else {
  // If pizza was something other than 'Papa Johns' or 'Dominoes' this would print
  console.log("What are you even doing with your life?")
}
```

## Multiple Conditions (Review)
We can also use multiple conditions in our conditional logic and chain them
This allows us to check for multiple things at the same time
```js
if (name === "Bruce" && parents === "Dead"){
  // Named bruce AND parents are dead
 //Turn off the bat signal
}
```
```js
if (day === "Saturday" || day === "Sunday"){
  //It is the weekend
}
```

## Functions (Review)
What are functions?

Functions are simple sets of instructions!
They form the basic "building blocks" of a program

Functions have two key steps
```js
//1. Declaration
function name(parameters){
  //body
}

//2. Call
name(arguments)
```

The declaration is the set of instructions
Just like a variable when you declare it that function is given a spot in memory

The call is a command to execute that set of instructions
When you make a call to a function you have the ability to pass in arguments
These arguments get passed into the function and can be used inside of the function itself as parameters
```js
// 1. Decalaration
function yell(word){
  alert(word)
}

// 2. Call
yell("HELLO")
```
Above we declare the `yell()` function to show an alert with a word variable
This word variable is also oneof the parameters
When we call the `yell()` function we pass in a string which gives the word parameter a value of `"HELLO"`
Now when the alert is trigger it will show the `"HELLO"` that was passed in

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

## Let's Code
Turbo Review
See 'class23-materials/turbo-review'
See instructions and try to solve in 5 minutes:
```js
// *Variables*
// Declare a variable and assign it to a sentance as a string. 
// Alert if the sentance is a question

// Declare a variable, assign it a string of multiple words, 
// replace every "jr. dev" with "software engineer", 
// and print it to the console

// *Functions*
// Create a function that returns rock, paper, or scissors 
// as randomly as possible

// *Conditionals*
// Create a function that takes in a choice (rock, paper, or scissors) 
// and determines if they won a game of rock paper scissors against a bot 
// using the above function

//*Loops*
// Create a function that takes an array of choices. 
// Play the game x times where x is the number of choices in the array. 
// Print the results of each game to the console.
```

Solution:
```js
// *Variables*
// Declare a variable and assign it to a sentance as a string. 
// Alert if the sentance is a question
let sentence = 'This is a question'
sentence.includes('?') && alert(sentence)

// Declare a variable, assign it a string of multiple words, 
// replace every "jr. dev" with "software engineer", 
// and print it to the console
let anotherSentence = 'random word jr. dev more words jr. dev'
console.log(anotherSentence.replaceAll('jr. dev', 'software engineer'))

// *Functions*
// Create a function that returns rock, paper, or scissors 
// as randomly as possible
function rps(){
  let play = Math.floor(Math.random() * 3)
  if(play === 0){
    return 'rock'
  } else if(play === 1){
    return 'paper'
  } else {
    return 'scissors'
  }
}
console.log(rps())

// *Conditionals*
// Create a function that takes in a choice (rock, paper, or scissors) 
// and determines if they won a game of rock paper scissors against a bot 
// using the above function
function playRPS(userChoice){
  let botChoice = rps()
  if(userChoice === botChoice){
    return `${userChoice} vs ${botChoice}: You tie`
  } else if((userChoice === 'rock' && botChoice === 'scissors') ||
            (userChoice === 'paper' && botChoice === 'rock') ||
            (userChoice === 'scissors' && botChoice == 'paper')){
    return `${userChoice} vs ${botChoice}: You win`
  } else {
    return `${userChoice} vs ${botChoice}: You lose ????`
  }
}
// console.log(playRPS('rock'))
// console.log(playRPS('paper'))
// console.log(playRPS('scissors'))

//*Loops*
// Create a function that takes an array of choices. 
// Play the game x times where x is the number of choices in the array. 
// Print the results of each game to the console.
function playRPSxTimes(arr){
  arr.forEach((el) => { 
    console.log(playRPS(el))
  })
}

let rpsArr = ['rock', 'paper', 'scissors',
  'rock', 'paper', 'scissors',
  'rock', 'paper', 'scissors'
]

playRPSxTimes(rpsArr)
```
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

???? WARNING ????
????Empty spaces leave an empty element ????

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

## Let's Code
Space Review
See 'class23-materials/space-review'
Follow the instructions and solve in 5 minutes
```js
// * Arrays *
// Create an array of numbers. 
// Sum all of the numbers. 
// Alert the sum.

// Create a function that takes in an array of numbers
// Return a new array of numbers
// that is every original number squared

// Create a function that takes string
// Print the reverse of that string to the console

// Create a function that takes in a string
// Alert if the string is a palindrome or not
```

Solution:
```js
// * Arrays *
// Create an array of numbers. 
// Sum all of the numbers. 
// Alert the sum.
let numbers = [1, 2, 3, 4, 5];
alert(numbers.reduce((a, el) => a += el, 0)); //=> 15

// Create a function that takes in an array of numbers
// Return a new array of numbers
// that is every original number squared
const sqArray = (arr) => arr.map((el) => el ** 2);
console.log(sqArray(numbers)); //=> [1, 4, 9, 16, 25]
console.log(numbers); //=> [1, 2, 3, 4, 5](unchanged)

// Create a function that takes string
// Print the reverse of that string to the console
const rev = (str) => str.split('').reverse().join('');
console.log(rev('test')); //=> 'tset'

// Create a function that takes in a string
// Alert if the string is a palindrome or not
const isPalindrome = (str) => (str === rev(str));
alert(`racecar ${isPalindrome('racecar')}`);
alert(`not a drome ${isPalindrome('not a drome')}`);
```
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

## Let's Code
Objects - Lost Galaxy
See 'class23-materials/objects-lost-galaxy'
Follow the instructions and solve in 2 minutes:
```js
//Create a dog object that has four properties and three methods
```

Solution:
```js
//Create a dog object that has four properties and three methods
let dog = {
  name: 'Ghost',
  breed: 'Husky',
  goodBoi: true,
  color: 'white',

  lick: () => { console.log('licking') },
  sleep: () => { console.log('sleeping') },
  rooRoo: () => { console.log('ROOOOOOOO') }
}

// Alternate
let dog ={}
dog.name = 'Ghost';
dog.breed = 'Husky';
dog.goodBoi = true;
dog.color = 'white'

dog.lick = function(){
  console.log('licking')
};
dog.sleep = function(){
  console.log('sleeping')
};
dog.rooRoo = function(){
  console.log('ROOOOOOOO')
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
See 'class23-materials/objects-tony-hawk-pro-skater'
Try to do in 4 minutes:
```js
// Create a Tony Hawk Pro Skater constructor 
// that makes fighting game characters 
// with 4 properties and 3 methods
```

Solution:
```js
// Create a Tony Hawk Pro Skater constructor 
// that makes fighting game characters 
// with 4 properties and 3 methods
function MakeSkater(name, boardColor, style, stance){
  this.name = name
  this.boardColor = boardColor
  this.style = style
  this.stance = stance

  this.move1 = function(){
    console.log('kickflip')
  }

  this.move2 = function(){
    console.log('pop-shove it')
  }

  this.move3 = function () {
    console.log('impossible')
  }
}

let bamMargera = new MakeSkater('Bam', 'black/red', 'street', 'regular');
```
## Car Factory
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

## APIs
What are APIs?

## APIs
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
See: 'class23-materials/objects-dog-photos'
Follow the instructions and try to solve (use the snippet from previous section)
```js
//Get a dog photo from the dog.ceo api 
// and place the photo in the DOM
```

Solution:
```js
//Get a dog photo from the dog.ceo api 
// and place the photo in the DOM
let url
fetch("https://dog.ceo/api/breeds/image/random")
  .then(res => res.json()) // parse response as JSON
  .then(data => {
    console.log(data.message)
    document.querySelector('img').src = data.message
  })
  .catch(err => {
    console.log(`error ${err}`)
  });
```

Class ended here
___
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
## Let's Code
NASA PHOTOS

## Homework
Read: Pillars of OOP - https://medium.com/@hamzzza.ahmed95/four-pillars-of-object-oriented-programming-oop-e8d7822aa219

Watch / Do: https://youtu.be/PFmuCDHHpwk

Watch: https://youtu.be/0fKg7e37bQE???
Do: Four Codewars Fundamentals