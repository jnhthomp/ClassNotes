//Create a button that adds 1 to a botScore stored in localStorage 
document.querySelector('button').addEventListener('click', addToScore);

if(!localStorage.getItem('score')){
  localStorage.setItem('score', 0)
}

function addToScore(){
    let localScore = localStorage.getItem('score');
    localStorage.setItem('score', +localScore + 1)
    console.log(localStorage.getItem('score'))
}