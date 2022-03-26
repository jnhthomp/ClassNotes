//Arrays
//Create and array of numbers. Sum all of the numbers. Alert the sum.
alert([1, 2, 3, 4, 5].reduce((a, el) => a += el, 0))

//Create a function that takes in an array of numbers
//Return a new array of numbers that is every original number squared
const squArray = (arr) => {
  return arr.map((el) => el ** 2)
}
console.log(squArray([1, 2, 3, 4, 5]))

//Create a function that takes string
//Print the reverse of that string to the console
const printReverse = (str) => {
  return str.split('').reverse().join('')
}
console.log(printReverse('Hello there!'));

//Create a function that takes in a string
//Alert if the string is a palindrome or not
const isPalindrome = (str) => str === printReverse(str) ? true : false
alert(isPalindrome('racecar')); //=> true
alert(isPalindrome('no.')); //=> false