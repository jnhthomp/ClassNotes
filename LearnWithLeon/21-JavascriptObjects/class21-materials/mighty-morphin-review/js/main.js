// *Variables*
// Declare a variable, reassign it to your fav holiday, 
// make sure it is in all caps, and print the value to the console
let favHoliday
favHoliday = 'Christmas';
favHoliday.toUpperCase();
console.log(favHoliday);

//Declare a variable, assign it a string, 
// alert the last three characters in the string 
// (Use your google-fu and the MDN)
let str = 'This has more than three chars'
alert(str.substring(str.length - 3));

// *Functions*
// Create a function that takes in 5 numbers. 
// Subtract all five from 100. 
// Alert the absolute value of the difference. 
// Call the function.
const subsFrom100 = (a, b, c, d, e) => {
  alert(Math.abs(100 - a - b - c - d - e))
}

subsFrom100(1,2,3,4,5);

// Create a function that takes in 3 numbers. 
// Console log lowest and highest values. 
// Call the function.
const findHighAndLow = (a, b, c) => {
  console.log(Math.max(a, b, c), Math.min(a, b, c))
}

findHighAndLow(1, 2, 3)

// *Conditionals*
//Create a function that returns heads or tails randomly 
// and as fairly as possible. 
// Call the function.
const headsOrTails = () => Math.random() > .5 ? console.log('heads') : console.log('tails')

headsOrTails();

//*Loops*
//Create a function that takes in a number. 
// Console log the result of heads or tails using the previous 
// function x times where x is the number passed into the function. 
// Call the function.
const flipCoinXTimes = (n) => {
  for(let i = 1; i <= n; i++){
    headsOrTails();
  }
}

flipCoinXTimes(5)