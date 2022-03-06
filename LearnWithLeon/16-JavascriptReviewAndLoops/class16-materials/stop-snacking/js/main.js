//Create a function that grabs the number of snacks from the input
// and tells you to stop that many times
const stopSnack = () => { 
  let num = Number(document.querySelector('input').value)
  document.getElementById('stops').innerText = '';
  for(let i = 1; i <= num; i++){
    document.getElementById('stops').innerText += ' STOP!';
  }
}

document.getElementById('help').addEventListener('click', stopSnack);