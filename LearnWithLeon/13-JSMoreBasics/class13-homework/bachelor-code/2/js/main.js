// Now for the second folder this page lists three names
// We have the choice over who the next bachelorette should have been

// We need to plug in the actions we want to person to show up 
// when their name is clicked


const andi = document.getElementById('andi');
const claire = document.getElementById('claire');
const sharleen = document.getElementById('sharleen');

document.getElementById('andiNext').addEventListener('click', andiNext);
document.getElementById('claireNext').addEventListener('click', claireNext);
document.getElementById('sharleenNext').addEventListener('click', sharleenNext);

function andiNext() {
  // hide claire and sharleen
  claire.classList.add('hidden');
  sharleen.classList.add('hidden');
  // show andi
  andi.classList.toggle('hidden');
}

function claireNext() {
  // hide andi and sharleen
  andi.classList.add('hidden');
  sharleen.classList.add('hidden');

  // show claire
  claire.classList.toggle('hidden');
}
function sharleenNext() {
  // hide andi and claire
  andi.classList.add('hidden');
  claire.classList.add('hidden');
  // show sharleen
  sharleen.classList.toggle('hidden');
}