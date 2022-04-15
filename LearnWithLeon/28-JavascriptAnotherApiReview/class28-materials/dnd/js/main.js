//Example fetch using DnD5eAPI - place subclasses in ul
document.querySelector('button').addEventListener('click', getFetch)

function getFetch() {
  const choice = document.querySelector('input').value
  const url = `https://www.dnd5eapi.co/api/spells/${choice}`

  fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {


      // Add name
      document.querySelector('h2').innerText = data.name;
      // Handle multiple classes
      data.classes.forEach((el, i) => {
        if (i > 0) {
          document.querySelector('h3').innerText += `/${el.name}`
        } else {
          document.querySelector('h3').innerText = el.name
        }
      })

      // Clear previous entries from subclass list
      while (document.querySelector('ul').hasChildNodes()) { // runs while child nodes exist in ul element
        // Remove first child until all children are cleared and loop exits
        document.querySelector('ul').removeChild(document.querySelector('ul').children[0])
      }

      // Loop through subclasses array
      data.subclasses.forEach((el) => {
        // Create new li for each object in subclass array
        document.querySelector('ul').innerHTML += `<li>${el.name}</li>`
      })
    })
    .catch(err => {
      console.log(`error ${err}`)
    });
}
