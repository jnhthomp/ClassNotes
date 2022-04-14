//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)

function getFetch(){
  const choice = document.querySelector('input').value
  // NASA APOD API URL
  // https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE
  const url = `https://api.nasa.gov/planetary/apod?api_key=3Lq27Fp6DXC6iXkqDf6coImbwriiDarFSMG59lgE&date=${choice}`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        if(data.media_type === 'image'){
          document.querySelector('img').src = data.hdurl  
          document.querySelector('iframe').src = ''
        } else {
          document.querySelector('iframe').src = data.url
          document.querySelector('img').src = ''
        }
        document.querySelector('img').src = data.hdurl
        document.querySelector('h3').innerText = data.explanation
        console.log(document.querySelector('input').value)
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}

