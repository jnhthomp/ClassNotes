// Open the first one first and view the page
// There are three contestants on the page
// The goal is to make it so that when you click on 'final rose' claire and sharlene go away and only nicky remains
// Edit this so that this happens
document.getElementById('finalRose').addEventListener('click', rose);

function rose() {
  document.getElementById('claire').style.display = 'none'
  document.getElementById('sharleen').style.display = 'none'
}