//Example fetch using pokemonapi.co
document.querySelector('button').addEventListener('click', getFetch)
document.querySelector('input').value = 1524713317
// Initialize local storage if it does not exist
if(!localStorage.getItem('books')){
  localStorage.setItem('books', '')
}
// set title from local storage
document.querySelector('h2').innerText = localStorage.getItem('books')

function getFetch(){
  
  const choice = document.querySelector('input').value 
  // console.log(choice)
  const url = `https://openlibrary.org/isbn/${choice}.json`

  fetch(url)
      .then(res => res.json()) // parse response as JSON
      .then(data => {
        console.log(data)
        title = data.title
        // put title into local storage and concatenate with previous value
        // We are concattenating a string because local storage cannot store arrays without json format
        // Easier to just concat strings for now
        let books = localStorage.getItem('books') + ';' + data.title
        localStorage.setItem('books', books)
        document.querySelector('h2').innerText = localStorage.getItem('books').split(';').join('\n')

        
      })
      .catch(err => {
          console.log(`error ${err}`)
      });
}

