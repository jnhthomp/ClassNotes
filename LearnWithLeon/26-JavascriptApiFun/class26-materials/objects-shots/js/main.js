// function to perform or async fetch action
function fetchDrinks(search = 'margarita', i = '0' ) { // base url
  const url = `https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${search}`
  fetch(url)
    .then(res => res.json()) // parse response as JSON
    .then(data => {
      let drink = data.drinks[i]
      console.log(data.drinks);
      console.log(drink)
      function setDrinks(dr){
        document.querySelector('h2').innerText = dr.strDrink
        document.querySelector('img').src = dr.strDrinkThumb
        document.querySelector('h3').innerText = dr.strInstructions
      }
      setDrinks(drink)
      
      let carousel = setInterval(carFunc, 10000);
      function carFunc(){
        if(i < data.drinks.length){
          i++
          drink = data.drinks[i]
          console.log(drink)
          setDrinks(drink)
        } else{
          clearInterval(carousel)
        }
      }
    })
    .catch(err => {
      console.log(`error ${err}`)
    });
}

document.querySelector('button').addEventListener('click', (e) => {
  fetchDrinks(document.querySelector('input').value.split(' ').join('+'))
})

fetchDrinks()