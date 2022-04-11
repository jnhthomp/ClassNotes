//The user will enter a date. 
// Use that date to get the NASA picture of the day from that date! https://api.nasa.gov/


// Fetch todays APID by default
let url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
function fetchAPOD(url){
  fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      console.log(data)
      // Add name to h2
      document.querySelector('h2').innerText = `${data.title}`
      // Add image
      document.querySelector('img').src = data.hdurl
      // Add description
      document.querySelector('h3').innerText = `Description: ${data.explanation}`
    })
    .catch(err => {
      console.log(`error ${err}`)
    });
}

document.querySelector('button').addEventListener('click', (e) => { 
  document.querySelector('input').value !== '' ?
    url = `https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=${document.querySelector('input').value}` :
    url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY";

  fetchAPOD(url)
})

fetchAPOD(url)