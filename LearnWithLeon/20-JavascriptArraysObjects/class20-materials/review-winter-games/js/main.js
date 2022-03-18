//Create a function that takes in an array of numbers. 
// Return a new array containing every even number from the original array 
// (do not use map or filter)

// No map/filter
const makeEvenArr = (arr) => {
  let newArr = [];
  arr.forEach((el) => { 
    if(el % 2 === 0){
      newArr.push(el);
    }
  })

  return newArr;
}

// With filter
const makeEvenArrV2 = (arr) => {
  return arr.filter((el) => el % 2 === 0)
}

console.log(makeEvenArr([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
console.log(makeEvenArrV2([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))