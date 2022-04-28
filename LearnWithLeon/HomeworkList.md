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
Do: Find three APIs and build three simple apps using those APIs (Not all of these work, but it is a start: https://github.com/public-apis/public-apis)
  - When is the next marvel movie?
    ```js
    let date = updateDate()
    // function to perform or async fetch action
    function fetchNexMovie(searchDate=date) { // base url
      const url = `https://www.whenisthenextmcufilm.com/api${searchDate ? `?date=${searchDate}`: ''}`
      fetch(url)
        .then(res => res.json()) // parse response as JSON
        .then(data => {
          console.log(data)
          // Update title in dom
          //console.log(data.title)
          document.getElementById('title').innerText = data.title
          // update countdown and release date in dom
          //console.log(data.days_until)
          document.getElementById('countdown').innerText = data.days_until
          //console.log(data.release_date)
          document.getElementById('releaseDate').innerText = data.release_date
          //console.log(data.poster_url)
          document.getElementById('posterImg').src = data.poster_url
          //console.log(data.overview)
          document.getElementById('description').innerText = data.overview

        })
        .catch(err => {
          console.log(`error ${err}`)
        });
    }

    function updateDate(dateISO = null){
      
      if(dateISO !== null){
        return new Date(dateISO)
      } else {
        return new Date()
      }
      
    }

    function formatDate(date){
      return date.toISOString().slice(0, date.toISOString().indexOf('T'))
    }

    document.getElementById('nextMovieBtn').addEventListener('click', (e) => {
      // let date = new Date(document.getElementById('releaseDate').innerText)
      // date.setDate(date.getDate())
      // console.log(date.toISOString().slice(0, date.toISOString().indexOf('T')))
      // const dateISO = date.toISOString().slice(0, date.toISOString().indexOf('T'));
      // fetchNexMovie(dateISO)

      console.log(date)
      date = updateDate(document.getElementById('releaseDate').innerText)
      console.log(date)

      // nextDate.setDate(date.getDate() + 1)
      fetchNexMovie(formatDate(date))
    })

    document.getElementById('prevMovieBtn').addEventListener('click', (e) => { 
      let subDate = date
      console.log(date.getDate())
      console.log(date.getDate() - 2)
      subDate.setDate(date.getDate() - 2)
      date = updateDate(formatDate(subDate))
      console.log(date)
      fetchNexMovie(formatDate(date))
    })
    fetchNexMovie()
    ```
    ```html
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta name="description" content="Your description goes here">
        <meta name="keywords" content="one, two, three">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Blank Template</title>

        <!-- external CSS link -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/style.css">
      </head>
      <body>
        <!-- 
        Data to display:
          - Title  
          - Days until movie
          - Poster URL (to display image)
          - Overview (movie description)
          - release date (set as date when clicking next movie)
          - Next movie
          
        -->

        <h1 id="title"></h1>
        <p>Releases in <span id="countdown"></span> days on <span id="releaseDate"></span></p>
        <img src="" alt="movie poster" id="posterImg">
        <p id="description"></p>
        <div class="btnHold">
          <button id="prevMovieBtn" type="button" name="button">Back to beginning</button>
          <button id="nextMovieBtn" type="button" name="button">Next Movie</button>
        </div>
        <script type="text/javascript" src="js/main.js"></script>
      </body>
    </html>
    ```
    ```css
    /* Box Model Hack */
    * {
        box-sizing: border-box;
    }

    /* Clear fix hack */
    .clearfix:after {
        content: ".";
        display: block;
        clear: both;
        visibility: hidden;
        line-height: 0;
        height: 0;
    }

    .clear {
      clear: both;
    }

    /******************************************
    /* BASE STYLES
    /*******************************************/

    body {
      color: rgb(250, 250, 250);
      background: rgb(38, 50, 56);
    }


    /******************************************
    /* LAYOUT
    /*******************************************/
    h1, p, img{
      text-align: center;
    }

    img, .btnHold {
      display: block;
      margin: 0 auto;
    }

    p {
      font-size: 1.5rem;
      width: 60%;
      margin: 2% auto;
    }

    button {
      color: rgb(250, 250, 250);
      font-size: 1.5rem;
      background-color: rgb(231, 76, 60);
      padding: 1% 2%;
      border: none;
      border-radius: 5px;
    }

    .btnHold{
      display:flex;
      justify-content: space-evenly;
    }

    button:hover{
      background-color: rgb(192, 57, 43);
    }
    /******************************************
    /* ADDITIONAL STYLES
    /*******************************************/

    ```
  - F1 API Discord bot
    - https://github.com/jnhthomp/f1-discord-bot
  
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
Do: Make a rotating list of drinks (an automatic carousel) from the cocktailDB
Do: Make the NASA API handle all the data types including video
Do: Add an API to your portfolio website  

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