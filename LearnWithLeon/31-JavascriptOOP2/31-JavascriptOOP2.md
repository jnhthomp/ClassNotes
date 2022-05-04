# Javascript - OOP Part 2
Slides: https://slides.com/leonnoel/100devs2-javascript-oop-part-2
___
## Agenda
Questions? 
Let's Talk -  #100Devs
Learn - Objects
Learn - Basic OOP Principles
Do - Work In Teams: The Four Pillars
Do - Work In Teams: Tic-tac-toe
Homework - Object City Yall
## Questions
About last class or life
## Checking In
https://twitter.com/leonnoel/status/1521603078406897664
Like and Retweet the Tweet
!checkin

## !newsletter
## Networking - Next Week
## Client Deadline: May 5th
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

## GIT BOWL
SUNDAY
1:00pm EST
## Discord
https://discord.com/channels/735923219315425401/970098839786758165/970098843435823195
## Never Miss The Stream Team
## Welcome, verolafox
https://www.twitch.tv/verolafox
Friday @ 11:00am ET! 
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

## BUT WHY? (Review)
Why Use Objects?

## Why Would We Need A Factory? (Review)
- As our codebase gets larger and more folx join the team, can we keep our code organized?
- Is it easy to add new features and functionality?
- Can another developer look at my code and understand what is happening?
- Can I make changes without losing sleep at night? 

## What if there was a system, a paradigm, a set of rules, an agreed upon way to structure our code that: (Review)
- Made it easier to add new stuff
- Made it easier to read through what was already coded
- Made it so you were not afraid to make changes

Music & Light Warning - Next Slide

## OOP BABY (Review)
Object Oriented Programming can solve all of the above problems

## OBJECT ORIENTED PROGRAMING (Review)
## Let's See Some Code (Review)
## Is it easy to add new features and functionality? (Review)
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
## Can another developer look at my code and understand what is happening? (Review)
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

## Can I make changes without losing sleep at night? (Review)
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

## DATA & FUNCTIONALITY (Review)
What if there was something we could do to get rid of all this mess?
We can solve the issue above and clean up the code

There are two main points of our code above
The data (`hourlyRate`, `hours`, `taxRate`)
The functionality (`calculateProfit()` and `holdForTaxes()`)
## DATA (Review)
```js
let hourlyRate = 250
let hours = 160
let taxRate = .35

```

## Functionality (Review)
```js
function calculateProfit(rate, numOfHours, taxes){
  return rate * numOfHours * (1 - taxes)
}
```

## Fusion (Review)
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

## Is it easy to add new features and functionality? (Review)
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

## Can another developer look at my code and understand what is happening? (Review)
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

## Can I make changes without losing sleep at night? (Review)
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

## This fusion of data and functionality into one object (Review)
Music & Light Warning - Next Slide

## Encapsulation Baby (Review)
That is basically encapsulation

## Encapsulation (Review)
(This is a definition that is just supposed to help people understand
Not necessarily a technical definition)

The process of storing functions (methods) with their associated data (properties) - in one thing (object)*
This makes our code more readable and makes it easier to make changes
Our data and functionality is fused into one thing

## Is it easy to add new features and functionality? (Review)
Encapsulation is just one step to make it easier
Imagine the following scenario

Imagine an espresso machine that heats water for espresso and steam for your milk with a steam wand
But...

## Steam wand sucks... (Review)
What should the engineers do?

## Do they get rid of the water boiler? (Review)
probably not... because it isn't related to the steam wand
The water that it heats is fine the only issue is the steam wand

## At first, do they even need to think about the water boiler? (Review)
No they are two unrelated parts and can be seperated from each other as such
One can be changed without the other being affected

## So the water boiling is abstracted? (Review)
Abstracted meanst that you can mess with something and other parts are unaffected
Similarly with an object if you change how a function works or the value of a property 
it shouldn't affect other functions that have nothing to do with those functions/values

## Let's look at some code (Review)

## Ut Oh... (Review)
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

## Better... (Review)
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

## So now my client can still get their invoice, but not see my hourly rate (Review)
Much like water boiling was hidden from the steam wand
the hourly rate was hidden from the client

Remember just because they are hidden doesn't mean they are not used inside the object

## Complex or unnecessary details are hidden (Review)
The wand does not need to know about the water boiler
The client does not need to know the hourly rate to get their invoice

## This enables you to implement things without understanding or even thinking about all the hidden complexity (Review)
If we were all engineers working on the steam wand we don't need to know how the water boiler works
We only need to know how the wand works

## Smaller more manageable pieces of code (Review)
This makes code easier to understand and change

## Do stuff once (Review)
You only need to create functions that do things once
You don't need to know how the water boiler works, just say give me steam

Music & Light Warning - Next Slide

## Abstraction Baby (Review)
## Abstraction (Review)
All about
Hiding details
and show essentials
Doing this makes code more SIMPLE, PREDICTABLE, MANAGEABLE

## Let's Start A Farm
```js
class Animal{
    constructor(name){
        this.name = name
    }
    speak(){
        console.log(`${this._name} makes a sound`)
    }
}
```

## What if we want a bunch of different animals on the farm?
## We can extend animal
```js
class Animal{
    constructor(name){
        this.name = name
    }
    speak(){
        console.log(`${this.name} makes a sound`)
    }
}
class Dog extends Animal{
    constructor(name,breed){
        super(name)
        this.breed = breed
    } 
}

let simba = new Dog('Simba', 'Sheperd')
```
* If you find yourself starting to create a number of objects that have similar features, then creating a generic object type to contain all the shared functionality and inheriting those features in more specialized object types can be convenient and useful. 
*mdn on oop https://developer.mozilla.org/en-US/docs/learn/javascript/objects/classes_in_javascript

## AKA We just eliminated a bunch of redundant code
Music & Light Warning - Next Slide

## Inheritance BABY
## Inheritance
Make a class from another class for a hierarchy of classes that share a set of properties and methods

## Let's Code
Make A Child Class

## Back To The Farm
## New workers keep renaming animals in our system
```js
class Animal{
    constructor(name){
        this.name = name
    }
    speak(){
        console.log(`${this.name} makes a sound`)
    }
}

let simba = new Animal('Simba')

simba.name // "Simba"

simba.name = 'Bob' //nothing happens

simba.name // "Bob"
```

## What could help here?
```js
class Animal{
    constructor(name){
        this._name = name
    }
    get name(){
        return this._name
    }
    speak(){
        console.log(`${this._name} makes a sound`)
    }
}

let simba = new Animal('Simba')

simba.name // "Simba"

simba.name = 'Bob'  //nothing happens
```

## We just rescued a bunch of animals! 
How should we build out our system? 

## Let's Code
Animal System

## We want to do a morning roll call and fortunately Dr. Dolittle works here
## ROLL CALL
```js
let simba = new Dog('Simba','Shepard')
let machi = new Dog('The Machine','Pitbull')
let salem = new Cat('Salem', 'American Shorthair')

let farm = [simba,machi,salem]

for( a of farm ){
    a.speak()
}

//Simba barks
//Machi barks
//Salem Meows
```

## Wait A Minute
```js
for( a of farm ){
    a.speak()
}

//Simba barks
//Machi barks
//Salem Meows
```

## Code written to use an interface automatically knows how to work with any number of different objects that provide the interface
## Sibling descendants of a base class will all have the same interface but varying implementations
## When you are not sure of the objects type at runtime and the most specific method is called.
## Therefore the behavior of the method called may differ, depending on the objects type at runtime
## Disgusting
```js
for( a of farm ){
    if(a instanceof Dog){
      console.log('Bark')
	}else if (a instanceof Cat){
      console.log('Meow')         
    }
}

//Simba barks
//Machi barks
//Salem Meows
```

## Provides a way to perform a single action in different forms.
Provides an ability to call the same method on different JavaScript objects.

## Instead of conditionals and switch cases
Music & Light Warning - Next Slide

## POLYMORPHISM BABY
## The Four Pillars (Review)
What if they actually made any sense...

## Encapsulation (Review)
The process of storing functions (methods) with their associated data (properties) in one thing (object)

## BUT WHY? (Review)
- Made it easier to add new stuff
- Made it easier to read through what was already coded
- Made it so you were not afraid to make changes

## Abstraction (Review)
All about
Hiding details
and show essentials
Doing this makes code more SIMPLE, PREDICTABLE, MANAGEABLE

## BUT WHY? (Review)
- Smaller more manageable pieces of code
- Helps you to split the complexity your software project into manageable parts

## Inheritance
Make a class from another class for a hierarchy of classes that share a set of properties and methods

## BUT WHY?
- Helps you eliminate redundant code

## Polymorphism
 Code written to use an interface automatically knows how to work with any number of different objects that provide the interface

## BUT WHY?
- Helps you avoid if/else and switch cases
- Makes your code more reusable

- Supports The Other Pillars
## Group Work
https://live.remo.co/e/100devs-networking-night-group-0
https://live.remo.co/e/100devs-networking-night-group-0-1
If Remo does not work for you, please jump into one of our

Discord Voice Channels!

## Talk Through OOP
## Right Of Passage
https://live.remo.co/e/100devs-networking-night-group-0
https://live.remo.co/e/100devs-networking-night-group-0-1
If Remo does not work for you, please jump into one of our

Discord Voice Channels!

## Get It To Work 
Then:
Make it easier to add new stuff
Make it easier to read through what was already coded
And make it so you are not afraid to make changes

## Homework
DO: Please review, play, and break the code we go over tonight.
Get lost in it, come with questions, and ready to review on Thursday.
DO: Get a paid client, Volunteer, or Contribute To Free Software
DO: FINISH Professional Checklist 

Want To Push (Due: Tues. May 5th)?
Do: Codewars Array Ladder (search array problems) - 8kyu, 7kyu, 6kyu, 7kyu, 8kyu  


