# Due 3/31 
COMPLETE: https://youtu.be/PFmuCDHHpwk
```js

// Object Literal
// const circle = {
//   // Properties (set values)
//   radius: 1,
//   location: {
//     x: 1,
//     y: 1
//   },
//   // Method (define logic)
//   draw: function(){
//     console.log('circle.draw() called')
//   }
// };
//
// circle.draw(); //=> 'circle.draw() called'

// Factory function
// function createCircle(radius){
//     return {
//       radius, // same as radius: radius,
//       draw: function(){
//         console.log('createCircle.draw() called')
//       }
//     }
//   }
  
  // const circle = createCircle(1);
  // circle.draw(); //=> createCircle.draw() called
  
  // Constructor function
//   function Circle(radius){
//     this.radius = radius;
//     this.draw = function(){
//       console.log('Circle.draw() called')
//     }
//   }
  
//   // New operator creates an empty object
//   // Then sets '.this' to point to the created object
//   const anotherCircle = new Circle(1);
//   // anotherCircle.draw() //=> 'Circle.draw() called'
  
//   // (Re-)add location to existing object
//   anotherCircle.location = {x: 1, y: 1} // same as anotherCircle['location'] = {..}
//   // Can also be used for names not valid in js 
//   //  ex: anotherCircle['center-location'] (valid)
//   //    vs anotherCirlce.center-location (invalid) 
//   // console.log(anotherCircle);
  
//   // Remove location key and value
//   delete anotherCircle.location
  
  
//   // Loop over the properties of an object
//  for(let key in anotherCircle){
//   // Only do output property keys (not methods/functions)
//    if(typeof anotherCircle[key] !== 'function'){
//       // output each key and value of anotherCircle 
//       console.log(key, anotherCircle[key])
//     }
//   }

// // Another way of getting keys from an object
// const keys = Object.keys(anotherCircle)
// console.log(keys)

// // Check for a specific key:
// if('radius' in anotherCircle){
//   console.log('anotherCircle has a radius')
// }

// Now what if we add a couple other methods/values?
// Doing it this way make these methods available to the client/consumer which may not be good
function Circle(radius) {
  this.radius = radius;
    
  // setting defaultLocation like this exposes it to outside of this function
  // this.defaultLocation = {x: 0, y: 0};
  
  // Instead set it like this:
  let defaultLocation = {x: 0, y: 0}

  // We can create a private method as well
  let computeOptimumLocation = function(){
    //do stuff...
  }

  this.draw = function(){
    // access private method in object's public method
    computeOptimumLocation()
    // can also access private properties
    // defaultLocation

    // Access the created objects properties (INDIVIDUAL OBJECT NOT CONSTRUCTOR)
    // this.radius
    console.log('draw')
  }

  this.getDefaultLocation = function(){
    return defaultLocation //=> {x:0, y:0}
  }

  // We can create properties that are accessible from the outside
  Object.defineProperty(this, 'defaultLocation', {
    // This creates a function that will return the value but keeps the value from being tampered with
    get: function(){
      return defaultLocation
    },
    // We can create one that will set the value if we want
    // Because this is a function we can perform validation on the value instead of accepting it blindly
    set: function(value){
      // ...validate value
      if(!value.x || !value.y){
        throw new Error('Invalid Location')
      }
      defaultLocation = value;
    }
  })

}

// You cannot access private properties from outside the constructor
let circle = new Circle(1)
console.log(circle.defaultLocation) //=> undefined

// You can set a method that returns private properties though
console.log(circle.getDefaultLocation()); //=> {x:0, y:0}

// But what if we didn't want to access the property as a method?
// We want to access it as a property instead so we can set it from the outside
circle.defaultLocation = 1 // throws error because 1 is not an object w/ x and y keys

// Now design a stopwatch object
// Should have following properties/methods:
//  - duration (prop)
//  - reset (method)
//  - start (method)
//  - stop (method)

// Initially duration is 0
// Start can only be called once in a row
// Same with stop (can only be called once in a row)
// Access duration property to output the time
// Can be restarted to continue duration counter
// Can be reset so duration goes back to 0


function Stopwatch() {
  let duration = 0
  let running = false;
  let startTime;
  let endTime

  // duration prop 
  // (retrievable, not directly editable from outside constructor)
  Object.defineProperty(this, 'duration', {
    get: function(){
      return duration
    }
  })
  
  // reset all values to initial values
  this.reset = function() {
    duration = 0;
    running = false;
    startTime = null;
    endTime = null;
  }

  // Start method
  // Creates new date object when executed (at current time)
  // Can not run if timer is already running
  this.start = function() {
    if(running){
      throw new Error('Already running...');
    }

    running = true;
    startTime = new Date();
  }

  // Stop method 
  // Creates new date object when executed (at current time)
  // Compares to startTime and updates duration with difference
  this.stop = function() {
    if(!running){
      throw new Error('No stopwatch running...');
    }

    running = false;
    endTime = new Date()
    duration += ((endTime.getTime() - startTime.getTime()) / 1000).toFixed(2)
  }

}
```
COMPLETE https://youtu.be/0fKg7e37bQE​
COMPLETE: https://aka.ms/learnwithleon (Intro. To Github)
  - https://github.com/jnhthomp/github-slideshow

## Bonus 3/31:
COMPLETE: https://javascript.info/ Whole Chapter - Objects: the basics 
  - 4.1: Objects
    - ```js
      // Hello, object
      // importance: 5
      // Write the code, one line for each action:

      // Create an empty object user.
      const user = {};
      // Add the property name with the value John.
      user.name = 'John';
      // Add the property surname with the value Smith.
      user.surname = 'Smith';
      // Change the value of the name to Pete.
      user.name = 'Pete';
      // Remove the property name from the object.
      delete user.name;



      //_______________
      // Check for emptiness
      // importance: 5
      // Write the function isEmpty(obj) 
      // which returns 
      // true if the object has no properties, 
      // false otherwise.

      // Should work like that:
      let schedule = {};

      alert(isEmpty(schedule)); // true

      schedule["8:30"] = "get up";

      alert(isEmpty(schedule)); // false

      function isEmpty(obj) {
        return Object.keys(obj).length > 0 ? true : false
      }



      //_______________
      // Sum object properties
      // importance: 5
      // We have an object storing salaries of our team:
      let salaries = {
        John: 100,
        Ann: 160,
        Pete: 130
      }

      // Write the code to sum all salaries 
      // and store in the variable sum.
      // Should be 390 in the example above.
      // If salaries is empty, then the result must be 0.
      let sum = 0;
      for(let key in salaries){
        sum += salaries[key]
      }
      console.log(sum);



      //_______________
      // Multiply numeric property values by 2
      // importance: 3
      // Create a function multiplyNumeric(obj) 
      // that multiplies all numeric property values of obj by 2.

      // For instance:
      // before the call
      let menu = {
        width: 200,
        height: 300,
        title: "My menu"
      };

      multiplyNumeric(menu);

      // after the call =>
        // menu = {
        //   width: 400,
        //   height: 600,
        //   title: "My menu"
        // };
      // Please note that multiplyNumeric does not need to return anything.
      // It should modify the object in -place.

      // P.S.Use typeof to check for a number here.

      function multiplyNumeric(obj) {
        for(let key in obj){
          if(typeof obj[key] === 'number'){
            obj[key] *= 2
          }
        }
      }

      console.log(menu);



      //_______________

      ```
  - 4.2: Object references and copying
    - no tasks
  - 4.3: Garbage collection
    - no tasks
  - 4.4: Object methods, "this"
    - ```js
      // Using "this" in object literal
      // importance: 5
      // Here the function makeUser() returns an object.
      // What is the result of accessing its ref ? Why ?
        function makeUser() {
          return {
            name: "John",
            ref: this
          };
        }

      let user = makeUser();

      alert(user.ref.name); // What's the result?
      // Undefined because 'this' is assigned within an object 
      // whose parent does not have any keys



      //_______________
      // Create a calculator
      // importance: 5
      // Create an object calculator with three methods:
      //
      // read() prompts for two values and saves them as object properties.
      // sum() returns the sum of saved values.
      // mul() multiplies saved values and returns the result.

      let calculator = {
        read(){
          this.val1 = +prompt('Value1');
          this.val2 = +prompt('Value2');
        },

        sum(){
          return this.val1 + this.val2
        },

        mul(){
          return this.val1 * this.val2
        }
      };

      calculator.read();
      alert(calculator.sum());
      alert(calculator.mul());



      //_______________
      // Chaining
      // importance: 2
      // There’s a ladder object that allows to go up and down:

      let ladder = {
        step: 0,
        up() {
          this.step++;
          return this;
        },
        down() {
          this.step--;
          return this;
        },
        showStep: function () { // shows the current step
          alert(this.step);
          return this;
        }
      };

      // Now, if we need to make several calls in sequence, can do it like this:
      ladder.up();
      ladder.up();
      ladder.down();
      ladder.showStep(); // 1
      ladder.down();
      ladder.showStep(); // 0

      // Modify the code of up, down and showStep 
      // to make the calls chainable, like this:

      ladder.up().up().down().showStep().down().showStep(); // shows 1 then 0
      // Such approach is widely used across JavaScript libraries.
      ```
  - 4.5: Constructor, operator "new"
    - ```js
      // Two functions – one object
      // importance: 2
      // Is it possible to create functions A and B 
      // so that new A() == new B() ?

      let obj = {}
      function A() { return obj }
      function B() { return obj }

      let a = new A;
      let b = new B;

      alert(a == b); // true
      // If it is, then provide an example of their code.
      // When returning objects the object is returned in stead of 'this'



      //_______________
      // Create new Calculator
      // importance: 5
      // Create a constructor function Calculator 
      // that creates objects with 3 methods:
      // 
      // read() asks for two values using prompt and remembers them in object properties.
      // sum() returns the sum of these properties.
      // mul() returns the multiplication product of these properties.
      // For instance:
      let calculator = new Calculator();
      calculator.read(); 
      alert("Sum=" + calculator.sum());
      alert("Mul=" + calculator.mul());
      // Run the demo

      function Calculator(){
        this.read = function(){
          this.val1 = +prompt('val1', 0)
          this.val2 = +prompt('val2', 0)
        }

        this.sum = function(){
          return this.val1 + this.val2
        }

        this.mul = function() {
          return this.val1 * this.val2
        }
      }



      //_______________
      // Create new Accumulator
      // importance: 5
      // Create a constructor function Accumulator(startingValue).
      // Object that it creates should:
      // Store the “current value” in the property value.
      // The starting value is set to the argument of the constructor startingValue.
      // The read() method should use prompt to read a new number 
      // and add it to value.
      // In other words, the value property 
      // is the sum of all user - entered values 
      // with the initial value startingValue.

      // Here’s the demo of the code:
      let accumulator = new Accumulator(1); // initial value 1

      accumulator.read(); // adds the user-entered value
      accumulator.read(); // adds the user-entered value

      alert(accumulator.value); // shows the sum of these values
      // Run the demo

      function Accumulator(init) {
        this.value = init;

        this.read = function(){
          this.value += +prompt('increase by:', 1);
        }
      }
      ```
  - 4.6: Optional chaining '?.'
    - no tasks
  - 4.7: Symbol type
    - no tasks
  - 4.8: Object to primitive conversion
    - no tasks

COMPLETE: Pillars of OOP - https://medium.com/@hamzzza.ahmed95/four-pillars-of-object-oriented-programming-oop-e8d7822aa219

Complete and Submit this project: https://github.com/leonnoel/100devs-calculator


Above will most likely not be submitted
___

# Due 4/14
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
  - F1 Data
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
Do: Catch Up
Do: Intro JS Course https://www.codecademy.com/learn/introduction-to-javascript
Do: Professional Checklist https://docs.google.com/document/d/1L2vTX3qvLhoGHeG5cVD2ljCfRGr1uJ_Gf-hNZj9KzTg/edit