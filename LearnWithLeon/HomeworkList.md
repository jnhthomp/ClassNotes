Due 2/22:
- COMPLETE: Plan out your networking!
  - Use Meetup to find at least 1 or 2 events to attend
- COMPLETE: https://javascript.info/variables + Tasks
  - Add answsers to tasks below to turn in
  1. 
      ```js
      // 1. Declare two variables: admin and name.
      let admin;
      let name;
      // 2. Assign the value "John" to name.
      name = "John";
      // 3. Copy the value from name to admin.
      admin = name;
      // 4. Show the value of admin using alert (must output “John”).
      alert(admin);
      ```
  2. 
      ```js
      // 1. Create a variable with the name of our planet. How would you name such a variable?
      let ourPlanet = "Earth";
      // 2. Create a variable to store the name of a current visitor to a website. How would you name that variable?
      let currentVisitor = "Leon";
      ```
  3. 
      ```js
      // Examine the following code:
      const birthday = '18.04.1982';
      const age = someCode(birthday);
      // Here we have a constant birthday date and 
      //  the age is calculated from birthday with the help of some code 
      //  (it is not provided for shortness, and because details don’t matter here).
      // Would it be right to use upper case for birthday? For age? Or even for both?
      
      //const BIRTHDAY = '18.04.1982'; // make uppercase?
      //const AGE = someCode(BIRTHDAY); // make uppercase?
      
      // A: Birthday can be uppercase if it is known before (if it is collected from the user then it should be lowercase)
      //    age is calculated so is not know before and should not be uppercase
      ```
- COMPLETE: https://javascript.info/function-basics + Tasks
  - Add answers to tasks below to turn in
  1. 
      ```js
      // The following function returns true if the parameter age is greater than 18.
      //Otherwise it asks for a confirmation and returns its result:
      function checkAge(age) {
        if (age > 18) {
          return true;
        } else {
          // ...
          return confirm('Did parents allow you?');
        }
      }

      // Will the function work differently if else is removed?
      function checkAge(age) {
        if (age > 18) {
          return true;
        }
        // ...
        return confirm('Did parents allow you?');
      }
      // Is there any difference in the behavior of these two variants?
      
      // A: No these two variants behave the same because in both cases the 'if' statement is not true
      //    In the case that else is provided it will be hit but if not the function will move to the next executable line
      //    Since both the 'else' block and next executable line are the same it is the same result
      ```
  2. 
      ```js
      // The following function returns true if the parameter age is greater than 18.
      //  Otherwise it asks for a confirmation and returns its result.
      function checkAge(age) {
        if (age > 18) {
          return true;
        } else {
          return confirm('Did parents allow you?');
        }
      }

      // Rewrite it, to perform the same, but without if, in a single line.
      // Make two variants of checkAge:
      //  1. Using a question mark operator (?)
      age > 18 ? true : confirm('Did parents allow you?');
      //  2. Using OR (||)
      age  = (age > 18) || confirm('Did parents allow you?')
      ```
  3. 
      ```js
      // Write a function min(a,b) which returns the least of two numbers a and b.
      const min = (a, b) => {
        return  a < b ? a : b;
      }
      // Test Cases:
      min(2, 5) //=> 2
      min(3, -1) //=> -1
      min(1, 1) //=> 1
      ```
  4. 
      ```js
      // Write a function pow(x,n) that returns x in power n. Or, in other words, multiplies x by itself n times and returns the result.
      const pow = (x, n) => {
        let ogX = x;
        for (i = 2; i <= n; i++) {
          x = x * ogX;
        }
        return x;
      }

      // Test cases
      console.log(pow(3, 2)) //= 3 * 3 = 9
      console.log(pow(3, 3)) //= 3 * 3 * 3 = 27
      console.log(pow(1, 100))// = 1 * 1 * ...* 1 = 1
      // Create a web-page that prompts for x and n, and then shows the result of pow(x,n).
      // * Import this ENTIRE js snippet to any index.html
      let x = prompt('Enter an x value', 3);
      let n = prompt('Enter an n value', 6)

      alert(pow(x,n));
      // Run the demo
      // P.S. In this task the function should support only natural values of n: integers up from 1.
      ```
___
Due 2/29:
- COMPLETE: https://javascript.info/function-expressions
  - No tasks listed
- COMPLETE: https://javascript.info/arrow-functions-basics + Tasks
  -   ```js
      // replace function expressions with arrow functions below
      function ask(question, yes, no) {
        if (confirm(question)) yes();
        else no();
      }

      ask(
        "Do you agree?",
        // function() { alert("You agreed."); },
        () => {alert("You agreed.")},
        // function() { alert("You canceled the execution."); }
        () => {alert("You canceled the execution")}
      );
      ```
- COMPLETE: https://github.com/thejsway/thejsway/blob/master/manuscript/chapter04.md
  - Try each excercise twice, once with a `while` loop and another with a `for` loop
    ```js
    // Carousel
    //  Write a program that launches a carousel for 10 turns, showing the turn number each time.
    
    // for version
    for(let i = 1; i <= 10; i++){
      console.log(`Now on turn ${i}`)
    }

    // while version
    let i = 1;
    while(i <= 10){
      console.log(`Now on turn ${i}`)
      i++;
    }

    //  When it's done, improve it so that the number of turns is given by the user.

    // for version
    let n = prompt('Enter the number of turns');
    for(let i = 1; i <= n; i++) {console.log(`Now on turn ${i}`)}

    // while version
    let n = prompt('Enter the number of turns');
    let i = 1
    while(i <= n){
      console.log(`Now on turn ${i}`);
      i++;
    }
    ```
    ```js
    // Parity
    //  Check the following program that shows even numbers (divisible by 2) between 1 and 10.

    for (let i = 1; i <= 10; i++) {
      if (i % 2 === 0) {
        console.log(`${i} is even`);
      }
    }

    // This program uses the modulo operator %, which calculates the remainder after division of one number by another. It's often used to assess number parity.

    console.log(10 % 2); // 0 because 10 = 5 * 2 + 0
    console.log(11 % 2); // 1 because 11 = 5 * 2 + 1
    console.log(18 % 3); // 0 because 18 = 3 * 6 + 0
    console.log(19 % 3); // 1 because 19 = 3 * 6 + 1
    console.log(20 % 3); // 2 because 20 = 3 * 6 + 2

    // Improve the program so that it also shows odd numbers. 
    // for version
    for (let i = 1; i <= 10; i++) {
      if(i % 2 === 0) {
        console.log(`${i} is even`)
      }
      console.log(`${i} is odd`)
    })
    // while version
    let whileI = 1;
    while(whileI <= 10){
      if(whileI % 2 === 0){
        console.log(`${whileI} is even`)
      } else {
        console.log(`${whileI} is odd`)
      }
      whileI++
    }
    // Improve it again to replace the initial number 1 by a number given by the user.
    // This program must show exactly 10 numbers including the first one, not 11 numbers!\
    // For version
    let i = +prompt('Starting Num');
    let n = i + 9;
    for (i; i <= n; i++){
      if(i % 2 === 0){
        console.log(`${i} is even`)
      } else {
        console.log(`${i} is odd`)
      }
    }

    // while version
    let i = +prompt('Starting Num');
    let n = i + 9;
    while (i <= n) {
      if(i % 2 === 0){
        console.log(`${i} is even`)
      } else {
        console.log(`${i} is odd`)
      }
      i++;
    }
    ```
    ```js
    // Input validation
    //  Write a program that continues to ask the user for a number until the entered number is less than or equal to 100.
    // for version
    for(let i = 101; i >= 100; i){
      i = +prompt('Enter a num');
    }

    // while version
    let i
    while(!i || i >= 100){
      i = +prompt('Enter a num');
    }

    //  When you are done with the above, improve the program so that the terminating number is between 50 and 100.
    // for version
    for(let i = 101; (50 >= i)||(i >= 100); i){
      i = +prompt('Enter a num');
    }
    
    // while version
    let i
    while(!i || i >= 100 || i <= 50){
      i = +prompt('Enter a num');
    }
    ```
    ```js
    // Multiplication table
    //  Write a program that asks the user for a number, then shows the multiplication table for this number.
    // for version
    let num = +prompt('Enter num');
    for(let i = 0; i <= 10; i++){
      console.log(num * i);
    }

    let num = +prompt('Enter num');
    let i = 0
    //  When you are done, improve the program so it only accepts numbers between 2 and 9 (use the previous exercise as a blueprint).
    // for version
    for(let num = 1; num <= 2 || num >= 9; num){
      num = +prompt('Enter num between 2 and 9');
      if(num > 2 && num < 9){
        for (let i = 0; i <= 10; i++){
          console.log(num * i)
        }
      }
    }

    // while version
    let num = 1
    while(num <= 2 || num >= 9){
      num = +prompt('Enter num between 2 and 9');
      if(num > 2 && num < 9){
        let i = 0
        while(i <= 10){
          console.log(i * num);
          i++
        }
      }
    }
    ```
    ```js
    // Neither yes nor no
    //  Write a program that plays "neither yes, nor no" with the user. 
    // Specifically, the programs asks the user to enter text until either "yes" or "no" is typed, which ends the game.
    
    // for version
    for(let input = prompt('type something (\'yes\' or \'no\' to quit)').toLowerCase(); 
        input !== 'yes' && input !== 'no';
        input){
      input = prompt('type something (\'yes\' or \'no\' to quit)').toLowerCase()
    }

    // while version
    let input;
    while(input !== 'yes' && input !== 'no'){
      input = prompt('type something (\'yes\' or \'no\' to quit)').toLowerCase()
    }
    ```
    ```js
    // FizzBuzz
    //  Write a program that shows all numbers between 1 and 100 with the following exceptions:
    //  It shows "Fizz" instead if the number is divisible by 3.
    //  It shows "Buzz" instead if the number is divisible by 5 and not by 3.

    // for version
    for(let i = 1; i <= 100; i++){
      if(i % 3 === 0){
        console.log(i, 'fizz')
      } else if(i % 5 === 0 && i % 3 !== 0){
        console.log(i, 'buzz')
      } else {
        console.log (i);
      }
    }

    // while version
    let i = 1;
    while(i <= 100){
      if(i % 3 === 0){
        console.log(i, 'fizz')
      } else if(i % 5 === 0 && i % 3 !== 0){
        console.log(i, 'buzz')
      } else {
        console.log (i);
      }
      i++;
    }

    //  When it's done, improve it so that the program shows "FizzBuzz" instead for numbers divisible both by 3 and by 5.
    // for version
    for(let i = 1; i <= 100; i++){
      if(i % 3 === 0 && i % 5 !== 0){
        console.log(i, 'Fizz')
      } else if(i % 5 === 0 && i % 3 !== 0){
        console.log(i, 'Buzz')
      } else if(i % 3 === 0 && i % 5 ===0){
        console.log(i, 'FizzBuzz');
      } else {
        console.log(i);
      }
    }

    // while version
    let i = 1
    while(i <= 100){
      if(i % 3 === 0 && i % 5 !== 0){
        console.log(i, 'Fizz')
      } else if(i % 5 === 0 && i % 3 !== 0){
        console.log(i, 'Buzz')
      } else if(i % 3 === 0 && i % 5 ===0){
        console.log(i, 'FizzBuzz');
      } else {
        console.log(i);
      }
      i++;
    }
    ```
- Do:
  - COMPLETE: angry-parent-simulator (delete and do again)
    ```js
    document.getElementById('yell').addEventListener('click', yell)

    function yell() {
      // Collect inputs
      const firstName = document.getElementById('firstName').value;
      const firstMiddle = document.getElementById('firstMiddle').value;
      const lastMiddle = document.getElementById('lastMiddle').value;
      const lastName = document.getElementById('lastName').value;

      document.getElementById('placeToYell').innerText = `${firstName} ${firstMiddle} ${lastMiddle} ${lastName}`;
    }
    ```
  - COMPLETE: bachelor-code (delete and do again)
    ```js
    // Open the first one first and view the page
    // There are three contestants on the page
    // The goal is to make it so that when you click on 'final rose' claire and sharlene go away and only nicky remains
    // Edit this so that this happens
    document.getElementById('finalRose').addEventListener('click', rose);

    function rose() {
      document.getElementById('claire').style.display = 'none'
      document.getElementById('sharleen').style.display = 'none'
    }
    ```
    ```js
    // Now for the second folder this page lists three names
    // We have the choice over who the next bachelorette should have been

    // We need to plug in the actions we want to person to show up 
    // when their name is clicked


    const andi = document.getElementById('andi');
    const claire = document.getElementById('claire');
    const sharleen = document.getElementById('sharleen');

    document.getElementById('andiNext').addEventListener('click', andiNext);
    document.getElementById('claireNext').addEventListener('click', claireNext);
    document.getElementById('sharleenNext').addEventListener('click', sharleenNext);

    function andiNext() {
      // hide claire and sharleen
      claire.classList.add('hidden');
      sharleen.classList.add('hidden');
      // show andi
      andi.classList.toggle('hidden');
    }

    function claireNext() {
      // hide andi and sharleen
      andi.classList.add('hidden');
      sharleen.classList.add('hidden');

      // show claire
      claire.classList.toggle('hidden');
    }
    function sharleenNext() {
      // hide andi and claire
      andi.classList.add('hidden');
      claire.classList.add('hidden');
      // show sharleen
      sharleen.classList.toggle('hidden');
    }
    ```
    ```js
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
    ```
  - COMPLETE: temperature-converter (delete and do again)
    ```js
    // When form is submitted (Enter or button click)
    // Find the input in the dom and retrieve a value from it
    // Convert that number from celsius to fahrenheit
    // target an element and provide it the calculated value

    document.querySelector('form').addEventListener('submit', convert);

    function convert(event) {
      event.preventDefault();
      document.getElementById('putValueHere').innerText = +document.getElementById('valueInput').value * 1.8 + 32;
    }
    ```
  - COMPLETE: simple-functions (follow instructions)
    ```js
    //create a function that adds two numbers and alerts the sum
    function add(i, n){
      alert(i + n)
    }

    add(1, 2) // => 3
    add(5, 6) // => 11
    add(4,-12) // => -8
    //create a function that multiplys three numbers and console logs the product
    function mult(i, n, j){
      console.log((i * n) * j);
    }

    mult(1, 2, 3) // => 6
    mult(5, 6, 7) // => 210
    mult(4, -12, 20) // => -960

    //create a function that divides two numbers and returns the ???
    function div(i, n){
      return i / n;
    }

    function rem(i, n){
      return i % n;
    }

    console.log(div(6, 2)) // =>3
    console.log(div(8, 2)) // =>4
    console.log(div(10, 2)) // =>5

    console.log(rem(6, 2)) // =>0
    console.log(rem(9, 2)) // =>1
    console.log(rem(14, 3)) // =>2
    ```
  - COMPLETE: bring it home (follow instructions)
    ```js
    // *Variables*
    // Create a variable and console log the value
    let i;
    console.log(i); //=> undefined

    // Create a variable, add 10 to it, and alert the value
    let n = 10;
    n = n + 10;
    alert(n); // => 20

    // *Functions*
    // Create a function that subtracts 4 numbers and alerts the difference
    function sub(a, b, c, d){
      alert(a - b - c - d);
    }

    sub(100, 10, 20, 30) // => 40

    // Create a function that divides one number by another and returns the remainder
    function rem(e, f){
      return e % f
    }
    console.log(rem(5, 2)) // => 1

    // *Conditionals*
    // Create a function that adds two numbers and if the sum is greater than 50 alert Jumanji
    function jumanji(a, b){
      if(a + b > 50){
        alert('Jumanji');
      }
    }
    jumanji(26, 25) // => Jumaji alert
    jumanji(24, 25) // => No alert

    // Create a function that multiplys three numbers and if the product is divisible by 3 alert ZEBRA
    function mult(a, b ,c){
      if((a * b * c) % 3 === 0){
        alert('ZEBRA');
      }
    }

    mult(3, 5, 2) // => ZEBRA alert
    mult(2, 2, 2) // No alert
    ```

Due: 3/8
Watch: Fuck You Pay Me
Do: Setup Your Portfolio
Do: Setup Your Proposal & Contract
Do: Pick A Vertical and Start Reaching Out