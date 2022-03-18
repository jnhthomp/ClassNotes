// Create a function that takes in an array of numbers.
// Multiply each number together and alert the product. 
// EZ way
const multArr = (arr) => {
  alert(arr.reduce((acc, val) => acc * val ));
}

multArr([1,2,3]) // =>6
multArrV2([1, 2, 3, 4]) // =>24
multArrV2([1, 2, 3, 4, 5]) // =>120

// Other way (without reduce)
function multArrV2(arr) {
  let product = 1
  arr.forEach((el) => { product *= el })
  alert(product);
}

// With a for loop
function multArrV3(arr) {
  let product = arr[0];
  for(let i = 1; i < arr.length; i++){
    product *= arr[i];
  }
  alert(product);
}