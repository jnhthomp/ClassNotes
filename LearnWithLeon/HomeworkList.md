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
- Read: Read: https://javascript.info/function-expressions + Tasks 
- Read: https://javascript.info/arrow-functions-basics + Tasks
- Read:https://github.com/thejsway/thejsway/blob/master/manuscript/chapter04.md
- Do:
  - angry-parent-simulator (delete and do again)
  - bachelor-code (delete and do again)
  - temperature-converter (delete and do again)
  - simple-functions (follow instructions)
  - bring it home (follow instructions)