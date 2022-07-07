2022-7-7
```js
// Mexican Wave (6 kyu)
//
// Introduction
// The wave (known as the Mexican wave in the English-speaking world outside North America) 
// is an example of metachronal rhythm achieved in a packed stadium 
// when successive groups of spectators briefly stand, yell, and raise their arms. 
// Immediately upon stretching to full height, the spectator returns to the usual seated position.
//
// The result is a wave of standing spectators that travels through the crowd, 
// even though individual spectators never move away from their seats. 
// In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, 
// and so the wave is able to travel continuously around the arena; 
// in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. 
// When the gap in seating is narrow, the wave can sometimes pass through it. 
// Usually only one wave crest will be present at any given time in an arena, 
// although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)
//
// Task
// In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
// You will be passed a string 
// and you must return that string in an array where an uppercase letter is a person standing up. 
//
// Rules
//  1.  The input string will always be lower case but maybe empty.
//  2.  If the character in the string is whitespace then pass over it as if it was an empty seat
//
// Example
console.log(wave("hello")) //=> ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
console.log(wave("two words")) //=> ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]

function wave(str){
  let arr = [];
  for(let i = 0; i < str.length; i++){
    if(str.charAt(i) !== ' '){
      arr.push(str.slice(0,i) + str.charAt(i).toUpperCase() + str.slice(i + 1))
    }
  }
  return arr
}
```
2022-7-6
```js
// BAC Calculator
//
// You just went to a wedding
// Create a function that receives a person object containing the following keys:
// sex, weight, drinks, period

// Use these values and the Widmark Formula to calculate the BAC of a given person object

person1 = {
  sex: 'female', // or 'male'
  weight: 120,
  drinks: 4, //as standard drink value for now
  period: 5 // in a value of hours
}

person2 = {
  sex: 'male', // or 'male'
  weight: 155,
  drinks: 5, //as standard drink value for now
  period: 3 // in a value of hours
}

console.log(calcBAC(person1)) // ~.11
console.log(calcBAC(person2)) // ~.10

function calcBAC(person){
  // Find alcohol dose (using standard drinks we multiply by 14)
  const alcDose = person.drinks * 14
  // Find grams person weighs (454 grams per pound) and multiply by gender constant
  const gConst = person.sex === 'male' ? .68 : .55
  const weight = person.weight * 454 * gConst

  let bac = 100 * (alcDose / weight)
  bac -= person.period * .015

  return bac
}
```
2022-7-5
```js
// Maximum Multiple (7kyu)
//
// Task
// Given a Divisor and a Bound , Find the largest integer N , Such That ,

// Conditions :
// N is divisible by divisor

// N is less than or equal to bound

// N is greater than 0.

// Notes
// The parameters (divisor, bound) passed to the function are only positive values .
// It's guaranteed that a divisor is Found .
// Input >> Output Examples

console.log(maxMultiple(2, 7)) //=> 6
// Explanation:
// (6) is divisible by (2) , (6) is less than or equal to bound (7) , and (6) is > 0 .

console.log(maxMultiple(10, 50)) //=> 50
// Explanation:
// (50) is divisible by (10) , (50) is less than or equal to bound (50) , and (50) is > 0 .*

console.log(maxMultiple(37, 200)) //=> 185
// Explanation:
// (185) is divisible by (37) , (185) is less than or equal to bound (200) , and (185) is > 0 .

function maxMultiple(divisor, bound){
  return bound - (bound % divisor)
}
```
2022-7-4
```js
// Maximum Triplet Sum (Array Series #7) (7kyu)
//
// Task
// Given an array/list [] of n integers, 
// find maximum triplet sum in the array Without duplications.
//
// Notes :
// Array/list size is at least 3.
// Array/list numbers could be a mixture of positives, negatives and zeros.
// Repetition of numbers in the array/list could occur, So (duplications are not included when summing).
//
// Input >> Output Examples
console.log(maxTriSum ({3,2,6,8,2,3})) //=> 17
// Explanation:
// As the triplet that maximize the sum {6,8,3} in order , their sum is (17)
// Note : duplications are not included when summing , (i.e) the numbers added only once.

console.log(maxTriSum ({2,1,8,0,6,4,8,6,2,4})) //=> 18
// Explanation:
// As the triplet that maximize the sum {8, 6, 4} in order , their sum is (18),
// Note : duplications are not included when summing , (i.e) the numbers added only once.

console.log(maxTriSum({-7,12,-7,29,-5,0,-7,0,0,29})) //=> 41
// Explanation:
// As the triplet that maximize the sum {12 , 29 , 0} in order , their sum is (41),
// Note : duplications are not included when summing , (i.e) the numbers added only once.

function maxTriSum(numbers){
  return numbers.sort((a, b) => b - a).filter((el, i, arr) => arr.indexOf(el) === i).slice(0, 3).reduce((acc, el) => acc + el, 0)
}

```
2022-7-3
```js
// Task
// Given an array of N integers, 
// you have to find how many times you have to add up 
// the smallest numbers in the array 
// until their Sum becomes greater or equal to K.
//
// Notes:
// - List size is at least 3.
// - All numbers will be positive.
// - Numbers could occur more than once , (Duplications may exist).
// - Threshold K will always be reachable.
//
// Input >> Output Examples
console.log(minimumSteps([1, 10, 12, 9, 2, 3], 6))  //=> 2
// Explanation:
// We add two smallest elements (1 + 2), their sum is 3 .
// Then we add the next smallest number to it (3 + 3) , so the sum becomes 6 .
// Now the result is greater or equal to 6 , Hence the output is (2) i.e (2) operations are required to do this .

console.log(minimumSteps([8 , 9, 4, 2], 23))  //=> 3
// Explanation:
// We add two smallest elements (4 + 2), their sum is 6 .
// Then we add the next smallest number to it (6 + 8) , so the sum becomes 14 .
// Now we add the next smallest number (14 + 9) , so the sum becomes 23 .
// Now the result is greater or equal to 23 , Hence the output is (3) i.e (3) operations are required to do this .

console.log(minimumSteps([19,98,69,28,75,45,17,98,67], 464))  //=> 8
// Explanation:
// We add two smallest elements (19 + 17), their sum is 36 .
// Then we add the next smallest number to it (36 + 28) , so the sum becomes 64 .
// We need to keep doing this until the sum becomes greater or equal to K (464 in this case), which will require 8 Steps .

function minimumSteps(numbers, value){
  let acc = 0
  let foundIdx = numbers.length
  numbers.sort((a, b) => a - b).forEach((el, i) => {
    acc += el
    if(acc >= value){
      foundIdx = foundIdx < i ? foundIdx : i
    }})
  
  return foundIdx
}
```
2022-7-2
```js
// Product Array (Array Series #5) (7 kyu)
//
// Task
// Given an array/list [] of integers, 
// Construct a product array Of same size 
// Such That prod[i] is equal to The Product of all the elements of Arr[] except Arr[i].
// 
// Notes
// Array/list size is at least 2 .
// Array/list's numbers Will be only Positives
// Repetition of numbers in the array/list could occur.
// 
// Input >> Output Examples
console.log(productArray ([12,20])) //=> [20,12]
// Explanation:
// The first element in prod [] array 12 is the product of all array's elements except the first element
// The second element 20 is the product of all array's elements except the second element .

console.log(productArray ([1,5,2])) //=> [10,2,5]
// Explanation:
// The first element 10 is the product of all array's elements except the first element 1
// The second element 2 is the product of all array's elements except the second element 5
// The Third element 5 is the product of all array's elements except the Third element 2.

console.log(productArray ([10,3,5,6,2])) //=> [180,600,360,300,900]
// Explanation:
// The first element 180 is the product of all array's elements except the first element 10
// The second element 600 is the product of all array's elements except the second element 3
// The Third element 360 is the product of all array's elements except the third element 5
// The Fourth element 300 is the product of all array's elements except the fourth element 6
// Finally ,The Fifth element 900 is the product of all array's elements except the fifth element 2

function productArray(numbers){
  return numbers.map((el, i, arr) => arr.reduce((acc, e, idx) => idx !== i ? acc *= e : acc, 1))
}
```
2022-7-1
```js
// Maximum Gap (Array Series #4) (7 kyu)
//
// Task
// Given an array/list [] of integers , Find The maximum difference between the successive elements in its sorted form.
//
// Notes
// - Array/list size is at least 3 .
// - Array/list's numbers Will be mixture of positives and negatives also zeros_
// - Repetition of numbers in the array/list could occur.
// - The Maximum Gap is computed Regardless the sign.
//
// Tests:
console.log(maxGap([13,10,2,9,5])) // => 4
console.log(maxGap([13,3,5])) // => 8
console.log(maxGap([24,299,131,14,26,25])) // => 168
console.log(maxGap([-3,-27,-4,-2])) // => 23
console.log(maxGap([-7,-42,-809,-14,-12])) // => 767
console.log(maxGap([12,-5,-7,0,290])) // => 278
console.log(maxGap([-54,37,0,64,-15,640,0])) // => 576
console.log(maxGap([130,30,50])) // => 80
console.log(maxGap([1,1,1])) // => 0
console.log(maxGap([-1,-1,-1])) // => 0

function maxGap (numbers){
  return numbers.sort((a, b) => a - b).reduce((acc, el, i, arr) => arr[i + 1] - el > acc ? arr[i + 1] - el  : acc, 0) 
}
```
2022-6-30
```js
// Array Leaders (Array Series #3)
//
// Definition
// An element is leader if 
// it is greater than The Sum all the elements to its right side.
//
// Task
// Given an array/list [] of integers, 
// Find all the LEADERS in the array.
//
// Notes
// - Array/list size is at least 3.
// - Array/list's numbers Will be mixture of positives , negatives and zeros
// - Repetition of numbers in the array/list could occur.
// - Returned Array/list should store the leading numbers in the same order in the original array/list .
//
// Input >> Output Examples
console.log(arrayLeaders([1, 2, 3, 4, 0])) //=>  [4]
// Explanation:
// 4 is greater than the sum all the elements to its right side
// Note : The last element 0 is equal to right sum of its elements (abstract zero).

console.log(arrayLeaders([16, 17, 4, 3, 5, 2])) //=> [17, 5, 2]
// Explanation:
// 17 is greater than the sum all the elements to its right side
// 5 is greater than the sum all the elements to its right side
// Note : The last element 2 is greater than the sum of its right elements (abstract zero).

console.log(arrayLeaders([5, 2, -1])) //=> [5, 2]
// Explanation:
// 5 is greater than the sum all the elements to its right side
// 2 is greater than the sum all the elements to its right side
// Note : The last element -1 is less than the sum of its right elements (abstract zero).

console.log(arrayLeaders([0, -1, -29, 3, 2])) //=> [0, -1, 3, 2]
// Explanation:
// 0 is greater than the sum all the elements to its right side
// -1 is greater than the sum all the elements to its right side
// 3 is greater than the sum all the elements to its right side
// Note : The last element 2 is greater than the sum of its right elements (abstract zero).

function arrayLeaders(numbers){
  // Array to hold found 'leaders'
  let leaders = []
  
  // Reduce right to get sum of all vals to the right of each element compared to that element
  numbers.reduceRight((acc, el, i) => {
    // If the element is bigger add to leader array
    if(el > acc){
      leaders.push(el)
    }
    // Update the accumulated sum before moving to next el
    return acc + el
  }, 0) // Init to 0 so last value can have a comparison (per instructions)
  
  return leaders.reverse(); // Reverse leader list before returning since items were added in reverse order
}
```
2022-6-29
```js
// Product Of Maximums Of Array (Array Series #2) (7 kyu)
//
// Task
// Given an array/list [] of integers, 
// Find the product of the k maximal numbers.
//
// Notes: 
// Array/list size is at least 3.
// Array/list's numbers Will be mixture of positives , negatives and zeros
// Repetition of numbers in the array/list could occur.
//
console.log(maxProduct([4,3,5], 2)) //=> 20
console.log(maxProduct([10,8,7,9], 3)) //=> 720
console.log(maxProduct([8,6,4,6], 3)) //=> 288
console.log(maxProduct([10,2,3,8,1,10,4], 5)) //=> 9600
console.log(maxProduct([13,12,-27,-302,25,37,133,155,-14], 5)) //=> 247895375
console.log(maxProduct([-4,-27,-15,-6,-1], 2)) //=> 4
console.log(maxProduct([-17,-8,-102,-309], 2)) //=> 136
console.log(maxProduct([10,3,-27,-1], 3)) //=> -30
console.log(maxProduct([14,29,-28,39,-16,-48], 4)) //=> -253344
console.log(maxProduct([1], 1)) //=> 1

function maxProduct(numbers, size){
  return numbers.sort((a,b) => b - a).reduce((acc, el, i) => i < size ? acc *= el : acc, 1)
}
```
2022-6-28
```js
Your task is to return the sum of Triangular Numbers 
up-to-and-including the nth Triangular Number.

Triangular Number: 
"any of the series of numbers (1, 3, 6, 10, 15, etc.) 
obtained by continued summation of the natural numbers 1, 2, 3, 4, 5, etc."

[01]
02 [03]
04 05 [06]
07 08 09 [10]
11 12 13 14 [15]
16 17 18 19 20 [21]
e.g. If 4 is given: 1 + 3 + 6 + 10 = 20.

Triangular Numbers cannot be negative so return 0 if a negative number is given.

Tests:
console.log(sumTriangularNumbers(6)) //=> 56
console.log(sumTriangularNumbers(34)) //=> 7140
console.log(sumTriangularNumbers(-291)) //=> 0
console.log(sumTriangularNumbers(943)) //=> 140205240
console.log(sumTriangularNumbers(-971)) //=> 0

function sumTriangularNumbers(n) {
  let numTree = [0]

  for(let i = 1; i <= n; i++){
    numTree.push(numTree[numTree.length-1] + i)
  }
  
  return numTree.reduce((a,b)=> a + b)
}
```
2022-6-27
```js
// Minimize Sum Of Array (Array Series #1) (7 kyu)
//
// Task
// Given an array of integers, 
// Find the minimum sum which is obtained from summing each Two integers product.
//
// Notes
// Array/list will contain positives only.
// Array/list will always have even size
//
// Input >> Output Examples
console.log(minSum({5,4,2,3})) //=> return (22) 
// Explanation:
// The minimum sum obtained from summing each two integers product , 5*2 + 3*4 = 22

console.log(minSum({12,6,10,26,3,24})) //=> return (342)
// Explanation:
// The minimum sum obtained from summing each two integers product , 26*3 + 24*6 + 12*10 = 342

console.log(minSum({9,2,8,7,5,4,0,6})) //=> return (74)
// Explanation:
// The minimum sum obtained from summing each two integers product , 9*0 + 8*2 +7*4 +6*5 = 74

function minSum(arr) {
  arr.sort((a,b)=> a - b)
  let newArr = []
  
  for(let i = 0; i <= (arr.length / 2) - 1; i++){
    newArr.push(arr[i] * arr[arr.length - (1 + i)])
  }
  
  return newArr.reduce((acc, el, i) => acc + el)
}
```
2022-6-26
```js
// Alphabet war (7 kyu)
//
// Introduction
// There is a war and nobody knows - the alphabet war!
// There are two groups of hostile letters. 
// The tension between left side letters and right side letters was too high and the war began.
//
// Task
// Write a function that accepts fight string consists of only small letters 
// and return who wins the fight. 
// When the left side wins return Left side wins!, 
// when the right side wins return Right side wins!, 
// in other case return Let's fight again!.
//
// The left side letters and their power:
//  w - 4
//  p - 3
//  b - 2
//  s - 1
//
// The right side letters and their power:
//  m - 4
//  q - 3
//  d - 2
//  z - 1
//
// The other letters don't have power and are only victims.
//
// Example
console.log(alphabetWar("z"));        //=> Right side wins!
console.log(alphabetWar("zdqmwpbs")); //=> Let's fight again!
console.log(alphabetWar("zzzzs"));    //=> Right side wins!
console.log(alphabetWar("wwwwwwz"));  //=> Left side wins!

function alphabetWar(fight){
  const leftKey = ['s', 'b', 'p', 'w'];
  const rightKey = ['z', 'd', 'q', 'm'];
  
  let left = [];
  let right = [];
  fight.split('').forEach((el) => {
    left.push(leftKey.indexOf(el) + 1)
    right.push(rightKey.indexOf(el) + 1)
  })
  
  left = left.reduce((acc, el)=> acc += el)
  right = right.reduce((acc, el)=> acc += el)
  
  return left === right ? 
          "Let's fight again!" : 
          `${left > right ? 'Left' : 'Right'} side wins!`
  
}
```
2022-6-25
```js
// Encrypt this! (6 kyu)
//
// Acknowledgments:
// I thank yvonne-liu for the idea and for the example tests :)
//
// Description:
// Encrypt this!
//
// You want to create secret messages which can be deciphered by the Decipher this! kata. 
//
// Here are the conditions:
// Your message is a string containing space separated words.
// You need to encrypt each word in the message using the following rules:
// The first letter must be converted to its ASCII code.
// The second letter must be switched with the last letter
// Keepin' it simple: 
// There are no special characters in the input.
//
// Examples:
console.log(encryptThis("Hello")) //=> "72olle"
console.log(encryptThis("good")) //=> "103doo"
console.log(encryptThis("hello world")) //=> "104olle 119drlo"

var encryptThis = function(text) {
  // Split string into array of words to encrypt by mapping each word
  return text.split(' ').map((word) => {
    // Split current word into an array
    word = word.split('')
    // Get the charcode of the first letter
    const charCode = word[0].charCodeAt(0)
    // Remove first letter
    word.shift()
    
    // Init first and last letter holder variables to null (important for building string later)
    let f = null
    let l = null
    
    // If the word has enough letters to swap them...
    if(word.length > 1){
      // Collect first letter and remove it
      f = word[0]
      word.shift()
      // Collect last letter and remove it
      l = word[word.length - 1]
      word.pop()
    }
    
    // Create string with gathered data
    // 1. Charcode of first letter
    // 2. Last letter (or '' if there is none)
    // 3. Unaffected chars
    // 4. Second letter from orignal word (or '' if there is none)
    return `${charCode}${l || ''}${word.join('')}${f || ''}`
  }).join(' ') // Join back to a single string
}
```
2022-6-24
```js
// Factorial (7 kyu)
//
// Your task is to write function factorial.
// https://en.wikipedia.org/wiki/Factorial

console.log(factorial(0)) // => 1
console.log(factorial(1)) // => 1
console.log(factorial(4)) // => 24
console.log(factorial(7)) // => 5040
console.log(factorial(17)) // => 355687428096000

function factorial(n){
  return n > 1 ? n * factorial(n - 1) : n === 0 ? 1 : n
}
```
2022-6-23
```js
// Count characters in your string (6 kyu)
//
// The main idea is to count all the occurring characters in a string. 
// If you have a string like 'aba', 
// then the result should be {'a': 2, 'b': 1}.
//
// What if the string is empty? 
// Then the result should be empty object literal, {}.

console.log(count('aba')) //=> {a: 2, b: 1}
console.log(count('')) // => {}

function count (string) {  
  const obj = {}
  for(let i = 0; i < string.length; i++){
    obj[string[i]] ? obj[string[i]] += 1 : obj[string[i]] = 1
  }
   return obj;
}
```
2022-6-22
```js
// Even numbers in an array (7 kyu)
//
// Given an array of numbers, 
// return a new array of length number containing the last even numbers from the original array (in the same order). 
// The original array will be not empty and will contain at least "number" even numbers.
//
// For example:
console.log(([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) //=> [4, 6, 8]
console.log(([-22, 5, 3, 11, 26, -6, -7, -8, -9, -8, 26], 2) //=> [-8, 26]
console.log(([6, -25, 3, 7, 5, 5, 7, -3, 23], 1) //=> [6]

function evenNumbers(array, number) {
  return array.filter(el=> el % 2 === 0).slice(-number)
}
```
2022-6-21
```js
// Consonant value (6 kyu)
//
// Given a lowercase string that has alphabetic characters only and no spaces, 
// return the highest value of consonant substrings. 
// Consonants are any letters of the alphabet except "aeiou".
//
// We shall assign the following values: a = 1, b = 2, c = 3, .... z = 26.
//
// For example, for the word "zodiacs", 
// let's cross out the vowels. 
// We get: "z o d ia cs"
//
// -- The consonant substrings are: "z", "d" and "cs" 
// and the values are z = 26, d = 4 and cs = 3 + 19 = 22. 
// The highest is 26.
console.log(solve("zodiacs")) //=> 26

// For the word "strength", 
console.log(solve("strength")) //=> 57
// -- The consonant substrings are: "str" and "ngth" 
// with values "str" = 19 + 20 + 18 = 57 
// and "ngth" = 14 + 7 + 20 + 8 = 49. 
// The highest is 57.

function solve(s) {
  console.log(s)
  const keyVal = 'abcdefghijklmnopqrstuvwxyz'
  const keyVow = ['a', 'e', 'i', 'o', 'u']
  const vals = s.split('')
    .map((el, i) => keyVow.indexOf(el) >= 0 ? 0 : keyVal.indexOf(el) + 1)
  
  let h = 0
  let acc = 0
  for(let i = 0; i < vals.length; i++){
    if (vals[i] !== 0){
      acc += vals[i]
      if(acc > h){
        h = acc
      }
    } else {
      if(acc > h){
        h = acc
      }
      
      acc = 0
    }
  }
  
  return h
};
```
2022-6-20
```js
// Given a 2D ( nested ) list ( array, vector, .. ) of size m * n, 
// your task is to find the sum of the minimum values in each row.

// For Example:
console.log(sumOfMinimums(
[ [ 1, 2, 3, 4, 5 ]        // minimum value of row is 1
, [ 5, 6, 7, 8, 9 ]        // minimum value of row is 5
, [ 20, 21, 34, 56, 100 ]  // minimum value of row is 20
])) //=> 26

// So the function should return 26 because the sum of the minimums is 1 + 5 + 20 = 26.

// Note: You will always be given a non-empty list containing positive values.

// ENJOY CODING :)

function sumOfMinimums(arr) {
  return arr.map(el=> Math.min(...el)).reduce((a,b)=> a + b)
}
```
2022-6-19
```js
// Printer Errors (7 kyu)
//
// Sometimes there are problems: 
// lack of colors, technical malfunction and a "bad" control string is produced 
// e.g. aaaxbbbbyyhwawiwjjjwwm with letters not from a to m.
//
// You have to write a function printer_error 
// which given a string will return the error rate of the printer as a string 
// representing a rational whose numerator is the number of errors 
// and the denominator the length of the control string. 
// Don't reduce this fraction to a simpler expression.
//
// The string has a length greater or equal to one and contains only letters from ato z.
//
// Examples:
s="aaabbbbhaijjjm"
console.log(printer_error(s)) //=> "0/14"

s="aaaxbbbbyyhwawiwjjjwwm"
console.log(printer_error(s)) //=> "8/22"

function printerError(s) {
  const err = s.split('').filter(el => el.charCodeAt(0) < 97 || el.charCodeAt(0) > 109)
  return `${err.length}/${s.length}`
}
```
2022-6-18
```js
// Check the exam (7 kyu)
//
// The first input array is the key to the correct answers to an exam, like ["a", "a", "b", "d"]. 
// The second one contains a student's submitted answers.
//
// The two arrays are not empty and are the same length. 
// Return the score for this array of answers, 
// giving +4 for each correct answer, 
// -1 for each incorrect answer, 
// and +0 for each blank answer, represented as an empty string (in C the space character is used).
//
// If the score < 0, return 0.
//
// For example:
console.log(checkExam(["a", "a", "b", "b"], ["a", "c", "b", "d"])) //=> 6
console.log(checkExam(["a", "a", "c", "b"], ["a", "a", "b",  ""])) //=> 7
console.log(checkExam(["a", "a", "b", "c"], ["a", "a", "b", "c"])) //=> 16
console.log(checkExam(["b", "c", "b", "a"], ["",  "a", "a", "c"])) //=> 0

function checkExam(array1, array2) {
  const grade = array2.reduce((grade, answer, qNum) => {
    if(answer === ''){
      return grade
    } else if(answer === array1[qNum]){
      return grade += 4
    } else{
      return grade -= 1
    }
  }, 0) 
  
  return grade >=0 ? grade : 0
}
```
2022-6-17
```js
// A Rule of Divisibility by 13 (6 kyu)
//
// From Wikipedia:
// "A divisibility rule is a shorthand way of determining 
// whether a given integer is divisible by a fixed divisor 
// without performing the division, usually by examining its digits."
//
// When you divide the successive powers of 10 by 13 
// you get the following remainders of the integer divisions:
// 1, 10, 9, 12, 3, 4 because:
//
// 10 ^ 0 ->  1 (mod 13)
// 10 ^ 1 -> 10 (mod 13)
// 10 ^ 2 ->  9 (mod 13)
// 10 ^ 3 -> 12 (mod 13)
// 10 ^ 4 ->  3 (mod 13)
// 10 ^ 5 ->  4 (mod 13)
//
// (For "mod" you can see: https://en.wikipedia.org/wiki/Modulo_operation)
//
// Then the whole pattern repeats. 
// Hence the following method:
//
// Multiply the right most digit of the number 
// with the left most number in the sequence shown above,
// the second right most digit with the second left most digit of the number in the sequence.
// The cycle goes on and you sum all these products. 
// Repeat this process until the sequence of sums is stationary.
//
// Example:
// What is the remainder when 1234567 is divided by 13?
//
// 7      6     5      4     3     2     1  (digits of 1234567 from the right)
// ×      ×     ×      ×     ×     ×     ×  (multiplication)
// 1     10     9     12     3     4     1  (the repeating sequence)
//
// Therefore following the method we get: 
// 7×1 + 6×10 + 5×9 + 4×12 + 3×3 + 2×4 + 1×1 = 178
//
// We repeat the process with the number 178:
//
// 8x1 + 7x10 + 1x9 = 87
//
// and again with 87:
//
// 7x1 + 8x10 = 87
//
// From now on the sequence is stationary (we always get 87) 
// and the remainder of 1234567 by 13 
// is the same as the remainder of 87 by 13 ( i.e 9).
//
// Task:
// Call thirt the function which processes this sequence of operations on an integer n (>=0). 
// thirt will return the stationary number.
//
// Tests:
console.log(thirt(1234567))    //=> 87.
console.log(thirt(321))        //=> 48
console.log(thirt(85299258))   //=> 31
console.log(thirt(5634))       //=> 57
console.log(thirt(1111111111)) //=> 71
console.log(thirt(987654321))  //=> 30

function thirt(n) {
  const calc = (x) => `${x}`.split('').reverse().map((el, i)=>((10**i)%13) * +el).reduce((acc, el) => acc + el,0)
  while(n !== calc(n)){
    n = calc(n)
  }
  
  return n
}

// Recursive version 
// I don't generally prefer recursive functions and instead prefer while loops
// I think it is a little more obvious what is going on for people not familiar with the code to use a loop
function thirtV2(n) {
  const sum = `${x}`.split('').reverse().map((el, i)=>((10**i)%13) * +el).reduce((acc, el) => acc + el,0)
  return sum === n ? n : thirtV2(sum)
}
```
2022-6-16
```js
Most digits (7 kyu)

Find the number with the most digits.

If two numbers in the argument array have the same number of digits, 
return the first one in the array.

Tests:
console.log(findLongest([1, 10, 100])) //=> 100
console.log(findLongest([9000, 8, 800])) //=> 9000
console.log(findLongest([8, 900, 500])) //=> 900

function findLongest(array){
  // Reduce array to an index of longest num found
  // First stored index is 0
  // If the current number is longer than array[0] (where 0 is the accumulator)
  // Then the accumulator is updated to the index of the current number 
  // Return the final index (longest or first found of equal length) from array
  return array[array.reduce((longestIdx, num, i) => `${num}`.length > `${array[longestIdx]}`.length ? i : longestIdx, 0)]
}
```
2022-6-15
```js
// You're a square! (7 kyu)
//
// A square of squares
// You like building blocks. You especially like building blocks that are squares. 
// And what you even like more, is to arrange them into a square of square building blocks!
//
// However, sometimes, you can't arrange them into a square. 
// Instead, you end up with an ordinary rectangle! Those blasted things! 
// If you just had a way to know, whether you're currently working in vain… Wait! 
// That's it! You just have to check if your number of building blocks is a perfect square.
//
// Task:
// Given an integral number, determine if it's a square number:
//
// In mathematics, a square number or perfect square is an integer that is the square of an integer; 
// in other words, it is the product of some integer with itself.
//
// The tests will always use some integral number, so don't worry about that in dynamic typed languages.
//
// Examples:
console.log(isSpare(-1)) //  =>false
console.log(isSpare(0)) // =>true
console.log(isSpare(3)) // =>false
console.log(isSpare(4)) // =>true
console.log(isSpare(25)) //  =>true
console.log(isSpare(26)) //  =>false

var isSquare = function(n){
  return Math.sqrt(n) % 1 === 0 ? true : false
}
```
2022-6-14
```js
Lenght and Two Values (7kyu)

Given a number n and two values firstValue and secondValue, 
build an array of size n filled with firstValue and secondValue alternating.

console.log(alterante(5, true, false)) //=> [true, false, true, false, true];

function alternate(n, firstValue, secondValue){
  const vals = [firstValue, secondValue]
  let retVal = []
  for(let i = 0; i < n; i++){
    retVal.push(vals[i % 2])
  }
  return retVal
}
```
2022-6-13
```js
// Odd or Even? (7 kyu)

// Task:
// Given a list of integers, determine whether the sum of its elements is odd or even.

// Give your answer as a string matching "odd" or "even".

// If the input array is empty consider it as: 
//   [0] (array with a zero).

// Examples:
console.log(oddOrEven([0]) //=> "even"
console.log(oddOrEven([0, 1, 4]) //=> "odd"
console.log(oddOrEven([0, -1, -5]) //=> "even"

const oddOrEven = (array) => array.reduce((a, e, i)=> a + e, 0) % 2 === 0 ? 'even' : 'odd'
```
2022-6-12
```js
// Data Reverse (6 kyu)
//
// A stream of data is received and needs to be reversed.

// Each segment is 8 bits long, 
// meaning the order of these segments needs to be reversed, 
// for example:

console.log(dataReverse([1,1,1,1,1,1,1,1,/*end byte1*/0,0,0,0,0,0,0,0,/*end byte2*/0,0,0,0,1,1,1,1, /*end byte3*/1,0,1,0,1,0,1,0/*end byte4*/]) //=>[1,0,1,0,1,0,1,0,  0,0,0,0,1,1,1,1,  0,0,0,0,0,0,0,0,  1,1,1,1,1,1,1,1]
console.log(dataReverse([0,0,1,1,0,1,1,0,0,0,1,0,1,0,0,1])) //=> [0,0,1,0,1,0,0,1,0,0,1,1,0,1,1,0]
// The total number of bits will always be a multiple of 8.

// The data is given in an array as such:

// [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]

// Note: In the C and NASM languages you are given the third parameter 
// which is the number of segment blocks.

function dataReverse(data) {
  let d = []
  
  for(let start = 0; start < data.length; start += 8){
    d.push([...data.slice(start, start + 8)])
  }

  d = d.reverse()
  
  return d.reduce((acc, el, i)=> [...acc, ...el],[])
}
```
2022-6-11
```js
// Sum of differences in array (8 kyu)
//
// Your task is to sum the differences between consecutive pairs in the array 
// in descending order.
//
// Example
console.log(sumOfDifferences([2, 1, 10])) //=> 9
// In descending order: [10, 2, 1]
// Sum: (10 - 2) + (2 - 1) = 8 + 1 = 9
console.log(sumOfDifferences([-3, -2, -1])) //=> 2
// In descending order: [-1, -2, -3]
// Sum: (-1 - -2) + (-2 - -3) = 1 + 1 = 2
//
// If the array is empty or the array has only one element 
// the result should be 0 

function sumOfDifferences(arr) {
  let f = 0;
  arr.sort((a,b)=> b - a)
  for(let i = 0; i < arr.length - 1; i++){
    f += arr[i] - arr[i + 1]
  }
  
  return f
}
```
2022-6-10
```js
// Flatten and sort an array (7 kyu)
// 
// Challenge:
// 
// Given a two-dimensional array of integers, 
// return the flattened version of the array 
// with all the integers in the sorted (ascending) order.
// 
// Example:
// 
console.log(flattenAndSort([])) //=> []
console.log(flattenAndSort([[], []])) //=> []
console.log(flattenAndSort([[], [1]])) // => [1]
console.log(flattenAndSort([[3, 2, 1], [4, 6, 5], [], [9, 7, 8]]) //=> [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(flattenAndSort([[1, 3, 5], [100], [2, 4, 6]])) //=>  [1, 2, 3, 4, 5, 6, 100]

function flattenAndSort(array) {
  let newArr = []
  
  array.forEach((el)=> {
    if(el.length > 0){
      el.forEach(subEl=>{
        newArr.push(subEl)
      })
    }
  });
  
  return newArr.sort((a,b)=>a-b)
}
```
2022-6-9
```js
// Predict your age! (7 kyu)
//
// My grandfather always predicted how old people would get, 
// and right before he passed away he revealed his secret!
//
// In honor of my grandfather's memory we will write a function using his formula!
// 
// Take a list of ages when each of your great-grandparent died.
// Multiply each number by itself.
// Add them all together.
// Take the square root of the result.
// Divide by two.
// Example
predictAge(65, 60, 75, 55, 60, 63, 64, 45) === 86

// Note: the result should be rounded down to the nearest integer.

// Note original prompt wanted to use the following format to accept args but didn't seem like best practice
// function predictAge(age1, age2, age3, age4, age5, age6, age7, age8){}
function predictAge(...ages){
  return Math.floor(Math.sqrt(ages.map(a=> a*a).reduce((b, c)=> b + c, 0))/2)
}

// This problem taught me about a cool built in function called `Math.hypot()`
// This will accept as many numbers as you want to pass in and return the square root of the sum of squares of the args
// I also learned about the bitwise or operator '|'
// This can only accept integers so any decimal numbers passed in will be truncated to remove the decimal
// So:  retun 5.6 | 0 //=> 5

// My solution could be simplified to
function predictAgeV2(...ages){
  return (Math.hypot(...ages) / 2) | 0
}
```
2022-6-8
```js
// Reverse or rotate? (6 kyu)
//
// The input is a string str of digits. 
// Cut the string into chunks 
// (a chunk here is a substring of the initial string) of size sz 
// (ignore the last chunk if its size is less than sz).
//
// If a chunk represents an integer 
// such as the sum of the cubes of its digits is divisible by 2, 
// reverse that chunk; 
// otherwise rotate it to the left by one position. 
// Put together these modified chunks and return the result as a string.
//
// If
// sz is <= 0 or if str is empty return ""
// sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
//
// Examples:
console.log(revrot("123456987654", 6)) //=> "234561876549"
console.log(revrot("123456987653", 6)) //=> "234561356789"
console.log(revrot("66443875", 4)) //=> "44668753"
console.log(revrot("66443875", 8)) //=> "64438756"
console.log(revrot("664438769", 8)) //=> "67834466"
console.log(revrot("123456779", 8)) //=> "23456771"
console.log(revrot("", 8)) //=> ""
console.log(revrot("123456779", 0)) //=> "" 
console.log(revrot("563000655734469485", 4)) //=> "0365065073456944"

// Example of a string rotated to the left by one position:
// s = "123456" gives "234561".

function revrot(str, sz) {
  const cubeSum = (s) => s.split('').map(el=> (+el)**3).reduce((acc, el)=>acc += el);

  const revrotEach = (s) =>{
    if(cubeSum(s) % 2 === 0){
      return s.split('').reverse().join('');
    }
    else{
      return s.slice(1) + s.slice(0,1);
    }
  }

  if(sz === 0 || str.length < sz){
    return '';
  }
  else{
    var arr = [];
    for(var i = 0; i < str.length; i += sz){
      arr.push(str.slice(i, i + sz));
    }
    return arr.filter((el) => el.length === sz).map((el) => revrotEach(el)).join('');
  }
}
```
2022-6-7
```js
// Sum of Pairs (5 kyu)
//
// Given a list of integers and a single sum value, return the first two values
// (parse from the left please) in order of appearance that add up to form the sum.
//
// Tests:
sum_pairs([11, 3, 7, 5],         10) //=> == [3, 7]
//             ^--^      3 + 7 = 10
sum_pairs([4, 3, 2, 3, 4],         6) //=> [4, 2]
//         ^-----^         4 + 2 = 6, indices: 0, 2 * entire pair is earlier, and therefore is the correct answer
//            ^-----^      3 + 3 = 6, indices: 1, 3
//               ^-----^   2 + 4 = 6, indices: 2, 4
sum_pairs([0, 0, -2, 3], 2) //=> undefined (there are no pairs of values that can be added to produce 2)
sum_pairs([10, 5, 2, 3, 7, 5],         10) // => [3,7]
//              ^-----------^   5 + 5 = 10, indices: 1, 5
//                    ^--^      3 + 7 = 10, indices: 3, 4 * entire pair is earlier, and therefore is the correct answer

// NOTE: Negative numbers and duplicate numbers can and will appear.

function sumPairs(ints, s) {
  let solutions = []
  for(let first = 0; first < ints.length; first++){
    for(let second = ints.length; second > first; second--){
      if(ints[first] + ints[second] === s ){
        solutions.push([ints[first], ints[second]])
      }
    }
  }
  
  return solutions.sort((a, b) => b[1] - a[1])[0] || undefined ;
}

// Alternative solution I liked:
function sum_pairsV2 (ints, s) {
  // This object will keep track of the numbers seen and their first indexes
  // For an array like [42, 5, 5, 7] we will get { '42': 0, '5': 1, '7': 3 }
  const numbersSeen = {};

  for (let i = 0; i < ints.length; i += 1) {
    // For every number...
    const currentNumber = ints[i];
    // Find the pair it needs to add up to "s"
    const pair = s - currentNumber;
    // If we've seen the pair before, we have our best set of numbers!
    if (numbersSeen[pair] !== undefined) {
      return [ pair, currentNumber ];
    }
    // Otherwise save this number's index if we haven't seen it before
    if (numbersSeen[currentNumber] === undefined) {
      numbersSeen[currentNumber] = i;
    }
  }
  // Return "null" if we find nothing after our loop
  return null;
}
```
2022-6-6
```js
// A wolf in sheep's clothing (8 kyu)
// Wolves have been reintroduced to Great Britain. 
// You are a sheep farmer, and are now plagued by wolves which pretend to be sheep. 
// Fortunately, you are good at spotting them.
//
// Warn the sheep in front of the wolf that it is about to be eaten. 
// Remember that you are standing at the front of the queue which is at the end of the array:
//
// [sheep, sheep, sheep, sheep, sheep, wolf, sheep, sheep] (YOU ARE HERE AT THE FRONT OF THE QUEUE)
//    7      6      5      4      3            2      1
// If the wolf is the closest animal to you, return "Pls go away and stop eating my sheep". 
// Otherwise, return "Oi! Sheep number N! You are about to be eaten by a wolf!" 
// where N is the sheep's position in the queue.
//
// Note: there will always be exactly one wolf in the array.
//
// Examples
console.log(warnTheSheep(["sheep", "sheep", "sheep", "wolf", "sheep"])) //=> "Oi! Sheep number 1! You are about to be eaten by a wolf!"
console.log(warntheSheep(["sheep", "sheep", "wolf"])) //=> "Pls go away and stop eating my sheep"

function warnTheSheep(queue) {
  const sheep = (queue.length - 1) - queue.indexOf('wolf')
  return sheep === 0 ? 'Pls go away and stop eating my sheep' : `Oi! Sheep number ${sheep}! You are about to be eaten by a wolf!`
}
```
2022-6-5
```js
// Find the unique number (6 kyu)
//
// 168740590% of 7,67427,738 of 79,490isqua3 Issues Reported
//  JavaScript
// Node v14.x
// VIM
// EMACS
// Instructions
// Output
// There is an array with some numbers. All numbers are equal except for one. Try to find it!
//
console.log(findUniq([ 1, 1, 1, 2, 1, 1 ])) //=> 2
console.log(findUniq([ 0, 0, 0.55, 0, 0 ])) //=> 0.55
// It’s guaranteed that array contains at least 3 numbers.
//
// The tests contain some very huge arrays, so think about performance.

function findUniq(arr) {
  return arr.filter((el)=> arr.lastIndexOf(el) === arr.indexOf(el))[0]
}
```
2022-6-4
```js
// Good vs Evil (6 kyu)
//
// Description
// Middle Earth is about to go to war. 
// The forces of good will have many battles with the forces of evil. 
// Different races will certainly be involved. 
// Each race has a certain worth when battling against others. 
//
// On the side of good we have the following races, with their associated worth:
// Hobbits: 1
// Men: 2
// Elves: 3
// Dwarves: 3
// Eagles: 4
// Wizards: 10
//
// On the side of evil we have:
// Orcs: 1
// Men: 2
// Wargs: 2
// Goblins: 2
// Uruk Hai: 3
// Trolls: 5
// Wizards: 10
//
// Although weather, location, supplies and valor play a part in any battle, 
// if you add up the worth of the side of good 
// and compare it with the worth of the side of evil, 
// the side with the larger worth will tend to win.
//
// Thus, given the count of each of the races on the side of good, 
// followed by the count of each of the races on the side of evil, 
// determine which side wins.
//
// Input:
// The function will be given two parameters. 
// Each parameter will be a string of multiple integers separated by a single space.
// Each string will contain the count of each race on the side of good and evil.
//
// The first parameter will contain the count of each race on the side of good 
// in the following order:
// Hobbits, Men, Elves, Dwarves, Eagles, Wizards.
//
// The second parameter will contain the count of each race on the side of evil 
// in the following order:
// Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.
//
// All values are non-negative integers. 
// The resulting sum of the worth for each side will not 
// exceed the limit of a 32-bit integer.
//
// Output:
// Return 
// "Battle Result: Good triumphs over Evil" if good wins, 
// "Battle Result: Evil eradicates all trace of Good" if evil wins, 
// or "Battle Result: No victor on this battle field" if it ends in a tie.
//
// Tests:
console.log(goodVsEvil('1 1 1 1 1 1', '1 1 1 1 1 1 1')) //=> 'Battle Result: Evil eradicates all trace of Good'
console.log(goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0')) //=> 'Battle Result: Good triumphs over Evil'
console.log(goodVsEvil('1 0 0 0 0 0', '1 0 0 0 0 0 0')) //=> 'Battle Result: No victor on this battle field'
```
2022-6-3
```js
// Multiple of index (8 kyu)
//
// Return a new array consisting of elements which are 
// multiple of their own index in input array (length > 1).
//
// Some cases:
console.log(multipleOfIndex([22, -6, 32, 82, 9, 25])) //=>[-6, 32, 25]
console.log(multipleOfIndex([68, -1, 1, -7, 10, 10])) //=> [-1, 10]
console.log(multipleOfIndex([-56,-85,72,-26,-14,76,-27,72,35,-21,-67,87,0,21,59,27,-92,68])) //=> [-85, 72, 0, 68]

function multipleOfIndex(array) {
  return array.filter((el, i)=> el % i=== 0) 
}
```
2022-6-2
```js
// Yet another staple for the functional programmer. 
// You have a sequence of values and some predicate for those values. 
// You want to remove the longest prefix of elements such that the predicate is true for each element. 
// We'll call this the dropWhile function. It accepts two arguments. 
// The first is the sequence of values, and the second is the predicate function. 
// The function does not change the value of the original sequence.

function isEven(num) {
  return num % 2 === 0;
}
var seq = [2,4,6,8,1,2,5,4,3,2];

dropWhile(seq, isEven) // -> [1,2,5,4,3,2]

// Your task is to implement the dropWhile function. 
// If you've got a span function lying around, this is a one-liner!
// Alternatively, if you have a takeWhile function on your hands, 
// then combined with the dropWhile function, you can implement the span function in one line. 
// This is the beauty of functional programming: 
// there are a whole host of useful functions, 
// many of which can be implemented in terms of each other.

function dropWhile(arr, pred) {
  while(pred(arr[0])){
    arr.shift()
  }
  
  return arr
}
```
2022-6-1
```js
// Matrix Addition (6 kyu)
//
// Write a function that accepts two square matrices 
// (N x N two dimensional arrays), and return the sum of the two. 
// Both matrices being passed into the function will be of size N x N 
// (square), containing only integers.
//
// How to sum two matrices:
// Take each cell [n][m] from the first matrix, 
// and add it with the same [n][m] cell from the second matrix. 
// This will be cell [n][m] of the solution matrix.
//
// Visualization:
// |1 2 3|     |2 2 1|     |1+2 2+2 3+1|     |3 4 4|
// |3 2 1|  +  |3 2 3|  =  |3+3 2+2 1+3|  =  |6 4 4|
// |1 1 1|     |1 1 3|     |1+1 1+1 1+3|     |2 2 4|
//
// Example
console.log(matrixAddition(
  [ [1, 2, 3],
    [3, 2, 1],
    [1, 1, 1] ],
//      +
  [ [2, 2, 1],
    [3, 2, 3],
    [1, 1, 3] ] ))
// returns:
/*  [ [3, 4, 4],
*    [6, 4, 4],
*    [2, 2, 4] ]
*/

console.log(matrixAddition([[1, 2], [1, 2]], [[2, 3],[2, 3]])) //=> [[3,5], [3,5]]
console.log(matrixAddition([[1]], [[2]])) //=> [[3]]
console.log(matrixAddition([[1, 2, 3], [3, 2, 1], [1, 1, 1]], [[2, 2, 1], [3, 2, 3], [1, 1, 3]])) //=>[[3, 4, 4], [6, 4, 4], [2, 2, 4]]

function matrixAddition(a, b){
  return a.map((el, i) => el.map((subEl, idx) => subEl += b[i][idx]))
}
```
2022-5-31
```js
// Fix string case (7 kyu)
//
// In this Kata, you will be given a string that may have mixed uppercase and lowercase letters 
// and your task is to convert that string to either lowercase only or uppercase only based on:
// make as few changes as possible.
//
// if the string contains equal number of uppercase and lowercase letters, 
// convert the string to lowercase.
//
// For example:
console.log(solve("coDe")) //=> "code"   (Lowercase characters > uppercase. Change only the "D" to lowercase.)
console.log(solve("CODe")) //=> "CODE"   (Uppercase characters > lowecase. Change only the "e" to uppercase.)
console.log(solve("coDE")) //=> "code"   (Upper == lowercase. Change all to lowercase.)

function solve(s){
  let upLeng = s.split('').filter(l=> l === l.toUpperCase()).length
  return  upLeng > s.length - upLeng ? s.toUpperCase() : s.toLowerCase()
}
```
2022-5-30
```js
// Shortest steps to a number (6 kyu)

// Summary:
// Given a number, num, return the shortest amount of steps it would take from 1, to land exactly on that number.

// Description:
// A step is defined as either:

// Adding 1 to the number: num += 1
// Doubling the number: num *= 2
// You will always start from the number 1 and you will have to 
// return the shortest count of steps it would take to land exactly on that number.

// 1 <= num <= 10000

// Examples:
// num == 3 would return 2 steps:
// 1 -- +1 --> 2:        1 step
// 2 -- +1 --> 3:        2 steps
// 2 steps
//_______________________________
// num == 12 would return 4 steps:
// 1 -- +1 --> 2:        1 step
// 2 -- +1 --> 3:        2 steps
// 3 -- x2 --> 6:        3 steps
// 6 -- x2 --> 12:       4 steps
// 4 steps
//_______________________________
// num == 16 would return 4 steps:
// 1 -- +1 --> 2:        1 step
// 2 -- x2 --> 4:        2 steps
// 4 -- x2 --> 8:        3 steps
// 8 -- x2 --> 16:       4 steps
// 4 steps
//_______________________________

console.log(shortestStepsToNum(1)) //=> 0
console.log(shortestStepsToNum(12)) //=> 4
console.log(shortestStepsToNum(16)) //=> 4
console.log(shortestStepsToNum(71)) //=> 9

function shortestStepsToNum(num) {
  let count = 0;
  
  // If the number is greater than goal number (1)...
  while(num > 1){
    if(num % 2 === 0){
      // If number is even divide by two and increase count
      num /= 2;
      count++
    } else{
      // If odd subtract one to make even (or 1) and increase count
      num -= 1
      count++;
    }
  }
  
  // return count after reducing number or 0 if number started at goal (1)
  return count
}
```
2022-5-29
```js
// Count the divisible numbers (6 kyu)
//
// Complete the function that takes 3 numbers x, y and k (where x ≤ y), 
// and returns the number of integers within the range [x..y] 
// (both ends included) that are divisible by k.
//
// More scientifically: { i : x ≤ i ≤ y, i mod k = 0 }
//
// Example
// Given x = 6, y = 11, k = 2 the function should return 3, 
// because there are three numbers divisible by 2 between 6 and 11: 6, 8, 10
//
// Note: The test cases are very large. 
// You will need a O(log n) solution or better to pass. (A constant time solution is possible.)
//
// Tests:
console.log(divisibleCount(6, 11, 2)) //=> 3
console.log(divisibleCount(11, 345, 17)) //=> 20
console.log(divisibleCount(0, 1, 7)) //=> 1
console.log(divisibleCount(20, 20, 2)) //=> 1
console.log(divisibleCount(20, 20, 8)) //=> 0 
console.log(divisibleCount(19, 20, 2)) //=> 1
console.log(divisibleCount(0, 10, 1)) //=> 11
console.log(divisibleCount(11, 14, 2)) //=> 2
console.log(divisibleCount(101, 9007199254740991, 11)) //=> 818836295885535
console.log(divisibleCount(1005, 9007199254740991, 109)) //=> 82634855548073

// Constant time solution:
function divisibleCount(x, y, k) {
  // Find first divisible number
  while(x % k !== 0){
    x++
  }

  // Ceil of range (inclusive) / divisor will be the number of elements evenly divisible by divisor
  return Math.ceil(((y + 1) - x) / k)
}

```
2022-5-28
```js
// 'x' marks the spot. (7 kyu)
//
// #'x' marks the spot
// 
// ##Task:
// Given a two dimensional array, return the co-ordinates of 'x'.
// If 'x' is not inside the array, or if 'x' appears multiple times, return []
// The co-ordinates should be zero indexed.
// You should assume you will always get an array as input. 
// The array will only contain 'x's and 'o's.
//
// Example test cases:
// 'Return an empty array if input is an empty array' => []
console.log(xMarksTheSpot([]))
//
// 'Return an empty array if no x found' => []
console.log(xMarksTheSpot([
  ['o', 'o'],
  ['o', 'o']
]))
//
// 'Return an empty array if more than one x found' => []
console.log(xMarksTheSpot([
  ['x', 'o'],
  ['o', 'x']
]))
//
// 'Return [0,0] when x at top left' => [0, 0]
console.log(xMarksTheSpot([
  ['x', 'o'],
  ['o', 'o']
]))
//
// 'Return [4,6] for the example below' => [4, 6]
console.log(xMarksTheSpot([
  ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o'],
  ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o'],
  ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o'],
  ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o'],
  ['o', 'o', 'o', 'o', 'o', 'o', 'x', 'o'],
  ['o', 'o', 'o', 'o', 'o', 'o', 'o', 'o']
]))

const xMarksTheSpot = (input) => {
  let spot = []
  for(let i = 0; i < input.length; i++){
    if(input[i].indexOf('x') > -1 && input[i].lastIndexOf('x') === input[i].indexOf('x')){
      spot.push(i)
      spot.push(input[i].indexOf('x'))
    }
  }
  
  if(spot.length > 2 || spot.length === 0){
    return []
  } else {
    return spot
  }
}
```
2022-5-27
```js
// The takeWhile Function (6 kyu)

// Here's another staple for the functional programmer. 
// You have a sequence of values and some predicate for those values. 
// You want to get the longest prefix of elements such that the predicate is true for each element. 
// We'll call this the takeWhile function. 
// It accepts two arguments. 
// The first is the sequence of values, and the second is the predicate function. 
// The function does not change the value of the original sequence.

// function isEven(num) {
//   return num % 2 === 0;
// }
// var seq = [2,4,6,8,1,2,5,4,3,2];

// takeWhile(seq, isEven) // -> [2,4,6,8]
// Your task is to implement the takeWhile function.

// If you've got a span function lying around, this is a one-liner! 
// Also, if you liked this problem, you'll surely love the dropWhile function.

// Tests:
// isEven() tests
function isEven(num) {
  return num % 2 === 0;
}

console.log(takeWhile([2,6,4,10,1,5,4,3] ,isEven)) //=> [2,6,4,10]
console.log(takeWhile([2,100,1000,10000,5,3,4,6] ,isEven)) //=> [2,100,1000,10000]
console.log(takeWhile([998,996,12,-1000,200,0,1,1,1] ,isEven)) //=> [998,996,12,-1000,200,0]
console.log(takeWhile([1,4,2,3,5,4,5,6,7] ,isEven)) //=> []
console.log(takeWhile([2,4,10,100,64,78,92] ,isEven)) //=> [2,4,10,100,64,78,92]

// isOdd() tests
function isOdd(num) {
  return num % 2 !== 0;
}
console.log(takeWhile([1,5,111,1111,2,4,6,4,5] ,isOdd)) //=> [1,5,111,1111]
console.log(takeWhile([-1,-5,127,86,902,2,1] ,isOdd)) //=> [-1,-5,127]
console.log(takeWhile([2,1,2,4,3,5,4,6,7,8,9,0] ,isOdd)) //=> []
console.log(takeWhile([1,3,5,7,9,111] ,isOdd)) //=> [1,3,5,7,9,111]



// Solution
function takeWhile (arr, pred) {
  let newArr = []
  let i =0
  while(pred(arr[i]) && i < arr.length){
    newArr.push(arr[i])
    i++
  }
  
  return newArr
}
```
2022-5-26
```js
// Digital cypher (7 kyu)
// 
// Introduction
// Digital Cypher assigns to each letter of the alphabet unique number. For example:
// | a | b | c | d | e | f | g | h | i | j | k | l | m |
// | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |13 |
// | n | o | p | q | r | s | t | u | v | w | x | y | z |
// | 14| 15| 16| 17| 18| 19| 20| 21| 22| 23| 24| 25| 26|
// Instead of letters in encrypted word 
// we write the corresponding number, 
// 
// eg. The word scout:
// | s | c | o | u | t |
// |19 | 3 | 15| 21| 20|
// 
// Then we add to each obtained digit consecutive digits from the key. 
// 
// For example. In case of key equal to 1939 :
//    s  c  o  u  t
//   19  3 15 21 20
//  + 1  9  3  9  1
//  ---------------
//   20 12 18 30 21
// 
//    m  a  s  t  e  r  p  i  e  c  e
//   13  1 19 20  5 18 16  9  5  3  5
// +  1  9  3  9  1  9  3  9  1  9  3
//   --------------------------------
//   14 10 22 29  6 27 19 18  6  12 8
// 
// Task
// Write a function that accepts str string and key number 
// and returns an array of integers representing encoded str.
// 
// Input / Output
// The str input string consists of lowercase characters only.
// The key input number is a positive integer.
// 
// Example
console.log(Encode("scout",1939)); //=>  [ 20, 12, 18, 30, 21]
console.log(Encode("masterpiece",1939)); //=>  [ 14, 10, 22, 29, 6, 27, 19, 18, 6, 12, 8]

function encode(str, n){
  const letters = ' abcdefghijklmnopqrstuvwxyz'
  i = 0
  return str.split('').map(l => {
    if(i >= `${n}`.length) {i = 0}
    let el = +letters.indexOf(l) + +`${n}`[i]
    i++
    return el
  })
}
```
2022-5-25
```js
// Merge two sorted arrays into one (8 kyu)
//
// You are given two sorted arrays that both only contain integers. 
// Your task is to find a way to merge them into a single one, 
// sorted in asc order. 
// Complete the function mergeArrays(arr1, arr2), 
// where arr1 and arr2 are the original sorted arrays.
//
// You don't need to worry about validation, 
// since arr1 and arr2 must be arrays with 0 or more Integers. 
// If both arr1 and arr2 are empty, then just return an empty array.
//
// Note: arr1 and arr2 may be sorted in different orders. 
// Also arr1 and arr2 may have same integers. 
// Remove duplicated in the returned result.
//
// Examples (input -> output)
console.log(mergeArrays([1, 2, 3, 4, 5], [6, 7, 8, 9, 10])) //=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(mergeArrays([1, 3, 5, 7, 9], [10, 8, 6, 4, 2])) //=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(mergeArrays([1, 3, 5, 7, 9, 11, 12], [1, 2, 3, 4, 5, 10, 12])) //=> [1, 2, 3, 4, 5, 7, 9, 10, 11, 12]

function mergeArrays(arr1, arr2) {
  return [...arr1, ...arr2].sort((a, b)=> a - b).filter((el, i, arr) => i === arr.indexOf(el))
}
```
2022-5-24
```js
// Bingo ( Or Not ) (7 kyu)
// 
// For this game of BINGO, you will receive 
// a single array of 10 numbers from 1 to 26 as an input. 
// Duplicate numbers within the array are possible.
// 
// Each number corresponds to their alphabetical order letter 
// (e.g. 1 = A. 2 = B, etc). 
// Write a function where you will win the game 
// if your numbers can spell "BINGO". 
// They do not need to be in the right order in the input array. 
// Otherwise you will lose. 
// Your outputs should be "WIN" or "LOSE" respectively.
//
// Tests:
console.log(bingo([1,2,3,4,5,6,7,8,9,10])) //=> 'LOSE' (does not contain 'B: 2 I: 9 N: 14 G: 7 O: 15')
console.log(bingo([21,13,2,7,5,14,7,15,9,10])) //=> 'WIN' (does contain 'B: 2 I: 9 N: 14 G: 7 O: 15')

function bingo(a) {
  const key = [2, 9, 14, 7, 15] // B: 2 I: 9 N: 14 G: 7 O: 15
  // Reduce a to only include numbers we care about (key to 'bingo')
  // Don't include duplicates of numbers
  // Compare length of reduced array to length of key
  // Since there are no duplicates if the length is the same then all values needed are accounted for and 'WIN' else missing needed letters and 'LOSE'
  return key.length === a.reduce((acc, el, i) => key.includes(el) && i === a.indexOf(el) ? [...acc, el] : [...acc],[]).length ?
    'WIN' : 'LOSE'
}
```
2022-5-23
```js
// Find the middle element (7 kyu)
// 
// As a part of this Kata, you need to create a function that when provided with a triplet, 
// returns the index of the numerical element that lies between the other two elements.
// 
// The input to the function will be an array of three distinct numbers (Haskell: a tuple).
//
// For example:
console.log(gimme([2, 3, 1])) //=> 0
// 2 is the number that fits between 1 and 3 and the index of 2 in the input array is 0.

console.log(gimme([5, 10, 14])) //=> 1
// 10 is the number that fits between 5 and 14 and the index of 10 in the input array is 1.

function gimme (triplet) {
  return triplet.indexOf([...triplet].sort((a,b)=>a-b)[1])
}
```
2022-5-22
```js
// Form The Minimum (7 kyu)
//
// Task
// Given a list of digits, return the smallest number that could be formed from these digits, 
// using the digits only once (ignore duplicates).
//
// Notes:
// Only positive integers will be passed to the function (> 0 ), no negatives or zeros.
// Input >> Output Examples
// minValue ({1, 3, 1})  ==> return (13)
// Explanation:
// (13) is the minimum number could be formed from {1, 3, 1} , Without duplications
//
// minValue({5, 7, 5, 9, 7})  ==> return (579)
// Explanation:
// (579) is the minimum number could be formed from {5, 7, 5, 9, 7} , Without duplications
//
// minValue({1, 9, 3, 1, 7, 4, 6, 6, 7}) return  ==> (134679)
// Explanation:
// (134679) is the minimum number could be formed from {1, 9, 3, 1, 7, 4, 6, 6, 7} , Without duplications

console.log(minValue([1, 3, 1])); //=> 13
console.log(minValue([4, 7, 5, 7])); //=> 457
console.log(minValue([4, 8, 1, 4])); //=> 148
console.log(minValue([5, 7, 9, 5, 7])); //=> 579
console.log(minValue([6, 7, 8, 7, 6, 6])); //=> 678
console.log(minValue([5, 6, 9, 9, 7, 6, 4])); //=> 45679
console.log(minValue([1, 9, 1, 3, 7, 4, 6, 6, 7])); //=> 134679
console.log(minValue([3, 6, 5, 5, 9, 8, 7, 6, 3, 5, 9])); //=> 356789
console.log(minValue([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])); //=> 1

function minValue(values){
  // Remove duplicates, sort smaller numbers to front of arr join and return as number
  return +values.filter((el, i, arr) => i === arr.indexOf(el)).sort().join('')
}
```
2022-5-21
```js
// Triangular Treasure (7 kyu)
//
// Triangular numbers are so called because of the equilateral triangular shape that they occupy when laid out as dots. i.e.
//
// 1st (1)   2nd (3)    3rd (6)
// *          **        ***
//            *         **
//                      *
// You need to return the nth triangular number. You should return 0 for out of range values:
//
// For example: (Input => Output)
console.log(triangular(0) //=> 0
console.log(triangular(2) //=> 3
console.log(triangular(3) //=> 6
console.log(triangular(-10) //=> 0

function triangular(n) {
  // Sum of sequence
  // S = (n/2)*(a * L) 
  // S: sum
  // n: number of items in sequence
  // a: first number in sequence 
  // L: last number in sequence
  return n >= 1 ? (n/2)*(1 + n): 0
}

```
2022-5-20
```js
// Consecutive items (7 kyu)
//
// You are given a list of unique integers arr, and two integers a and b. 
// Your task is to find out whether or not a and b appear consecutively in arr, 
// and return a boolean value (True if a and b are consecutive, False otherwise).
//
// It is guaranteed that a and b are both present in arr.
//
// Tests: 
console.log(consecutive([1, 3, 5, 7], 3, 7)) // => false
console.log(consecutive([1, 3, 5, 7], 3, 1)) //=> true
console.log(consecutive([1, 6, 9, -3, 4, -78, 0], -3, 4)) //=> true

function consecutive(arr, a, b) { 
  return Math.abs(arr.indexOf(a) - arr.indexOf(b)) === 1 ? true : false
}
```
2022-5-19
```js
// Is a number prime? (6 kyu)
// Define a function that takes an integer argument 
// and returns a logical value true or false 
// depending on if the integer is a prime.

// Per Wikipedia, a prime number ( or a prime ) 
// is a natural number greater than 1 
// that has no positive divisors other than 1 and itself.

// Requirements
// You can assume you will be given an integer input.
// You can not assume that the integer will be only positive. 
// You may be given negative numbers as well ( or 0 ).

// NOTE on performance: There are no fancy optimizations required, 
// but still the most trivial solutions might time out. 
// Numbers go up to 2^31 ( or similar, depending on language ). 
// Looping all the way up to n, or n/2, will be too slow.

// Tests:
console.log(isPrime(0)) //=> false
console.log(isPrime(1)) //=> false
console.log(isPrime(2)) //=> true
console.log(isPrime(73)) //=> true
console.log(isPrime(75)) //=> false
console.log(isPrime(-1)) //=> false

function isPrime(num) {
  // Only a positive number can be not prime
  if(num > 1){
    // Loop up to the sqrt of the number
    for(let i = 2; i <= Math.ceil(Math.sqrt(num)); i++){
      // Check if number divides by current iterator (and isn't 1 or itself)
      if(num % i === 0 && i !== 1 && i !== num){
        return false
      }
    }
  } else{
    // Number was less than 1 so it is definitely not prime since prime must be greater than 1
    return false
  }

  // No divisors found in loop and greater than 1 so is prime
  return true
}
```
2022-5-18
```js
// Perfect squares, perfect fun (7 kyu)
//
// Given an integer, if the length of it's digits is a perfect square, 
// return a square block of sqroot(length) * sqroot(length). 
// If not, simply return "Not a perfect square!".
//
// Examples:
console.log(squareInt(1212)) // => '12\n12`
// Note: 4 digits so 2 squared (2x2 perfect square). 2 digits on each line.

console.log(squareInt(123123123)) //=> '123\n123\n123'
// Note: 9 digits so 3 squared (3x3 perfect square). 3 digits on each line.

function squareIt(int) {
  let intStr = `${int}`
  let lengSqrt = Math.sqrt(intStr.length)
  if(lengSqrt % 1 === 0){
    let newStr = ''
    let spread = [...intStr]
    spread.forEach((el, i) => {
      (i + 1) % lengSqrt === 0 && i + 1 !== spread.length ? newStr += el + '\n' : newStr += el
    })

    return newStr
  }
	return 'Not a perfect square!';
}
```
2022-5-17
```js
// Build a pile of Cubes (6kyu)
//
// Your task is to construct a building which will be a pile of n cubes. 
// The cube at the bottom will have a volume of n^3, 
// the cube above will have volume of (n-1)^3 
// and so on until the top which will have a volume of 1^3.
//
// You are given the total volume m of the building. 
// Being given m can you find the number n of cubes you will have to build?
//
// The parameter of the function findNb (find_nb, find-nb, findNb, ...) 
// will be an integer m and you have to return the integer n 
// such as n^3 + (n-1)^3 + ... + 1^3 = m 
// if such a n exists or -1 if there is no such n.

// Examples:
console.log(findNb(1071225)) //=> 45
console.log(findNb(91716553919377)) //=> -1

function findNb(m) {
    // 1 cube initial start
    let vol = 1
    let cubes = 1
    
    // Increment cubes and volume while vol is less then desired (m)
    while(vol <= m){
      // Check if vol has reached m with perfect solution
      if(vol === m){
        // return cubes needed for perfect solution
        return cubes
      }

      // No solution found this iteration increment cubes and volume
      cubes++
      vol += cubes**3
    }

    // While loop concluded with no vol === m match so no solution
    return -1;
}
```
2022-5-16
```js
// Don't give me five! (7 kyu)
// In this kata you get the start number and the end number of a region 
// and should return the count of all numbers except numbers with a 5 in it. 
// The start and the end number are both inclusive!
//
// Examples:
console.log(dontGiveMeFive(1,9)  //=> 1,2,3,4,6,7,8,9 -> Result 8
console.log(dontGiveMeFive(4,17) //=> 4,6,7,8,9,10,11,12,13,14,16,17 -> Result 12
// The result may contain fives. ;-)
// The start number will always be smaller than the end number. Both numbers can be also negative!
//
// I'm very curious for your solutions and the way you solve it. 
// Maybe someone of you will find an easy pure mathematics solution.
// Have fun coding it and please don't forget to vote and rank this kata! :-)
// I have also created other katas. Take a look if you enjoyed this kata!

function dontGiveMeFive(start, end){
  // Create null array of length start - end + 1 (to include last num)
  // Map over and assign each element start + index so first element would be start second would be start + 1 etc
  // Filter the array by convertin num to string and seeing if any of the chars are 5
  // Return length of filtered array
  return Array.apply(null, new Array(end - start + 1)).map((el, i) => start + i).filter(el=> !`${el}`.includes('5')).length
}
```
2022-5-15
```js
// Help the bookseller! (6 kyu)
// A bookseller has lots of books classified in 26 categories labeled A, B, ... Z. 
// Each book has a code c of 3, 4, 5 or more characters. 
// The 1st character of a code is a capital letter which defines the book category.

// In the bookseller's stocklist each code c is followed by a space and by a positive integer n (int n >= 0) 
// which indicates the quantity of books of this code in stock.

// For example an extract of a stocklist could be:

// L = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
// You will be given a stocklist (e.g. : L) and a list of categories in capital letters e.g :

// M = ["A", "B", "C", "W"]
// and your task is to find all the books of L with codes belonging to each category of M 
// and to sum their quantity according to each category.

// For the lists L and M of example you have to return the string 
// (in Haskell/Clojure/Racket a list of pairs):

// '(A : 20) - (B : 114) - (C : 50) - (W : 0)'
// where A, B, C, W are the categories, 
// 20 is the sum of the unique book of category A, 
// 114 the sum corresponding to "BKWRK" and "BTSQZ", 
// 50 corresponding to "CDXEF" 
// and 0 to category 'W' since there are no code beginning with W.

// If L or M are empty return string is "" 
// (Clojure and Racket should return an empty array/list instead).

// Note:
// In the result codes and their values are in the same order as in M.

// Tests:
let b = ["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"]
let c = ["A", "B"]
console.log(stockList(b, c)) //=> "(A : 200) - (B : 1140)"

b = ["CBART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
c = ["A", "B", "C", "W"]
console.log(stockList(b, c)) //=> "(A : 0) - (B : 114) - (C : 70) - (W : 0)"

function stockList(listOfArt, listOfCat){
  // Check for invalid input
  if(listOfArt.length < 1 || listOfCat.length < 1){
    return ''
  }
  
  // Map art to array of subarrays [['A', 20], ['B', 10], ...]
  let artCount = listOfArt.map(el => {
    // Split current string by space (code and amount)
    el = el.split(' ')
    // Only save the first letter of the code to the first index
    el[0] = el[0][0]
    // return new subarray with First Letter/value pair
    return el
  }).filter(el => listOfCat.includes(el[0][0])) // Remove subarrays that won't be counted
  
  // Initialize categories to 0
  listOfCat = listOfCat.map(el=> [el, 0])
  
  // Merge the categories and count array (categories first)
  let merged = [...listOfCat, ...artCount]
  
  // Reduce array to obj (easier to check for and update values than an array)
  // To add all values of like strings
  merged = merged.reduce((acc, el) => {
    // If they key/values doesn't exist yet needs init to 0
    acc[el[0]] = (acc[el[0]] || 0) + +el[1]
    return acc
  } , {})
  
  // Create an array from the object that was made to add avlues
  // Map through array and create a string for each element
  // Join strings with ' - ' to get final output
  return Object.entries(merged).map(el =>`(${el[0]} : ${el[1]})`).join(' - ')
}
```
2022-5-14
```js
// 6 kyu
// Cancer cells
//
// Your task is to write a function which cuts cancer cells from the body.
//
// Cancer cells are divided into two types:
// Advance stage,described as letter C
// Initial stage,described as letter c
// Rest cells are divided as follows:
//
// Normal cell,described as lowercase letter
// Important cell,described as uppercase letter
// Prerequisites:
// Important cell,cannot be cut out.
// Advance cancer cell,should be cut out with adjacent cells if it can be done.
// Function input is a string (representing a body), 
// remove "cancer" characters (based on the described rules) 
// and return the body cured of those "cancer" characters.
//
// Tests: 
console.log(cutCancerCells('CC')) //=> ''
console.log(cutCancerCells('CAAC')) //=> 'AA
console.log(cutCancerCells('CaaC')) //=> ''
console.log(cutCancerCells('C')) //=> ''
console.log(cutCancerCells('acb')) //=> 'ab'

function cutCancerCells(organism){
  return organism.split('').filter((el, i, arr)=> {
    if((arr[i + 1] === 'C' && el !== el.toUpperCase()) || 
       (arr[i - 1] === 'C' && el !== el.toUpperCase()) || 
       (el === 'C' || el === 'c')){
      return false
    } else {
      return true
    }
  }).join('')  
}
```
2022-5-13
```js
// Two Joggers (6kyu)
//
// Description
// Bob and Charles are meeting for their weekly jogging tour. 
// They both start at the same spot called "Start" and they each run a different lap, 
// which may (or may not) vary in length. 
// Since they know each other for a long time already, 
// they both run at the exact same speed.
//
// Illustration
// Example where Charles (dashed line) runs a shorter lap than Bob:
//
// Example laps
//
// Task
// Your job is to complete the function nbrOfLaps(x, y) 
// that, given the length of the laps for Bob and Charles, 
// finds the number of laps that each jogger has to complete 
// before they meet each other again, at the same time, at the start.
//
// The function takes two arguments:
//
// The length of Bob's lap (larger than 0)
// The length of Charles' lap (larger than 0)
//
// The function should return an array (Tuple<int, int> in C#) 
// containing exactly two numbers:
//
// The first number is the number of laps that Bob has to run
// The second number is the number of laps that Charles has to run
//
// Examples:
nbrOfLaps(5, 3); // returns [3, 5]
nbrOfLaps(4, 6); // returns [3, 2]

var nbrOfLaps = function (b, c) {
  // They will each have to run 1 lap so we can initialize each lap count to 1
  let laps = [1, 1]
  // While the lap counts * length of laps are not equal
  while(b * laps[0] !==  c * laps[1]){
    // Increase the smaller of the two distances by 1 lap
    laps = b * laps[0] < c * laps[1] ? [laps[0] + 1, laps[1]] : [laps[0], laps[1] + 1]  
  }
  
  // Return laps array with lap counts after distance times laps equal for both runners
  return laps;
}
```
2022-5-12
```js
// Remove the parentheses (6 kyu)
//
// In this kata you are given a string 
//
// for example:
// "example(unwanted thing)example"
//
// Your task is to remove everything inside the parentheses 
// as well as the parentheses themselves.

// The example above would return:

// "exampleexample"
// Notes
// Other than parentheses only letters and spaces can occur in the string.
//  Don't worry about other brackets like "[]" and "{}" 
// as these will never appear.
// There can be multiple parentheses.
// The parentheses can be nested.

function removeParentheses(s){
  // Split string to array and reduce array to object
  // object contains count of opening parenthesis at the current element
  // and string where elements are added as count === 0
  return s.split('').reduce((acc,el)=> {
    if(el === '('){// If the current element is '(' 
      //(about to be between parens)
      // Increase opening paren count
      return {...acc, count: acc.count + 1}
    } else if(el === ')'){// If the current element is ')'
      // (leaving a set of parens)
      // Decrease opening paren count
      return {...acc, count: acc.count - 1}
    } else if(acc.count === 0){ // If opening paren count is 0 we have not entered or have hit a closing paren for every opening paren encountered
      // (Not inside a set of parens)
      // Add the current element to a string
      return {...acc, str: acc.str + el}
    } else{ // Count is more than 0 and current element is not closing paren
      // Disregard current element
      return {...acc}
    }
  },{count: 0, str: ''}).str // return string built in acc objet
}
```
2022-5-11
```js
// Maximum Length Difference (7 kyu)
//
// You are given two arrays a1 and a2 of strings. 
// Each string is composed with letters from a to z. 
// Let x be any string in the first array and y be any string in the second array.
//
// Find max(abs(length(x) − length(y)))
//
// If a1 and/or a2 are empty return -1 in each language 
// except in Haskell (F#) where you will return Nothing (None).
// Bash note:
// input : 2 strings with substrings separated by ,
// output: number as a string
//
// Example:
a1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
a2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
mxdiflg(a1, a2) //=> 13

function mxdiflg(a1, a2) {
  if(a1.length === 0 || a2.length === 0){
    return -1
  }
  
  // convert to num -> sort ascending -> keep first and last num (smallest and biggest)->
  const smallBig = arr => arr.map(el=> +el.length).sort((a,b)=> a - b).filter((el, i, arr)=> i === 0 || i === arr.length - 1)
  a1 = smallBig(a1)
  a2 = smallBig(a2)
  
  // Cross compare smallest and biggest num and return the largest of the two differences
  return Math.max(a1[a1.length - 1] - a2[0], a2[a2.length - 1] - a1[0])
}
```
2022-5-10
```js
// Is the King In Check? (5kyu)
// You have to write a function that takes for input a 8x8 chessboard in the form of a bi - dimensional array of chars
// (or strings of length 1, depending on the language) 
// and returns a boolean indicating whether the king is in check.
//
// The array will include 64 squares which can contain the following characters:
// '♔' for the black King;
// '♛' for a white Queen;
// '♝' for a white Bishop;
// '♞' for a white Knight;
// '♜' for a white Rook;
// '♟' for a white Pawn;
// ' '(a space) if there is no piece on that square.
//
// Note : these are actually inverted - color chess Unicode characters 
// because the codewars dark theme makes the white appear black and vice versa.
// Use the characters shown above.
//
// There will always be exactly one king, which is the black king, 
// whereas all the other pieces are white.
// The board is oriented from Black's perspective.
// Remember that pawns can only move and take forward.
// Also be careful with the pieces' lines of sight ;-).
//
// The input will always be valid, no need to validate it.
// To help you visualize the position, tests will print a chessboard to show you the problematic cases.
// Looking like this :
// |---|---|---|---|---|---|---|---|
// |   |   |   |   |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   | ♜ |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   |   |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   | ♔ |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   |   |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   |   |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   |   |   |   |   |   |
// |---|---|---|---|---|---|---|---|
// |   |   |   |   |   |   |   |   |
// |---|---|---|---|---|---|---|---|

// Tests:
// Should work with check by pawn
let chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', '♟', ' ', ' ', ' ', ' '],
  [' ', ' ', '♔', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with check by bishop
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', '♝', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ['♔', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with a check by rook
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', '♔', ' ', '♜', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with a check by knight
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', '♞', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', '♔', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with a check by queen
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', '♔', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', '♛', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with a king alone
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', '♔', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with no check
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ['♛', ' ', ' ', '♞', ' ', ' ', ' ', '♛'],
  [' ', ' ', ' ', '♔', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))

// Should work with another piece blocking line of site
chessboard = [
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ['♜', ' ', '♝', '♔', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']];
console.log(kingIsInCheck(chessboard))


function kingIsInCheck(chessboard) {
  // Get list of pieces on board
  let pieceLocations = [] //=> [[piece, rowNum, colNum], [...]...] => [['♛', 1, 3], [...]...]
  let kingLocation = [] //=> [rowNum, colNum] => [1, 6]

  // Loop through board to find piece locations and king location
  for (let row = 0; row < chessboard.length; row++) {
    for (let col = 0; col < chessboard[row].length; col++) {
      // Space at current row/col is not empty
      if (chessboard[row][col] !== ' ') {
        // If it is king, update king location
        if (chessboard[row][col] === '♔') {
          kingLocation = [row, col]
        } else { // Not king, add to arr of pieces/locations
          pieceLocations.push([chessboard[row][col], row, col])
        }
      }

      // Do nothing if not piece found at current square
    }
  }

  // Reduce list of piece locations to a true or false value
  // Will check all pieces and if one of them has check then the entire array reduces to true
  // Otherwise array will reduce to false
  return pieceLocations.reduce((acc, el) => {

    // Returns general direction of king as [row, col]
    // where row is the direction of row 
    // (0 = same row; 1 = king is in a higher row number; -1 = king is in a lower row number)
    const getKingDirection = (piece, king) => {
      let rowIncr = 0
      let colIncr = 0

      // get general row direction of king
      if (piece[1] > king[0]) {
        rowIncr = -1
      } else if (piece[1] < king[0]) {
        rowIncr = 1
      }

      // get general col direction of king
      if (piece[2] > king[1]) {
        colIncr = -1
      } else if (piece[2] < king[1]) {
        colIncr = 1
      }

      return [rowIncr, colIncr]
    }

    // Returns if the passed in piece will hit the king moving in given general direction
    // ex: rowIncr === 0 and colIncr === 1/-1 same row will check if can take by moving through column
    const checkForKing = (piece, rowIncr, colIncr) => {
      // Check chessboard in direction of rowIncr + colIncr for a piece (not space)
      // If it is a king then check
      // If it is not a king then no check
      let piecePathRow = piece[1]
      let piecePathCol = piece[2]
      let pieceCheck = null
      // While within confines of the board
      while (piecePathRow + rowIncr >= 0 && piecePathRow + rowIncr <= 7 && piecePathCol + colIncr >= 0 && piecePathCol + colIncr <= 7) {
        if (chessboard[piecePathRow + rowIncr][piecePathCol + colIncr] === ' ') {
          // next space is empty continue to next space
          piecePathRow += rowIncr
          piecePathCol += colIncr
        } else if (chessboard[piecePathRow + rowIncr][piecePathCol + colIncr] === '♔') {
          // Next space has king, check is true
          pieceCheck = true
          piecePathRow = 8
          piecePathCol = 8
        } else {
          // Next space has a different piece, no check possible
          pieceCheck = false
          piecePathRow = 8
          piecePathCol = 8
        }
      }

      return pieceCheck
    }

    // Pawn
    if (el[0] === '♟') {
      // Use pawn and king location to search for check (don't need to check line of sight since king must be next to it)
      return el[1] === kingLocation[0] - 1 && (el[2] === kingLocation[1] + 1 || el[2] === kingLocation[1] - 1) || acc
    }

    // Bishop
    if (el[0] === '♝') {
      const [rowIncr, colIncr] = getKingDirection(el, kingLocation)
      // if king is on same row or column it is definitely not in check
      if (rowIncr === 0 || colIncr === 0) {
        return false || acc
      }

      return checkForKing(el, rowIncr, colIncr) || acc
    }

    // Rook
    if (el[0] === '♜') {
      const [rowIncr, colIncr] = getKingDirection(el, kingLocation)

      // if king is not on same row or column it is definitely not in check
      if (rowIncr !== 0 && colIncr !== 0) {
        return false || acc
      }

      return checkForKing(el, rowIncr, colIncr) || acc
    }

    // Knight
    if (el[0] === '♞') {
      // Get array of possible knight moves
      let possibleKnightMoves = []
      let knightPathRow = el[1]
      let knightPathCol = el[2]
      let knightCheck = false

      possibleKnightMoves.push([(knightPathRow + 2), (knightPathCol - 1)])
      possibleKnightMoves.push([(knightPathRow + 2), (knightPathCol + 1)])
      possibleKnightMoves.push([(knightPathRow + 1), (knightPathCol - 2)])
      possibleKnightMoves.push([(knightPathRow - 1), (knightPathCol - 2)])
      possibleKnightMoves.push([(knightPathRow - 2), (knightPathCol - 1)])
      possibleKnightMoves.push([(knightPathRow - 2), (knightPathCol + 1)])
      possibleKnightMoves.push([(knightPathRow - 1), (knightPathCol + 2)])
      possibleKnightMoves.push([(knightPathRow + 1), (knightPathCol + 2)])

      for (let i = 0; i < possibleKnightMoves.length; i++) {
        if (possibleKnightMoves[i][0] === kingLocation[0] && possibleKnightMoves[i][1] === kingLocation[1]) {
          knightCheck = true
        }
      }

      return knightCheck || acc
    }

    // Queen (If rook or bishop takes rules)
    if (el[0] === '♛') {
      const [rowIncr, colIncr] = getKingDirection(el, kingLocation)

      return checkForKing(el, rowIncr, colIncr) || acc
    }

    return acc
  }, false)
}
```
2022-5-9
```js
// Anagram Detection (7 kyu)
//
// An anagram is the result of rearranging the letters of a word to produce a new word 
// (see wikipedia).
//
// Note: anagrams are case insensitive
//
// Complete the function to return true 
// if the two arguments given are anagrams of each other; 
// return false otherwise.
//
// Examples:
console.log(isAnagram("foefet", "toffee")) //=> true
console.log(isAnagram("Buckethead", "DeathCubeK")) //=> true
console.log(isAnagram("Twoo", "WooT")) //=> false

console.log(isAnagram("dumble", "bumble")) //=> false
console.log(isAnagram("ound", "round")) //=> false
console.log(isAnagram("apple", "pale")) //=> false

// write the function isAnagram
var isAnagram = function(test, original) {
  // Check length is the same (if not then not anagram)
  if(test.length !== original.length){
    return false
  }
  
  // set both to same case and sort
  original = original.toLowerCase().split('').sort()
  test = test.toLowerCase().split('').sort()
  
  // Reduce original array and check that index matches the same index in test
  // If they match for every char then original reduces to true else reduce to false
  original = original.reduce((bool, el, i)=> el === test[i] ? bool : false, true)
  
  return original
};

// Another solution I liked
// instead of reducing we can rejoin the array and then compare strings after sorting
// Then we also don't have to indepenedently check the length
// write the function isAnagram
var isAnagramV2 = function(test, original) {
  var t = test.toLowerCase().split('').sort().join('');
  var o = original.toLowerCase().split('').sort().join('');
  return (t==o)?true:false;
};
```
2022-5-8
```js
// Never gonna give you up (Beta) (estimated 6kyu)

// Let's go back to the 80s when our parents were students like us.

// In this kata you will have to work with the chorus 
// of the wonderful song 'Never gonna give you up' by Rick Astley

// A vector of numbers will be input,
// the output will be a vector of chorus lines
// Depending on what number will be in the array, you need to insert one stanza, and each even line should have a 'NEVER GONNA' in capital letters.

// I offer you examples of the program.

// Chorus of this song:
// "Never gonna give you up
// Never gonna let you down
// Never gonna run around and desert you
// Never gonna make you cry
// Never gonna say goodbye
// Never gonna tell a lie and hurt you "

// Input: { 1, 3, 3, 4 }
// Output: [
// "Never gonna let you down",
// "NEVER GONNA make you cry",
// "Never gonna make you cry",
// "NEVER GONNA say goodbye"
// ]
// More examples in the test cases. Good luck and never give up! :D

function music(numbers) {
  // Store each line
  const chorus = [
    'Never gonna give you up',
    'Never gonna let you down',
    'Never gonna run around and desert you',
    'Never gonna make you cry',
    'Never gonna say goodbye',
    'Never gonna tell a lie and hurt you'
  ]
  
  // Array that will be badded to for each line in the input array
  let output = []
  
  // iterate through numbers arr and add the corresponding line to output array
  numbers.forEach((el, i)=>{
    // fetch line to add
    let line = chorus[el]
    // If current line being built is an even line number then...
    if((i + 1) % 2 === 0){
      // ...capitalize first two words of line
      line = line.split(' ').map((el, i)=> i === 0 || i ===1 ? el.toUpperCas() : el).join(' ')
    }
    // Add line to output array
    output.push(line)
  })

  // return output array
  return output
}
```
2022-5-7
```js
// Where is my parent!?(cry) (6 kyu)
//
// Mothers arranged a dance party for the children in school.
// At that party, there are only mothers and their children. 
// All are having great fun on the dance floor 
// when suddenly all the lights went out. 
// It's a dark night and no one can see each other. 
// But you were flying nearby and you can see in the dark 
// and have ability to teleport people anywhere you want.
//
// Legend:
// - Uppercase letters stands for mothers, 
//   lowercase stand for their children, 
//   i.e. "A" mother's children are "aaaa".
//
// - Function input: String contains only letters, uppercase letters are unique.
//
// Task:
// Place all people in alphabetical order 
// where Mothers are followed by their children, 
// i.e. "aAbaBb" => "AaaBbb".

console.log(findChildren("beeeEBb"));
console.log(findChildren("uwwWUueEe"));
console.log(findChildren("abBA"));
console.log(findChildren("AaaaaZazzz")); 
console.log(findChildren("CbcBcbaA")); 
console.log(findChildren("xXfuUuuF"));

function findChildren(dB) {
  return dB.split('').sort((prev, next)=>{
    // See if chars to sort are the same letter (regardless of case)
    if(prev.toLowerCase() !== next.toLowerCase()){
      // If not the same letter set both to lowerCase for even comparison
      prev = prev.toLowerCase()
      next = next.toLowerCase()
    }
    // (a, a) => 0
    // (a, b) => 1
    // (b, a) => -1
    // (A, a) => 1
    return prev > next ? 1 : (prev < next ? -1 : 0)
  }).join('');
}
```
2022-5-6
```js
// No one likes carrying change (6 kyu)
//
// No one enjoys carrying around spare change. 
// And to avoid all that jingling it's absolutely necessary 
// to have an efficient algorithm to 
// calculate the minimum number of coins needed to pay for something. 
// So given a set of coin denominations 
// determine the fewest number of coins required 
// to add up to a given amount.
//
// For example: US Currency includes the penny, nickel, dime and quarter 
// or the coins with denominations: 
// [1, 5, 10, 25] 
//
// If I were to ask you to make 75 cents 
// you would return 3 
/// since 75 cents can be made with 3 quarters.
//
// NOTES:
// The coin denominations will contain at least one coin 
// and will be greater than zero. 
// [3] or [1, 100, 19] are both valid.
// All amounts given will be solvable.
// Be greedy...
//
// Sample Tests:
const coins1= [1,5,10,25];
const coins2= [1,2,5,10,20,50];

console.log(coinsNeeded(75, coins1)) //=> 3
console.log(coinsNeeded(123, coins1)) //=> 9
console.log(coinsNeeded(75, coins2)) //=> 3
console.log(coinsNeeded(123, coins2)) //=> 5

function coinsNeeded(amount, coinDenominations) {
  // Make sure coins are in order (small to big)
  coinDenominations.sort((a, b)=> a - b)
  let coins = 0
  for(let i = coinDenominations.length -1; i >= 0; i--){
    // can the amount be divided by current denomination?
    // How many times?
    coins += Math.floor(amount / coinDenominations[i])
    // Set leftover amount after taking all coins that fit
    amount = amount % coinDenominations[i]
  }
  
  return coins
}
```
2022-5-5
```js
// From..To..Series #1: from m to n. Find the maximum range (6 kyu)
//
// Description:
// Give you an array, like this:
//
// ["from 1 to 3","from 2 to 6","from -100 to 0"]
// Find out the maximum range, return by an array:
findMaxRange(["from 1 to 3","from 2 to 6","from -100 to 0"]) //=> ["from -100 to 0"]
// If more than one elements have the maximum range, 
// return them according to the order of the original array.

// Input data is always an array. 
// The format of all elements is always "from m to n". 
// The value of from and to can be an integer or float. 
// These are all possible: m > n or m == n or m < n
//
// Examples
findMaxRange(["from 1 to 3","from 2 to 4","from 1 to 1"]) //=> ["from 1 to 3","from 2 to 4"]
findMaxRange(["from 1 to 10","from 10 to 1","from -1 to -10"]) //=> ["from 1 to 10","from 10 to 1","from -1 to -10"]
findMaxRange(["from 1 to 10","from 10.1 to 1","from -1 to -10"]) //=> ["from 10.1 to 1"]
findMaxRange([])//=> []

function findMaxRange(ranges){
  // Get array of differences in each string
  let calc = ranges.map(el=> el.split(' ') // split string by spaces
                               .map(el=> +el) // Convert to number
                               .filter((el, i) => i === 1 || i === 3) // Only get values at index 1 and 3 (where numbers are alternatively a type check would work)
                               .reduce((a, b)=> Math.abs(b -a))) // Calculate diff between two values
  
  const max = Math.max(...calc) // find biggets diff
  
  // Build array of indexes containg a value of the max diff from calc array
  let idx = []
  for(let i = 0; i < calc.length; i++){
    if(calc[i] === max){
      idx.push(i)
    }
  }
  
  // Return the orinal arraying to filter only those at the above index (that matched the max diff)
  return ranges.filter((el, i)=> idx.includes(i))
}
```
2022-5-4
```js
// Unique In Order (6 kyu)
//
// Implement the function unique_in_order 
// which takes as argument a sequence and returns a list of items 
// without any elements with the same value next to each other 
// and preserving the original order of elements.

// For example:
uniqueInOrder('AAAABBBCCDAABBB') //=> ['A', 'B', 'C', 'D', 'A', 'B']
uniqueInOrder('ABBCcAD')         //=> ['A', 'B', 'C', 'c', 'A', 'D']
uniqueInOrder([1,2,2,3,3])       //=> [1,2,3]

var uniqueInOrder=function(iterable){
  if(!Array.isArray(iterable)){  
    iterable = `${iterable}`.split('')
  }
  return iterable.reduce((acc, el)=> el !== acc[acc.length - 1] ? [...acc, el] : [...acc] ,[])
}

// Another solution I liked
// I liked that this one used spread operator to not have to check that the iterable is an array
// This way it is converted into an array regardless and you don't have to worry about type conversion
var uniqueInOrderV2=function(iterable){
    return [...iterable].filter((a, i) => a !== iterable[i-1])
}
```
2022-5-3
```js
// Build Tower (6kyu)
// Build a pyramid-shaped tower given a positive integer number of floors. 
// A tower block is represented with "*" character.

// For example, a tower with 3 floors looks like this:
// [
//   "  *  ",
//   " *** ", 
//   "*****"
// ]

// And a tower with 6 floors looks like this:

// [
//   "     *     ", 
//   "    ***    ", 
//   "   *****   ", 
//   "  *******  ", 
//   " ********* ", 
//   "***********"
// ]

console.log(towerBuilder(1)) //=> ['*']
console.log(towerBuilder(2)) /*=> [' * ',
                                   '***' ]*/
console.log(towerBuilder(3))  /*=> ['  *  ',
                                    ' *** ',
                                    '*****'] */

function towerBuilder(nFloors) {
  let tower = []
  for(let i = 1; i <= nFloors; i++){
    // string composed of sections then pushed into array
    //'(spaces)(star pre-center)(star center)(star post-center)(spaces)'
    // spaces (each side) = nFloors - current floor
    // star (pre/post-center) = current floor - 1 (for center star) 
    // star (center) = constant '*' single star
    tower.push(`${' '.repeat(nFloors - i)}${'*'.repeat(i - 1)}*${'*'.repeat(i - 1)}${' '.repeat(nFloors - i)}`)
  }
  return tower
}

// Another solution I liked
// This uses an array constructor and makes it n length where n is number of floors
// Then it iterates over that array with a .map function
// This function will edit each element in the array by using the index as a reference to the current floor being mapped
function towerBuilderV2(n) {
  return Array.from({length: n}, function(v, k) {
    const spaces = ' '.repeat(n - k - 1);
    return spaces + '*'.repeat(k + k + 1) + spaces;
  });
}
```
2022-5-2
```js
// Who likes it? (6 kyu)
// 
// You probably know the "like" system from Facebook and other pages. 
// People can "like" blog posts, pictures or other items. 
// We want to create the text that should be displayed next to such an item.
//
// Implement the function which takes an array containing the names of people that like an item. 
// It must return the display text as shown in the examples:

console.log(likes([]) //=> "no one likes this"
console.log(likes(["Peter"]) //=> "Peter likes this"
console.log(likes(["Jacob", "Alex"]) //=> "Jacob and Alex like this"
console.log(likes(["Max", "John", "Mark"]) //=> "Max, John and Mark like this"
console.log(likes(["Alex", "Jacob", "Mark", "Max"]) //=> "Alex, Jacob and 2 others like this"

function likes(names) {
  let likeThis = names.length <= 1 ? 'likes this' : 'like this'
  // add 'no one' if no names present
  if(names.length === 0){
    names.push('no one')
  }
  // If only a single name (or was 0 but now 1) output as is
  if(names.length === 1){
    names.push(likeThis)
    return names.join(' ')
  }
  
  // If more than 3 names remove extra names and add count of removed names
  if(names.length > 3){
    names = [...names.slice(0, 2), `${names.length - 2} others`]
  }
  
  // If more than 1 name add commas to end of each string unless 
  let initNames = names.slice(0, -1).join(', ')
  initNames += ` and ${names.slice(-1)} ${likeThis}`
  return initNames
}

// Another version
// I didn't like this one as much because it is very hardcoded
// What if you wanted to do 5 names before showing the number instead of just 2?
// It does look a little cleaner than my version though
function likesV2(names) {
  names = names || [];
  switch(names.length){
    case 0: return 'no one likes this'; break;
    case 1: return names[0] + ' likes this'; break;
    case 2: return names[0] + ' and ' + names[1] + ' like this'; break;
    case 3: return names[0] + ', ' + names[1] + ' and ' + names[2] + ' like this'; break;
    default: return names[0] + ', ' + names[1] + ' and ' + (names.length - 2) + ' others like this';
  }
}
```
2022-5-1
```js
// Equal Sides Of An Array (6kyu)
//
// You are going to be given an array of integers. 
// Your job is to take that array and find an index N 
// where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. 
// If there is no index that would make this happen, return -1.
//
// For example:
// Let's say you are given the array:
// [1,2,3,4,3,2,1]
// Your function will return the index 3, 
// because at the 3rd position of the array, 
// the sum of left side of the index ([1,2,3...) 
// and the sum of the right side of the index (...3,2,1]) 
// both equal 6.

// Let's look at another one.
// You are given the array: 
// [1,100,50,-51,1,1]
// Your function will return the index 1, 
// because at the 1st position of the array, 
// the sum of left side of the index ([1...)
//  and the sum of the right side of the index (...50,-51,1,1]) both equal 1.

// Last one:
// You are given the array:
// [20,10,-80,10,10,15,35]
// At index 0 the left side is ([...)
// The right side is ()...10,-80,10,10,15,35])
// They both are equal to 0 when added. 
// (Empty arrays are equal to 0 in this problem)
// Index 0 is the place where the left side and right side are equal.

// Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

// Input:
// An integer array of length 0 < arr < 1000. 
// The numbers in the array can be any integer positive or negative.

// Output:
// The lowest index N 
// where the side to the left of N 
// is equal to the side to the right of N. 
// If you do not find an index that fits these rules, 
// then you will return -1.

// Note:
// If you are given an array with multiple answers, 
// return the lowest correct index.

console.log(findEvenIndex([1,2,3,4,3,2,1])) //=> 3
console.log(findEvenIndex([1,100,50,-51,1,1])) //=> 1
console.log(findEvenIndex([1,2,3,4,5,6])) //=> -1
console.log(findEvenIndex([20,10,30,10,10,15,35])) //=> 3
console.log(findEvenIndex([20,10,-80,10,10,15,35])) //=> 0

function findEvenIndex(arr){  
  for (let i=0; i< arr.length; i++) {
    if( arr.slice(0,i).reduce((acc,el) => acc +el, 0) === arr.slice(i+1).reduce((acc,el) => acc +el, 0)){
      return i
    }
  }
  return -1;
}
```
2022-4-30
```js
// Two Sum (6kyu)

// Write a function that takes an array of numbers 
// (integers for the tests) and a target number. 
// It should find two different items in the array that, 
// when added together, give the target value. 
// The indices of these items should then be returned in a tuple / list 
// (depending on your language) like so: (index1, index2).

// For the purposes of this kata, some tests may have multiple answers; 
// any valid solutions will be accepted.

// The input will always be valid 
// (numbers will be an array of length 2 or greater, 
//  and all of the items will be numbers; 
//  target will always be the sum of two different items from that array).

// Based on: http://oj.leetcode.com/problems/two-sum/

// twoSum [1, 2, 3] 4 === (0, 2)
function twoSum(numbers, target){
  let sorted = numbers.slice().sort((a,b)=> a-b)
  for(let i = 0; i < sorted.length; i++){
    for(let j = sorted.length - 1; j > i && sorted[i] + sorted[j] >= target; j--){
      if(sorted[i] + sorted[j] === target){
        return [numbers.indexOf(sorted[i]), numbers.lastIndexOf(sorted[j])]
      }
    }
  }
}
```
2022-4-29
```js
// Tribonacci Sequence (6 kyu)
//
// Well met with Fibonacci bigger brother, AKA Tribonacci.
// As the name may already reveal, it works basically like a Fibonacci, 
// but summing the last 3 (instead of 2) numbers of the sequence 
// to generate the next. 
// And, worse part of it, regrettably I won't get to hear 
// non-native Italian speakers trying to pronounce it :(

// So, if we are to start our Tribonacci sequence with [1, 1, 1] 
// as a starting input (AKA signature), we have this sequence:
// [1, 1 ,1, 3, 5, 9, 17, 31, ...]

// But what if we started with [0, 0, 1] as a signature? 
// As starting with [0, 1] instead of [1, 1] 
// basically shifts the common Fibonacci sequence by once place, 
// you may be tempted to think that we would get the same sequence 
// shifted by 2 places, 
// but that is not the case and we would get:
// [0, 0, 1, 1, 2, 4, 7, 13, 24, ...]

// Well, you may have guessed it by now, but to be clear: 
// you need to create a fibonacci function that 
// given a signature array/list, returns the first n elements 
// - signature included of the so seeded sequence.

// Signature will always contain 3 numbers; 
// n will always be a non-negative number; 
// if n == 0, then return an empty array (except in C return NULL) 
// and be ready for anything else which is not clearly specified ;)

// If you enjoyed this kata more advanced and generalized version of it can be found in the Xbonacci kata

function Xbonacci(signature,n){
  // This method will handle tribonacci as well as any other progression based on length of signature
  // For fibonacci: tribonacci([1,1], 10) => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
  // For tribonacci: tribonacci([1,1,1], 10) => [1, 1, 1, 3, 5, 9, 17, 31, 57, 105]
  // For quadronacci: tribonacci([1,1,1,1], 10) => [1, 1, 1, 1, 4, 7, 13, 25, 49, 94]
  // etc...
  if(n <= signature.length) {
    return signature.reduce((acc, el, i) => i <= n - 1 ? [...acc, el] : [...acc],[])
  }
  let initialLength = signature.length
  for(let i = signature.length - 1; signature.length < n; i++){
    let sum = 0;
    for(let l = signature.length - 1; l >= signature.length - initialLength; l--){
      console.log(l, signature[l])
      sum += signature[l]
      console.log(sum)
    }
    signature.push(sum)
    console.log(signature)
  
  }
  return signature
}

// Shorter version just for tribonacci
function tribonacciV2(signature,n){  
  for (var i = 0; i < n-3; i++) { // iterate n times
    signature.push(signature[i] + signature[i+1] + signature[i+2]); // add last 3 array items and push to trib
  }
  return signature.slice(0, n); //return trib - length of n
}

```
2022-4-28
```js
Break camelCase (6 kyu)

// Complete the solution so that the function will break up camel casing, using a space between words.

// Example
console.log(solution("camelCasing")) //=>  "camel Casing"
console.log(solution("identifier")) //=>  "identifier"
console.log(solution("")) //=>  ""

function solution(string) {
  for(let i = 0; i < string.length; i++){
    if(string[i] === string[i].toUpperCase()){
      string = `${string.slice(0, i)} ${string.slice(i)}`
      i++
    }
  }
  
  return string
}
```
2022-4-27
```js
// Delete Occurences of an Element If It Occurs More than n Times (6kyu)
// 
// Enough is enough!
// Alice and Bob were on a holiday. 
// Both of them took many pictures of the places they've been, 
// and now they want to show Charlie their entire collection. 
// However, Charlie doesn't like these sessions, since the motive usually repeats. 
// He isn't fond of seeing the Eiffel tower 40 times. 
// He tells them that he will only sit during the session 
// if they show the same motive at most N times. 
// Luckily, Alice and Bob are able to encode the motive as a number. 
// Can you help them to remove numbers such that 
// their list contains each number only up to N times, 
// without changing the order?

// Task
// Given a list and a number, create a new list 
// that contains each number of lst at most N times without reordering. 
// For example if the input number is 2, and the input list is [1,2,3,1,2,1,2,3], 
// you take [1,2,3,1,2], drop the next [1,2] 
// since this would lead to 1 and 2 being in the result 3 times, 
// and then take 3, which leads to [1,2,3,1,2,3]. 
// With list [20,37,20,21] and number 1, 
// the result would be [20,37,21].

console.log(deleteNth([20,37,20,21], 1)) //=> [20,37,21]
console.log(deleteNth([1,1,3,3,7,2,2,2,2], 3)) //=> [1, 1, 3, 3, 7, 2, 2, 2]
console.log(deleteNth([1, 2, 3, 1, 1, 2, 1, 2, 3, 3, 2, 4, 5, 3, 1], 3)) //=> [1, 2, 3, 1, 1, 2, 2, 3, 3, 4, 5]
console.log(deleteNth([1,1,1,1,1], 5)) //=> [1,1,1,1,1]
console.log(deletenth([], 5)) //=> []

// Use a reduce function
// For each value in the reduce function filter the accumulator array to that value
// If the length of the filtered array is less than arg n we can add this value to the accumulator array
// Otherwise if it is already in the array n times do nothing and move on to the next value
const deleteNth = (arr, n) => arr.reduce((acc, val, i) => acc.filter(num => num === val).length < n ? [...acc, val] : [...acc],[]);
```
2022-4-26
```js
// Highest Scoring Word (6kyu)
//
// Given a string of words, you need to find the highest scoring word.
// Each letter of a word scores points according to its position in the alphabet: 
// a = 1, b = 2, c = 3 etc.

// You need to return the highest scoring word as a string.
// If two words score the same, return the word that appears earliest in the original string.
// All letters will be lowercase and all inputs will be valid.
function high(x){
  const score = 'abcdefghijklmnopqrstuvwxyz'
  // get array of words broken into array of chars
  let wordsArr = x.split(' ').map(word => word.split(''))
  // reduce char array to a number based on position of letter in the score string
  let scoreArr = wordsArr.map((word)=> word.reduce((acc, letter) => acc += score.indexOf(letter) + 1, 0))
  // get the index of the highest score and use it to find the corresponding word
  // combine back to string and return
  return wordsArr[scoreArr.indexOf(Math.max(...scoreArr))].join('')
}

// Another solution I liked:
// Same approach but used spread operator to not need a storage array and used charcode - 96 to not need a score key
function highV2(s){
  let as = s.split(' ').map(s=>[...s].reduce((a,b)=>a+b.charCodeAt(0)-96,0));
  return s.split(' ')[as.indexOf(Math.max(...as))];
}
```
2022-4-25
```js
// Persistent Bugger (6 kyu)
// 
// Write a function, persistence, that takes in a positive parameter num 
// and returns its multiplicative persistence, 
// which is the number of times you must multiply the digits in num 
// until you reach a single digit.
//
// For example (Input --> Output):
console.log(persistence(39) //=> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
console.log(persistence(999) //=> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
console.log(persistence(4) //=> 0 (because 4 is already a one-digit number)

function persistence(num) {
  let count = 0 
  while(num.toString().length > 1){
     // convert number to string to get two values
    num = num.toString().split('').reduce((acc, el) => acc *= el ,1)
    count++
   }
  return count
}

// Another solution I liked
// this uses a recursive function that will accumulate a count everytime it is called
const persistenceV2 = num => {
  return `${num}`.length > 1 
    ? 1 + persistence(`${num}`.split('').reduce((a, b) => a * +b)) 
    : 0;
}
```
2022-4-24
```js
// Sum of Odd Numbers
//
// Givent he triangle of consecutive odd numbers:

//              1
//           3     5
//        7     9    11
//    13    15    17    19
// 21    23    25    27    29
// ...
// Calculate the sum of the numbers in the nth row of this triangle 
// (starting at index 1) e.g.: (Input --> Output)
console.log(rowSumOddNumbers(1)) //=>  1
console.log(rowSumOddNumbers(2)) //=> 3 + 5 = 8

function rowSumOddNumbers(n) {
	return n**3
}

// Mathy expanation (I just wrote out the first few sequences and solutions and saw the pattern)
console.log(rowSumOddNumbers(1), 1);
console.log(rowSumOddNumbers(2), 8);
console.log(rowSumOddNumbers(3), 27);
console.log(rowSumOddNumbers(4), 64);
///...
// The derivation of formula 
// for 1st row, count is 1; 2nd row, count is 2;... (n-1)th row, count is n-1 
// according to the sum of arithmetic progression, 
// the count before nth row, 1+2+...(n-1) ===> (1+n-1) * (n-1) /2  ===> n * (n-1) / 2 
// start one of nth row is n * (n -1) + 1  ===> n^2 - n +1 
// end one is (start one + 2(n-1)), so it is n^2 + n -1
// according to the sum of arithmetic progression
// the sum of every row is (start + end) * nums /2
// and nums of every row is n.
// ((n^2 - n + 1)+(n^2 + n -1)) * n / 2  ===> n^3
```
2022-4-23
```js
// Isograms (7 kyu)
//
//Hide Kata Description
// An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a function that determines whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.

// Example: (Input --> Output)

console.log("Dermatoglyphics") --> true
console.log("aba") --> false
console.log("moOse") --> false (ignore letter case)

function isIsogram(str){
  return str.toLowerCase().split('').reduce((acc, el, i, arr) => i === arr.lastIndexOf(el) && acc ? acc : acc = false, true)
}

// I didn't see a solution I liked more than mine this time
// Other solutions I saw involved 
// nested loops to compare each letter to the entire string or regex
```
2022-4-22
```js
// Count the smiley faces! (6kyu)
//
// Given an array(arr) as an argument complete the function countSmileys 
// that should return the total number of smiling faces.
//
// Rules for a smiling face:
//
// 1. Each smiley face must contain a valid pair of eyes.
//      Eyes can be marked as : or;
// 2. A smiley face can have a nose but it does not have to.
//      Valid characters for a nose are - or ~
// 3. Every smiling face must have a smiling mouth 
//      that should be marked with either ) or D
// 4. No additional characters are allowed except for those mentioned.

// Valid smiley face examples: :) : D; -D : ~)
// Invalid smiley faces: ;( :> :} :]

// Example
console.log(countSmileys([':)', ';(', ';}', ':-D'])); //=> 2;
console.log(countSmileys([';D', ':-(', ':-)', ';~)'])); //=> 3;
console.log(countSmileys([';]', ':[', ';*', ':$', ';-D'])); //=> 1;
// Note
// In case of an empty array return 0. 
// You will not be tested with invalid input
// (input will always be an array).
// Order of the face(eyes, nose, mouth) elements will always be the same.

function countSmileys(arr){
  // reduce array to count of valid smileys
  return arr.reduce((acc, el) => {
    // check that eyes and mouth are valid
    if ((el.charAt(0) === ':' || el.charAt(0) === ';') && (el.charAt(el.length - 1) === ')' || el.charAt(el.length - 1) === 'D')){
      // if length is three check that nose is valid
      // if the length is 2 then smiley is valid
      if((el.length === 3 && (el.charAt(1) === '-' || el.charAt(1) === '~' )) || el.length === 2){
        // face valid, increment
        return acc = acc + 1
      } else return acc // face not valid don't increment
    } else return acc // face not valid don't increment
  }, 0)
}
```
2022-4-21
```js
// Duplicate Encoder (6 kyu)
//
// The goal of this exercise is to convert a string to a new string 
// where each character in the new string is 
// "(" if that character appears only once in the original string, 
// or ")" if that character appears more than once in the original string. 
// Ignore capitalization when determining if a character is a duplicate.
//
// Examples:
console.log(duplicateEncode("din") // => "((("
console.log(duplicateEncode("recede") //=> "()()()"
console.log(duplicateEncode("Success") //=> ")())())"
console.log(duplicateEncode("(( @") //=> "))((" 

// Notes
// Assertion messages may be unclear about what they display in some languages. 
// If you read "...It Should encode XXX", the "XXX" is the expected result, not the input!
function duplicateEncode(word){
  // lowercase word, split each char into array element
  // map each element to either '(' or ')' by comparing current index to first/last index
  // if current index differs from current or last index then it is a repeat 
  // otherwise if it matches both the char is not a repeat
  // join mapped array to a string
  return word.toLowerCase().split('').map((el, i, arr) => i !== arr.lastIndexOf(el) || i !== arr.indexOf(el) ? ')' : '(' ).join('')
}
```
2022-4-20
```js
// Ones and Zeros (7 kyu)
// Given an array of ones and zeroes, 
// convert the equivalent binary value to an integer.

// Eg: [0, 0, 0, 1] is treated as 0001 
// which is the binary representation of 1.

// Examples:
console.log(binaryArrayToNumber([0, 0, 0, 1])) //=> 1
console.log(binaryArrayToNumber([0, 0, 1, 0])) //=> 2
console.log(binaryArrayToNumber([0, 1, 0, 1])) //=> 5
console.log(binaryArrayToNumber([1, 0, 0, 1])) //=> 9
console.log(binaryArrayToNumber([0, 0, 1, 0])) //=> 2
console.log(binaryArrayToNumber([0, 1, 1, 0])) //=> 6
console.log(binaryArrayToNumber([1, 1, 1, 1])) //=> 15
console.log(binaryArrayToNumber([1, 0, 1, 1])) //=> 11

// Note: However, the arrays can have varying lengths, not just limited to 4.

function binaryArrayToNumber(arr){
  return arr.reverse().reduce((acc, bin) => { 
    acc[1] = (bin * acc[0]) + acc[1]
    acc[0] = acc[0] * 2
    return acc
  }, [1, 0])[1]
}

// Another solution I liked
// This uses the built in js method to convert from binary to base10
const binaryArrayToNumberV2 = arr => parseInt(arr.join(''), 2);
```
2022-4-19
```js
// Find the next perfect square! (7kyu)
//
// You might know some pretty large perfect squares. 
// But what about the NEXT one?

// Complete the findNextSquare method that finds 
// the next integral perfect square after the one passed as a parameter. 
// Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.

// If the parameter is itself not a perfect square then -1 should be returned. 
// You may assume the parameter is non-negative.

// Examples:(Input --> Output)
console.log(findNextSquare(121) //=> 144
console.log(findNextSquare(625) //=> 676
console.log(findNextSquare(114) //=> -1 since 114 is not a perfect square

function findNextSquare(sq) {
  // Return the next square if sq is a perfect square, -1 otherwise
  if(Math.sqrt(sq) % 1 === 0){
    sq++
    while(Math.sqrt(sq) % 1 !== 0){
      sq++
    }
    return sq
  }
  else{
    return -1;
  }
}

// Another solution I liked
// This is much smarter than looping until finding the next square root
// Instead get the current square root, add 1 to it, then square that number, it will be the next square root
// Example
console.log(findNextSquareV2(121)) 
// Checks if 121 has square root
// It does so get that square root (11)
// Add 1 to the square root of sq (12)
// Get square value of increased sq (144)
// This avoid 23 loops and is more efficient as sq increases
function findNextSquareV2(sq) {
  return Math.sqrt(sq)%1? -1 : Math.pow(Math.sqrt(sq)+1,2);
}
```
2022-4-18
```js
// Binary Addition (7kyu)
// 
// Implement a function that adds two numbers together and returns their sum in binary. The conversion can be done before, or after the addition.

// The binary number returned should be a string.

// Examples:(Input1, Input2 --> Output (explanation)))
addBinary(1, 1) //=> "10" (1 + 1 = 2 in decimal or 10 in binary)
addBinary(5, 9) //=> "1110" (5 + 9 = 14 in decimal or 1110 in binary)

function addBinary(a,b){
  return (a+b).toString(2)
}
```
2022-4-17
```js
// Mumbling (7kyu)
//
// This time no story, no theory.
// The examples below show you how to write function accum:
//
// Examples:
console.log(accum("abcd")) //=> "A-Bb-Ccc-Dddd"
console.log(accum("RqaEzty")) //=> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
console.log(accum("cwAt")) //=> "C-Ww-Aaa-Tttt"

// The parameter of accum is a string which includes only letters from a..z and A..Z.

function accum(str){
  // split string into array
  // map array and repeat each char by letter index + 1
  // split repeated letter string and map it
  // if the index of the letter is 0 uppercase it 
  // join array of same chars with the first now capitalized
  // join array of all chars with dash
  return str.split('').map((el,i) => el.toLowerCase().repeat(i + 1).split('').map((el, i) => i === 0 ? el.toUpperCase() : el ).join('')).join('-')
}
```
2022-4-16
```js
// Your order, please (6 kyu)
//
// Your task is to sort a given string.
// Each word in the string will contain a single number.
// This number is the position the word should have in the result.

// Note: Numbers can be from 1 to 9. So 1 will be the first word(not 0).
//
// If the input string is empty, return an empty string.The words in the input String will only contain valid consecutive numbers.
//
// Examples:
console.log(order("is2 Thi1s T4est 3a")) //=> "Thi1s is2 3a T4est"
console.log(order("4of Fo1r pe6ople g3ood th5e the2"))//=> "Fo1r the2 g3ood 4of th5e pe6ople"
console.log(order("")) //=> ""

function order(words) {
  let newWords = []
  // Start a loop to iterate for each element in array
  // Go through loop and identify element that contains  a number  === i + 1
  // if element found push that element to an array 
  for(let i = 1; i <= words.split(' ').length; i++){
    newWords.push(words.split(' ').filter((el) => el.includes(i)))
  }
  return newWords.join(' ')
}
```
2022-4-15
```js
// Disemvowel Trolls (7 kyu)
//
// Trolls are attacking your comment section!

// A common way to deal with this situation is to 
// remove all of the vowels from the trolls' comments, neutralizing the threat.
// Your task is to write a function that takes a string 
// and return a new string with all vowels removed.
// For example, the string "This website is for losers LOL!" 
// would become: "Ths wbst s fr lsrs LL!".
//
//  Note: for this kata y isn't considered a vowel.
console.log(disemvowel('This website is for losers LOL!')) //=> 'Ths wbst s fr lsrs LL!'
const disemvowel = (str) => str.split('').reduce((acc, el) => ['A', 'E', 'I', 'O', 'U'].includes(el.toUpperCase()) ? acc += '' : acc += el, '')

// Another solution I liked
// This replaces any casing of vowels with empty string
// I prefer to solve without regex though
function disemvowelV2(str) {
  return str.replace(/[aeiou]/gi, '');
}
```
2022-4-14
```js
// Sort the Odd (6kyu)
//
// Task
// You will be given an array of numbers.
// You have to sort the odd numbers in ascending order 
// while leaving the even numbers at their original positions.

// Examples
console.log(sortArray([7, 1])) //=> [1, 7]
console.log(sortArray([5, 8, 6, 3, 4])) //=> [3, 8, 6, 5, 4]
console.log(sortArray([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])) //=> [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

function sortArray(array){
  // Extract odd numbers to own array and replace with placehodler value
  let oddArr = []
  array = array.map((el) => { 
    if(el % 2 !== 0 ){
      oddArr.push(el)
      return 1
    }
    else return el
  })

  // sort odd array
  oddArr.sort((a, b) => a - b)

  // Replace placeholder values with oddArray values from beginning
  array = array.map((el) => { 
    if(el === 1){
      let toPush = oddArr[0]
      oddArr.shift()
      return toPush
    } else {
      return el
    }
  })
  
  // Return sorted array
  return array
}

// Another solution I liked
// Same process except condensed
function sortArrayV2(array) {
  // Filter out odd numbes and sort them into a new array
  const odd = array.filter((x) => x % 2).sort((a, b) => a - b);
  // If the current element in the original array is odd remove first element from odd array and replace
  return array.map((x) => x % 2 ? odd.shift() : x);
}
```
2022-4-13
```js
// Get the Middle Character (7kyu)
//
// You are going to be given a word.
// Your job is to return the middle character of the word.
// If the word's length is odd, return the middle character. 
// If the word's length is even, return the middle 2 characters.

// #Examples:
console.log(getMiddle("test")) //=> "es"
console.log(getMiddle("testing")) //=> "t"
console.log(getMiddle("middle")) //=> "dd"
console.log(getMiddle("A")) //=> "A"

// #Input
// A word(string) of length 0 < str < 1000
// (In javascript you may get slightly more than 1000 in some test cases due to an error in the test cases).
// You do not need to test for this.
// This is only here to tell you that you do not need to worry about your solution timing out.

// #Output
// The middle character(s) of the word represented as a string.

function getMiddle(s){
  return s.length % 2 === 0 ?
    `${s[((s.length / 2) - 1)]}${s[s.length / 2]}` : 
    `${s[Math.floor(s.length / 2)]}`
}

// Another solution I liked:
function getMiddleV2(s) {
  // uses substr since the first char will always be in the same relative index
  // Then ternary to check whether a second character should be returned as well or not
  return s.substr(Math.ceil(s.length / 2 - 1), s.length % 2 === 0 ? 2 : 1);
}
```
2022-4-12
```js
// Bouncing Ball (6kyu)
//
// A child is playing with a ball on the nth floor of a tall building.
// The height of this floor, h, is known.

// He drops the ball out of the window. The ball bounces (for example), 
// to two-thirds of its height (a bounce of 0.66).

// His mother looks out of a window 1.5 meters from the ground.

// How many times will the mother see the ball pass in front of her window // (including when it's falling and bouncing?

// Three conditions must be met for a valid experiment:
// Float parameter "h" in meters must be greater than 0
// Float parameter "bounce" must be greater than 0 and less than 1
// Float parameter "window" must be less than h.
// If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

// Note:
// The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

// Examples:
console.log(bouncingBall(3, .66, 1.5)) //=> 3
// - h = 3, bounce = 1, window = 1.5, result is -1 
console.log(bouncingBall(3, 1, 1.5)) //=> -1

// (Condition 2) not fulfilled).
function bouncingBall(h,  bounce,  window) {
  // Check experiment is valid
  if(h <= 0 || bounce <= 0 || bounce >= 1 || window >= h){
    return -1
  }
  
  // initialize counter
  let counter = 0
  // while loop (while h is > window)
  while(h > window){
    // drop ball (add 1 to counter)
    counter++
    // Calculate height of ball after bounce (h * bounce) and set as new height
    h *= bounce
    // if new height heigher than window add 1 to counter
    if(h > window){
      counter++
    }
  }
  return counter
}
```
2022-4-11
```js
// Once upon a time, on a way through the old wild mountainous west,…
// … a man was given directions to go from one point to another.
// The directions were "NORTH", "SOUTH", "WEST", "EAST".
// Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too.
//
// Going to one direction and coming back the opposite direction right away is a needless effort.
// Since this is the wild west, with dreadfull weather and not much water, 
// it's important to save yourself some energy, otherwise you might die of thirst!
//
// How I crossed a mountainous desert the smart way.
// The directions given to the man are, for example, the following(depending on the language):
//  ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
//  or
//  { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" };
//  or
//  [North, South, South, East, West, North, West]
//  You can immediatly see that going "NORTH" and immediately "SOUTH" is not reasonable, 
// better stay to the same place! 
// So the task is to give to the man a simplified version of the plan.
// A better plan in this case is simply:
//  ["WEST"]
//  or
//  { "WEST" }
//  or
//  [West]
//
// Other examples:
// In ["NORTH", "SOUTH", "EAST", "WEST"], 
// the direction "NORTH" + "SOUTH" is going north and coming back right away.
// The path becomes["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, 
// therefore, the final result is[](nil in Clojure).
// In["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite 
// but they become directly opposite after the reduction of "EAST" and "WEST" 
// so the whole path is reducible to["WEST", "WEST"].

// Task
// Write a function dirReduc which will take an array of strings 
// and returns an array of strings with the needless directions removed (W < -> E or S < -> N side by side).
//
// The Haskell version takes a list of directions with data Direction = North | East | West | South.
// The Clojure version returns nil when the path is reduced to nothing.
// The Rust version takes a slice of enum Direction { North, East, West, South }.
// See more examples in "Sample Tests:"
// Notes
// Not all paths can be made simpler.
// The path["NORTH", "WEST", "SOUTH", "EAST"] is not reducible. 
// "NORTH" and "WEST", "WEST" and "SOUTH", "SOUTH" and "EAST" are not directly opposite of each other 
// and can't become such. 
// Hence the result path is itself : ["NORTH", "WEST", "SOUTH", "EAST"].
// if you want to translate, please ask before translating.

// Tests:
console.log(dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])); //=> ["West"]
console.log(dirReduc(["NORTH", "SOUTH", "EAST", "WEST"],)); //=> []
console.log(dirReduc(["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"],)); //=> ["WEST", "WEST"]
console.log(dirReduc(["NORTH", "WEST", "SOUTH", "EAST"])); //=> ["NORTH", "WEST", "SOUTH", "EAST"] (not reucible)
console.log(dirReduc(["SOUTH", "NORTH", "EAST", "WEST", "SOUTH", "NORTH", "SOUTH", "WEST", "WEST", "EAST", "NORTH", "SOUTH", "EAST", "WEST"])) //=> ['SOUTH', 'WEST']

function dirReduc(arr){
  // Create an array of values where opposite directions are opposite values
  // Optional filter to only include valid directions in case invalid directions are passed
  let valArr = arr.map((el) => {
    if (el === 'NORTH') {
      return 1
    } else if (el === 'SOUTH') {
      return -1
    } else if (el === 'EAST') {
      return 5
    } else if (el === 'WEST') {
      return -5
    }
  }).filter(el => typeof el === 'number')

  // Loop to cycle through array of nums
  // If the next number cancels current number remove current number and next number from array
  // Reset i to 0 now that elements have shifted
  // Once i is equal to length all elements have been calculated since next el is considered
  for(let i = 0; i < valArr.length; i){
    if(valArr[i] + valArr[i + 1] === 0){
      valArr.splice(i, 2)
      i = 0
    } else{
      // Go to next index if it doesn't cancel with previous
      i++
    }
  }

  // Translate array of numbers back to directions
  arr = valArr.map((el) => { 
    if(el === 1){
      return 'NORTH'
    } else if(el === -1){
      return 'SOUTH'
    } else if(el === 5){
      return 'EAST'
    } else if (el === -5){
      return 'WEST'
    }
  })

  // Return array of directions
  return arr
}
```
2022-4-10
```js
// What's a Perfect Power anyway? (5kyu)
//
// A perfect power is a classification of positive integers:
// In mathematics, a perfect power is 
// a positive integer that can be expressed as 
// an integer power of another positive integer.
// More formally, n is a perfect power if 
// there exist natural numbers m > 1, and k > 1 such that mk = n.

// Your task is to check wheter a given integer is a perfect power.
// If it is a perfect power, return a pair m and k with mk = n as a proof.
// Otherwise return Nothing, Nil, null, NULL, None or your language's equivalent.

// Note: For a perfect power, there might be several pairs.
// For example 81 = 3 ^ 4 = 9 ^ 2, so(3, 4) and(9, 2) are valid solutions.
// However, the tests take care of this, so if a number is a perfect power, 
// return any pair that proves it.

// Examples:
// console.log(isPP(4)) //=> "4 = 2^2"
// console.log(isPP(9)) //=> "9 = 3^2"
// console.log(isPP(5)) //=> "null"

for(let i = 4; i <= 1024; i++){
  // Will return pairs for the following: (See Sequence A001597 https://oeis.org/A001597)
  // 1, 4, 8, 9, 16, 25, 27, 32, 36, 49, 64, 81, 100, 121,
  // 125, 128, 144, 169, 196, 216, 225, 243, 256, 289, 324, 343, 361, 400, 
  // 441, 484, 512, 529, 576, 625, 676, 729, 784, 841, 900, 961, 1000, 1024
  console.log(isPP(i))
}

function isPP(n){
  let k = 2
  for(let m = 2; m**2 <= n; m++){
    while(m**k < n){
      k++
    }
    if(m**k === n){
      return [m, k]
    }
    k = 2
  }
  return null
}
```
2022-4-9
```js
// Reverse the Words (?kyu)
//
// Write a function that will reverse the order of the characters in each word
// Without changing the order of the words themselves
// A word is defined as a collection of letter chars 
// All non-letter chars are considered delimiters
//
// example:
console.log(reverseWords("The fox'es dog left, the house.")); 
//^=> "ehT xof'se god tfel, eht esouh."
console.log(reverseWords("Works with no delimiting char at the end"));
//^=> "skroW htiw on gnitimiled rahc ta eht dne"

function reverseWords(input) {
  let wordArray = [];
  let curWord = [];
  // Cycle through each char in input
  for (let i = 0; i < input.length; i++) {
    // If char is letter (by charCode) add to curWord array
    if (
      (input.charCodeAt(i) >= 65 && input.charCodeAt(i) <= 90) ||
      (input.charCodeAt(i) >= 97 && input.charCodeAt(i) <= 122)
    ) {
      curWord.push(input[i]);
      // If char is not a letter then the current word is over
      // Flip/compress back to string before adding to wordArray
      // Immediately add the delimiter char to word array as well
      // Clear current word
    } else {
      wordArray.push(curWord.reverse().join(""));
      wordArray[wordArray.length - 1] += input[i];
      curWord = [];
    }
  }
  // If string doesn't end in delimiter
  wordArray.push(curWord.reverse().join(""));
  // return array of flipped words after joining elements into string
  return wordArray.join("");
}

```
2022-4-8
```js
// Count the number of Duplicates (6kyu)
//
// Write a function that will 
// return the count of distinct case -insensitive 
// alphabetic characters and numeric digits that 
// occur more than once in the input string.
// The input string can be assumed to contain only alphabets
// (both uppercase and lowercase) and numeric digits.

// Example
//
console.log(duplicateCount("abcde")) //=> 0 # no characters repeats more than once
console.log(duplicateCount("aabbcde")) //=> 2 # 'a' and 'b'
console.log(duplicateCount("aabBcde")) //=> 2 # 'a' occurs twice and 'b' twice(`b` and`B`)
console.log(duplicateCount("indivisibility")) //=> 1 # 'i' occurs six times
console.log(duplicateCount("Indivisibilities")) //=> 2 # 'a' and '1'
console.log(duplicateCount("ABBA")) //=> 2 # 'A' and 'B' each occur twice

function duplicateCount(str){
  // Object: key = letter & value = number of times appearing in string
  let returnObj = {}
  // Convert string to returnObj
  str.toLowerCase().split('').forEach((el) => {
    // If key exists increase the value to count this letter
    if(returnObj.hasOwnProperty(el)){
      returnObj[el] += 1
    } else {// no key yet, initialize one to value 1
      returnObj[el] = 1
    }
  })

  // Count keys in obj with value > 1
  let count = 0
  for(key in returnObj){
    if(key > 1){
      count++
    }
  }

  return count
}

// Another solution I liked
// This filters the string down to an array of chars that are repeated 
// Does this by making sure this is not the first instance of that char 
//  and IS the last instance of the char
// If so then it is added to the filtered array
// The length of the filtered results is how many characters are repeated
function duplicateCountV2(text){
  return text.toLowerCase().split('').filter(function(val, i, arr){
    return arr.indexOf(val) !== i && arr.lastIndexOf(val) === i;
  }).length;
}
```
2022-4-7
```js
// String Transformer (6kyu)
//
// Given a string, return a new string 
// that has transformed based on the input:
// Change case of every character, 
//   ie.lower case to upper case, upper case to lower case.
// Reverse the order of words from the input.
// Note: You will have to handle multiple spaces, and leading / trailing spaces.
//
// For example:
// "Example Input" ==> "iNPUT eXAMPLE"
// You may assume the input only contain English alphabet and spaces.


console.log(stringTransformer('Example Input'))  //=> "iNPUT eXAMPLE"
function stringTransformer(str){
  return str.split(' ').reverse().map((el) => {
    return el.split('').map((el) => el.toUpperCase() === el ? el.toLowerCase().toLowerCase() : el.toUpperCase()).join('') 
  }).join(' ');
}


// Another version of the above
const stringTransformerV2 = (str) => str.split(' ').reverse().map((el) => el.split('').map((el) => el.toUpperCase() === el ? el.toLowerCase().toLowerCase() : el.toUpperCase()).join('')).join(' ')
console.log(stringTransformerV2('Example Input')) //=> "iNPUT eXAMPLE"
```
2022-4-6
```js
// Count letters in string (6kyu)
//
// In this kata, 
// you've to count lowercase letters in a given string 
// and return the letter count in a hash 
// with 'letter' as key and count as 'value'. 
// The key must be 'symbol' instead of string in Ruby 
// and 'char' instead of string in Crystal.\

letterCount('arithmetics') //=> {"a": 1, "c": 1, "e": 1, "h": 1, "i": 2, "m": 1, "r": 1, "s": 1, "t": 2}

function letterCount(s){
  let returnObj ={}
  s.split('').forEach((el,i) => { 
    if(returnObj.hasOwnProperty(el)){
      returnObj[el] += 1
    } else{
      returnObj[el] = 1
    }
  })

  return returnObj;
}

// Another solution I liked
// This reduces to an object instead of adding to a new object
const letterCount = s => s
  .split('')
  .reduce((accum, value) => {
    accum[value] = accum[value] ? accum[value] + 1 : 1
    return accum
  }, {})
```
2022-4-5
```js
// Lottery Ticket (6 kyu)
//
// Time to win the lottery!
// Given a lottery ticket(ticket), 
// represented by an array of 2 - value arrays, 
// you must find out if you've won the jackpot.
// Example ticket:
//
// [['ABC', 65], ['HGR', 74], ['BYHT', 74]]
// To do this, you must first count the 'mini-wins' on your ticket.
// Each subarray has both a string and a number within it.
// If the character code of any of the characters in the string matches the number, 
// you get a mini win.
// Note you can only have one mini win per sub array.
//
// Once you have counted all of your mini wins, 
// compare that number to the other input provided(win).
// If your total is more than or equal to(win), 
// return 'Winner!'. Else return 'Loser!'.
// 
// All inputs will be in the correct format.
// Strings on tickets are not always the same length.
// bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) //=> Loser!
bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) //=> Winner!
// bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) //=> Loser!
function bingo(ticket, win) {
  let ticketVal = ticket.map((el, i) => {
    let str = el[0]
    let found = false
    for (let i = 0; i < str.length; i++) {
      console.log(str[i], el[1])
      if (str.charCodeAt(i) === el[1]) {
        found = true
      }
    }
    return found ? 1 : 0
    console.log(el)
  }).reduce((acc, el) => acc += el, 0)

  return ticketVal >= win ? 'Winner!' : 'Loser!'
}

// Another solution I liked
// Instead of translating each letter to a charcode
// Translate the charcode to a letter and see if the string contains it
function bingoV2(ticket, win) {
  var count = 0;

  ticket.forEach(game => {
    if (game[0].includes(String.fromCharCode(game[1]))) {
      count++;
    }
  });

  return (count >= win) ? "Winner!" : "Loser!";
}
```
2022-4-4
```js
// Multiplication Table (6kyu)
//
// Your task, is to create NxN multiplication table, 
// of size provided in parameter.

// for example, when given size is 3:
// [[1, 2, 3],
// [2, 4, 6],
// [3, 6, 9]]

multiplicationTable = function(size) {
  let table = [];
  for(let i = 1; i <= size; i++){
    let subTable = [];
    for(let n = 1; n <= size; n++){
      subTable.push(n * i)
    }
    table.push(subTable)
  }
  return table
}

// Another solution I liked:
// Same idea as mine except creating the arrays dynamically instead of pushing to empty/existing arrays
multiplicationTableV2 = function(size) {
  return Array.apply(null, new Array(size)).map(function(val, i) {
    return Array.apply(null, new Array(size)).map(function(val, j) {
      return (i+1) * (j+1);
    });
  });
}
```
2022-4-3
```js
// Ball Upwards (6kyu)
// 
// You throw a ball vertically upwards with an initial speed v(in km per hour).
// The height h of the ball at each time t is given by h = v * t - 0.5 * g * t * t 
// where g is Earth's gravity (g ~ 9.81 m/s**2). 
// A device is recording at every tenth of second the height of the ball. 
// For example with v = 15 km/h the device gets something of the following form: 
// (0, 0.0), (1, 0.367...), (2, 0.637...), (3, 0.808...), (4, 0.881..) ... 
// where the first number is the time in tenth of second 
// and the second number the height in meter.
//
// Task
// Write a function max_ball with parameter v(in km per hour) 
// that returns the time in tenth of second of the maximum height recorded by the device.

// Examples:
console.log(maxBall(15)) //=> 4
console.log(maxBall(25)) //=> 7

// Notes
// Remember to convert the velocity from km / h to m / s 
// or from m / s in km / h when necessary.
// The maximum height recorded by the device is not necessarily the maximum height reached by the ball.

function maxBall(v){

  let t = 0;
  let heights = [];


  // Check that the last element in height array is still bigger than the previous (ball going up)
  // If it is not then the ball is going down and we no longer need to calculate
  while (heights[heights.length - 1] > heights[heights.length - 2] || heights.length <= 1){
    t += 1;
    // T will be in tenth of a second (multiply by .1 to convert)
    // V will be in km per hour (divide by 3.6 to convert)
    // G will be in m per second
    // Convert all relative to a second in calculation
    // Add result as height to heights array
    heights.push((v / 3.6) * (t*.1) - 0.5 * (9.81) * (t*.1) * (t*.1))
  }

  // return t - 1 because t is currently the time for the final calculation which is when the ball started heading down
  return t - 1;
}

// Much better solution just calculating second of max height given velocity
// Then converting the resulting second value to a tenth of a second and rounding to the nearest full value
function maxBallV2(v0) {
  const g = 9.81, mpsToKph = 3.6, secondsToTenths = 10;
  return Math.round(secondsToTenths * v0 / mpsToKph / g);
}
```
2022-4-2
```js
// Find the Odd Int (6kyu)
//
// Given an array of integers, 
// find the one that appears an odd number of times.
// There will always be only one integer that appears an odd number of times.

// Examples
console.log(findOdd([7])) //=> 7 because it occurs 1 time(which is odd).
console.log(findOdd([0])) //=> 0, because it occurs 1 time(which is odd).
console.log(findOdd([1, 1, 2])) //=> 2, because it occurs 1 time(which is odd).
console.log(findOdd([0, 1, 0, 1, 0])) //=> 0, because it occurs 3 times(which is odd).
console.log(findOdd([1, 2, 2, 3, 3, 3, 4, 3, 3, 3, 2, 2, 1])) //=> 4, because it appears 1 time(which is odd).

function findOdd(A) {
  let val
  A.forEach((el) => { 
    let indexes = [] // hold list of indexes where the current value exists
    let i = -1; // -1 so while loop will start at index 0
    while((i = A.indexOf(el, i + 1)) !== -1){ // search for an index of the element starting after the current index (last found index or 0)
      indexes.push(i) // if an index is found add the index to the index array
    }
    if(indexes.length % 2 !== 0){
      // This is the number repeated odd times if indexes.length is odd
      val = el
    }
  })
  return val
}
```
2022-4-1
```js
// Write Number in Expanded Form (6kyu)
//
// You will be given a number and you will need to return it 
// as a string in Expanded Form.
// For example:
expandedForm(12); // Should return '10 + 2'
expandedForm(42); // Should return '40 + 2'
expandedForm(70304); // Should return '70000 + 300 + 4'
// NOTE: All numbers will be whole numbers greater than 0.
// If you liked this kata, check out part 2!!


function expandedForm(num) {
  num = `${num}`.split('')
  let zeroPlace = ''
  for(let i = num.length -1; i >=0; i--){
    if(num[i] !== '0'){
      num[i] = num[i] + zeroPlace
    } else {
      num.splice(i, 1)
    }
    zeroPlace = zeroPlace + '0'
  }

  return num.join(' + ')
}

// Another solution I liked
const expandedFormV2 = n => n.toString()
                              .split("")
                              // Reverse array instead of iterating backwards
                              .reverse()
                              // Math.pow to the 10 at the index will add the approrpriate number of 0
                              // for 1's place will not add any 0 since i = 0
                              // for 10's place will add 1 0 since i = 1
                              // etc...
                              .map((a, i) => a * Math.pow(10, i))
                              // Remove elements equal to 0
                              .filter(a => a > 0)
                              // set array back to correct order
                              .reverse()
                              .join(" + ");
```
2022-3-31
```js
// Buying a car (6 kyu)
//
// Let us begin with an example:
// A man has a rather old car being worth $2000.
// He saw a secondhand car being worth $8000.
// He wants to keep his old car until he can buy the secondhand one.

// He thinks he can save $1000 each month 
// but the prices of his old car 
// and of the new one decrease of 1.5 percent per month.
// Furthermore this percent of loss increases 
// by 0.5 percent at the end of every two months.
// Our man finds it difficult to make all these calculations.

// Can you help him ?

// How many months will it take him to save up enough money to buy the car he wants, 
// and how much money will he have left over ?

// Parameters and return of function:
//  parameter (positive int or float, guaranteed) startPriceOld (Old car price)
//  parameter(positive int or float, guaranteed) startPriceNew (New car price)
//  parameter(positive int or float, guaranteed) savingperMonth
//  parameter(positive float or int, guaranteed) percentLossByMonth

console.log(nbMonths(2000, 8000, 1000, 1.5)) //=> [6, 766] or(6, 766)
// Detail of the above example:
// end month 1: percentLoss 1.5 available -4910.0
// end month 2: percentLoss 2.0 available -3791.7999...
// end month 3: percentLoss 2.0 available -2675.964
// end month 4: percentLoss 2.5 available -1534.06489...
// end month 5: percentLoss 2.5 available -395.71327...
// end month 6: percentLoss 3.0 available 766.158120825...
// return [6, 766] or(6, 766)
// where 6 is the number of months at the end of which he can buy the new car and 766 is the nearest integer to 766.158... (rounding 766.158 gives 766).

// Note:
// Selling, buying and saving are normally done at end of month.
// Calculations are processed at the end of each considered month 
// but if, by chance from the start, 
// the value of the old car is bigger than the value of the new one or equal 
// there is no saving to be made, 
//no need to wait so he can at the beginning of the month buy the new car:
// console.log(nbMonths(12000, 8000, 1000, 1.5)) //=> [0, 4000]
// console.log(nbMonths(8000, 8000, 1000, 1.5)) //=> [0, 0]
// We don't take care of a deposit of savings in a bank:-)

function nbMonths(startPriceOld, startPriceNew, savingPerMonth, percentLossByMonth) {
  let savings = 0
  let months = 0
  while (startPriceOld + savings < startPriceNew){
    months++
    savings += savingPerMonth
    if(months % 2 === 0 && months !== 0) {percentLossByMonth += .5}
    startPriceOld -= (startPriceOld * (percentLossByMonth * .01))
    startPriceNew -= (startPriceNew * percentLossByMonth * .01)
    // console.log(`end month ${months} percentLoss ${percentLossByMonth} available: old:${startPriceOld} savings:${savings} new:${startPriceNew}`)
  }

  return [months, Math.round((startPriceOld + savings) % startPriceNew)]
}
```
2022-3-30
```js
// Detect Pangram (6 kyu)
//
// A pangram is a sentence that contains every single letter of the alphabet at least once.
// For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, 
// because it uses the letters A - Z at least once(case is irrelevant).
//
// Given a string, detect whether or not it is a pangram.
// Return True if it is, False if not.
// Ignore numbers and punctuation.

function isPangram(string) {
  return [...'abcdefghijklmnopqrstuvwxyz'].reduce((acc, el, i) => string.toLowerCase().includes(el) && acc !== false ? true : false, null)
}

console.log(isPangram('This isn\'t a pangram!'))  //=> false
console.log(isPangram('Cwm fjord bank glyphs vext quiz'))//=> true
console.log(isPangram('Detect Pangram')) //=> false
console.log(isPangram('Pack my box with five dozen liquor jugs'))//=> true
```
2022-3-29
```js
// Multi - tap Keypad Text Entry on an Old Mobile Phone (6yu)
//
// Prior to having fancy iPhones, 
// teenagers would wear out their thumbs 
// sending SMS messages on candybar - shaped 
// feature phones with 3x4 numeric keypads.

// ----- ------- -------
// |   | | ABC | | DEF |
// | 1 | | 2   | | 3   |
// ----- ------- -------
// ----- ------- ---------
// | GHI | | JKL | | MNO |
// | 4   | | 5   | | 6   |
// ------ ------- --------
// ------- ------- ---------
// | PQRS | | TUV | | WXYZ |
// | 7    | | 8   | | 9    |
// -------- ------- -------
// ------- ------- ---------
// |     | | space | |     |
// |  *  | | 0     | |  #  |
// ------- ------- --------
// Prior to the development of T9(predictive text entry) systems, 
// the method to type words was called "multi-tap" 
// and involved pressing a button repeatedly to cycle through the possible values.
// For example, to type a letter "R" you would press the 7 key three times
// (as the screen display for the current character cycles through P -> Q -> R -> S -> 7). 
// A character is "locked in" once the user presses a different key or pauses for a short period of time
// (thus, no extra button presses are required beyond what is needed for each letter individually).
// The zero key handles spaces, 
// with one press of the key producing a space and two presses producing a zero.

// In order to send the message "WHERE DO U WANT 2 MEET L8R" 
// a teen would have to actually do 47 button presses.
// No wonder they abbreviated.

// For this assignment, 
// write a module that can calculate the amount of button presses 
// required for any phrase.
// Punctuation can be ignored for this exercise.
// Likewise, you can assume the phone doesn't distinguish 
// between upper/lowercase characters 
// (but you should allow your module to accept input in either for convenience).

// Hint: While it wouldn't take too long to hard code the amount of keypresses for all 26 letters by hand, 
// try to avoid doing so! 
//(Imagine you work at a phone manufacturer who might be testing out different keyboard layouts, 
//  and you want to be able to test new ones rapidly.)


// TESTS:
console.log(presses('LOL')) //=> 9
console.log(presses('HOW R U')) //=> 13

function presses(phrase) {
  let layout = ['1',     'abc2', 'def3', 
                'ghi4',  'jkl5', 'mno6', 
                'pqrs7', 'tuv8', 'wxyz9', 
                '*',     ' 0',   '#']
  // Set phrase to array
  // Cycle through char in phrase (as el in phrase arr)
  // Find the index of the string in layout containing the current char (layout[str])
  // Find the index of the letter within layout[str][char]
  // set the value of that letter to be this index + 1
  // reduce array to sum of all the values
  return phrase.toLowerCase().split('').map((el, i) => { 
    let button = layout.filter((btn) => btn.includes(el))
    return button[0].indexOf(el) + 1
  }).reduce((a, el) => a += el,0);
}
```
2022-3-28
```js
// IPv4 to int32 (6kyu)
// 
// Take the following IPv4 address: 
// 128.32.10.1 
// This address has 4 octets where each octet is a single byte(or 8 bits).

//  1st octet 128 has the binary representation: 
//    10000000
// 2nd octet 32 has the binary representation: 
//    00100000
// 3rd octet 10 has the binary representation: 
//    00001010
// 4th octet 1 has the binary representation: 
//    00000001
// So 128.32.10.1 
// == 10000000.00100000.00001010.00000001

// Because the above IP address has 32 bits, 
// we can represent it as the 32 bit number: 2149583361.
// Write a function ip_to_int32(ip) (JS: ipToInt32(ip) ) 
// that takes an IPv4 address and returns a 32 bit number.

console.log(ipToInt32("128.32.10.1")) //=> 2149583361

function ipToInt32(ipStr){
  // Convert string to array of numbers
  let ipArr = ipStr.split('.').map((el) => +el)

  // Convert each number to binary
  // Each number gets an octet (00000000)
  let ip2Arr = ipArr.map((ipEl) => {
    let base2Arr = [128, 64, 32, 16, 8, 4, 2, 1];
    return base2Arr.map((b2El) => { 
      if(ipEl >= b2El){
        ipEl -= b2El
        return 1
      } else{
        return 0
      }
    }).reduce((a, el) => a += `${el}`, '')
  }).join('')

  return Number(`0b${ip2Arr}`)
}
```
2022-3-27
```js
// The Supermarket Queue (6kyu)
// There is a queue for the self-checkout tills at the supermarket.
// Your task is write a function 
//  to calculate the total time required 
//  for all the customers to check out!

// input
// customers: an array of positive integers representing the queue.
//  Each integer represents a customer, 
//  and its value is the amount of time they require to check out.
// n: a positive integer, 
//  the number of checkout tills.

// output
// The function should return an integer, the total time required.
// Important
// Please look at the examples and clarifications below, 
// to ensure you understand the task correctly:)

//Examples
// console.log(`Should return 12: ${queueTime([5, 3, 4], 1)}`)
// should return 12
// because when there is 1 till, the total time is just the sum of the times

// console.log(`Should return 10: ${queueTime([10, 2, 3, 3], 2)}`)
// should return 10
// because here n=2 and the 2nd, 3rd, and 4th people in the 
// queue finish before the 1st person has finished.

// console.log(`Should return 12: ${queueTime([2, 3, 10], 2)}`)
// should return 12
// Clarifications
// There is only ONE queue serving many tills, and
// The order of the queue NEVER changes, and
// The front person in the queue
// (i.e.the first element in the array / list) 
// proceeds to a till as soon as it becomes free.

// N.B.You should assume that all the test input will be valid, 
// as specified above.
// P.S.The situation in this kata can be likened to the more 
//  computer-scienc-related idea of a thread pool, 
//  with relation to running multiple processes at the same time: 
//  https://en.wikipedia.org/wiki/Thread_pool


// ?Didn't pass all test cases?
function queueTime(customers, n) {

  if(n > customers.length && customers.length > 0){
    return Math.max(...customers)
  }

  let tills = Array.apply(null, Array(n)).map((el, i) => {
    let tillFill = customers[0]
    customers.shift()
    return tillFill
  })

  let totalCheckoutTime = 0 
  while(customers.length >= 1){
    
    let shortLine = Math.min(...tills)
    console.log(tills, totalCheckoutTime)
    tills = tills.map((el) => el - shortLine)
    tills.forEach((el, i) => {
      if(el === 0){
        tills[i] = customers[0]
        customers.shift()
      } 
    });
    totalCheckoutTime += shortLine
    console.log(totalCheckoutTime)
    console.log(customers)
    
  }
  
  return totalCheckoutTime + (tills.map((a, el) => a += el, 0)[0] ? tills.map((a, el) => a += el, 0)[0] : 0)
  
}

// Other answer I liked
function queueTimeV2(customers, n) {
  // Create array for queue n length (filled with 0 values)
  var w = new Array(n).fill(0); //=> [0,0,0]
  for (let t of customers) {
    // Find smallest line index
    let idx = w.indexOf(Math.min(...w));
    // Add current customer to smallest line
    w[idx] += t;
  }
  // Return longest line total time
  return Math.max(...w);
}
```
2022-3-26
```js
// Consecutive Strings (6kyu)
//
// You are given an array(list) strarr of strings and an integer k.
// Your task is to return the first longest string consisting of k consecutive strings taken in the array.
// Examples:
strarr = ["tree", "foling", "trashy", "blue", "abcdef", "uvwxyz"], k = 2

// Concatenate the consecutive strings of strarr by 2, we get:

// treefoling(length 10)  concatenation of strarr[0] and strarr[1]
// folingtrashy("12)  concatenation of strarr[1] and strarr[2]
// trashyblue("10)  concatenation of strarr[2] and strarr[3]
// blueabcdef("10)  concatenation of strarr[3] and strarr[4]
// abcdefuvwxyz("12)  concatenation of strarr[4] and strarr[5]

// Two strings are the longest: "folingtrashy" and "abcdefuvwxyz".
// The first that came is "folingtrashy" so 
// longest_consec(strarr, 2) should return "folingtrashy".

// In the same way:
// longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2)-- > "abigailtheta"
// n being the length of the string array, if n = 0 or k > n or k <= 0 return ""(return Nothing in Elm).

// Note
// consecutive strings: follow one after another without an interruption

function longestConsec(strarr, k) {
  // Catch error cases
  if(strarr.length === 0 || k > strarr.length || k <= 0){
    return ''
  }

  // Array of concatenated words
  let concatArr = []

  strarr.forEach((el, index) => { 
    // concat word at el
    let concat = ''
    for(let i = 0; i < k; i++){
      // If last element don't try to concat
      if(strarr[index + k - 1] !== undefined){
        concat += (strarr[index + i]);
      } else {
        concat = el
      }
    }
    concatArr.push(concat)
  })

  let longest = '' 
  for(let j = 0; j < concatArr.length; j++){
    if(concatArr[j].length > longest.length){
      longest = concatArr[j]
    }
  }

  return longest
}

console.log(longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], 2)) //=> "abigailtheta"
console.log(longestConsec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1)) //=> "oocccffuucccjjjkkkjyyyeehh"
console.log(longestConsec([], 3)) //=> ''
console.log(longestConsec(["itvayloxrp", "wkppqsztdkmvcuwvereiupccauycnjutlv", "vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2)) //=> "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
console.log(longestConsec(["wlwsasphmxx", "owiaxujylentrklctozmymu", "wpgozvxxiu"], 2)) //=> "wlwsasphmxxowiaxujylentrklctozmymu"
console.log(longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], -2)) //=> ''
console.log(longestConsec(["it", "wkppv", "ixoyx", "3452", "zzzzzzzzzzzz"], 3)) //=> "ixoyx3452zzzzzzzzzzzz"
console.log(longestConsec(["it", "wkppv", "ixoyx", "3452", "zzzzzzzzzzzz"], 15)) //=> ''
console.log(longestConsec(["it", "wkppv", "ixoyx", "3452", "zzzzzzzzzzzz"], 0)) //=> ''
console.log(longestConsec(['test1', 'test2', 'test3'])) //=> 'test1test2'
```
2022-3-25
```js
// Statistics for an Athletic Association (6kyu)
//
// You are the "computer expert" of a local Athletic Association(C.A.A.).
// Many teams of runners come to compete.
// Each time you get a string of all race results of every team who has run.
// For example here is a string showing the individual results of a team of 5 runners:
//
//  "01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17"
//
// Each part of the string is of the form: h | m | s 
// where h, m, s(h for hour, m for minutes, s for seconds) 
// are positive or null integer(represented as strings) 
// with one or two digits.
// Substrings in the input string are separated by, or,.

// To compare the results of the teams you are asked for giving three statistics;
// range, average and median.
//
// Range : difference between the lowest and highest values.
//         In { 4, 6, 9, 3, 7 } the lowest value is 3, 
//         and the highest is 9, 
//         so the range is 9 − 3 = 6.
// Mean or Average: To calculate mean, add together all of the numbers in a set and 
//                  then divide the sum by the total count of numbers.
// Median : In statistics, the median is the number separating the higher half of a data sample from the lower half.
//          The median of a finite list of numbers can be found by 
//          arranging all the observations from lowest value to highest value 
//          and picking the middle one
//          (e.g., the median of { 3, 3, 5, 9, 11} is 5) when there is an odd number of observations.
//          If there is an even number of observations, then there is no single middle value; 
//          the median is then defined to be the mean of the two middle values
//          (the median of { 3, 5, 6, 9} is(5 + 6) / 2 = 5.5).

// Your task is to return a string giving these 3 values.
// For the example given above, the string result will be
// "Range: 00|47|18 Average: 01|35|15 Median: 01|32|34"
// of the form: "Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"`

// where hh, mm, ss are integers (represented by strings) with each 2 digits.

// Remarks:
// if a result in seconds is ab.xy... it will be given truncated as ab.
// if the given string is "" you will return ""


console.log(stat("01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17")) //=> "Range: 01|01|18 Average: 01|38|05 Median: 01|32|34"
console.log(stat("02|15|59, 2|47|16, 02|17|20, 2|32|34, 2|17|17, 2|22|00, 2|31|41")) //=> "Range: 00|31|17 Average: 02|26|18 Median: 02|22|00"

//1 hr= 3600
// 15 min = 900


function stat(strg){
  // Handle empty string input
  if(strg === ''){
    return ''
  }

  // Convert input to array of seconds and sort low to high
  strg = strg.split(', ').map((el) => el.split('|')
    .reduce((a, el, i) => {
      if(i === 0){
        el = el * 60 * 60
      }
      if(i=== 1){
        el = el * 60
      }
      return a + Number(el)
    }, 0)).sort((a, b) => a - b);

  // find range by subtracting first element in sorted array from last element
  const range = strg[strg.length - 1] - strg[0];
  
  // find average
  const avg = strg.reduce((a, el, i) => {
    // On last element add element then divide total by length to return avg
    if(i === strg.length - 1){
      a += el
      return Math.floor(a / strg.length)
    }
    return a += el
  }, 0)

  // find median
  const median = strg.length % 2 === 0 ? 
    // When strg.length is even get avg of two median elements
    Math.floor((strg[(strg.length / 2) - 1] + strg[(strg.length / 2)]) / 2) : 
    // When strg.length is odd return the middle element
    strg[Math.floor(strg.length / 2)]
  

  // Convert seconds to HMS
  const convertToHMS = (s) => {
    // initialize hours and minutes
    let h = 0;
    let m = 0;
    if(s > 60){
      // Divide seconds by 60 to get whole minutes
      m = Math.floor(s / 60);
      // Remainder of seconds / 60 is number of seconds not converted and stay as seconds
      s = s % 60
      if(m > 60){
        // Divide minutes by 60 to get whole hours
        h = Math.floor(m / 60);
        // Remainder of min/60 is number of minutes not converted and stay as minutes
        m = m % 60;
      }
    }

    // Function to ensure h, m, and s always have two digits
    const setTwoDigs = (t) => {
      return ('0' + t).slice(-2);
    }

    // Return formatted HMS string from seconds
    return `${setTwoDigs(h)}|${setTwoDigs(m)}|${setTwoDigs(s)}`
  }

  return `Range: ${convertToHMS(range)} Average: ${convertToHMS(avg)} Median: ${convertToHMS(median)}`
}
```
2022-3-24
```js
// Title Case (6kyu)
// A string is considered to be in title case if each word in the string is either
// (a) capitalised(that is, only the first letter of the word is in upper case) 
//  or
// (b) considered to be an exception and put entirely into lower case unless it is the first word, 
//     which is always capitalised.

// Write a function that will convert a string into title case, 
// given an optional list of exceptions(minor words).
// The list of minor words will be given as a string with each word separated by a space.
// Your function should ignore the case of the minor words string-- 
// it should behave in the same way even if the case of the minor word string is changed.

// ###Arguments(Haskell)
// First argument: space - delimited list of minor words that must always be lowercase except for the first word in the string.
// Second argument: the original string to be converted.

// ###Arguments(Other languages)
// First argument(required): the original string to be converted.
// Second argument(optional): space - delimited list of minor words that must always be lowercase except for the first word in the string.
// The JavaScript / CoffeeScript tests will pass undefined when this argument is unused.
// ###Example

console.log(titleCase('a clash of KINGS', 'a an the of')) // should return: 'A Clash of Kings'
console.log(titleCase('THE WIND IN THE WILLOWS', 'The In')) // should return: 'The Wind in the Willows'
console.log(titleCase('the quick brown fox')) // should return: 'The Quick Brown Fox'
console.log(titleCase("First a of in", "an often into"))

function titleCase(title, minorWords) {
  // Handle empty titles
  if(title === ''){
    return ''
  }
  // Split the title into an array
  // map each element
  return title.split(' ').map((el, i) => {
    // Turn the element lowercase (to handle uppercase ie: 'KINGS' => 'kings')
    el = el.toLowerCase()
    // If index is 0 (first word) capitalize ignoring minor words list
    if(i === 0){
      // Capitalize first letter and attach rest of string as lowercase
      return el[0].toUpperCase() + el.slice(1);
    }
    // If there is a minor words list and it includes the current element
    // (split into array since string will check individual chars)
    // ie   'an often into'.includes('a') => true 
    // but ['an', 'often', 'into'].includes('a') => false
    if(minorWords !== undefined && minorWords.toLowerCase().split(' ').includes(el)){
      // If listed in minor words list don't change and return in lowercase
      return el
    }
    // For all other words uppercase first letter only
    return el[0].toUpperCase() + el.slice(1);
  }).join(' ') // join to string with spaces before returning
}
```
2022-3-23
```js
// Playing with digits (6 kyu)
// 
// Some numbers have funny properties.
// For example:
// 89 -- > 8¹ + 9² = 89 * 1
// 695 -- > 6² + 9³ + 5⁴= 1390 = 695 * 2
// 46288 -- > 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

// Given a positive integer n written as abcd... 
// (a, b, c, d... being digits) and a positive integer p

// we want to find a positive integer k, if it exists, 
// such that the sum of the digits of n taken to the successive powers of p is equal to k * n.
// In other words:
// Is there an integer k such as : 
// (a ^ p + b ^ (p + 1) + c ^ (p + 2) + d ^ (p + 3) + ...) = n * k
// If it is the case we will return k, if not return -1.
// Note: n and p will always be given as strictly positive integers.

console.log(digPow(89, 1)) // should return 1 since 8¹ + 9² = 89 = 89 * 1
console.log(digPow(92, 1)) // should return -1 since there is no k such as 9¹ + 2² equals 92 * k
console.log(digPow(695, 2)) // should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
console.log(digPow(46288, 3)) // should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

// Take in a large number and second number
// For each digit in the large number:
//  Raise the digit to a power (the first power used is the second argument)
//  Get the value of this power and add it to a running total
//  Go to next digit and raise it to a power 1 higher than the previous number


}

function digPow(n, p){
  final  = `${n}`.split('')
    .map((el) => Number(el))
    .reduce((a, el) => {
      let pow = el ** p
      p++
      return a + pow
    }, 0);

  return final % n === 0 ? final / n : -1
}

// Another solution I liked:
// Same idea except used Math.pow so they didn't need to convert to num
// Also used index as an additive to p so they don't have to increment p when reducing
// (First loop through p + 0 for normal p value)
//  also reversed the return statement and only 0 (falsey) will return a posive response
//  Truthy numbers will return a -1
function digPowV2(n, p) {
  var x = String(n).split("").reduce((s, d, i) => s + Math.pow(d, p + i), 0)
  return x % n ? -1 : x / n
}

```
2022-3-22
```js
// Give me a Diamond (6kyu)
//
// Jamie is a programmer, and James' girlfriend. 
// She likes diamonds, and wants a diamond string from James. 
// Since James doesn't know how to make this happen, he needs your help.
//
// Task
// You need to return a string that looks like a diamond shape when printed on the screen, 
// using asterisk(*) characters.
// Trailing spaces should be removed, 
// and every line must be terminated with a newline character(\n).
// Return null / nil / None /... if the input is an even number or negative, 
// as it is not possible to print a diamond of even or negative size.

// Examples
// A size 3 diamond:
//  *
// ***
//  *
// ...which would appear as a string of " *\n***\n *\n"

// A size 5 diamond:

//   *
//  ***
// *****
//  ***
//   *
// ...that is:
// "  *\n ***\n*****\n ***\n  *\n"

// Tests
console.log(diamond(1)) // => "*/n"
console.log(diamond(3)) // => " *\n***\n *\n"
console.log(diamond(5)) // => "  *\n ***\n*****\n ***\n  *\n"
console.log(diamond(2)) // => null
console.log(diamond(-3)) // => null
console.log(diamond(0)) // => null

function diamond(d){
  // Create empty array to hold lines we will create
  let dArr = [];
  // Check to make sure d input number is valid
  //  Will keep dArr empty if d <= 0 or is divisible by 2
  //  (cannot make diamond with these values)
  if(d % 2 !== 0 && d > 0){
    // Create a line of diamonds d characters long (and add newline) 
    dArr.push(`${'*'.repeat(d)}\n`)
    // Start loop and run while i is greater than d/2 + .5
    // ex: 5/2 = 2.5 + .5 = 3 So run 4 loops (i = 5, 4, 3)
    for(let i = d; i >= (d/2) + .5; i--){
      // Create a 'newLine' var we will edit to add to array
      // Initialize it to the first array item
      let newLine = dArr[0]
      // Remove the last '*' character (and \n newline char)
      newLine = newLine.slice(0, newLine.length - 2)
      // Replace first '*' with a space character
      newLine = newLine.replace('*', ' ')
      // Add newline char to end of current string
      newLine = `${newLine}\n`
      // Add this string to the beginning and end of the array
      dArr.push(newLine);
      dArr.unshift(newLine);
    }
  }
  // If we added to the dArr then join each element to create diamond shape
  // If we didn't add to it (d was invalid) return null
  return dArr.length > 0 ? dArr.join('') : null
}
```
2022-3-21
```js
// Replace With Alphabet Position (6kyu)
//
// Welcome.
// In this kata you are required to, 
// given a string, replace every letter with its position in the alphabet.
// If anything in the text isn't a letter, ignore it and don't return it.

// "a" = 1, "b" = 2, etc.

// Example
console.log(alphabetPosition("The sunset sets at twelve o' clock.")) //=> "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

function alphabetPosition(text) {
  // Key to check what number should replace a value
  let key = "abcdefghijklmnopqrstuvwxyz"
  // set argument to lowercase, make each character an element in an array and filter invalid characters (non-letters)
  // Convert each letter in array to a number that is index from key + 1 
  // Rejoin all elements to a string with a space between
  return text.toLowerCase().split('').filter((el) => key.includes(el)).map((el, i, a) => { 
    return key.indexOf(el) + 1
  }).join(' ')
}
```
2022-3-20
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
2022-3-19
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
2022-3-18
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
2022-3-17
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
2022-3-16
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
2022-3-15
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