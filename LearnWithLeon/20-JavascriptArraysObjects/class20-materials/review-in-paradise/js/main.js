// *Variables*
// Declare a variable, reassign it to your favorite food, 
// and alert the value
let favFood = 'boring'
favFood = 'Pizza'
// alert(favFood)

//Declare a variable, assign it a string, 
// alert the second character in the string 
// (Use your google-fu and the MDN)
let str = 'Hello There!'
// alert(str[1])


// *Functions*
// Create a function that takes in 3 numbers. 
// Divide the first two numbers and multiply the last. 
// Alert the product. Call the function.
const divFirstTwoMultLast = (a, b, c) => {
  alert(a / b * c)
}
divFirstTwoMultLast(12, 3, 4); // 16

// Create a function that takes in 1 number. 
// Console log the cube root of the number. 
// Call the function.
const logRoot = (a) => {
  console.log(Math.cbrt(a));
}
logRoot(64);

// *Conditionals*
//Create a function that takes in a month. 
// If it is a summer month alert "YAY". 
// If another other month, alert "Booo"
const sayMonth = (month) => {
  const monthsArr = ['january','february', 'march','april','may','june','july','august','september','october','november', 'december']
  if(monthsArr.indexOf(month.toLowerCase()) > 4 && monthsArr.indexOf(month.toLowerCase()) < 8){
    alert('Yay');
  } else {
    alert('Boo');
  }
}

// Test above
// ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'].forEach((el) => {
//   sayMonth(el) 
// })

//*Loops*
// Create a function that takes in a number. 
/// Console log every number from 1 to that number 
// while skipping multiples of 5.
const logToNumSkip5 = (num) => {
  for(let i = 1; i <= num; i++){
    if(i % 5 !== 0){
      console.log(i);
    }
  }
}

logToNumSkip5(25);