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

## USE UNDERSTAND BUILD
This is a method of learning that Leon uses
First use objects to create properties and methods and constructors
Then you will undertsand why you use them afterwords
Finally build projects with them after you understand

## Finna Make Sum Nerds Angry
Explaining theory to people who don't have a solid grasp of objects can make it harder to understand
This is going to cover why encapsulation and abstraction are important
Not to study dusty theories (we will cover dusty theories later)

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
Objects - Espresso Machine
See 'class30-materials/objects-espresso-machine'
Try to solve in 4 minutes
Instructions:
```js
// Create an espresso machine class that 
// makes machines with 4 properties and 3 methods
```

Solution
```js
// Create an espresso machine class that 
// makes machines with 4 properties and 3 methods

class MakeEspressoMachine{
  constructor(color, make, model, price){
    this.color = color
    this.make = make
    this.model = model
    this.price = price
  }

  turnOn(){
    console.log('powering on...')
  }
  steam(){
    console.log('steaming...')
  }
  brew(){
    console.log('brewing...')
  }
}

let gaggia = new MakeEspressoMachine('red', 'Gaggia', 'Classic Pro', 400)
console.log(gaggia)
```

## BUT WHY?
Why Use Objects?

## Why Would We Need A Factory?
- As our codebase gets larger and more folx join the team, can we keep our code organized?
- Is it easy to add new features and functionality?
- Can another developer look at my code and understand what is happening?
- Can I make changes without losing sleep at night? 

## What if there was a system, a paradigm, a set of rules, an agreed upon way to structure our code that: 
- Made it easier to add new stuff
- Made it easier to read through what was already coded
- Made it so you were not afraid to make changes

Music & Light Warning - Next Slide

## OOP BABY
Object Oriented Programming can solve all of the above problems

## OBJECT ORIENTED PROGRAMING 
## Let's See Some Code
## Is it easy to add new features and functionality?
Say we wanted to be able to calculate profit when working with a client
We can store important values as variables
We can have a function to calculate profit 
Then we call that function passing in the aforementioned variables 
and saving the result to a new variable
This would work and might be something we actually right
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

But is it easy to add new features? Lets try...
Just adding one other bit of functionality (`holdForTaxes`)
Now we have to calculate using this new function passing in our previously calculated profit
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
Again this works but...
## Can another developer look at my code and understand what is happening?
Even with a small program like this it is more difficult with just a single added function
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
What if there was 50 or 100 functions to keep track of?
Since it is procedural if one link is messed up any mistakes are amplified...

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
What if there was something we could do to get rid of all this mess?
We can solve the issue above and clean up the code

There are two main points of our code above
The data (`hourlyRate`, `hours`, `taxRate`)
The functionality (`calculateProfit()` and `holdForTaxes()`)
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
What if we could fuse our data and functionality together to make it make more sense?
Now we have data and functionality combined into a single object
There isn't a big mess and if we want to access any of these values we can with dot notations
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
If we want to add another function we can just add another function
This can reference values within the object instead of having to check the global scope for those values
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
  },
  calculateTaxesHeld: function(){
    return this.hourlyRate * this.hours - this.calculateProfit()
  }
}
```

## Can another developer look at my code and understand what is happening?
A developer can see what is happening because it is much more organized
`this` makes it obvious that the values used are properties of the object
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
Changing the tax rate won't ruin any of your other values or functionality in this case
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
That is basically encapsulation

## Encapsulation
(This is a definition that is just supposed to help people understand
Not necessarily a technical definition)

The process of storing functions (methods) with their associated data (properties) - in one thing (object)*
This makes our code more readable and makes it easier to make changes
Our data and functionality is fused into one thing

## Is it easy to add new features and functionality?
Encapsulation is just one step to make it easier
Imagine the following scenario

Imagine an espresso machine that heats water for espresso and steam for your milk with a steam wand
But...
## Steam wand sucks...
What should the engineers do?
## Do they get rid of the water boiler?
probably not... because it isn't related to the steam wand
The water that it heats is fine the only issue is the steam wand

## At first, do they even need to think about the water boiler?
No they are two unrelated parts and can be seperated from each other as such
One can be changed without the other being affected

## So the water boiling is abstracted?
Abstracted meanst that you can mess with something and other parts are unaffected
Similarly with an object if you change how a function works or the value of a property 
it shouldn't affect other functions that have nothing to do with those functions/values

## Let's look at some code

## Ut Oh...
This calculator was put on the agency website...
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
You can see that hourly rate, hours, and taxrate are all visible
A client could come to your website and get an estimate but they see your hourly rate if they inspect the page
We don't want them to know that

## Better...
Now they can't access hourly rate or profit
These variables and methods are 'private' and only available inside of that object
By using let instead of this instead of being bound to the object they become local variables
They are only available locally (inside the object)
The object that is created does not have access to that data anymore
It is only available to the methods inside of that object
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
Much like water boiling was hidden from the steam wand
the hourly rate was hidden from the client

Remember just because they are hidden doesn't mean they are not used inside the object

## Complex or unnecessary details are hidden
The wand does not need to know about the water boiler
The client does not need to know the hourly rate to get their invoice

## This enables you to implement things without understanding or even thinking about all the hidden complexity
If we were all engineers working on the steam wand we don't need to know how the water boiler works
We only need to know how the wand works

## Smaller more manageable pieces of code
This makes code easier to understand and change

## Do stuff once
You only need to create functions that do things once
You don't need to know how the water boiler works, just say give me steam

Music & Light Warning - Next Slide
## Abstraction Baby
## Abstraction
All about
Hiding details
and show essentials
Doing this makes code more SIMPLE, PREDICTABLE, MANAGEABLE

## The Four Pillars
What if they actually made any sense...

## Encapsulation
The process of storing functions (methods) with their associated data (properties) in one thing (object)

## BUT WHY?
- Made it easier to add new stuff
- Made it easier to read through what was already coded
- Made it so you were not afraid to make changes

## Abstraction
All about
Hiding details
and show essentials
Doing this makes code more SIMPLE, PREDICTABLE, MANAGEABLE

## BUT WHY?
- Smaller more manageable pieces of code
- Helps you to split the complexity your software project into manageable parts

## Next Class
Inheritance
&&
Polymorphism

## Group Work
https://live.remo.co/mic-cam-check?event=100devs-networking-night-group-0-1

## Right Of Passage
we are going to create tik-tak-toe 
If you must do it proceduraly but try to use OOP

https://live.remo.co/e/100devs-objects-project

## Get It To Work 
Then:
- Make it easier to add new stuff
- Make it easier to read through what was already coded
- And make it so you are not afraid to make changes

## Homework
Watch/Do: https://youtu.be/PFmuCDHHpwk
Read/Do: JS Way Ch. 09
Push? Read/Do: Eloquent JS Ch. 06
Do: 7 Codewars 
