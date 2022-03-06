// *Variables*
// Declare a variable, assign it a value, and alert the value
let num = 5
alert(num);

// Create a variable, divide it by 10, and console log the value
let num2 = 100
console.log(num2/10);

// *Functions*
// Create a function that multiplys 3 numbers and alerts the product
const mult = (a, b, c) => { alert(a * b * c) }

// Create a function that takes in 4 numbers. 
// Add the first two numbers and subtract the next two. 
// Console log the result
const take4num = (a, b, c, d) => { console.log((a + b) -c - d) }

// *Conditionals*
// Create a function that takes in 3 numbers. 
// Starting with 100 add the first number, subtract the second, 
// and divide the third. 
// If the value is greater then 25, console log "WE HAVE A WINNNA"
const takes3num = (a, b, c) => { 
  let result = ((100 + a - b) / c);
  if(result > 25){
    console.log('WE HAVE A WINNA');
  }  
}

// Create a function that takes in a day of the week. 
// If it is a weekend alert, "weekend" and if not alert "week day". 
// Handle capitilization 
// and if the user does not enter a day of the week alert "Try again!"
const takeDOTW = (day) => { 
  if(day.toLowerCase === 'saturday' || day.toLowerCase === 'sunday'){
    alert('weekend');
  } else if (day.toLowerCase === 'monday' || day.toLowerCase === 'tuesday' || day.toLowerCase === 'wednesday' || day.toLowerCase === 'thursday' || day.toLowerCase === 'friday'){
    alert('weekday');
  } else {
    alert('try again');
  }
}

//*Loops*
//Create a function that takes in a number. 
// Console log all values from 1 to that number or greater, but count by 3
const takeNum = (num) => { 
  for(let i = 1; i <= num; i + 3){
    console.log(i);
  }
}