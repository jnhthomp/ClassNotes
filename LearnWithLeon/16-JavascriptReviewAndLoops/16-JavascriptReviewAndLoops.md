# Javascript - Review & Loops
Slides: https://slides.com/leonnoel/100devs2-js-review-loops
___

## Agenda
Questions? 
Let's Talk -  Next Week
Review - Pseudo Code
Review - Variables
Review - Conditionals
Review - Functions
Learn - Loops
Homework - Work During Break

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1499512575393820677
Like and Retweet the Tweet
!checkin

## Submitting Work
Share What JS You Added in codepen.io
Submit URLs here: https://forms.gle/G7LhHnyTA7zYq7UV6

## Thinking by Walter D Wintle
https://allpoetry.com/poem/8624439-Thinking-by-Walter-D-Wintle

## Javascript Should NOT Make Sense YET
## You Should Still Struggle With CSS
## You Should Still Stumble Choosing HTML Tags
## THIS IS ALL NORMAL YOU CAN AND WILL DO THIS

## But What About Freelancing?
How are you supposed to freelance if this doesn't make sense?
When there is money and a client on the line you gone learn today

## I'm NOT GOING TO
TEXT YOU, CALL YOU, EMAIL YOU OUTSIDE OF THE NEWSLETTER, DM YOU ON TWITTER OR DISCORD, Or EVER ASK YOU FOR MONEY!

## There Are No Other 100Devs Classes or Teachers 
But We Have An Amazing Stream Team
https://www.twitch.tv/thedabolical

https://www.twitch.tv/oldcoderchick

And Amazing Folx on Discord

Shout Out @Mayanwolfe

30+ Alumni Mentors!

## Stream Team Assemble
https://forms.gle/LcnfRn6NMJqbto6q6

## Please Be Kind

## Want to be fancy?
Best Clip Get's Special Color On Discord!

## The Winner Is: 
Nikolaus#1985
https://clips.twitch.tv/PhilanthropicFineCurryGingerPower-skaxA9MSCde-XOrU

## What's Next?

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

## Let's Code
Variable Fun Time
use 'class16-materials/variable-fun-time' and follow the instructions in the js file
Give yourself 5 minutes and get through as many as you can
```js
//--- Easy
//create a variable and assign it a number

//minus 10 from that number

//print that number to the console

//--- Medium
//create a variable that holds a value from the input

//add 25 to that number

//alert that number

//--- Hard
//create a variable that holds the h1


//add an event listener to that element that console logs the sum of the two previous variables

```

For the solutions:
easy:
```js
//--- Easy
//create a variable and assign it a number
let num = 5
//minus 10 from that number
num -= 10;
//print that number to the console
console.log(num);
```

medium:
```js
//--- Medium
//create a variable that holds a value from the input
let inputVal = document.getElementById('danceDanceRevolution').value;
//add 25 to that number
inputVal = +inputVal + 25 // convert inputVal to number with '+' in front
//alert that number
alert(inputVal);
```

hard:
```js
//--- Hard
//create a variable that holds the h1
const header = document.querySelector('h1');

//add an event listener to that element that console logs the sum of the two previous variables
header.addEventListener('click', () => console.log(+num + +inputVal));
```
Notice that there is an anonymous arrow function that runs console log
That is because if you just put console log in with the arguments it will execute as soon as the page loads
To prevent this we put it in a function and that function only runs when the element is clicked

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
Age Checker
This is in 'class16-materials/age-checker'
```js
//Create a conditonal that checks their age
//If under 16, tell them they can not drive
//If under 18, tell them they can't hate from outside the club, because they can't even get in
//If under 21, tell them they can not drink
//If under 25, tell them they can not rent cars affordably
//If under 30, tell them they can not rent fancy cars affordably
//If under over 30, tell them there is nothing left to look forward too


//--- Harder
//On click of the h1
//Take the value from the input
//Place the result of the conditional in the paragraph
```
Give yourself 5 minutes to complete the tasks
There are a couple of ways to approach this, especially the 'harder' part
```js
function checkAge(age){
  let message
  //Create a conditonal that checks their age
  if (age < 16) {//If under 16, tell them they can not drive
    message  = 'You cannot drive'
    console.log(message);
    return message;
  } else if (age < 18) { //If under 18, tell them they can't hate from outside the club, because they can't even get in
    message = 'You can\'t hate from outside the club, you can\'t even get in';
    console.log(message);
    return message;
  } else if (age < 21) { //If under 21, tell them they can not drink
    message = 'You cannot drink';
    console.log(message);
    return message;
  } else if (age < 25) { //If under 25, tell them they can not rent cars affordably
    message = 'You cannot rent cars affordable';
    console.log(message);
    return message;
  } else if (age < 30) { //If under 30, tell them they can not rent fancy cars affordably
    message = 'You cannot rent fancy cars affordably';
    console.log(message);
    return message;
  } else { //If under over 30, tell them there is nothing left to look forward too
    message = 'There is nothing left to look forward to';
    console.log(message);
    return message;
  }
}




//--- Harder
//On click of the h1
//Take the value from the input
//Place the result of the conditional in the paragraph
document.querySelector('h1').addEventListener('click', runCheckAge);

function runCheckAge() {
  inputVal = document.getElementById('danceDanceRevolution').value
  document.querySelector('p').innerText = checkAge(+inputVal);
}
```

## In Chat: (Review)
What is the best TV show of all time?

## Answer: (Review)
The Bachelor

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
see 'class16-materials/simple-functions'
Give yourself 5 minutes
```js
//---Easy
//create a function that subtracts two numbers and alerts the difference

//create a function that divides three numbers and console logs the quotient

//create a function that multiplys three numbers and returns the product

//---Medium
//create a function that takes in three numbers. Add the first two numbers and return the remainder of dividing the sum of the first two numbers by the third number

//---Hard
//create a function that takes in 4 numbers. Multiply the first two numbers. If the product is greater than 100 add the sum of the last two numbers and console log the value. If the product is less that 100, subtract the difference of the last two numbers and console log the value. If the product is 100, multiply the first three numbers together and alert the remainder of dividing the fourth number
```
Solution:
```js
//---Easy
//create a function that subtracts two numbers and alerts the difference
const subtract = (a, b) => { alert(a - b) }
// subtract(50, 30); // alerts 20
// subtract(100,33); // alerts 67

//create a function that divides three numbers and console logs the quotient
const div = (a, b, c) => { console.log(a/b/c) }
// div(12, 4, 3) // logs=>1


//create a function that multiplys three numbers and returns the product
const mult = (a, b, c) => a * b * c
// console.log(mult(5, 10, 2)); //=>100

//---Medium
//create a function that takes in three numbers. 
//Add the first two numbers and return 
// the remainder of dividing the sum of the first two numbers by the third number
const med = (a, b, c) => ((a + b) % c)
console.log(med(5, 2, 3)) //=> 1

//---Hard
//create a function that takes in 4 numbers. 
// Multiply the first two numbers. 
// If the product is greater than 100 add the sum of the last two numbers 
//and console log the value. If the product is less that 100, 
//subtract the difference of the last two numbers and console log the value. 
//If the product is 100, multiply the first three numbers together 
// and alert the remainder of dividing the fourth number
const hard = (a, b, c, d) => { 
  if((a * b) > 100){
    console.log((a * b) + c + d)
  } else if ((a * b) < 100){
    console.log(c -d);
  } else if ((a * b) === 100){
    alert((a * b * c)% d);
  }
}
```

## Loops
What are loops?
- Repeat an action some number of times!
- Three main types of loops in Javascript
- For, while, and do while loops
- Each type offers a different way to determine the start and end points of a loop

## Loops - For
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
21 Savage Loop

See 'class16-materials/sir-savage-the-21st'
Give yourself 2 minutes
```js
//Create a function that has a loop that prints '21' 21 times to the console and then call that function
//Bonus can you make it print '21' 21 times to the dom?
```

Solution:
```js
//Create a function that has a loop that prints '21' 21 times to the console and then call that function
//Bonus can you make it print '21' 21 times to the dom?
const savage = () => { 
  for(let i = 1; i <= 21; i++){
    console.log(21)
    document.getElementById('savageSays').innerHTML += '21';
  }
}
savage();
```

## Loops - While
There are other types of loops
Don't worry about it too much, just know they exist
We will practice them more later

```js
let count = 0 

while(count < 5){
  console.log(count)
  count++
}
```
Be careful with these as they are easier to get stuck in an infinite loop

## Let's Code
Stop Night Snacking

See 'class16-materials/stop-snacking'
```js
//Create a function that grabs the number of snacks from the input
// and tells you to stop that many times
```
```js
//Create a function that grabs the number of snacks from the input
// and tells you to stop that many times
const stopSnack = () => { 
  let num = Number(document.querySelector('input').value)
  document.getElementById('stops').innerText = ''; // clear prev stop msg
  for(let i = 1; i <= num; i++){
    document.getElementById('stops').innerText += ' STOP!';
  }
}

document.getElementById('help').addEventListener('click', stopSnack);
```

## Let's Code
Bring It On!

See 'class16-materials/bring-it-on'
Give yourself 5 minutes and try to get as much done as you can
```js
// Create a variable and console log the value

// Create a variable, add 10 to it, and alert the value


// *Functions*
// Create a function that subtracts 4 numbers and alerts the difference

// Create a function that divides one number by another 
// and returns the remainder

// *Conditionals*
// Create a function that adds two numbers and 
// if the sum is greater than 50 alert Jumanji

// Create a function that multiplys three numbers and 
// if the product is divisible by 3 alert ZEBRA


//*Loops*
//Create a function that takes in a word and a number. 
//Console log the word x times where x was the number passed in

```

Solutions:
```js
// *Variables*
// Create a variable and console log the value
let num = 5;
console.log(num);
// Create a variable, add 10 to it, and alert the value
let num2 = 10;
alert(num += 10);

// *Functions*
// Create a function that subtracts 4 numbers and alerts the difference
const sub4nums = (a, b, c, d) => { alert(a - b - c - d) }
// Create a function that divides one number by another 
// and returns the remainder
const findRemainder = (a, b) => a % b
// *Conditionals*
// Create a function that adds two numbers and 
// if the sum is greater than 50 alert Jumanji
const add2nums = (a, b) => { 
  if(a + b > 50){
    alert(jumanji)
  }
}  
// Create a function that multiplys three numbers and 
// if the product is divisible by 3 alert ZEBRA
const mult3nums = (a, b, c) => { 
  if(a * b * c % 3 === 0){
    alert('ZEBRA');
  }
}

//*Loops*
//Create a function that takes in a word and a number. 
//Console log the word x times where x was the number passed in
const wordAndNum = (word, num) => { 
  for(let i = 1; i <= num; i++){
    console.log(word);
  }
}
```

## Let's Code
Bring It On Again!
See 'class16-materials/bring-it-on-again'

Give yourself 5 minutes and try to get as much done as you can
```js
// *Variables*
// Declare a variable, assign it a value, and alert the value

// Create a variable, divide it by 10, and console log the value

// *Functions*
// Create a function that multiplys 3 numbers and alerts the product

// Create a function that takes in 4 numbers. Add the first two numbers and subtract the next two. Console log the result

// *Conditionals*
// Create a function that takes in 3 numbers. Starting with 100 add the first number, subtract the second, and divide the third. If the value is greater then 25, console log "WE HAVE A WINNNA"

// Create a function that takes in a day of the week. If it is a weekend alert, "weekend" and if not alert "week day". Handle capitilization and if the user does not enter a day of the week alert "Try again!"

//*Loops*
//Create a function that takes in a number. Console log all values from 1 to that number or greater, but count by 3

```
```js
// *Variables*
// Declare a variable, assign it a value, and alert the value
let num = 5
alert(num);

// Create a variable, divide it by 10, and console log the value
let num2 = 100
console.log(num2/10);

// *Functions*
// Create a function that multiplys 3 numbers and alerts the product
const mult = (a, b, c) => { alert(a * b * c) }

// Create a function that takes in 4 numbers. 
// Add the first two numbers and subtract the next two. 
// Console log the result
const take4num = (a, b, c, d) => { console.log((a + b) -c - d) }

// *Conditionals*
// Create a function that takes in 3 numbers. 
// Starting with 100 add the first number, subtract the second, 
// and divide the third. 
// If the value is greater then 25, console log "WE HAVE A WINNNA"
const takes3num = (a, b, c) => { 
  let result = ((100 + a - b) / c);
  if(result > 25){
    console.log('WE HAVE A WINNA');
  }  
}

// Create a function that takes in a day of the week. 
// If it is a weekend alert, "weekend" and if not alert "week day". 
// Handle capitilization 
// and if the user does not enter a day of the week alert "Try again!"
const takeDOTW = (day) => { 
  if(day.toLowerCase === 'saturday' || day.toLowerCase === 'sunday'){
    alert('weekend');
  } else if (day.toLowerCase === 'monday' || day.toLowerCase === 'tuesday' || day.toLowerCase === 'wednesday' || day.toLowerCase === 'thursday' || day.toLowerCase === 'friday'){
    alert('weekday');
  } else {
    alert('try again');
  }
}

//*Loops*
//Create a function that takes in a number. 
// Console log all values from 1 to that number or greater, but count by 3
const takeNum = (num) => { 
  for(let i = 1; i <= num; i + 3){
    console.log(i);
  }
}
```
## Homework
On Discord, you have more than a week!
Homework (Due Tuesday - Mar. 15th):
Read - https://www.poetryfoundation.org/poems/51642/invictus
Read - https://github.com/bpesquet/thejsway (3, 2, 1... Code! through Write Functions)
Read - http://eloquentjavascript.net/3rd_edition/ (Chapters 1 - 3)
Do - https://www.codecademy.com/learn/introduction-to-javascript (1-6)
Watch - https://youtu.be/SWYqp7iY_Tc
Extra Reading: https://jwiegley.github.io/git-from-the-bottom-up/
Don't Do - Play yo self - start early even though you have more than a week because this is a lot and very important

Office Hours - Sunday 1pm ET