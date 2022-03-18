// Create a function that takes in an array. 
// If the first number, is less than the last number, alert "Hi". 
// If the first number is greater than the last number, alert "Bye". 
// If they are equal, alert "We close in an hour".
function alertSomething(arr) {
  let first = arr[0]
  let last = arr[arr.length - 1];
  if(first < last){
    alert('Hi');
  } else if (first > last){
    alert('Bye');
  } else {
    alert("We close in an hour");
  }
}

alertSomething([7,2,3,4,5,6,6,7])