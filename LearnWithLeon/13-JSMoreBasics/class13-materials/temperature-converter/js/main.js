//Write your pseduo code first! 

// Create an input field that can accept numbers
// Create a button that when clicked activates function
// This function should:d
  // Find the input in the dom and retrieve a value from it
  // check that the value is valid (number)
  // Convert that number from celsius to fahrenheit
  // Create an element in the dom to output to (such as an h2) 
  // target that element and provide it the calculated value

const buttonAction = (event) => {
  event.preventDefault();
  const celsiusVal = document.getElementById('valueInput').value;
  const fahrenheitVal = (celsiusVal * 1.8) + 32;
  document.getElementById('putValueHere').innerText = fahrenheitVal;
}

document.getElementById('inputButton').addEventListener('click', buttonAction);

