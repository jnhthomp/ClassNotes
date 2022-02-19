const updateDOM = (message) => {
  document.getElementById('placeToSee').innerText = message;
}

const getDayHandler = () => {
  let message;
  const dotw = document.getElementById('day').value.toUpperCase();
  if (dotw === ('TUESDAY') || dotw === 'THURSDAY') {
    message = 'class'
  } else if (dotw === 'SATURDAY' || dotw === 'SUNDAY') {
    message = 'weekend'
  } else if (dotw === ('MONDAY') || dotw === 'WEDNESDAY'){
    message = 'boring'
  } else {
    message = 'WE DON\'T GET GOT'
  }
  updateDOM(message);
}
// document.getElementById('check').addEventListener('click', getDayHandler);
// Prevent page reloading when form submits (enter key or submit button)
document.querySelector('form').addEventListener('submit', (event) => {
  event.preventDefault();
  getDayHandler();
});
document.getElementById('check').addEventListener('click', getDayHandler);
