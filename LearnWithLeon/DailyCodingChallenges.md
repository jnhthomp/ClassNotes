3/20/2022
```js
// Count the Digit (7kyu)
//
// Take an integer n(n >= 0) and a digit d(0 <= d <= 9) as an integer.
// Square all numbers k(0 <= k <= n) between 0 and n.
// Count the numbers of digits d used in the writing of all the k ** 2.
// Call nb_dig(or nbDig or ...) the function taking n and d as parameters 
// and returning this count.
// Examples:
//  n = 10, d = 1 
//  the k * k are 0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100
//  We are using the digit 1 in: 1, 16, 81, 100. The total count is then 4.

// nb_dig(25, 1) returns 11 since
// the k * k that contain the digit 1 are:
// 1, 16, 81, 100, 121, 144, 169, 196, 361, 441.
// So there are 11 digits 1 for the squares of numbers between 0 and 25.
// Note that 121 has twice the digit 1.

console.log(nbDig(25, 1)) //=> 11

function nbDig(n, d) {
  // empty array to hold values
  let k = []
  // Get k values (**2) of all numbers between 0 and n arg
  for(let i = 0; i <= n; i++){
    // Add square val to array
    k.push(i * i)
  }
  // Combine all elements of array to single string (string not num)
  // Split string back into array so every digit is an element
  // Filter to only return d values
  // Find length of array only containing d values (number of d's returned total)
  return k.join('').split('').filter((el) => el == `${d}`).length;
}

// Another solution I liked:
function nbDigV2(n, d) {
  // String to hold all values (reason this is used but maybe not best practice)
  var o = '';
  // Cycle through and get 'k' values from 0 to n of squares
    for(var i = 0; i <= n; i++){
      // Add squared number to 'o' string
      o += Math.pow(i, 2);
    }
    // Split o string by the digit we are looking for into an array
    // return length -1 since there will be one extra element that doesn't have a 1 at the end
  return o.split(d).length-1
}
```
3/19/2022
```js
// Reverse words (7 kyu)
//
// Complete the function that accepts a string parameter, 
// and reverses each word in the string.
// All spaces in the string should be retained.

// Examples
console.log(reverseWords("Hello There!")); // => "olleH !erehT"
console.log(reverseWords("This is an example!")) //=> "sihT si na !elpmaxe"
console.log(reverseWords("double  spaces")) //=> "elbuod  secaps"



function reverseWords(str) {
  // Go for it
  // Split string into array of words
  return str.split(' ') // 'Hello there!' => ['Hello', 'There!']
    // split each word into array of strings to give an array of arrays
    // [['H', 'e', 'l', 'l', 'o'],['T', 'h', 'e', 'r', 'e', '!']]
    // Reverse each sub array
    // [['0', 'l', 'l', 'e', 'H'],['!', 'e', 'r', 'e', 'h', 'T']]
    // Join subarrays back together into stringss
    // ['olleH', '!erehT']
    .map((el, i , a) => el.split('').reverse().join(''))
    // Join main array back to one string
    // 'olleH !erehT'
    .join(' ');
}
```
3/18/2022
```js
// Small enough? - Beginner (7kyu)
// 
// You will be given an array and a limit value.
// You must check that all values in the array are below or equal to the limit value.
// If they are, return true.Else, return false.

// You can assume all values in the array are numbers.

console.log(smallEnough([66, 101], 200)); // true
console.log(smallEnough([78, 117, 110, 99, 104, 117, 107, 115], 100)); // false
console.log(smallEnough([101, 45, 75, 105, 99, 107], 107)); // true 
console.log(smallEnough([80, 117, 115, 104, 45, 85, 112, 115], 120)); // true
console.log(smallEnoughV2([66, 101], 200)); // true
console.log(smallEnoughV2([78, 117, 110, 99, 104, 117, 107, 115], 100)); // false
console.log(smallEnoughV2([101, 45, 75, 105, 99, 107], 107)); // true 
console.log(smallEnoughV2([80, 117, 115, 104, 45, 85, 112, 115], 120)); // true

function smallEnough(a, limit) {
  // Reduce array to boolean value
  // If the current element is greater than than limit passed in
  //  return false (sets a to false)
  // Otherwise 
  //  return current value of a 
  //  can be false or true depending on if a previous el flipped it or not
  return a.reduce((a, el) => (el > limit) ? false : a, true)
}

// Alternate version I also Liked
function smallEnoughV2(a, limit) {
  // Spread array values are arguments and get the largest from the list w/ .max
  // Return whether the largest value is less than the limit
  return Math.max(...a) <= limit
}
```
```js
// Remove anchor form URL (7kyu)
//
// Complete the function/method so that it returns the url with anything after the anchor (#) removed.
// Examples
// "www.codewars.com#about" --> "www.codewars.com"
// "www.codewars.com?page=1" -->"www.codewars.com?page=1"

console.log(removeUrlAnchor('www.codewars.com#about')); // => www.codewars.com
console.log(removeUrlAnchor('www.codewars.com?page=1')); // => www.codewars.com?page=1
console.log(removeUrlAnchorV2('www.codewars.com#about')); // => www.codewars.com
console.log(removeUrlAnchorV2('www.codewars.com?page=1')); // => www.codewars.com?page=1

function removeUrlAnchor(url) {
  return url.includes('#') ? url.slice(0, url.indexOf('#')) : url;
}

// Other solution I liked
// Splits string into array at '#' 
// (only one element if no '#')
// Returns first element of that array
const removeUrlAnchorV2 = (url) => url.split("#")[0];

// url => www.codewars.com#about
// url.split('#') => ['www.codewars.com', 'about']
// url.split('#')[0] => 'www.codewars.com'
```
3/17/2022
```js
// Growth of a Population (7 kyu)
//
// In a small town the population is p0 = 1000 at the beginning of a year.
// The population regularly increases by 2 percent per year 
// and moreover 50 new inhabitants per year come to live in the town.\
// How many years does the town need to see its population 
//  greater or equal to p = 1200 inhabitants?
//  (** number of inhabitants is an integer **)
//
// At the end of the first year there will be:
//  1000 + 1000 * 0.02 + 50 => 1070 inhabitants
// At the end of the 2nd year there will be:
//  1070 + 1070 * 0.02 + 50 => 1141 inhabitants
// At the end of the 3rd year there will be:
//  1141 + 1141 * 0.02 + 50 => 1213

// It will need 3 entire years.
// More generally given parameters:
// p0, percent, aug(inhabitants coming or leaving each year), p(population to surpass)
// the function nbYear should return n number of entire years needed to get a population 
//  greater or equal to p.
//
// aug is an integer, 
// percent a positive or null floating number, 
// p0 and p are positive integers(> 0)

// Examples:
console.log(nbYear(1500, 5, 100, 5000)) //=> 15
console.log(nbYear(1500000, 2.5, 10000, 2000000)) //=> 10
console.log(nbYear(1500000, 0.25, 1000, 2000000)) // => 94
console.log(nbYearV2(1500, 5, 100, 5000)) //=> 15
console.log(nbYearV2(1500000, 2.5, 10000, 2000000)) //=> 10
console.log(nbYearV2(1500000, 0.25, 1000, 2000000)) // => 94
// Note:
// Don't forget to convert the percent parameter as a percentage in the body of your function: 
// if the parameter percent is 2 you have to convert it to 0.02.

// p0 = initial
// perc = percent
// inOUt = aug
// final = p
function nbYear(p0, percent, aug, p) {
  let n = 0
  while (p0 < p) {
    // Must use .floor because you cannot have a part of a person and rounding up wouldn't make sense
    // Important when (p0* (percent / 100)) would result in a decimal
    p0 = p0 + Math.floor((p0 * (percent / 100))) + aug
    n++;
  }

  return n;
}

// Alternate solution that I liked and considered:
function nbYearV2(p0, percent, aug, p) {
  for (let n = 0; p0 < p; n++) {
    p0 = p0 + Math.floor((p0 * (percent / 100))) + aug
  }
  return n;
}
```
3/16/2022
```js
// Story (7kyu)
//  Ben has a very simple idea to make some profit: 
// he buys something and sells it again. 
// Of course, this wouldn't give him any profit at all if he was simply to buy and sell it at the same price. 
// Instead, he's going to buy it for the lowest possible price and sell it at the highest.

// Task
// Write a function that returns both the minimum and maximum number of the given list/array.

// Examples
console.log(minMax([1, 2, 3, 4, 5]))   //== [1,5]
console.log(minMax([2334454, 5]))   //== [5, 2334454]
console.log(minMax([1]))           //== [1, 1]
// Remarks
// All arrays or lists will always have at least one element, so you don't need to check the length. 
// Also, your function will always get an array or a list, you don't have to check for null, undefined or similar.

function minMax(arr){
  // Initial values for low and high numbers we will return
  let low = arr[0]
  let high = arr[0]

  // Loop through each element in the array
  arr.forEach((el, i) => { 
    // If the current element is lower value than the current low value then replace it
    if (el < low){
      low = el
    }
    // If the current element is higher value than the current high value then replace it
    if (el > high){
      high = el
    }
  })

  // Return low and high values
  return [low, high];
}

// Another answer I liked:
function minMaxV2(arr) {
  // Utilizes Math.min/max functions which take a list of numbers as an argument
  // Then uses spread operator to fill arguments with all the values in the array
  return [Math.min(...arr), Math.max(...arr)];
}

// Examples
console.log(minMaxV2([1, 2, 3, 4, 5]))   //== [1,5]
console.log(minMaxV2([2334454, 5]))   //== [5, 2334454]
console.log(minMaxV2([1]))           //== [1, 1]
```

3/15/2022
```js
// Summing a number's digits (7kyu)
// 
//  Write a function named sumDigits which takes a number as input 
//  and returns the sum of the absolute value of 
//  each of the number's decimal digits.
//    For example: (Input-- > Output)
//      10 --> (1 + 0) --> 1 
//      99 --> (9 + 9) --> 18
//      -32 --> (3 + 2) --> 5
//  Let's assume that all numbers in the input will be integer values.

function sumDigits(number) {
  // Get absolute value and conver to string
  number = Math.abs(number).toString();
  
  // Will hold sum before we iterate through values
  let sum = 0;
  // Run loop same number of iterations as string
  // iterator starts at 0 to act as index of element in string
  for (let i = 0; i < number.length; i++) {
    // Get value at current index, conver to num, add to sum
    sum += Number(number[i]);
  }

  // return sum
  return sum;
}

// Test Cases
console.log(sumDigits(10)); // 1
console.log(sumDigits(99)); // 18
console.log(sumDigits(-32)); // 5


// Another solution I liked
function sumDigitsV2(number) {
  // Gets absolute value of number
  // Converts to a string
  // Splits string into array between characters
  // uses reduce on array and adds current value to running value 
  // returns final result from reducer
  return Math.abs(number).toString().split('').reduce(function (a, b) { return +a + +b }, 0);
}

// Test Cases
console.log(sumDigitsV2(10)); // 1
console.log(sumDigitsV2(99)); // 18
console.log(sumDigitsV2(-32)); // 5
```