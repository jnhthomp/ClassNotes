# Javascript - More Basics
Slides: https://slides.com/leonnoel/100devs2-javascript-more-basics
___
## Agenda
Questions? 
Let's Talk -  Imposter Syndrome
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
https://twitter.com/leonnoel/status/1496251214304264193
Like and Retweet the Tweet
!checkin

## Submitting Work

 Share What JS You Added in codepen.io
Submit URLs here: https://forms.gle/G7LhHnyTA7zYq7UV6

Networking

2 Individuals Already In Tech
Push? 1 Coffee Chat
Imposter Syndrome

The Golden Rule
SEPERATION OF CONCERNS
HTML = Content / Structure
CSS = Style
JS = Behavior / Interaction


## Submitting Work

 Share What JS You Added in codepen.io
Submit URLs here: https://forms.gle/G7LhHnyTA7zYq7UV6

Networking

2 Individuals Already In Tech
Push? 1 Coffee Chat
Imposter Syndrome

The Golden Rule
SEPERATION OF CONCERNS
HTML = Content / Structure
CSS = Style
JS = Behavior / Interaction


## Imposter Syndrome
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

## Programming
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
## Let's Code
Class, Weekend, or Boring Day?
## Let's Code
Angry Parent Simulator
## Pseudo Code
## Let's Code
A Temperature Converter
## In Chat:
What is the best TV show of all time?
## Answer:
The Bachelor
## Let's Code
Bachelor Code
## Functions
What are functions?
## Functions
Functions are simple sets of instructions!
They form the basic "building blocks" of a program
## Functions
```js
function name(parameters){
  //body
}

//call
name(arguments)
```

```js
Functions
function yell(word){
  alert(word)
}


yell("HELLO")
```

## Let's Code
Simple Functions
## Let's Code
Bring It Home!
## Homework
Read: https://javascript.info/function-expressions + Tasks 

Read: https://javascript.info/arrow-functions-basics + Tasks

Read:https://github.com/thejsway/thejsway/blob/master/manuscript/chapter04.md

Do: Delete the JS and do it again for all assignments
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
## 
