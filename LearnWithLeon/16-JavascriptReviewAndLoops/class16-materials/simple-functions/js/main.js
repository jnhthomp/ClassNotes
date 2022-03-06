//---Easy
//create a function that subtracts two numbers and alerts the difference
const subtract = (a, b) => { alert(a - b) }
// subtract(50, 30); // alerts 20
// subtract(100,33); // alerts 67

//create a function that divides three numbers and console logs the quotient
const div = (a, b, c) => { console.log(a/b/c) }
// div(12, 4, 3) // logs=>1


//create a function that multiplys three numbers and returns the product
const mult = (a, b, c) => a * b * c
// console.log(mult(5, 10, 2)); //=>100

//---Medium
//create a function that takes in three numbers. 
//Add the first two numbers and return 
// the remainder of dividing the sum of the first two numbers by the third number
const med = (a, b, c) => ((a + b) % c)
console.log(med(5, 2, 3)) //=> 1

//---Hard
//create a function that takes in 4 numbers. 
// Multiply the first two numbers. 
// If the product is greater than 100 add the sum of the last two numbers 
//and console log the value. If the product is less that 100, 
//subtract the difference of the last two numbers and console log the value. 
//If the product is 100, multiply the first three numbers together 
// and alert the remainder of dividing the fourth number
const hard = (a, b, c, d) => { 
  if((a * b) > 100){
    console.log((a * b) + c + d)
  } else if ((a * b) < 100){
    console.log(c -d);
  } else if ((a * b) === 100){
    alert((a * b * c)% d);
  }
}