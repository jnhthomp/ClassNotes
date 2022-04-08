// function to perform or async fetch action
function fetchDrinks(search = 'margarita') { // base url
  const url = `https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${search}`
  fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      let drink = data.drinks[Math.ceil(Math.random() * data.drinks.length - 1)]
      console.log(drink)
      document.querySelector('h2').innerText = drink.strDrink
      document.querySelector('img').src = drink.strDrinkThumb
      document.querySelector('h3').innerText = drink.strInstructions
    })
    .catch(err => {
      console.log(`error ${err}`)
    });
}

document.querySelector('button').addEventListener('click', (e) => {
  fetchDrinks(document.querySelector('input').value.split(' ').join('+'))
})

fetchDrinks()