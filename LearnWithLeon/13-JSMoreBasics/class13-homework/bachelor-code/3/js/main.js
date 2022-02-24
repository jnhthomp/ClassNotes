// This only displays two names
// We want to make it so that if you click nikki then you show her image 
// But if you click claire then there is an alert saying "Wrong"
const contestants = document.querySelectorAll('.contestant');

contestants.forEach((el) => { 
  el.addEventListener('click', rose);
})

function rose(event) {
  if(event.target.classList.contains('rose')){
    document.getElementById('nikki').classList.toggle('hidden');
  } else if(!event.target.classList.contains('rose')){
    alert('WRONG!');
  }
}