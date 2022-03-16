3/16/2022
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