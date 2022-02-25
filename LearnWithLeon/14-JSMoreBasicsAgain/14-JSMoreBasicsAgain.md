# Javascript - More Basics
Slides: https://slides.com/leonnoel/100devs2-javascript-more-basics-again
___

## Agenda
Questions? 
Let's Talk -  2 Classes
Learn - What is programming?
Learn - JS Basics
Review - Previous Class Work 
Learn - Pseudo Code
Build - Temperature Converter
Learn - Functions
Build - Functions
Homework - Read Please 

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1496975838327107591
Like and Retweet the Tweet
!checkin

## I'm NOT GOING TO
TEXT YOU, CALL YOU, EMAIL YOU OUTSIDE OF THE NEWSLETTER, DM YOU ON TWITTER OR DISCORD

## Friends?
Study Community Networking (Mar. 8th)

## Submitting Work
Nothing Tonight

## Ads?
Going to start playing ads during the 5 minute break to prevent interruptions to stream

## Coffee Chats
(Not Showing Up)?
Show up to coffee chats
Some people are no call no showing and making 100Devs look bad

## TWO CLASSES
Today is only the second js class so don't feel like you must have a complete understanding tonight

## Hydrate With Me


## The Golden Rule SEPERATION OF CONCERNS (Review)
SEPERATION OF CONCERNS
HTML = Content / Structure
CSS = Style
JS = Behavior / Interaction

The idea here is that we want to keep tasks seperate and these should not mix
If we were to go to a website and add an extra paragraph you would use html
If you wanted to make something pink you would use css
If you wanted something to move when you clicked it you would use js

This is important so that it organizes all of the work so it is easier to work on or change something
You know exactly where to go when you want to make a change

## IDs & Classes (Review)
These are identifiers that allow you to target elements and give the highest specificity score to elements that are targetted by it

## IDs (Review)
IDs are used for selecting distinct elements
Only one id with the same value per document

This is a way of uniquely identifing an element

Here we assign an id with the 'id' property and assigning it a value of 'zebra'
Then we can target it in css by using: #idname or in this case #zebra
```
<section>
  <p>Hello, Twitch!</p>
  <p id="zebra">Hello, Youtube!</p>
</section>
```
```
#zebra {
  color: red;
}
```

## Classes (Review)
Classes are for selecting multiple elements
Multiple with same value allowed per document

They are kind of like ID's in that they add an identifier to an element
However you can have multiple elements with the same class name
This is so you can group elements and give them common rules to share between them
For example you could assign a specific font to paragraphs with a certain class while leaving other paragraphs untouched
This prevents you from having to write many different rules that do the same thing while target different elements
Instead we can just write one rule and target all the elements we want to follow that rule
You can have multiple classes per element as well

Here we assign a class name with the 'class' property 
Then we can use a rule that these classes must follow in css with .className or in this case '.bob'
```
<section>
  <p class="robot">Hello, Twitch!</p>
  <p id="zebra" class="bob">Hello, Youtube!</p>
  <p class="bob">Goodbye, Mixer!</p>
</section>
```
```
.bob {
  color: red;
}
```

## Programming (Review)
## A computer will do what you tell it to do. (Review)
The key rule of programming is that a computer will do what you tell it to
If you tell it to do something wrong it will do it wrong
If you tell it to do it right it will do it correctly

## What is a program? (Review)
A program is a set of instructions that you write to tell a computer what to do

## What is a programming? (Review)
Programming is the task of writing those instructions in a language that the computer can understand.

Javascript is readable by humans but it does need to be broken down by the browser so that the computer itself can understand it

## True Story (Review)
The homework was to watch Independence Day
We are going to use it to highlight a story that is important to understand js

Remember in the movie when aliens crashed but we already had one in area 51?
When the alien ships came to earth the old crashed ship turned back on

That means somehow all of these ships are connected
Then they used this network to inject a virus into the mothership

We have to assume that even advanced alien spaceships use the same math and physics as us
Maybe the idea of 0's and 1's are also a universal constant
Even their computers boiled down to logic gates which let Jeff Goldblum hack them and save the day

The lesson is that as you are writing js there are people who came before and wrote the 0's and 1's so that js can even be used

## JAVASCRIPT (Review)
JS is a language that we will use to tell the computer what to do
You don't need to get it tonight
Just take in the concepts and ideas and worry about the execution later
We will go deep on this the next couple classes

## Has a specific 'Syntax' (Review)
Syntax: "Spelling and grammar" rules of a programming language.

Remember html and css had a specific syntax we had to use when writing them
JS is the same way

Over the next couple classes we will introduce more and more of the syntax
Really do take care of your hands becaues you will be using characters that you may not normally use on a keyboard

## Variables (Review)
What are variables?
Variables are something we can use to tell our program to remember values for us to use later on
​
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

## Variable Conventions (Review)
There is a convention you use when naming variables
Usually this is called camel case
camelCase:
```js
let numberOfApples = 9
```
You can see that the very first word is lowercase and each word after is capitalized

## Variables & Data Types (Review)
What can you store in variables?
Variables can hold all kinds of different data
So far we have seen two types: strings and numbers

Strings are just a piece of text
Numbers are of course numbers

## Strings (Review)
Stores text
String is surrounded by quotes
```js
"How is the weather today?"
```
```js
'Warm'
```
You can also use ticks
```js
`Wonderful weather`
```

Double vs Single Quoted Strings:
```js
'They "purchased" it'
"It's a beautiful day"
```
One important thing is that whatever kind of quote symbol you use on the outside you cannot use on the inside
```js
"They "purchased" it"
```
Doing this will make JS think that the string has ened and will think you are looking for a variable called 'purchsed'
We can use an escape character (\\) in order to avoid this and use the same quotes
```js
"They \"purchased\" it"
```

## Strings (Review)
Other than escaping there are a few other things we can do
New Line + Tabs:
```js
"1. Preheat over to 350\n2. Grease the pan"
'\tBeginning of paragraph'
```
🚨 WARNING 🚨
This is more of a job for css but is good to know

## Numbers (Review)
Represent Numerical Data
Javascript has two types of numbers

1. int: 29 
  These are whole number
2. float: 5.14876
  These are numbers with decimal places

You can also have 'signed' numbers
Signed
1. positive - int: +4
2. negative - float: -10.375

## Arithmetic In Javascript (Review)
```
Operator | Meaning        | example
+        |  addition      | 8 + 10
-        |  subtraction   | 10-8
*        |  multiplication| 12 * 2
/        |  division      | 10/5
%        |  Modulus       | 10 % 6 = 4
```

One good use of the modulus symbol is to determine if a number is even or odd

## Making Decisions (Review)
We can make decisions based on whether something is either TRUE or FALSE 
If you are greater than 18 you are an adult
```js
if (age > 18){
  console.log("You are an adult")
}
```
In order to do make decisions we need to know how to make comparisons

## Comparisons: (Review)
Equality
Are two things equal?
```js
// Comparing the number 9 is it equal to the number 9?
9 === 9 //true
// Comparing the number 7 to the number 3
7 === 3 //false
// Comparing two strings containing the same text
"Hello" === "Hello" //true
```

## Logical Operators (Review)
```
x = 3
operator  desctiption       comparing returns
==        equal to          x == 8 false
===       exactly equal to  x==="3" false 
          (value and type)
!=        is not equal      x != 8 true
!==       is not equal      x !== "3" true
  (neither value nor type)
>         greater than      x>8 false
<         less than         x<8 true
>=        greater than      x>=8 false 
          or equal to 
<=        less than         x<=8 true
          or equal to 
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

## 🚨 DANGER 🚨 (Review)
Assignment vs. Comparison
Be careful that when you compare values you don't accidentally use a single equal sign like this:
```js
const pizza = "Dominos" 

// Accidentally used assignment
// This will cause an error since we are trying to re-assign a constant variable
if (pizza = "Papa Johns") {
  console.log("Scram!")
} else if(pizza === "Dominos") {
  console.log("All aboard the train to flavor town")
} else {
  console.log("What are you even doing with your life?")
}
```
If we had used let for pizza AND accidentally used a single equal sign
```js
let pizza = "Dominos" 

// Accidentally used assignment
// This will cause 'Scram!' to be printed since it will be re-assigned and then be true
if (pizza = "Papa Johns") {
  console.log("Scram!")
} else if(pizza === "Dominos") {
  console.log("All aboard the train to flavor town")
} else {
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
## Let's Code (Review)
Class, Weekend, or Boring Day?
Use 'class-weekend-boring' from 'class13-materials'
In there we have some js
```html
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
    	<meta name="description" content="This app lets you know today is class, the weekend, or a boring day">
    	<meta name="keywords" content="class, weekend, boring">

		<title>What is today?</title>

		<!-- external CSS link -->
		<link rel="stylesheet" href="css/normalize.css">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>

		<h1>What is today?</h1>

		<form>
			<label for="day"> Day of the week: </label>
			<input id="day" type="text" placeholder="Day of the week">
		</form>

		<button id="check" type="button" name="button">check</button>

		<h2 id="placeToSee"></h2>


		<script type="text/javascript" src="js/main.js"></script>
	</body>
</html>

```
```js
//Handle Capital Letters, Place result in DOM, add a check for humpday (Wed)
document.querySelector('#check').addEventListener('click', check)

function check() {

  const day = document.querySelector('#day').value

  if(day === "tuesday" || day === "thursday"){
    console.log("YOU HAVE CLASS")
  }else if( day === "saturday" || day === "sunday"){
    console.log("Its The Weekend")
  }else{
    console.log("BORING")
  }
}
```

We want to change it so that it is not case sensitive
Currently if someone enters 'Tuesday' they will get boring which we don't want

We can see that the input has an id of `#day` and there is an h2 with an id of `placeToSee`
We can use javascript to mess with the dom 

Currently we are going in and looking for an element with an id of `#check`
The button we click on has that id
We are adding an event listener to it that is listening for a click
When a click happens it will run the function called `check`

We define that function in the next few lines
It will check that input field again and assign the current value in it to a variable
Then we run some if statements to compare that variable to some predefined strings matching days of the week

What if we made sure that the formatting of 'day' matched what we expect before we do our comparisons?
We can call a function on day to set it to all lowercase letters before we do our if statements so that way the comparison is not case sensitive since it is transformed
```js
document.querySelector('#check').addEventListener('click', check)

function check() {

  const day = document.querySelector('#day').value.toLowerCase()

  if(day === "tuesday" || day === "thursday"){
    console.log("YOU HAVE CLASS")
  }else if( day === "saturday" || day === "sunday"){
    console.log("Its The Weekend")
  }else{
    console.log("BORING")
  }
}
```
Now if someone enteres 'TUESDAY' all characters will be transformed to 'tuesday' because of `toLowerCase()` transforming whatever we got from the value

## Let's Code (Review)
Angry Parent Simulator
This is in 'class13-materials/angry-parent-simulator'
```html
<!DOCTYPE html>
<html lang="en">
	<head>
    	<meta charset="utf-8">
    	<meta name="description" content="This app simulates when your parental unit is really mad at you">
    	<meta name="keywords" content="mom, dad, yell">

		<title>Angry Parent Simulator</title>

		<!-- external CSS link -->
		<link rel="stylesheet" href="css/normalize.css">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>

		<h1>YOU DONE MESSED UP</h1>

		<form>
			<label for="firstName"> First Name: </label>
			<input id="firstName" type="text" placeholder="First Name">
			<label for="firstMiddle"> First Middle Name: </label>
			<input id="firstMiddle" type="text" placeholder="First Middle Name">
			<label for="lastMiddle"> Last Middle Name: </label>
			<input id="lastMiddle" type="text" placeholder="Last Middle Name">
			<label for="lastName"> Last Name: </label>
			<input id="lastName" type="text" placeholder="Enter First Name">
		</form>

		<button id="yell" type="button" name="button">YELL</button>

		<h2 id="placeToYell"></h2>


		<script type="text/javascript" src="js/main.js"></script>
	</body>
</html>

```
```js
document.querySelector('#yell').addEventListener('click', run)

function run() {
  const fName = document.querySelector('#firstName').value
  const fMidName = document.querySelector('#firstMiddle').value
  const lMidName = document.querySelector('#lastMiddle').value
  const lName = document.querySelector('#lastName').value

  // document.querySelector('#placeToYell').innerText = fName + ' ' + fMidName + ' ' + ' ' + lMidName + ' ' + lName

  //Add what you should be doing - conditionals go here

  document.querySelector('#placeToYell').innerText = `${fName} ${fMidName} ${lMidName} ${lName}`
}

// const synth = window.speechSynthesis;
// document.querySelector('#yell').addEventListener('click', run)
//
// function run() {
//   const fName = document.querySelector('#firstName').value
//   const fMidName = document.querySelector('#firstMiddle').value
//   const lMidName = document.querySelector('#lastMiddle').value
//   const lName = document.querySelector('#lastName').value
//
//   const yellText =  `${fName} ${fMidName} ${lMidName} ${lName}`
//
//   document.querySelector('#placeToYell').innerText = yellText
//
//   let yellThis = new SpeechSynthesisUtterance(yellText);
//
//   synth.speak(yellThis);
// }

```
If you view this page in the browser it will take different inputs to get each name
When you click 'yell' all those inputs are collected and then put in the dom

We get those out by using `.querySelector` to target each input and retrieve the value then assign that value to a variable
Then we use `.querySelector` again to target where the content should be placed 
We then attach a special method `.innerText` that lets us put values into an element and pass in each of the variables that were assigned values from the inputs
Both of these do the same thing just in a different way
old way:
```js
document.querySelector('#placeToYell').innerText = fName + ' ' + fMidName + ' ' + ' ' + lMidName + ' ' + lName
```
new way: (template literal)
```js
document.querySelector('#placeToYell').innerText = `${fName} ${fMidName} ${lMidName} ${lName}`
```
This is just two different ways to add variables to a string but we only need to use one in order to create a string

```js
const synth = window.speechSynthesis;
document.querySelector('#yell').addEventListener('click', run)

function run() {
  const fName = document.querySelector('#firstName').value
  const fMidName = document.querySelector('#firstMiddle').value
  const lMidName = document.querySelector('#lastMiddle').value
  const lName = document.querySelector('#lastName').value

  const yellText =  `${fName} ${fMidName} ${lMidName} ${lName}`

  document.querySelector('#placeToYell').innerText = yellText

  let yellThis = new SpeechSynthesisUtterance(yellText);

  synth.speak(yellThis);
}
```
In the lower code we are doing something similar except we are adding one other special function
There is speech synthesis built into the browser that we can access by using `window.speechSynthesis`
This allows us to pass a string into a method and have the browser speak some text for us

## Pseudo Code (Review)
Pseudo code is just talking about an idea and what steps you might take to work towards that
This is done in plain english and not using any particular language
The idea is to have it all mapped out in english so then you can just 'translate' it to js (or whatever language you need to use)
The better you are at doing this the easier it is to write the code to actually execute what you want to do

## Let's Code (Review)
A Temperature Converter
Look at 'class13-materials/temperature-converter'
Notice there is no js code written
We will start with pseudocode
We want to convert a value from celsius to fahrenheit
In plain english there are a couple of things that need to happen

1. Need the value that is in celsius
2. Convert the value from celsius to fahrenheit
3. Output this new converted value to the dom

Now lets try to code this for real
First we want to remember how to setup an input we have to add it to html and add a button as well as an h2 that we can insert text into
```html
<body>
  <form>
    <input type="text" id="valueInput">
    <button id="inputButton">Convert</button>
  </form>
  <h2 id="putValueHere"></h2>
  <script type="text/javascript" src="js/main.js"></script>
</body>
```

Now in our js we need to activate our button when their is a click
So we will need to add an event listener
```js
document.getElementById('inputButton').addEventListener('click', buttonAction);
```

Now we have the action we want to do but we don't have the function to do it
So lets make the function
Remember it gets the 'event' object because of the `onClick` action
```js
const buttonAction = (event) => {
}
```

Now we can start doing the instructions from our pseudocode
```js
const buttonAction = (event) => {
  event.preventDefault();
  // 1. Need the value that is in celsius (from input)
  const celsiusVal = document.getElementById('valueInput').value;
  // 2. Convert this value from celsius to fahrenheit
  const fahrenheitVal = (celsiusVal * 1.8) + 32;
  // 3. Output this new converted value to the dom
  document.getElementById('putValueHere').innerText = fahrenheitVal;
}
```

## In Chat: (Review)
What is the best TV show of all time?

## Answer: (Review)
The Bachelor
## Let's Code (Review)
Bachelor Code
Now open the starter code 'class13-materials/bachelor-code'
There are three folders

Open the first one first and view the page
There are three contestants on the page
The goal is to make it so that when you click on 'final rose' claire and sharlene go away and only nicky remains
Edit this so that this happens
```js
document.querySelector('#finalRose').addEventListener('click', /*INSERTCODE*/)

function hide(){
	document.querySelector(/*INSERTCODE*/).style.display = 'none'
	document.querySelector(/*INSERTCODE*/).style.display = 'none'
}
```
First for the event listener we have to plug in the action we want to take (`hide` function)
The we need to plug in the id's of the elements we want to hide
```js
document.querySelector('#finalRose').addEventListener('click', hide);

function hide(){
  document.querySelector('#claire').style.display = 'none'
  document.querySelector('#sharleen').style.display = 'none'
}
```

Now for the second folder this page lists three names
We have the choice over who the next bachelorette should have been

We need to plug in the actions we want to person to show up when their name is clicked
```js
const andi = document.querySelector('#andi')
const claire = document.querySelector('#claire')
const sharleen = document.querySelector('#sharleen')

document.querySelector('#andiNext').addEventListener('click', /*INSERTCODE*/)
document.querySelector('#claireNext').addEventListener('click', /*INSERTCODE*/)
document.querySelector('#sharleenNext').addEventListener('click', /*INSERTCODE*/)

function andiNext(){
	claire.classList.add(/*INSERTCODE*/)
	sharleen.classList.add(/*INSERTCODE*/)
	andi.classList.toggle(/*INSERTCODE*/)
}

function claireNext(){
	/*INSERTCODE*/.classList.add(/*INSERTCODE*/)
	/*INSERTCODE*/.classList.add(/*INSERTCODE*/)
	/*INSERTCODE*/.classList.toggle(/*INSERTCODE*/)
}

function sharleenNext(){
	/*INSERTCODE*/.classList.add(/*INSERTCODE*/)
	/*INSERTCODE*/.classList.add(/*INSERTCODE*/)
	/*INSERTCODE*/.classList.toggle(/*INSERTCODE*/)
}
```
First we have to hook up the event listeners to activate the appropriate functions for each element
```js
document.querySelector('#andiNext').addEventListener('click', andiNext)
document.querySelector('#claireNext').addEventListener('click', claireNext)
document.querySelector('#sharleenNext').addEventListener('click', sharleenNext)
```

Then we have to add/remove the `.hidden` class to these elements within the functions
```js
function andiNext(){
	claire.classList.add('hidden')
  sharleen.classList.add('hidden')
	andi.classList.toggle('hidden')
}

function claireNext(){
  andi.classList.add('hidden')
  sharleen.classList.add('hidden')
  claire.classList.toggle('hidden')
}

function sharleenNext(){
  andi.classList.add('hidden')
  claire.classList.add('hidden')
  sharleen.classList.toggle('hidden')
}
```
Final answer for the second folder:
```js
const andi = document.querySelector('#andi')
const claire = document.querySelector('#claire')
const sharleen = document.querySelector('#sharleen')

document.querySelector('#andiNext').addEventListener('click', andiNext)
document.querySelector('#claireNext').addEventListener('click', claireNext)
document.querySelector('#sharleenNext').addEventListener('click', sharleenNext)

function andiNext(){
	claire.classList.add('hidden')
  sharleen.classList.add('hidden')
	andi.classList.toggle('hidden')
}

function claireNext(){
  andi.classList.add('hidden')
  sharleen.classList.add('hidden')
  claire.classList.toggle('hidden')
}

function sharleenNext(){
  andi.classList.add('hidden')
  claire.classList.add('hidden')
  sharleen.classList.toggle('hidden')
}
```

Now for the third folder
This only displays two names
We want to make it so that if you click nikki then you show her image 
But if you click claire then there is an alert saying "Wrong"
```js
const contestants = document.querySelectorAll(/*INSERTCODE*/)

Array.from(contestants).forEach(element => element.addEventListener('click', /*INSERTCODE*/))

function checkForRose(click){
	if(click.target.classList.contains(/*INSERTCODE*/)){
		document.querySelector('#nikki').classList.toggle(/*INSERTCODE*/)
	}else{
		alert("Wrong!");
	}
}
```

First we need to make sure we are filling the contestants variable with the appropriate elements
We want to select the h2 elements since these will later have an event listener added
Then we need to make sure that a function is being passed in via the event listener
This function and event listener will be applied to both h2 elements in the contestants variable
Then we want to see if the clicked element contains the `.rose` class
Then we want to toggle the `.hidden` class for the element if it does contain the `.rose` class
```js
const contestants = document.querySelectorAll('.contestant')

Array.from(contestants).forEach(element => element.addEventListener('click', checkForRose))

function checkForRose(click){
	if(click.target.classList.contains('rose')){
		document.querySelector('#nikki').classList.toggle('hidden')
	}else{
		alert("Wrong!");
	}
}
```
___ 
## Functions
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

## Let's Code
Simple Functions
See 'class14-materials/simple-functions'
Use this to practice writing functions with parameters and passing arguments to these functions
```js
//create a function that adds two numbers and alerts the sum
//create a function that multiplys three numbers and console logs the product
//create a function that divides two numbers and returns the ???
```

```js
//create a function that adds two numbers and alerts the sum
const add = (num1, num2) => { alert(num1 + num2) };
add(1, 2); //=>3

//create a function that multiplys three numbers and console logs the product
const mult = (num1, num2, num3) => { console.log(num1 * num2 * num3) };
mult(1, 2, 3); // => 6
//create a function that divides two numbers and returns the ???
const div = (num1, num2) => { num1 / num2 };
div(6, 2); // =>3f

const mod = (num1, num2) => { num1 % num2 };
mod(5,2); // =>1
```
## Let's Code
Bring It Home!
## Homework
COMMENT OUT YOUR JS

TYPE IT ALL OUT AGAIN WITHOUT LOOKING

PEAK IF YOU HAVE TOO

REPEAT UNTIL YOU DO NOT HAVE TO PEAK
DELETE YOUR JS ENTIRELY
AND DO IT AGAIN
THEN DO IT AGAIN BUT CHANGE SOMETHING!