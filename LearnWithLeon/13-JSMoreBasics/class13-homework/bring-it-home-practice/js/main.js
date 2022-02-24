// *Variables*
// Create a variable and console log the value
let i;
console.log(i); //=> undefined

// Create a variable, add 10 to it, and alert the value
let n = 10;
n = n + 10;
alert(n); // => 20

// *Functions*
// Create a function that subtracts 4 numbers and alerts the difference
function sub(a, b, c, d){
  alert(a - b - c - d);
}

sub(100, 10, 20, 30) // => 40

// Create a function that divides one number by another and returns the remainder
function rem(e, f){
  return e % f
}
console.log(rem(5, 2)) // => 1

// *Conditionals*
// Create a function that adds two numbers and if the sum is greater than 50 alert Jumanji
function jumanji(a, b){
  if(a + b > 50){
    alert('Jumanji');
  }
}
jumanji(26, 25) // => Jumaji alert
jumanji(24, 25) // => No alert

// Create a function that multiplys three numbers and if the product is divisible by 3 alert ZEBRA
function mult(a, b ,c){
  if((a * b * c) % 3 === 0){
    alert('ZEBRA');
  }
}

mult(3, 5, 2) // => ZEBRA alert
mult(2, 2, 2) // No alert

