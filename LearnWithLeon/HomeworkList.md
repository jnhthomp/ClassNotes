# Due 4/14
Submission Link: https://docs.google.com/forms/d/e/1FAIpQLSfQjK13fHQKfdQ-87F649ZZ_sOhb0UC8p_RYOXLKri86CkxKg/viewform

COMPLETE: Make the cocktailDB api work with spaces between the names!
  - ```js
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
      // Replace all spaces with '+'. Not using .replace(' ', '+') since it only affects first instance
      fetchDrinks(document.querySelector('input').value.split(' ').join('+'))
    })

    fetchDrinks()
    ```
COMPLETE: Find three APIs and build three simple apps using those APIs (Not all of these work, but it is a start: https://github.com/public-apis/public-apis)
  - When is the next marvel movie?
    - https://glitch.com/edit/#!/next-marvel-movie-api
  - F1 API Discord bot
    - https://github.com/jnhthomp/f1-discord-bot
  - Github api profile card
    - https://glitch.com/edit/#!/github-details-api
COMPLETE: Get NASA picture of the day api working
  - ```js
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
    ```

## Bonus 3/31
COMPLETE: Make a rotating list of drinks (an automatic carousel) from the cocktailDB
  - https://glitch.com/edit/#!/cocktail-db-carousel
Do: Make the NASA API handle all the data types including video
Do: Add an API to your portfolio website  f

## Due 4/26
(No actual submission links)
Do: Intro JS Course https://www.codecademy.com/learn/introduction-to-javascript
Do: Professional Checklist https://docs.google.com/document/d/1L2vTX3qvLhoGHeG5cVD2ljCfRGr1uJ_Gf-hNZj9KzTg/edit

## Due 5/3
Watch / Do: https://youtu.be/PFmuCDHHpwk
Read / Do: JS Way Ch. 09: https://github.com/thejsway/thejsway/blob/master/manuscript/
Do: 7 Codewars
DO: FINISH Professional Checklist - https://docs.google.com/document/d/1L2vTX3qvLhoGHeG5cVD2ljCfRGr1uJ_Gf-hNZj9KzTg

## Bonus
Read / Do: Eloquent JS Ch. 06: https://eloquentjavascript.net/06_object.html

## Extra work (Good idea to do)
- Add API to portfolio website (github stats api on glitch?)ff