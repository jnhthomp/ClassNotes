# Due 3/22
COMPLETE: JSWay Arrays (https://github.com/thejsway/thejsway/blob/master/manuscript/chapter07.md)
```js
// Musketeers
// Write a program that:
//  -Creates an array named musketeers containing values "Athos", "Porthos" and "Aramis".
const musketeers = ['Athos', 'Porthos', 'Aramis'];
//  -Shows each array element using a for loop.
for(let i=0; i < musketeers.length; i++ ){
  console.log(musketeers[i]);
}

//  -Adds the "D'Artagnan" value to the array.
musketeers.push('D\'Artagnan');
//  -Shows each array element using the forEach() method.
musketeers.forEach((one) => { console.log(one) })

//  -Remove poor Aramis.
musketeers.splice(2, 1);
//  -Shows each array element using a for-of loop.
for(const one of musketeers){
  console.log(one);
}

// Sum of values
// Write a program that creates the following array, 
const values = [3, 11, 7, 2, 9, 10];
// then calculates and shows the sum of its values(42 in that case).
let sum = 0;
values.forEach((el) => { sum += el });
console.log(sum) //=> 42

// Array maximum
// Write a program that creates the following array, 
const values = [3, 11, 7, 2, 9, 10];
// then calculates and shows the array's maximum value.

// (Cheating way without loops and spread operator)
console.log(Math.max(...values));

// Not cheating way
let high = values[0];
values.forEach((el) => {
  high = (el > high ? el : high);
})
console.log(high);

// List of words
// Write a program that asks the user for a word until the user types "stop".
// The program then shows each of these words, except "stop".

// Option 1
let wordList = [];
while(wordList[wordList.length - 1] !== 'stop'){
  wordList.push(prompt('Enter a word (stop to stop)'));
}

wordList.pop();
console.log(wordList);

// Option 2
wordList = [];
let shouldStop = false
while(!shouldStop){
  let newWord = prompt('Enter a word (stop to stop)');
  if(newWord === 'stop'){
    shouldStop = true
  } else {
    wordList.push(newWord);
  }
}

console.log(wordList);
```
Read: https://javascript.info/array-methods
```js

// Translate border-left-width to borderLeftWidth
// importance: 5
// Write the function camelize(str) that changes dash-separated words like “my-short-string” into camel-cased “myShortString”.
// That is: removes all dashes, each word after dash becomes uppercased.
// Examples:
console.log(camelize("background-color")) //== 'backgroundColor';
console.log(camelize("list-style-image")) //== 'listStyleImage';
console.log(camelize("-webkit-transition")) //== 'WebkitTransition';
// P.S. Hint: use split to split the string into an array, 
// transform it and join back.

function camelize(str) {
  // Remove dashes and make an array of letters
  let strSplit = str.split('');
  
  // Map through each and if the previous letter was a dash transform it to upperacse
  strSplit = strSplit.map((el, index) => { 
    if(strSplit[index - 1] === '-'){
      return el.toUpperCase();
    }
    return el;
  })

  // Filter array to remove dashes
  strSplit = strSplit.filter((el) => el !== '-');
  
  // Make array string again and return
  return strSplit.join('');
}




//_______________
// Filter range
// importance: 4
// Write a function filterRange(arr, a, b) that gets an array arr, 
// looks for elements with values higher or equal to a 
// and lower or equal to b and return a result as an array.

// The function should not modify the array.
// It should return the new array.

// For instance:
let arr = [5, 3, 8, 1];
let filtered = filterRange(arr, 1, 4);

alert(filtered); // 3,1 (matching values)
alert(arr); // 5,3,8,1 (not modified)

function filterRange(arr, a, b) {
  return arr.filter((el) => el >= a && el <= b);
}




//_______________
// Filter range "in place"
// importance: 4
// Write a function filterRangeInPlace(arr, a, b)that gets an array arr 
// and removes from it all values except those that 
// are between a and b.
// The test is: a ≤ arr[i] ≤ b.
// The function should only modify the array.It should not return anything.

// For instance:
let arr = [5, 3, 8, 1];

filterRangeInPlace(arr, 1, 4); // removed the numbers except from 1 to 4

alert(arr); // [3, 1]

function filterRangeInPlace(arr, a, b) {
  arr.forEach((el, i, a) => { 
    if(!(el >= a) && !(el <= b)){
      a.splice(i, 1)
    }
  })
}




//_______________
// Sort in decreasing order
// importance: 4
let arr = [5, 2, 1, -10, 8];

// ... your code to sort it in decreasing order
// each sort returns a calculated number 
// opposite of a (2nd number being compared) - opposite of b (first number)
// if the result is negative then a was larger and negative returns behind
// if the result is positive then a is smaller and returns before b
arr.sort((a, b) => -a - -b)
alert(arr); // 8, 5, 2, 1, -10




//_______________
// Copy and sort array
// importance: 5
// We have an array of strings (arr).
// We’d like to have a sorted copy of it, 
// but keep arr unmodified.
// Create a function copySorted(arr) that returns such a copy.

let arr = ["HTML", "JavaScript", "CSS"];

const copySorted = (arr) => { 
  return arr.slice().sort();
  // Alternative to array.slice
  //let newArr = [...arr];
  //return newArr.sort();
}

let sorted = copySorted(arr);

alert(sorted); // CSS, HTML, JavaScript
alert(arr); // HTML, JavaScript, CSS (no changes)




//_______________
// NOT COMPLETE
🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨
//Create an extendable calculator
//importance: 5
//Create a constructor function Calculator that creates “extendable” calculator //objects.
//
//The task consists of two parts.
//
//First, implement the method calculate(str) that takes a string like "1 + 2" //in the format “NUMBER operator NUMBER” (space-delimited) and returns the //result. Should understand plus + and minus -.
//
//Usage example:
//
//let calc = new Calculator;
//
//alert( calc.calculate("3 + 7") ); // 10
//Then add the method addMethod(name, func) that teaches the calculator a new //operation. It takes the operator name and the two-argument function func(a,b) //that implements it.
//
//For instance, let’s add the multiplication *, division / and power **:
//
//let powerCalc = new Calculator;
//powerCalc.addMethod("*", (a, b) => a * b);
//powerCalc.addMethod("/", (a, b) => a / b);
//powerCalc.addMethod("**", (a, b) => a ** b);
//
//let result = powerCalc.calculate("2 ** 3");
//alert( result ); // 8
//No parentheses or complex expressions in this task.
//The numbers and the operator are delimited with exactly one space.
//There may be error handling if you’d like to add it.




//_______________
// Map to names
// importance: 5
// You have an array of user objects, 
// each one has user.name.
// Write the code that converts it into an array of names.

// For instance:
let john = { name: "John", age: 25 };
let pete = { name: "Pete", age: 30 };
let mary = { name: "Mary", age: 28 };

let users = [john, pete, mary];

/* ... your code */
let names = users.map((el) => el.name)

alert(names); // John, Pete, Mary




//_______________
// Map to objects
// importance: 5
// You have an array of user objects, each one has name, surname and id.
// Write the code to create another array from it, 
// of objects with id and fullName, 
// where fullName is generated from name and surname.

// For instance:
let john = { name: "John", surname: "Smith", id: 1 };
let pete = { name: "Pete", surname: "Hunt", id: 2 };
let mary = { name: "Mary", surname: "Key", id: 3 };

let users = [john, pete, mary];

/* ... your code ... */
let usersMapped = users.map((user) => {
  return { fullName: `${user.name} ${user.surname}`, id: user.id}
})

  /*
  usersMapped = [
    { fullName: "John Smith", id: 1 },
    { fullName: "Pete Hunt", id: 2 },
    { fullName: "Mary Key", id: 3 }
  ]
  */

alert(usersMapped[0].id) // 1
alert(usersMapped[0].fullName) // John Smith
// So, actually you need to map one array of objects to another.
// Try using => here.
// There’s a small catch.




//_______________
// Sort users by age
// importance: 5
// Write the function sortByAge(users) that gets an array of objects with the age property and sorts them by age.

// For instance:
let john = { name: "John", age: 25 };
let pete = { name: "Pete", age: 30 };
let mary = { name: "Mary", age: 28 };

let arr = [pete, john, mary];

const sortByAge = (arr) => { 
  arr.sort((a, b) => a.age - b.age)
}

sortByAge(arr);

// now: [john, mary, pete]
alert(arr[0].name); // John
alert(arr[1].name); // Mary
alert(arr[2].name); // Pete




//_______________
// Shuffle an array
// importance: 3
// Write the function shuffle(array) that shuffles(randomly reorders) elements of the array.
// Multiple runs of shuffle may lead to different orders of elements.
// For instance:

let arr = [1, 2, 3];

console.log(shuffle(arr));
// arr = [3, 2, 1]

console.log(shuffle(arr));
// arr = [2, 1, 3]

console.log(shuffle(arr));
// arr = [3, 1, 2]
// ...
// All element orders should have an equal probability.
// For instance, [1, 2, 3] can be reordered 
//  as [1, 2, 3] or [1, 3, 2] or [3, 1, 2] etc, 
// with equal probability of each case.

function shuffle(arr) {
  arr.sort((a, b) => { 
  let test = Math.floor(Math.random() * 2)
    if(test === 0){
      return -1
    } else{
      return 1
    }
  })

  return arr;  
}




//_______________
// Get average age
// importance: 4
// Write the function getAverageAge(users) 
// that gets an array of objects with property age 
// and returns the average age.
// The formula for the average is(age1 + age2 + ... + ageN) / N.
// For instance:

let john = { name: "John", age: 25 };
let pete = { name: "Pete", age: 30 };
let mary = { name: "Mary", age: 29 };

let arr = [john, pete, mary];

alert(getAverageAge(arr)); // (25 + 30 + 29) / 3 = 28

function getAverageAge(arr) {
  let sum = 0;
  arr.forEach(el => sum += el.age);
  return sum / arr.length;
}




//_______________
// Filter unique array members
// importance: 4
// Let arr be an array.

// Create a function unique(arr) that should return an array 
// with unique items of arr.
// For instance:

function unique(arr) {
  /* your code */
  let newArr = arr.filter((el, i, a) => )
}
let strings = [
  "Hare", "Krishna", "Hare", 
  "Krishna", "Krishna", "Krishna", 
  "Hare", "Hare", ":-O"
];

alert(unique(strings)); // Hare, Krishna, :-O
```
Read: JSWay Objects (https://github.com/thejsway/thejsway/blob/master/manuscript/chapter06.md)
Read: https://eloquentjavascript.net/04_data.html
Do: Minimum of 1 https://codewars.com 8 Kyu Fundamentals Track EVERY DAY - 20 mins then look at solution!
Do: https://javascript30.com Day 04 Array Cardio (super hard, do it on Discord together)