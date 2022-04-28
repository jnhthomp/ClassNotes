# Javascript - Back From Break
Slides: https://slides.com/leonnoel/100devs2-javascript-oop
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Learn - Objects
Learn - Basic OOP Principles
Do - Work In Teams: Tic-tac-toe
Homework - Object City Yall

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1519791265285505024
Like and Retweet the Tweet
!checkin

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

## Live Crafting Your Story (Review)
FRIDAY
6:30pm EST

## OFFICE HOURS (Review)
SUNDAY
1:00pm EST
Will cover git more deeply since we kind of brushed over it and will be using it to submit homework

## Objects (Review)
What are objects?

- Objects are a collection of variables and functions!
- Objects represent the attributes and behavior of something used in a program
- Object variables are called properties and object functions are called methods
- Objects store "keyed" collections

## USE
UNDERSTAND
BUILD

## Finna Make Sum Nerds Angry
## Objects
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
Objects - Espresso Machine

## BUT WHY?
Why Use Objects?
Why Would We Need A Factory?

## As our codebase gets larger and more folx join the team, can we keep our code organized?
## Is it easy to add new features and functionality?
## Can another developer look at my code and understand what is happening?
## Can I make changes without losing sleep at night? 
## What if there was a system, a paradigm, a set of rules, an agreed upon way to structure our code that:
 

Made it easier to add new stuff

Made it easier to read through what was already coded

And made it so you were not afraid to make changes

 

Music & Light Warning - Next Slide
## OOP BABY
## OBJECT ORIENTED PROGRAMING 
## Let's See Some Code
## Is it easy to add new features and functionality?
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}

let profit = calculateProfit(hourlyRate, hours, taxRate)

console.log(profit)
```
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}

function holdForTaxes(profitMade){
  return hourlyRate * hours - profitMade
}

let profit = calculateProfit(hourlyRate, hours, taxRate)

let taxesHeld = holdForTaxes(profit)

console.log(profit)

console.log(taxesHeld)
```
## Can another developer look at my code and understand what is happening?
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}

function holdForTaxes(profitMade){
  return hourlyRate * hours - profitMade
}

let profit = calculateProfit(hourlyRate, hours, taxRate)

let taxesHeld = holdForTaxes(profit)

console.log(profit)

console.log(taxesHeld)
```
## Can I make changes without losing sleep at night? 
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}

let profit = calculateProfit(hourlyRate, hours, taxRate)

console.log(profit)
```
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}

function holdForTaxes(profitMade){
  return hourlyRate * hours - profitMade
}

let profit = calculateProfit(hourlyRate, hours, taxRate)

let taxesHeld = holdForTaxes(profit)

console.log(profit)

console.log(taxesHeld)
```
## DATA & FUNCTIONALITY
## DATA
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

```
## Functionality
```js
function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}
```
## Fusion
```js

let seriousBusinessPerson = {
  hourlyRate: 250,
  hours: 160,
  taxRate: .35,
  calculateProfit: function() {
    return this.hourlyRate * this.hours * (1 - this.taxRate)
  }
}
```
## Is it easy to add new features and functionality?
```js
let seriousBusinessPerson = {
  hourlyRate: 250,
  hours: 160,
  taxRate: .35,
  calculateProfit: function() {
    return this.hourlyRate * this.hours * (1 - this.taxRate)
  }
}
```
```js
let seriousBusinessPerson = {
  hourlyRate: 250,
  hours: 160,
  taxRate: .35,
  calculateProfit: function() {
    return this.hourlyRate * this.hours * (1 - this.taxRate)
  }
  calculateTaxesHeld: function(){
    return this.hourlyRate * this.hours - this.calculateProfit()
  }
}
```
## Can another developer look at my code and understand what is happening?
```js
let seriousBusinessPerson = {
  hourlyRate: 250,
  hours: 160,
  taxRate: .35,
  calculateProfit: function() {
    return this.hourlyRate * this.hours * (1 - this.taxRate)
  }
}
```
## Can I make changes without losing sleep at night? 
```js

let seriousBusinessPerson = {
  hourlyRate: 250,
  hours: 160,
  taxRate: .40, //changed
  calculateProfit: function() {
    return this.hourlyRate * this.hours * (1 - this.taxRate)
  }
}
```

## This fusion of data and functionality into one object

Music & Light Warning - Next Slide

## Encapsulation Baby
## Encapsulation
The process of storing functions (methods) with their associated data (properties) - in one thing (object)*
## Is it easy to add new features and functionality?
## Heats water for espresso and steam for your milk
## Steam wand sucks...
What should the engineers do?
## Do they get rid of the water boiler?
probably not...
## At first, do they even need to think about the water boiler?
## So the water boiling is abstracted?
## Let's look at some code

## Ut Oh...
```js
function AgencyContractor(hourlyRate, hours, taxRate){
  this.hourlyRate = hourlyRate
  this.hours = hours
  this.taxRate = taxRate
  this.calculateProfit = function() {
    return this.hourlyRate * this.hours * (1 - this.taxRate)
  }
  this.invoiceClient = function(){
    return `Your invoice total is ${this.hourlyRate * this.hours}`
  }
}

let leon = new AgencyContractor(250,160,.35)
console.log( leon.invoiceClient() ) //40000
console.log( leon.hourlyRate ) //250
console.log( leon.calculateProfit() ) //26000
```
## Better...
```js
function AgencyContractor(hourlyRate, hours, taxRate){
  this.hours = hours
  this.taxRate = taxRate
  let rate = hourlyRate
  let calculateProfit = function() {
    return rate * this.hours * (1 - this.taxRate)
  }
  this.invoiceClient = function(){
    return `Your invoice total is ${rate * this.hours}`
  }
}

let leon = new AgencyContractor(250,160,.35)
console.log( leon.invoiceClient() ) //40000
console.log( leon.hourlyRate ) //undefined
console.log( leon.calculateProfit() ) 
//Uncaught TypeError: leon.calculateProfit is not a function
```
## So now my client can still get their invoice, but not see my hourly rate
## Water boiling was hidden from the steam wand
Hourly rate was hidden from the client
## Complex or unnecessary details are hidden
## This enables you to implement things without understanding or even thinking about all the hidden complexity
## Smaller more manageable pieces of code
## Do stuff once
Music & Light Warning - Next Slide
## Abstraction Baby
## Abstraction
Hide details
and show essentials
SIMPLE, PREDICTABLE, MANAGEABLE
## The Four Pillars
What if they actually made any sense...
## Encapsulation
The process of storing functions (methods) with their associated data (properties) in one thing (object)
## BUT WHY?
## Made it easier to add new stuff
 

Made it easier to read through what was already coded
 

And made it so you were not afraid to make changes
## Abstraction
Hide details
and show essentials
## BUT WHY?
## Smaller more manageable pieces of code
Helps you to split the complexity your software project into manageable parts
## Inheritance
Polymophism
Next Class
## Group Work
https://live.remo.co/e/100devs-objects-project

## Right Of Passage
https://live.remo.co/e/100devs-objects-project

## Get It To Work 
Then:
- Make it easier to add new stuff
- Make it easier to read through what was already coded
- And make it so you are not afraid to make changes

## Homework
Watch / Do: https://youtu.be/PFmuCDHHpwk
Read / Do: JS Way Ch. 09
Push? Read / Do: Eloquent JS Ch. 06
Do: 7 Codewars 
