# Javascript - The Basics
Slides: https://slides.com/leonnoel/100devs2-javascript-basics
___
## Agenda
Questions? 
Let's Talk -  Baby Learns To Walk?
Learn - What is programming?
Build - Youtube Background Picker
Learn - JS Variables && Types
Build - Not so great calculator
Learn - JS Arithmetic && Conditionals
Build - Angry Parent Simulator 
Build - Temperature Converter 
Homework - Repetition 
## Questions
About last class or life

Tonight it is not important to understand everything
Just hear it and get prepared to learn the things we are covering
We will practice the stuff we cover again in the coming weeks

## Checking In
Like and Retweet the Tweet
!checkin
https://twitter.com/leonnoel/status/1494439359726043141

## Submitting Work
Layouts Homework in codepen.io
Submit URLs here: https://forms.gle/7r1obfquRuih9BEu7

## Baby Learns To Walk?
Half Hard Work and Half Believing You Can Do It
*thanks Vonds

Don't get stressed about not understanding js right away
Babies don't freak out because they can't walk their first try but know that they will be able to do it eventually
Know that you will be able to get it eventually and keep pushing

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

## A computer will do what you tell it to do.
The key rule of programming is that a computer will do what you tell it to
If you tell it to do something wrong it will do it wrong
If you tell it to do it right it will do it correctly
## What is a program?
A program is a set of instructions that you write to tell a computer what to do

## What is a programming?
Programming is the task of writing those instructions in a language that the computer can understand.

Javascript is readable by humans but it does need to be broken down by the browser so that the computer itself can understand it

## Simple Circuit
Imagine a bulb with a wire connected to a battery that connects to the bulb again
```
  ----bulb-----
  |            |
  ---battery---
```
If the circuit is closed then the light is one

If we modify the circuit we could add a switch
```
  ----bulb-----
  |            |
switch         |
  |            |
  ---battery---
```
We can use the switch to open and close the circuit 
When it is open the light is off and when it is closed it is on

We could represent the state of the circuit with 0's and 1's (this is what computers do)
```
0 = circuit off
1 = circuit on
```

What if we added another switch?
```
  ----bulb-----
  |            |
switch       switch
  |            |
  ---battery---
```
How can we represent different states of the switch?
```
switchL off & switchR off = 0
switchL on & switchR off = 0 (circuit is not closed even though one switch is)
switchL on & switchR on = 1
```
This demonstrates the idea of 'and'

We can build these up called 'logic gates' and can build them up to larger amounts of gates and more logic
Doing this is enough is basically how a computer works

We as humans cannot talk in 0's and 1's
We want to talk in a language similar to english that the computer can understand as 0's and 1's

## True Story
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

## JAVASCRIPT
JS is a language that we will use to tell the computer what to do
You don't need to get it tonight
Just take in the concepts and ideas and worry about the execution later
We will go deep on this the next couple classes

## Has a specific 'Syntax'
Syntax: "Spelling and grammar" rules of a programming language.

Remember html and css had a specific syntax we had to use when writing them
JS is the same way

Over the next couple classes we will introduce more and more of the syntax
Really do take care of your hands becaues you will be using characters that you may not normally use on a keyboard
## JS Syntax 
Square brackets - [] used with arrays
Brackets - {} used to hold functions and objects
Less than/greater than - <> Not used like brackets like they are in html instead we use these for logic and comparison
comma and period - ,.
forward slash - / used for division
Question mark - ? called a ternary selector (will cover later)
colon - : also used with ternary operators and other places
Semicolon - ; mark end of line 
single/double quotes/ticks - '' "" `` holds strings
Pipe character - || used to represent or logic
Parenthesis - () holds arguments
asterisk - * multiplication
Double ampersand - && used as and operator
Modulus - % Returns the remainder value from division 23%7 = 2
Bling (dollar sign) - $
Octothorp - #
Not/Bang - ! Used as the not operator
Plus sign - + addition
equal sign - = assignment AND comparison
Tilde - ~ 

## Let's Code
A Youtube Background Picker
This is in the 'class12-materials/background-picker' folder

In index.html we can see that a script tag linking our js
```html
<script type="text/javascript" src="js/main.js"></script>
```

Also open up this main.js file

If we load the index.html file we can see a picture of a chair and a set of colors
If you click each color the background will match it
We have the ability to affect the dom and this is done with js

What is affecting the dom? (Document Object Model)
It means that when we click there are changes taking effect to our page
When we click green the background color is set to the color green
Nothing has changed in any of our files, our css is still the same
However the browser keeps a running file that outlines what the page should look like
When we use inspect we are not seeing html, we are seeing the rendering of the html
What the browser does is read your html and css and paints a picture based on those files
Then it will recreate the html and css structure inside of the developer tools this is called the dom
However we can use js to change how our file is rendered which would change how it appears on the page but doesn't change the content of the css or html
All these changes are shown and represented in the dom

You can see this because if you use the inspect tool to change a heading or something in index.html the files don't change, just the rendering of the files because we changed the dom
When it is rerendered the html and css are reread and rerendered

The cool thing is that we can mess with the dom and make changes to it
JS allows us to do this
We are never actually manipulating the html and css files we have written just how the browser renders them and the dom

Say you have a recipe that is:
1. water
2. salt
3. tofu

If you are cooking something with this recipe and someone throws a tomato in the recipe has not changed just the execution of that recipe
You can go back and remake the recipe
JS is like the person throwing in a tomato
We can refresh and those changes go away and the original recipe is read again

In index.html you will notice that there are three li's in index.html with three ids
1. `#purple`
2. `#green`
3. `#blue`

Now look at our js
We can see the first three lines say
```js
document.getElementById('purple').onclick = partyPurple
document.getElementById('green').onclick = partyGreen
document.getElementById('blue').onclick = partyBlue
```

Our page itself is the document
We are saying "Look at the document and find something with the id of purple"
Then when you click on it run this set of instructions
We name those intructions
1. `partyPurple`
2. `partyGreen`
3. `partyBlue`

Below are three functions with these names
```js
function partyPurple() {
  document.querySelector('body').style.backgroundColor = 'rgba(241,63,247,1)'
  document.querySelector('body').style.color = 'white'
}

function partyGreen() {
  document.querySelector('body').style.backgroundColor = 'rgba(0,253,81,1)'
  document.querySelector('body').style.color = 'white'
}

function partyBlue() {
  document.querySelector('body').style.backgroundColor = 'rgba(0,254,255)'
  document.querySelector('body').style.color = 'white'
}
```
So when one of these instructions are run we can see what it says to do
It says "in the document find the 'body' tag and give it a background color"
Then it says "find the 'body' tag again and change the text color to white"

We call the first three lines are called event listeners, the event we are listening for is a click
```js
document.getElementById('purple').onclick = partyPurple
document.getElementById('green').onclick = partyGreen
document.getElementById('blue').onclick = partyBlue
```
Think of them as smurfs who wait on that item in the page
When the click happens the smurf executes the function that we assigned to the listener
So the instructions that are assigned are run and the background/color is changed

We have three different smurfs each of them will listen for a click on their assigned element and execute the instructions assigned to them

For homework: come back to this code and add another smurf to add another instruction
You will need to add another li, event listener, and function
Then delete it and redo it a few times

## Variables
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

## Variable Conventions
There is a convention you use when naming variables
Usually this is called camel case
camelCase:
```js
let numberOfApples = 9
```
You can see that the very first word is lowercase and each word after is capitalized


## Variables & Data Types
What can you store in variables?
Variables can hold all kinds of different data
So far we have seen two types: strings and numbers

Strings are just a piece of text
Numbers are of course numbers

## Strings
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

## Strings
Other than escaping there are a few other things we can do
New Line + Tabs:
```js
"1. Preheat over to 350\n2. Grease the pan"
'\tBeginning of paragraph'
```
🚨 WARNING 🚨
This is more of a job for css but is good to know
## Numbers
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
## Arithmetic In Javascript
```
Operator | Meaning        | example
+        |  addition      | 8 + 10
-        |  subtraction   | 10-8
*        |  multiplication| 12 * 2
/        |  division      | 10/5
%        |  Modulus       | 10 % 6 = 4
```

One good use of the modulus symbol is to determine if a number is even or odd

## Let's Code
A not so great calculator
use 'class12-materials/simple-calculator'

If you run index.html you can see a few boxes
If you click 0 the result resets
If you click +3 it increments by three, +9 by 9, and -2 will subtract 2
Before we even look at the js file we know that there are 4 event listeners since there are four actions
In index we can see four li's
```html
<ul>
  <li id="pumpkin">0</li>
  <li id="dominosPizza">+3</li>
  <li id="zebra">+9</li>
  <li id="cantThinkOfAnything">-2</li>
</ul>
```
We can use these id's to target these li's with javascript

In main.js we can see these event listeners
```js
document.querySelector('#pumpkin').addEventListener('click', makeZero)
document.querySelector('#dominosPizza').addEventListener('click', jumanji)
document.querySelector('#zebra').addEventListener('click', add9)
document.querySelector('#cantThinkOfAnything').addEventListener('click', sub2)
```
We are looking in the dom for id's and when those elements are clicked we are running one of four instructions (functions)
1. `makeZero`
2. `jumanji`
3. `add9`
4. `sub2`

The only difference to the event listeners in the previous example is that those were `onClick` actions on `addEventListener`
`addEventListener` actually has other actions that we could use that aren't just click like 'mouseenter' or 'mouseleave' 

During each of these instructions we are re-assigning the value of `total` (which is assigned to 0 at the top of the js document)
Each instruction will reset, add, or subtract from that total amount
```js
let total = 0;

...eventListeners

function makeZero() {
  total = 0
  ...
}
function jumanji() {
  total = total + 3
  ...
}

function add9() {
  total = total + 9
  ...
}

function sub2() {
  total = total - 2
  ...
}
```

Then after we have re-assigned the value of total with a new amount
We can use the old value with some math to update the new value
```js
total = total - 2 // 3 = 5 - 2; total now === 3
```
We can also do this a few other ways too
```js
total += 5 // total = total + 5
```

Next we use `.querySelector` just like we do with event listeners to select an element
Then we use `.innerText` to set the value of total to that inner text
```js
function makeZero() {
  total = 0
  document.querySelector('#placeToPutResult').innerText = total
}

function jumanji() {
  total = total + 3
  document.querySelector('#placeToPutResult').innerText = total
}

function add9() {
  total = total + 9
  document.querySelector('#placeToPutResult').innerHTML = total
}

function sub2() {
  total = total - 2
  document.querySelector('#placeToPutResult').innerHTML = total
}
```

Lets walk through clicking +3
First the query selector is activated because it heard the click
When this is done the `jumanji` function is run
The jumanji function takes the total, adds three to it, and updates the total with this new value
Then an element is targetted and we change the inner text of that element to be the value of the total that was just calculated

## Making Decisions
We can make decisions based on whether something is either TRUE or FALSE 
If you are greater than 18 you are an adult
```js
if (age > 18){
  console.log("You are an adult")
}
```
In order to do make decisions we need to know how to make comparisons

## Comparisons:
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
## Logical Operators
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
## Conditional Syntax
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
## 🚨 DANGER 🚨
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

## Multiple Conditions
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
See 'class12-materials/class-weekend-boring'
If you open index.html there is a form 
It has an input and a button

We want to accept that input and when check is clicked see if it is a classday, weekend, or a boring day
First we will need an event listener in main.js and a set of instructions
It will need to get the value from the input
Then check that value and use conditional logic to output something based on that value
If the input is tuesday or thursday it will be class
If it is saturday or sunday that is weekend
any other day is boring
```js
// Event listener on button
// executes when button is clicked and runs 'check' function
document.querySelector('#check').addEventListener('click', check)

// runs when button is clicked
function check() {
  // Get value from input field
  const day = document.querySelector('#day').value
  //Conditionals go here
}
```

Now we can use conditionals to check the value of `day` and output something
Let's write the if statements
We just want to check the value of day (and convert it to uppercase), see if it matches a day of the week and console log out something if true
Notice that we don't need to check days of the week for boring since those are the only remaining days
Also notice that we used `.toUpperCase` to convert the input we received so we KNOW it will match the string we are checking for
```js
if (day.toUpperCase() === "SATURDAY" || day.toUpperCase() === "SUNDAY") {
  alert("weekend")
} else if (day.toUpperCase() === "TUESDAY" || day.toUpperCase() === "THURSDAY") {
  alert("class")
}else {
  alert("boring")
}
```
For homework: instead of an alert put the response in the dom somewhere
## Let's Code
Angry Parent Simulator
## Pseudo Code
## Let's Code
A Temperature Converter
## Homework
Do: Plan out your networking!

Read: https://javascript.info/variables + Tasks

Read: https://javascript.info/function-basics + Tasks

Do: Delete the JS and do it again for all assignments  
    Redo youtube background picker and add another color
    Redo simple calculator and math function
    Put message from week in dom and work with any case

Do: Something special for yourself this weekend