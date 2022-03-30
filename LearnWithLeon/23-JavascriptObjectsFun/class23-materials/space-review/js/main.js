// * Arrays *
// Create an array of numbers. 
// Sum all of the numbers. 
// Alert the sum.
let numbers = [1, 2, 3, 4, 5];
alert(numbers.reduce((a, el) => a += el, 0)); //=> 15

// Create a function that takes in an array of numbers
// Return a new array of numbers
// that is every original number squared
const sqArray = (arr) => arr.map((el) => el ** 2);
console.log(sqArray(numbers)); //=> [1, 4, 9, 16, 25]
console.log(numbers); //=> [1, 2, 3, 4, 5](unchanged)

// Create a function that takes string
// Print the reverse of that string to the console
const rev = (str) => str.split('').reverse().join('');
console.log(rev('test')); //=> 'tset'

// Create a function that takes in a string
// Alert if the string is a palindrome or not
const isPalindrome = (str) => (str === rev(str));

console.log(`racecar ${isPalindrome('racecar')}`);
console.log(`not a drome ${isPalindrome('not a drome')}`);