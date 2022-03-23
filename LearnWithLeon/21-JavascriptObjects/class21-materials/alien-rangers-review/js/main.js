//*Arrays*

//Create and array of tv shows. 
// Loop through and print each show to the console
const tvShow = ['show1', 'show2', 'show3']
tvShow.forEach((el) => { console.log(el) })

// Create and array of numbers
// Return a new array of numbers that includes 
//  every even number from the previous Arrays
const nums = [1,2,3,4,5,6,7,8,9,10]
const evens = (arr) => arr.filter((el) => el % 2 === 0)
console.log(evens(nums));

// Create a function that takes in an array of numbers
// Alert the sum of the second lowest 
// and the second highest number
const alert2ndLowAndHigh = (arr) => {
  arr = arr.sort((a,b) => a - b)
  alert(arr[1] + arr[arr.length - 2]);
}

alert2ndLowAndHigh(nums);