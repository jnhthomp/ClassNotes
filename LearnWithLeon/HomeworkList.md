# Due: 3/8
Watch: Fuck You Pay Me
Do: Setup Your Portfolio
Do: Setup Your Proposal & Contract
Do: Pick A Vertical and Start Reaching Out

___
# Due Mar. 15th):
COMPLETE - https://www.poetryfoundation.org/poems/51642/invictus
COMPLETE - https://github.com/bpesquet/thejsway (3, 2, 1... Code! through Write Functions)
  - 3, 2, 1... Code!
    ```js
    // Presentation
    // Write a program that displays your name and age.
    console.log('Jonah', 27);
    // Minimalistic calculator
    // Write a program that displays the results of adding, subtracting, multiplying and dividing 6 by 3.
    console.log(6+3, 6-3, 6*3, 6/3);
    // Values prediction
    // Observe the following program and try to predict the values it displays.
    console.log(4 + 5); //=>9
    console.log("4 + 5"); // =>'4 + 5'
    console.log("4" + "5"); // => '45'
    // Check your prediction by executing it.
    ```
  - Play with Variables
    ```js
    // Improved hello
    // Write a program that asks the user for his first name and his last name. 
    // The program then displays them in one sentence.
    let name = prompt('First Name:') + ' '
    name += prompt('Last Name:');
    console.log(name)

    // Final values
    // Observe the following program and 
    // try to predict the final values of its variables.
    let a = 2; // a = 2
    a -= 1; // a = 1
    a++; // a = 2
    let b = 8; // b = 8
    b += 2; // b = 10
    const c = a + b * b; // c = 2 + (10 * 10) = 102
    const d = a * b + b; // d = 2 * 10 + 10 = 30
    const e = a * (b + b); // e = 2 * (10 + 10) = 40
    const f = a * b / a; // f = 2 * 10 / 2 = 10
    const g = b / a * a; // g = 10 / 2 * 2 = 10
    console.log(a, b, c, d, e, f, g); //=> 2 10 102 30 40 10 10
    // Check your prediction by executing it.

    // VAT calculation
    // Write a program that asks the user for a raw price. 
    // After that, it calculates the corresponding final price using a VAT rate of 20.6%.
    let price = Number(prompt(`Give Price`));
    console.log((price * .206) + price)

    // From Celsius to Fahrenheit degrees
    // Write a program that asks for a temperature in Celsius degrees, 
    // then displays it in Fahrenheit degrees.

    // The conversion between scales is given by the formula: 
    //  [°F] = [°C] x 9/5 + 32.

    let temp = Number(prompt('Give Temp (in celsius)'));
    console.log(temp * (9/5) + 32)

    // Variable swapping
    // Observe the following program:
    let number1 = 5;
    let number2 = 3;

    // TODO: type your code here (and nowhere else!)
    let holder = number1 // n1:5 n2:3 h:5
    number1 = number2 // n1:3 n2:3 h:5
    number2 = holder // n1:3 n2:5 h

    console.log(number1); // Should show 3
    console.log(number2); // Should show 5
    // Add the necessary code to swap the values of variables number1 and number2.
    // T> This exercise has several valid solutions. You may use more than two variables to solve it.
    ```
  - Add conditions
    ```js
    // Here are a few pieces of advice about these exercises:
    //  - Keep on choosing your variable names wisely, and 
    //      respect indentation when creating code blocks associated to if, else and switch statements.
    //  - Try to find alternative solutions. 
    //      For example, one using an if and another using a switch.
    //  - Test your programs thoroughly, without fear of finding mistakes. 
    //      It's a very important skill.

    // Following day
    // Write a program that accepts a day name from the user, 
    // then shows the name of the following day. 
    // Incorrect inputs must be taken into account.
    let day = prompt('Give DotW');
    const weekArr = ['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY'];
    dayIndex = weekArr.indexOf(day.toUpperCase());
    console.log(dayIndex)
    if (dayIndex === -1) {
      console.log('not a day')
    } else {
      console.log(weekArr[dayIndex + 1]);
    }

    // Number comparison
    // Write a program that accepts two numbers, 
    // then compares their values and displays an appropriate message in all cases.
    let num1 = Number(prompt('Give num1'));
    let num2 = Number(prompt('Give num2'));

    if (num1 > num2) {
      console.log(`num1 bigger`)
    } else if (num1 < num2) {
      console.log(`num2 bigger`)
    } else {
      console.log(`nums same`)
    }

    // Final values
    // Take a look at the following program.

    let nb1 = Number(prompt("Enter nb1:"));
    let nb2 = Number(prompt("Enter nb2:"));
    let nb3 = Number(prompt("Enter nb3:"));

    if (nb1 > nb2) {
      nb1 = nb3 * 2;
    } else {
      nb1++;
      if (nb2 > nb3) {
        nb1 += nb3 * 3;
      } else {
        nb1 = 0;
        nb3 = nb3 * 2 + nb2;
      }
    }
    console.log(nb1, nb2, nb3);
    // Before executing it, 
    // try to guess the final values of variables nb1, nb2 and nb3 depending on their initial values. 
    // Complete the following table.
    // Check your predictions by executing the program.

    // Initial values     | nb1 final val |	nb2 final val |	nb3 final val |
    // nb1=nb2=nb3=4			| 0             | 4             | 12            |
    // nb1=4,nb2=3,nb3=2  |	4             | 3	            | 2             |	
    // nb1=2,nb2=4,nb3=0  |	3             | 4             | 0             |
    
    // Number of days in a month
    // Write a program that accepts a month number (between 1 and 12), 
    // then shows the number of days of that month. 
    // Leap years are excluded. Incorrect inputs must be taken into account.
    let month = Number(prompt('Give month as num'));

    if(((month <= 7) && (month % 2 !== 0)) || (month > 7) && (month % 2 === 0)){
      console.log('31 days')
    } else if (month === 2){
      console.log('28 days')
    } else {
      console.log('30 days')
    }
    // Following second
    // Write a program that asks for a time under the form of three information (hours, minutes, seconds). 
    // The program calculates and shows the time one second after. 
    // Incorrect inputs must be taken into account.

    // This is not as simple as it seems... Look at the following results to see for yourself:

    // 14h17m59s => 14h18m0s
    // 6h59m59s => 7h0m0s
    // 23h59m59s => 0h0m0s (midnight)
    let h = Number(prompt('Give hours...'));
    let m = Number(prompt('Give minutes...'));
    let s = Number(prompt('Give seconds...'));

    if(h >= 24 || m >= 60 || s >= 60){
      console.log('not a valid time')
    } else {
      s++
      if(s === 60){
        m++
        s = 0
      }
      if(m === 60){
        h++
        m = 0
      }
      if(h===24){
        h = 0
      }
      console.log(`${h}h${m}m${s}s`)
    }
    ```
  - Repeat statements
    ```js
    // Try to code each exercise twice, once with a while loop and the other with a for, to see for yourself which one is the most appropriate.

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
  - Write Functions
    ```js
    // Improved hello
    // Complete the following program so that it asks the user for his first and last names, 
    // then show the result of the sayHello() function.

    // Say hello to the user
    function sayHello(firstName, lastName) {
      const message = `Hello, ${firstName} ${lastName}!`;
      return message;
    }

    // TODO: ask user for first and last name
    let firstName = prompt('Give first');
    let lastName = prompt('Give last');
    // TODO: call sayHello() and show its result
    console.log(sayHello(firstName, lastName));
    


    // Number squaring
    // Complete the following program so that the square1() and square2() functions work properly.

    // Square the given number x
    function square1(x) {
      // TODO: complete the function code
      return x * x
    }

    // Square the given number x
    const square2 = x => x * x// TODO: complete the function code

    //console.log(square1(0)); // Must show 0
    //console.log(square1(2)); // Must show 4
    //console.log(square1(5)); // Must show 25

    //console.log(square2(0)); // Must show 0
    //console.log(square2(2)); // Must show 4
    //console.log(square2(5)); // Must show 25
    
    // When it's done, update the program so that it shows the square of every number between 0 and 10.
    // Writing 10 dumb calls to square() is forbidden! You know how to repeat statements, don't you? ;)
    for(let i = 0; i <= 10; i++){
      console.log(square1(i));
      console.log(square2(i));
    }

    // Minimum of two numbers
    // Let's pretend the JavaScript Math.min() function doesn't exist. 
    // Complete the following program so that the min() function returns the minimum of its two received numbers.

    // TODO: write the min() function
    const min = (num1, num2) => {
      if (num1 <= num2){
        return num1;
      } else {
        return num2
      }
    }

    console.log(min(4.5, 5)); // Must show 4.5
    console.log(min(19, 9));  // Must show 9
    console.log(min(1, 1));   // Must show 1

    // Calculator
    // Complete the following program so that it offers the four basic arithmetical operations:
    //  addition, subtraction, multiplication and division. 
    // You can use either a function declaration or a function expression.

    // TODO: complete program
    const calc = (num1, symbol, num2) => {
      if(symbol === '+'){
        return num1 + num2;
      } else if (symbol === '-'){
        return num1 - num2;
      } else if (symbol === '*'){
        return num1 * num2;
      } else if (symbol === '/'){
        return num1 / num2;
      } else {
        return 'invalid symbol';
      }
    }

    console.log(calculate(4, "+", 6));  // Must show 10
    console.log(calculate(4, "-", 6));  // Must show -2
    console.log(calculate(2, "*", 0));  // Must show 0
    console.log(calculate(12, "/", 0)); // Must show Infinity



    // Circumference and area of a circle
    // Write a program containing two functions to calculate the circumference and area of a circle defined by its radius. 
    // Test it using user input.
    // Here are some tips for solving this exercise:  
    //  Circumference and area calculation formulas should be part of your secondary school memories... Or a Google click away :)
    //  The value of number π (Pi) is obtained with Math.PI in JavaScript.
    //  You might want to use the exponentiation operator ** to perform computations.
    // console.log(2 ** 3); // 8: 2 * 2 * 2
    // console.log(3 ** 2); // 9: 3 * 3

    const findCirc = (r) => {
      return 2 * Math.PI * r
    }

    const findArea = (r) => {
      return Math.PI * r ** 2
    }

    console.log(findCirc(8)); // => 50.26548245743669
    console.log(findArea(8)); // => 201.06192982974676
    ```
COMPLETE - http://eloquentjavascript.net/3rd_edition/ (Chapters 1 - 3)
  - Chapter 2
  ```js
  // Looping a triangle
  // Write a loop that makes seven calls to console.log to output the following triangle:

  // #
  // ##
  // ###
  // ####
  // #####
  // ######
  // #######
  // It may be useful to know that you can find the length of a string by writing .length after it.
  let abc = "abc";
  console.log(abc.length); // → 3
  // Most exercises contain a piece of code that you can modify to solve the exercise. 
  // Remember that you can click code blocks to edit them.
  // Your code here.
  let tri = '🎉'
  for(let i = 1; i <= 7; i++){
    console.log(tri)
    tri = tri + '🎉'
  }



  // FizzBuzz
  // Write a program that uses console.log to print all the numbers from 1 to 100, with two exceptions. 
  //  For numbers divisible by 3, print "Fizz" instead of the number, and 
  //  for numbers divisible by 5 (and not 3), print "Buzz" instead.

  // When you have that working, modify your program to print "FizzBuzz" for numbers that are divisible by both 3 and 5 
  // (and still print "Fizz" or "Buzz" for numbers divisible by only one of those).

  // (This is actually an interview question that has been claimed to weed out a significant percentage of programmer candidates. 
  //  So if you solved it, your labor market value just went up.)
  
  // Your code here.
  for(let i = 1; i <= 100; i++){
    if(i % 3 === 0 && i % 5 === 0){
      console.log(`${i}: FizzBuzz`)
    }
    else if(i % 3 === 0){
      console.log(`${i}: Fizz`);
    } else if(i % 5 === 0){
      console.log(`${i}: Buzz`);
    } else {
      console.log(i);
    }
  }



  // Chessboard
  // Write a program that creates a string that represents an 8×8 grid, 
  // using newline characters to separate lines. 
  // At each position of the grid there is either a space or a "#" character. 
  // The characters should form a chessboard.
  // Passing this string to console.log should show something like this:
  
  //  # # # #
  // # # # # 
  //  # # # #
  // # # # # 
  //  # # # #
  // # # # # 
  //  # # # #
  // # # # #

  // When you have a program that generates this pattern, 
  // define a binding size = 8 and change the program so that it works for any size, 
  // outputting a grid of the given width and height.

  // Your code here.
  let size = 8
  let str = ''
  for (let i = 1; i <= size; i++) {
    if (i % 2 !== 0) {
      for (let j = 1; j <= size; j++) {
        if (j % 2 !== 0) {
          str += ' ';
        } else {
          str += '#';
        }
      }
      str += '\n';
    } else {
      for (let j = 1; j <= size; j++) {
        if (j % 2 === 0) {
          str += ' ';
        } else {
          str += '#';
        }
      }
      str += '\n';
    }
  }
  console.log(str)
  ```
  - Chapter 3
  ```js
  // Minimum
  // The previous chapter introduced the standard function Math.min that returns its smallest argument. 
  // We can build something like that now. 
  // Write a function min that takes two arguments and returns their minimum.

  // Your code here.
  const min = (a, b) => {
    if(a <= b){
      return a;
    } else {
      return b;
    }
  }

  console.log(min(0, 10));
  // → 0
  console.log(min(0, -10));
  // → -10



  // Recursion
  // We’ve seen that % (the remainder operator) can be used to test whether a number is even or odd 
  // by using % 2 to see whether it’s divisible by two. 
  // Here’s another way to define whether a positive whole number is even or odd:
  //  - Zero is even.
  //  - One is odd.
  //  - For any other number N, its evenness is the same as N - 2.
  
  // Define a recursive function isEven corresponding to this description. 
  // The function should accept a single parameter (a positive, whole number) and return a Boolean.

  // Test it on 50 and 75. See how it behaves on -1. Why? Can you think of a way to fix this?

  // Your code here.
  const isEven = (a) => {
    if (a === 0) {
      return true;
    } else if (a === 1) {
      return false;
    } else if (a > 0) {
      return isEven(a - 2)
    } else if (a < 0) {
      return isEven(a + 2)
    }
  }

  console.log(isEven(50));
  // → true
  console.log(isEven(75));
  // → false
  console.log(isEven(-1));
  // → false


  // Bean counting
  // You can get the Nth character, or letter, from a string by writing "string"[N]. 
  // The returned value will be a string containing only one character (for example, "b"). 
  // The first character has position 0, which causes the last one to be found at position string.length - 1. 
  // In other words, a two-character string has length 2, and its characters have positions 0 and 1.

  // Write a function countBs that takes a string as its only argument 
  //  and returns a number that indicates how many uppercase “B” characters there are in the string.

  // Next, write a function called countChar that behaves like countBs, 
  // except it takes a second argument that indicates the character that is to be counted 
  // (rather than counting only uppercase “B” characters). 
  // Rewrite countBs to make use of this new function.

  // Your code here.
  const countBs = (str) => {
    return countChar(str, 'B');
  }

  const countChar = (str, letter) => {
    let letterCount = 0;
    for(let i = 0; i <= (str.length -1); i++){
      if(str[i] === letter){
        letterCount++;
      }
    }
    return letterCount;
  }

  console.log(countBs("BBC"));
  // → 2
  console.log(countChar("kakkerlak", "k"));
  // → 4
  ```
COMPLETE - https://www.codecademy.com/learn/introduction-to-javascript (1-6)
COMPLETE - https://youtu.be/SWYqp7iY_Tc
COMPLETE Extra Reading: https://jwiegley.github.io/git-from-the-bottom-up/
COMPLETE Don't Do - Play yo self - start early even though you have more than a week because this is a lot and very important