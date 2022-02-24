//create a function that adds two numbers and alerts the sum
function add(i, n){
  alert(i + n)
}

add(1, 2) // => 3
add(5, 6) // => 11
add(4,-12) // => -8
//create a function that multiplys three numbers and console logs the product
function mult(i, n, j){
  console.log((i * n) * j);
}

mult(1, 2, 3) // => 6
mult(5, 6, 7) // => 210
mult(4, -12, 20) // => -960

//create a function that divides two numbers and returns the ???
function div(i, n){
  return i / n;
}

function rem(i, n){
  return i % n;
}

console.log(div(6, 2)) // =>3
console.log(div(8, 2)) // =>4
console.log(div(10, 2)) // =>5

console.log(rem(6, 2)) // =>0
console.log(rem(9, 2)) // =>1
console.log(rem(14, 3)) // =>2