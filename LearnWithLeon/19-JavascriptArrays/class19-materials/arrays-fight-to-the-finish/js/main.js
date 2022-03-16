// Create an array of movie titles. 
let movies = ['Shrek 1', 'Shrek 2', 'Shrek 3'];
// Loop through the array and add each element to the h2.
movies.forEach((el) => { 
  document.querySelector('h2').innerHTML += (el + ' ');
})

//Create an array of numbers. 
let nums = [1, 2, 3]
// Loop through the array 
// and add three to each number and replace the old number.
nums.forEach((el, i) => { 
  nums[i] += 3;
})

console.log(nums);

//Find the average of all the numbers from question three
let sum = 0
nums.forEach((el) => { 
  sum += el
})
let avg = (sum / nums.length);
console.log(avg);