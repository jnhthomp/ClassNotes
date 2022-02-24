
  // When form is submitted (Enter or button click)
  // Find the input in the dom and retrieve a value from it
  // Convert that number from celsius to fahrenheit
  // target an element and provide it the calculated value

document.querySelector('form').addEventListener('submit', convert);

function convert(event) {
  event.preventDefault();
  document.getElementById('putValueHere').innerText = +document.getElementById('valueInput').value * 1.8 + 32;
}