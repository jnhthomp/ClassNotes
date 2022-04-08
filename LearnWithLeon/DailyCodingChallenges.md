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