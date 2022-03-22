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
COMPLETE: https://javascript.info/array-methods
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
let powerCalc = new Calculator;
powerCalc.addMethod("*", (a, b) => a * b);
powerCalc.addMethod("/", (a, b) => a / b);
powerCalc.addMethod("**", (a, b) => a ** b);

let result = powerCalc.calculate("2 ** 3");
alert( result ); // 8
//No parentheses or complex expressions in this task.
//The numbers and the operator are delimited with exactly one space.
//There may be error handling if you’d like to add it.

function Calculator() {
  // Hold all methods in object
  this.methods = {
    "-": (a, b) => a - b,
    "+": (a, b) => a + b
  };

  // Calculate function
  this.calculate = function(str) {

    // Split string into array by spaces
    let split = str.split(' '),
      // set each element of the array as an argument for calculation
      a = +split[0],
      op = split[1],
      b = +split[2];

    // If a, op, or b, are invalid return NaN
    if (!this.methods[op] || isNaN(a) || isNaN(b)) {
      return NaN;
    }

    // if a, op, and b are valid run the op method with a and b arguments
    return this.methods[op](a, b);
  };

  // add method receives a name and function to run when that name is called
  this.addMethod = function(name, func) {
    this.methods[name] = func;
  };
}


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
    let newArr = arr.filter((el, i, a) => a.indexOf(el) === i);
    return newArr;
}

let strings = [
    "Hare", "Krishna", "Hare", 
    "Krishna", "Krishna", "Krishna", 
    "Hare", "Hare", ":-O"
];
  
alert(unique(strings)); // Hare, Krishna, :-O




//_______________
// Create keyed object from array
// importance: 4
// Let’s say we received an array of users in the form 
//  {id:..., name:..., age:... }.

// Create a function groupById(arr) that creates an object from it, 
// with id as the key, and array items as values.
// For example:

let users = [
  {id: 'john', name: "John Smith", age: 20},
  {id: 'ann', name: "Ann Smith", age: 24},
  {id: 'pete', name: "Pete Peterson", age: 31},
];

let usersById = groupById(users);
console.log(usersById);
/*
// after the call we should have:

usersById = {
  john: {id: 'john', name: "John Smith", age: 20},
  ann: {id: 'ann', name: "Ann Smith", age: 24},
  pete: {id: 'pete', name: "Pete Peterson", age: 31},
}
*/
// Such function is really handy when working with server data.

// In this task we assume that id is unique. 
// There may be no two array items with the same id.

// Please use array .reduce method in the solution.

function groupById(arr){
    // Reduce current array to single object
    let newObj = arr.reduce((acc, item) => {
        // For each item in array create a new key named after the id
        // add item data to that key
        acc[item.id] = item;
        // Return obj as is to continue iterating on it
        return acc;
    }, {})

    // Return object derived from reducing array
    return newObj;
}
```
COMPLETE: JSWay Objects (https://github.com/thejsway/thejsway/blob/master/manuscript/chapter06.md)
```js
// Adding character experience
// Improve our example RPG program to add an experience property named xp to the character. 
// Its initial value is 0. 
//Experience must appear in character description.

// create the character object here
const aurora = {
  name: "Aurora",
  health: 150,
  strength: 25,
  xp: 0, 
  describe() {
    return `Aurora has ${this.health} health points, ${this.strength} as strength and ${this.xp} xp points`
  }
}


// Aurora is harmed by an arrow
aurora.health -= 20;

// Aurora equips a strength necklace
aurora.strength += 10;

// Aurora learn a new skill
aurora.xp += 15;

console.log(aurora.describe());
// "Aurora has 130 health points, 35 as strength and 15 xp points"





//_______________
// Modeling a dog
// Complete the following program to add the dog object definition.

// create the dog object here
const dog = {
  name: 'Chewbacca',
  species: 'bipedal',
  size: '8ft',

  bark() {
    return 'aaahnruh huuguughghg!';
  }

}
/*
name, species, size, bark()
*/
console.log(`${dog.name} is a ${dog.species} dog measuring ${dog.size}`);
//=> "Chewbacca is a bipedal dog measuring 8ft"
console.log(`Look, a cat! ${dog.name} barks: ${dog.bark()}`);
//=> "Look, a cat! Chewbacca barks: aaahnruh huuguughghg!"




//_______________
// Modeling a circle
// Complete the following program to add the circle object definition. 
// Its radius value is input by the user.

const r = Number(prompt("Enter the circle radius:"));

//create the circle object here
const circle = {
  radius: +r,
  circumference() {
    return Math.PI * 2 * this.radius;
  },

  area() {
    return Math.PI * this.radius ** 2
  }
}

console.log(`Its circumference is ${circle.circumference()}`);
// (r=10) => 'Its circumference is 62.83185307179586'
console.log(`Its area is ${circle.area()}`);
// (r=10) => 'Its area is 314.1592653589793'




//_______________
// Modeling a bank account
// Write a program that creates an account object with the following characteristics:

// A name property set to "Alex".
// A balance property set to 0.
// A credit method adding the (positive or negative) value passed as an argument to the account balance.
// A describe method returning the account description.

// Use this object to show its description, crediting 250, debiting 80, then show its description again.

const account = {
  name: 'Alex',
  balance: 0,

  credit(num) {
    this.balance += num;
  },

  describe() {
    return `Owner: ${this.name}, balance ${this.balance}`
  }
}

console.log(account.describe()) // => 'Owner: Alex, balance 0'
account.credit(250); // => 'Owner: Alex, balance 0'
account.credit(-80); 
console.log(account.describe()) // => 'main.js: 27 Owner: Alex, balance 170'
```
COMPLETE: https://eloquentjavascript.net/04_data.html
```js
// The sum of a range
// The introduction of this book alluded to the following as a nice way to compute the sum of a range of numbers:

// console.log(sum(range(1, 10))); // => 55
// Write a range function that takes two arguments, start and end, 
// and returns an array containing all the numbers from start up to (and including) end.
function range(start, end, step){
  let rangeArr = []
  if(start <= end){
    step === undefined ? step = 1 : step = step;
    for(start; start <= end; start += step){
      rangeArr.push(start)
    }
  } else{
    step === undefined ? step = -1 : step = step;
    for(start; start >= end; start += step){
      rangeArr.push(start)
    }
  }
  return rangeArr
}

// Next, write a sum function that takes an array of numbers and returns the sum of these numbers.Run the example program and see whether it does indeed return 55.
// As a bonus assignment, modify your range function to take an optional third argument that indicates the “step” value used when building the array.If no step is given, the elements go up by increments of one, corresponding to the old behavior.The function call range(1, 10, 2) should return [1, 3, 5, 7, 9].Make sure it also works with negative step values so that range(5, 2, -1) produces[5, 4, 3, 2].

function sum(numArr){
  return numArr.reduce((a, el, i) => a + el)
}

console.log(range(1, 10));
// → [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(range(5, 2, -1));
// → [5, 4, 3, 2]
console.log(sum(range(1, 10)));
// → 55




//_______________
// Reversing an array
//
// Arrays have a reverse method that changes the array by inverting the order in which its elements appear.
// For this exercise, write two functions, reverseArray and reverseArrayInPlace.
// The first, reverseArray, takes an array as argument and produces a new array that has the same elements in the inverse order.
// The second, reverseArrayInPlace, does what the reverse method does: 
//  it modifies the array given as argument by reversing its elements.
// Neither may use the standard reverse method.
// Thinking back to the notes about side effects and pure functions in the previous chapter,
// which variant do you expect to be useful in more situations ? Which one runs faster ?

// Your code here.
function reverseArray(arr){
  let newArr = []
  arr.forEach((el) => { newArr.unshift(el) })
  return newArr
}

function reverseArrayInPlace(arr){
  for(let i = arr.length - 1; i >= 0; i--){
    el = arr[i]
    arr.splice(i, 1)
    arr.push(el)
  }
  return arr;
}

console.log(reverseArray(["A", "B", "C"]));
// → ["C", "B", "A"];
let arrayValue = [1, 2, 3, 4, 5];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);
// → [5, 4, 3, 2, 1]




//_______________
// A list
//
// Objects, as generic blobs of values, can be used to build all sorts of data structures.
// A common data structure is the list(not to be confused with array).
// A list is a nested set of objects, with the first object holding a reference to the second, the second to the third, and so on.

let list = {
  value: 1,
  rest: {
    value: 2,
    rest: {
      value: 3,
      rest: null
    }
  }
};

// The resulting objects form a chain

// A linked list
// A nice thing about lists is that they can share parts of their structure.
// For example, if I create two new values { value: 0, rest: list } and { value: -1, rest: list } 
// (with list referring to the binding defined earlier), they are both independent lists, 
// but they share the structure that makes up their last three elements.
// The original list is also still a valid three - element list.

// Write a function arrayToList that builds up a list structure like the one shown when given[1, 2, 3] as argument.
// Also write a listToArray function that produces an array from a list.
// Then add a helper function prepend, which takes an element and a list 
//  and creates a new list that adds the element to the front of the input list, 
// Then create nth, which takes a list and a number and returns the element at the given position in the list
// (with zero referring to the first element) or undefined when there is no such element.

// If you haven’t already, also write a recursive version of nth.

  // Your code here.

function arrayToList(arr){
  let list = null
  for(let i = arr.length - 1; i >=0; i--){
    list = {value: arr[i], rest: list}
  }
  return list;
}

function listToArray(list){
  let newArr = []
  while(list !== null){
    newArr.push(list.value)
    list = list.rest;
  }
  return newArr;
}

function prepend(el, list){
  let newList = {value: el, rest: list}
  return newList;
}

function nth(list, num){
  
  let arr =listToArray(list)
  
  if(num !== 0) {
    num--;
    arr.shift();
    list = arrayToList(arr)
    nth(list, num)
  }

  return arr[0];
}

console.log(arrayToList([10, 20])); //=> {value: 10, rest: {value: 20, rest: null}}
console.log(listToArray(arrayToList([10, 20, 30]))); //=> [10, 20, 30]
console.log(prepend(10, prepend(20, null))); //=> {value: 10, rest: {value: 20, rest: null}}
console.log(nth(arrayToList([10, 20, 30]), 1)); //=> 20




//_______________
// Deep comparison
//
// The == operator compares objects by identity.
// But sometimes you’d prefer to compare the values of their actual properties.

// Write a function deepEqual that takes two values and returns true only if they are the same value or are objects with the same properties, 
// where the values of the properties are equal when compared with a recursive call to deepEqual.

// To find out whether values should be compared directly(use the === operator for that) or have their properties compared, 
// you can use the typeof operator.
// If it produces "object" for both values, you should do a deep comparison.
// But you have to take one silly exception into account: because of a historical accident, typeof null also produces "object".

// The Object.keys function will be useful when you need to go over the properties of objects to compare them.

// Your code here.
function deepEqual(a, b) {
  for (const key in a) { // Using for-in in a object you can iterate the properties
    const a_value = a[key]
    const b_value = b[key]
    if (a_value !== b_value) {
      if((typeof a_value === 'object' && a_value !== null) && (typeof b_value === 'object' && b_value !== null)){
        deepEqual(a_value, b_value)
      }
      else {
        return false
      }
    }
  }
  return true
}

let obj = { here: { is: "an" }, object: 2 };

console.log(deepEqual(obj, obj)); //=> true
console.log(deepEqual(obj, { hee: 1, object: 2 })); //=> false
console.log(deepEqual(obj, { here: { is: "an" }, object: 2 })); //=> true

```
COMPLETE: Minimum of 1 https://codewars.com 8 Kyu Fundamentals Track EVERY DAY - 20 mins then look at solution!
COMPLETE: https://javascript30.com Day 04 Array Cardio (super hard, do it on Discord together)
```js
// Get your shorts on - this is an array workout!
// ## Array Cardio Day 1

// Some data we can work with

const inventors = [
  { first: 'Albert',    last: 'Einstein',     year: 1879, passed: 1955 },
  { first: 'Isaac',     last: 'Newton',       year: 1643, passed: 1727 },
  { first: 'Galileo',   last: 'Galilei',      year: 1564, passed: 1642 },
  { first: 'Marie',     last: 'Curie',        year: 1867, passed: 1934 },
  { first: 'Johannes',  last: 'Kepler',       year: 1571, passed: 1630 },
  { first: 'Nicolaus',  last: 'Copernicus',   year: 1473, passed: 1543 },
  { first: 'Max',       last: 'Planck',       year: 1858, passed: 1947 },
  { first: 'Katherine', last: 'Blodgett',     year: 1898, passed: 1979 },
  { first: 'Ada',       last: 'Lovelace',     year: 1815, passed: 1852 },
  { first: 'Sarah E.',  last: 'Goode',        year: 1855, passed: 1905 },
  { first: 'Lise',      last: 'Meitner',      year: 1878, passed: 1968 },
  { first: 'Hanna',     last: 'Hammarström',  year: 1829, passed: 1909 }
];

const people = [
  'Bernhard, Sandra', 'Bethea, Erin', 'Becker, Carl', 'Bentsen, Lloyd', 'Beckett, Samuel', 'Blake, William', 'Berger, Ric', 'Beddoes, Mick', 'Beethoven, Ludwig',
  'Belloc, Hilaire', 'Begin, Menachem', 'Bellow, Saul', 'Benchley, Robert', 'Blair, Robert', 'Benenson, Peter', 'Benjamin, Walter', 'Berlin, Irving',
  'Benn, Tony', 'Benson, Leana', 'Bent, Silas', 'Berle, Milton', 'Berry, Halle', 'Biko, Steve', 'Beck, Glenn', 'Bergman, Ingmar', 'Black, Elk', 'Berio, Luciano',
  'Berne, Eric', 'Berra, Yogi', 'Berry, Wendell', 'Bevan, Aneurin', 'Ben-Gurion, David', 'Bevel, Ken', 'Biden, Joseph', 'Bennington, Chester', 'Bierce, Ambrose',
  'Billings, Josh', 'Birrell, Augustine', 'Blair, Tony', 'Beecher, Henry', 'Biondo, Frank'
];

// Array.prototype.filter()
// 1. Filter the list of inventors for those who were born in the 1500's
console.log(inventors.filter((el) => el.year >= 1500 && el.year <= 1599));

// Array.prototype.map()
// 2. Give us an array of the inventors first and last names
console.log(inventors.map((el) => { 
  return `${el.first} ${el.last}`
}))

// Array.prototype.sort()
// 3. Sort the inventors by birthdate, oldest to youngest
console.log(inventors.sort((a, b) => a.year - b.year))


// Array.prototype.reduce()
// 4. How many years did all the inventors live all together?
console.log(inventors.reduce((a,el) => a += (el.passed - el.year), 0))

// 5. Sort the inventors by years lived
console.log(inventors.sort((a, b) => (a.passed - a.year) - (b.passed - b.year)));

// 6. create a list of Boulevards in Paris that contain 'de' anywhere in the name
// https://en.wikipedia.org/wiki/Category:Boulevards_in_Paris
// const list = document.querySelectorAll('.mw-category')
// const links = [...list[0].querySelectorAll('a')];

// const filtered = links.filter((el) => el.textContent.includes('de')).map((el) => `${el.textContent}`)


// 7. sort Exercise
// Sort the people alphabetically by last name
console.log(people.sort());

// 8. Reduce Exercise
// Sum up the instances of each of these
const data = ['car', 'car', 'truck', 'truck', 'bike', 'walk', 'car', 'van', 'bike', 'walk', 'car', 'van', 'car', 'truck'];

console.log(data.reduce((a, el) => {
  a[el] ? a[el] += 1 : a[el] = 1;
  return a
}, {}));
```