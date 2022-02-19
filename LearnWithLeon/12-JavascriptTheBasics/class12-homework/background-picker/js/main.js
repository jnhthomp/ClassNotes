
// Create new list item and give it an id
const newColor = document.createElement('li');
newColor.id = ('red');

const colorList = document.querySelector('ul');
const body = document.querySelector('body');

colorList.appendChild(newColor);
colorList.style.height = '265px';
newColor.style.background = 'rgb(227, 84, 79)';

const setBackgroundPurple = () => { body.style.background = 'rgba(241,63,247,1)'};
const setBackgroundGreen = () => { body.style.background = 'rgba(0,253,81,1)' };
const setBackgroundBlue = () => { body.style.background = 'rgba(0,254,255)' };
const setBackgroundRed = () => { body.style.background = 'rgb(227, 84, 79)' };

document.getElementById('purple').addEventListener('click', setBackgroundPurple);
document.getElementById('green').addEventListener('click', setBackgroundGreen);
document.getElementById('blue').addEventListener('click', setBackgroundBlue);
document.getElementById('red').addEventListener('click', setBackgroundRed);

