# Javascript - Arrays
Slides: https://slides.com/leonnoel/100devs2-javascript-arrays
(Classes 17 & 18 were networking/working with other #100Devs students and had no notes or materials)
___

## Agenda
Questions? 
Let's Talk -  #100Devs
Review - Functions && Loops
Learn - Arrays
Learn - Array Iteration
Learn - Array Methods
Homework - Objects

## Questions
About last class or life

## Checking In
https://twitter.com/leonnoel/status/1503846066055118849
Like and Retweet the Tweet
!checkin

## Want to be fancy?
Best Clip Get's Special Color On Discord!

## Submitting Work

I WANT IT
Homework: https://forms.gle/PLuuSi7aHeL7wbMQ9

## Networking

3 Individuals Already In Tech
2 Coffee Chats

## USE THE SHEET!

Networking Google Sheet
## Coding Challenges
Daily
Codewars 8kyu Fundamentals

## Paid Client
Due by Mar. 31st

## TURN IT UP!
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

## Loops - While (Review)
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
Bring It On - All Or Nothing!

## Arrays
What are arrays?

## Toasters
## Arrays
- A data structure to store ordered collections!
- Array elements are numbered starting with zero
- Arrays have many methods to manage the order of elements
- Can be created by a constructor or literal notation

## Declaring Arrays
```js
let newArr = new Array()
```
Array Constructor

## Declaring Arrays
```js
let newArr = []
```
Literal Notation

## Declaring Arrays
```js
newArr = ['Zebra',true,21]
```
Arrays are populated with elements
Elements can be of any type

## Declaring Arrays
🚨Empty spaces leave an empty element 🚨

## Array Indexing
```js
newArr = ['Zebra',,true,21]

console.log( newArr[0] )  //Zebra
console.log( newArr[1] )  //undefined
console.log( newArr[2] )  //true
console.log( newArr[3] )  //21
```
Elements can be accessed by their index numbers

## Array Indexing
```js
newArr = ['Zebra',,true,21]

newArr[1] = 'Bob'

console.log( newArr )  

// ['Zebra','Bob',true,21]

```
Elements can be updated by using the index at that position

## Array Indexing
```js
let cars = ['Honda', 'Toyota', 'Ford', 'Tesla']
let nums = [1,2,3]
cars = nums
console.log( cars ) //[1,2,3]
```
You can overwrite whole arrays by assigning an array to a different array

## Array Length
```js
console.log( newArr.length ) //4
```
How do you determine how many elements are in your array?

## Let's Code
Array Dat - In It To Win It

## Array Iteration
```js
let bestColors = ['green','blue','yellow','black']

for(let i = 0; i < bestColors.length;i++){
  console.log( bestColors[i] )
}
```
Iterates through an array passing in the value and index of each element 

## Array Iteration
```js
let bestColors = ['green','blue','yellow','black']

bestColors.forEach((x,i)=> console.log(x))
```
Iterates through an array passing in the value and index of each element 

## Let's Code
Array Dat - Fight To The Finish

## Other Arrays Methods
```js
let bestRappers2020 = ['6ix9ine','Polo G','6ix9ine']

let removed = bestRappers2020.shift()

console.log( bestRappers2020 ) // ['Polo G', '6ix9ine']

```
Remove item from the beginning of an Array

## Other Arrays Methods
```js
let bestRappers2020 = ['Polo G','6ix9ine']

let removedAgain = bestRappers2020.pop()

console.log( bestRappers2020 ) // ['Polo G']

```
Remove item from the end of an Array

## Other Arrays Methods
```js
let bestRappers2020 = ['Polo G']

let removed = bestRappers2020.unshift('Dylan')

console.log( bestRappers2020 ) // ['Dylan','Polo G']

```
Add item to the beginning of an Array

## Other Arrays Methods
```js
let bestRappers2020 = ['Dylan','Polo G']

let removed = bestRappers2020.push('Dylan')

console.log( bestRappers2020 ) // ['Dylan','Polo G','Dylan']

```
Add item to the end of an Array 

## Other Arrays Methods
```js
let bestRappers2020 = ['Dylan','Polo G','Dylan']

let bestRappersAllTime = bestRappers2020.map(x => 'Dylan')

bestRappersAllTime.unshift('Dylan')
  
bestRappersAllTime.push('Dylan')

console.log( bestRappersAllTime ) 

// ['Dylan','Dylan','Dylan', 'Dylan', 'Dylan']

```

## Let's Code
Array Dat - Worldwide Cheersmack

## Homework
Read: JSWay Arrays
Read: https://javascript.info/array-methods
Read: JSWay Objects
Read: https://eloquentjavascript.net/04_data.html
Do: Minimum of 1 https://codewars.com 8 Kyu Fundamentals Track EVERY DAY - 20 mins then look at solution!
Do: https://javascript30.com Day 04 Array Cardio (super hard, do it on Discord together)
