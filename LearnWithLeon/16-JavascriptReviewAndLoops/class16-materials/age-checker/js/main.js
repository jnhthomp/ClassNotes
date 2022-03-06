function checkAge(age){
  let message
  //Create a conditonal that checks their age
  if (age < 16) {//If under 16, tell them they can not drive
    message  = 'You cannot drive'
    console.log(message);
    return message;
  } else if (age < 18) { //If under 18, tell them they can't hate from outside the club, because they can't even get in
    message = 'You can\'t hate from outside the club, you can\'t even get in';
    console.log(message);
    return message;
  } else if (age < 21) { //If under 21, tell them they can not drink
    message = 'You cannot drink';
    console.log(message);
    return message;
  } else if (age < 25) { //If under 25, tell them they can not rent cars affordably
    message = 'You cannot rent cars affordable';
    console.log(message);
    return message;
  } else if (age < 30) { //If under 30, tell them they can not rent fancy cars affordably
    message = 'You cannot rent fancy cars affordably';
    console.log(message);
    return message;
  } else { //If under over 30, tell them there is nothing left to look forward too
    message = 'There is nothing left to look forward to';
    console.log(message);
    return message;
  }
}




//--- Harder
//On click of the h1
//Take the value from the input
//Place the result of the conditional in the paragraph
document.querySelector('h1').addEventListener('click', runCheckAge);

function runCheckAge() {
  inputVal = document.getElementById('danceDanceRevolution').value
  document.querySelector('p').innerText = checkAge(+inputVal);
}