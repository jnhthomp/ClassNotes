let total = 0

const zeroBtn = document.getElementById('pumpkin');
const plusThreeBtn = document.getElementById('dominosPizza');
const plusNineBtn = document.getElementById('zebra');
const minusTwoBtn = document.getElementById('cantThinkOfAnything');

const resultArea = document.getElementById('placeToPutResult');
// Update result with starting totat
resultArea.innerText = total

// Create new li and give it an id
const plusFiveBtn = document.createElement('li');
plusFiveBtn.id = 'plusFive';
plusFiveBtn.innerText = '+5';

// Target list of buttons and add new button as child
const btnList = document.querySelector('ul');
btnList.appendChild(plusFiveBtn);
// Adjust height to fit new child
btnList.style.height = '250px';

// Update result function
const updateResult = (updateAmount) => { 
  total = total + updateAmount;
  document.getElementById('placeToPutResult').innerText = total;
};

// onClick events for each button
zeroBtn.addEventListener('click', () => {updateResult(-Math.abs(parseInt(resultArea.innerText)))});
plusThreeBtn.addEventListener('click', () => { updateResult(parseInt(plusThreeBtn.innerText))});
plusNineBtn.addEventListener('click', () => { updateResult(parseInt(plusNineBtn.innerText))});
minusTwoBtn.addEventListener('click', () => { updateResult(parseInt(minusTwoBtn.innerText))});
plusFiveBtn.addEventListener('click', () => { updateResult(parseInt(plusFiveBtn.innerText))});
