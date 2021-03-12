# Section 2: Refreshing Next Generation JavaScript (Optional)
____
## 12. Module Introduction
If you know js but haven't used ES6 or next gen js because of the next gen features that react apps usually use
React apps are usually built with the latest gen features
Using latest gen features allows cleaner code




____
## 13. Understanding "let" and "const"
These are two keywords used to create variables

var still works but you are highly encouraged to use let and const

let is like the new var and is used for changing values
const is used for values that will not change

to see how this works consider the following:
```
var myName = 'Max';
console.log(myName);

myName = 'Manu';
console.log(myName);
```
```
=> "Max"
=> "Manu"
```

If we use let instead of var:
```
let myName = 'Max';
console.log(myName);

myName = 'Manu';
console.log(myName);
```
```
=> "Max"
=> "Manu"
```
Nothing changes and it works as expected
But if we use const instead of let:
```
const myName = 'Max';
console.log(myName);

myName = 'Manu';
console.log(myName);
```
```
=> "Max"
=> "error" "TypeError: Assignment to constant variable."
```

This is because we are unable to change the value of a const variable and it must retain its original value



____
## 14. Arrow Functions
Arrow functions are another syntax for creating js functions
Normal js function syntax looks like:
```
function myFnc(){
  ...
}
```

In an arrow function it looks like:
```
const myFnc=()=>{
  ...
}
```
This is used because it solves a lot of issues with the 'this' keyword in js which can be confusing
When you use 'this' inside of an arrow function it will always keep its context

Lets see this in action
Before ES6 we might write a function like this:
```
function printMyName(name){
  console.log(name)
}

printMyName('Max')
```
Now with arrow functions we can write it like this: 
```
const printMyName = (name) => {
  console.log(name);
}
printMyName('Max');

```

If there is exactly 1 argument you can omit the () in the arrow function
You cannot do this if there are 0 arguments or more than 1 argument only if there is 1 argument.

If the method returns a value and it is the only line in the function you can get rid of the curly braces and the return keyword and write the function in 1 line

For example the following code could go from this:
```
const multiply = (number) => {
  return number * 2;
}
```
to this:
```
const multiply = number => number * 2;
```



____
## 15. Exports and Imports
With JS we are always getting data from other files
ES6 uses imports and exports that make that easier

We can have the following files:
```
# person.js #
const person = {
  name: 'Max'
}

export default person
```
```
# utility.js #
export const clean = () => {...}
export const baseData = 10;
```
person.js will export person by default unless otherwise specified (there is nothing else)
utility has multiple methods/values that can be exported
If we get them with the app 
```
app.js
// Name here is up to you since it is the default and only export in the file
// Both are shown as example
import person from './person.js'
import prs from './person.js'

import { baseData } from './utility.js'
import { clean } from './utility.js'
```

Notice that curly braces are used to target specific methods or values in a file

if we choose a default to import then we can name it whatever we want
if it is not a default such as in utility then we have to use the same as defined by the export
you can use the 'as' keyword to rename however
for example:
```
import { clean as wash } from './utility.js'
```
or
```
import * as bundled from './utility.js'
//bundled.clean and bundled.baseData are both available
```

```
Since some of these next gen features won't work in the browser we will use a feature which compiles the site and converts it to current gen js features so we can use next gen without shipping broken code
```
____
## 16. Understanding Classes
Classes are blueprints for js objects a class can have both properties and methods 
properties are like variables attached to classes and methods are like funtions attached to classes
Usage:
```
class Person {
  name = 'Max'
  call = () => {...}
}

const myPerson = new Person()
myPerson.call()
console.log(myPerson.name)
```
Classes also support inheritance

Consider the following
```
class Person {
  constructor() {
    this.name = 'Max';
  }

  printMyName(){
    console.log(this.name)
  }
}

const person = new Person();
person.printMyName(); //=>Max
```
Because of inheritance we can create another class called human where we can set and print a gender and attach it to the Person class so if something is a person is also has access to Human class methods as well

```
class Human {
  constructor(){
    this.gender = 'male';
  }

  printMyGender() {
    console.log(this.gender);
  }
}
class Person extends Human{ //add extends human to give people access to humane methods
  constructor() {
    super(); //Must be included when extending another class which executes the parent constructor
    this.name = 'Max';
    this.gender = 'female'; //Can update gender here no problem
  }

  printMyName(){
    console.log(this.name);
  }
}

const person = new Person();
person.printMyName(); //=>Max
person.printMyGender(); //=>female
```
____
## 17. Classes, Properties, and Methods
There is a proper more modern way to set properties and methods than we did with the constructor function
As a reminder this is the older way
```
#ES6
constructor(){
  this.myProperty = 'value'
}
```

With the newer way we would use:
```
#ES7
myProperty = 'value'
```

For methods it is pretty similar
```
#ES6
myMethod(){...}

#ES7
myMethod = () => {...}
```

Now let's practice using these syntax
To do that we can update the Person/Human classes from the last lesson and update them to use ES7
Here is the code currently:
```
class Human {
  constructor(){
    this.gender = 'male';
  }

  printMyGender() {
    console.log(this.gender);
  }
}
class Person extends Human{ //add extends human to give people access to humane methods
  constructor() {
    super(); //Must be included when extending another class which executes the parent constructor
    this.name = 'Max';
    this.gender = 'female'; //Can update gender here no problem
  }

  printMyName(){
    console.log(this.name);
  }
}

const person = new Person();
person.printMyName(); //=>Max
person.printMyGender(); //=>female
```
To start with our updates we can get rid of the constructor functions and remove the this keyword when assigning variables
Then we can make our methods arrow functions
Because we no longer need the constructor we also no longer need to call the super() method in the Person class

When we are donewith our changes it should look like this:
```
*Note: In order for this to run you will need to select ES6/Babel if using jsbin*
class Human {
  gender = 'male';

  printMyGender = () => {
    console.log(this.gender);
  }
}
class Person extends Human{ //add extends human to give people access to humane methods
  name = 'Max';
  gender = 'female'; //Can update gender here no problem

  printMyName = () => {
    console.log(this.name);
  }
}

const person = new Person();
person.printMyName(); //=>Max
person.printMyGender(); //=>female
```



____
## 18. The Spread and Rest Operator
The spread and rest operator is a new operator available to us they use the same symbol three dots (...)
Whether it is a spread or rest operator depends on where/how it is used 

Spread operator
- Used to split up array elements or object properties
For example if we wanted to create an new array using an old array and add a couple new elements to the end we could use something like:
```
const newArray = [...oldArray, 1, 2]
```
Or if we wanted to create a new object from an old object and add a new property we could use:
```
const newObject = {...oldObject, newProp: 5}
```

Rest operator
- Used to merge a list of function arguments into an array
The below function allows us to submit an unlimited number of arguments and combine them into a single array (named args) then within the function we can manipulate the array that was created
```
function sortArgs(...args) {
  return args.sort
}
```

Now let's play with the spread and rest operators

Here we use the spread operator to take the numbers array and add each element of numbers to newNumbers
Then 4 is added after
```
//Spread operator
const numbers = [1, 2, 3];
const newNumbers = [...numbers, 4]

console.log(newNumbers) //=> [1, 2, 3, 4]

//If spread operator didn't work
const anotherNewNumbers = [numbers, 4]

console.log(anotherNewNumbers) //=>[[1, 2, 3], 4]
```

You can also do the same and use spread for objects
```
const person = {
  name: 'Max';
}

const newPerson = { 
  ...person,
  age: 28
}

console.log(newPerson) //=>[object Object]{age:28, name: 'Max'}
```

Now an example of using the rest operator
We will have a function that takes an list of arguments using the rest operator
With these arguments it will see if the numbers are greater than or equal to 1 and if so return it and other qualifying arguments
We can also practice our ES7 syntax
```
const myFilter = (...args) => args.filter(el => el >= 1);
console.log(myFilter(-1, 0, 1, 2, 3)); //=>[1, 2, 3]
```



____
## 19. Destructuring
Destructuring
- Easily extract array elements or object properties and store them in variables

Think of an array containing ``` ['Hello', 'there'] ```
With array destructing we can assign ``` a = 'Hello' ``` and ``` b = 'there' ``` with the following
```
[a,b]=['Hello', 'there'];
console.log(a); //=>'Hello'
console.log(b); //=>'there'
```

For object it is the same except with curly braces and instead of order we use the property name
```
{name} = {name:'Max', age:28};
console.log(name); //=>'Max'
console.log(age); //=>undefined
```
This isn't used as much in the course but is important to know



____
## 20. Reference and Primitive Types Refresher
In javascript there are 2 types of data primitive and reference
Primitive types are things like integer values
With primitive types if you 'copy' a variable holding a primitive type with another variable
the new variable will hold a copy of the same value that was in the original
For example:
```
x = 1;
y = x;
x++;
console.log(x, y); //=> 2, 1
```
y still returns 1 because it is holding a copy of the value 1 so when x is changed y is unaffected

However objects are reference data types
So instead of holding a replica of the values in the array or a replica of the array it basically just creates a new name for the same array
```
const person = {
  name: 'Max'
};
const secondPerson = person;

person.name = 'Manu';

console.log(secondPerson.name); //=>'Manu'
```
You would think that since we never changed the name for secondPerson it would still have the name Max
But because secondPerson is referencing the exact same object as person instead of storing a copy of person the name change is displayed for both of them

The above also applies to arrays so be careful when copying and changing objects or arrays

If you did want to create a 'clone' or copy of an object so you could change one and have the other be unaffected 
You can do that using the spread operator
using the above example:
```
const person = {
  name: 'Max'
};
const secondPerson = {
 ...person 
};

person.name = 'Manu';

console.log(secondPerson.name); //=>"Max"
```
Now we can see that even though we changed the name the secondPerson wasn't affected because we made a real copy utilizng the spread operator



____
## 21. Refereshing Array Functions
JS has many different built in array functions
Earlier we used one called filter but there are many others with map being one example

Map:
This will allow you to perform a method on each item inside an array
For the below example we will cycle through each item in the array, double it, return it, and add these values to a new array
```
const numbers = [1, 2, 3]; //original array

const doubleNumArray = numbers.map((num) => { //num references the current element in the array
  return num * 2; //double current number in array
});

console.log(numbers); //=>[1, 2, 3]
console.log(doubleNumArray); //=>[2, 4, 6]
```



____
## 21. Wrap Up
That concludes this module
This module covered some next gen js and important js concepts

____
## 22. Next-Gen JavaScript - Summary
### Next-Gen JavaScript - Summary
In this module, I provided a brief introduction into some core next-gen JavaScript features, of course focusing on the ones you'll see the most in this course. Here's a quick summary!

### let & const
Read more about let : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let

Read more about const : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const

let  and const  basically replace var . You use let  instead of var  and const  instead of var  if you plan on never re-assigning this "variable" (effectively turning it into a constant therefore).

### ES6 Arrow Functions
Read more: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions

Arrow functions are a different way of creating functions in JavaScript. Besides a shorter syntax, they offer advantages when it comes to keeping the scope of the this  keyword (see here).

Arrow function syntax may look strange but it's actually simple.
```
function callMe(name) { 
    console.log(name);
}
```
which you could also write as:
```
const callMe = function(name) { 
    console.log(name);
}
```
becomes: 
```
const callMe = (name) => { 
    console.log(name);
}
```
Important: 

When having no arguments, you have to use empty parentheses in the function declaration:
```
const callMe = () => { 
    console.log('Max!');
}
```
When having exactly one argument, you may omit the parentheses:
```
const callMe = name => { 
    console.log(name);
}
```
When just returning a value, you can use the following shortcut:
```
const returnMe = name => name
That's equal to:

const returnMe = name => { 
    return name;
}
```
### Exports & Imports
In React projects (and actually in all modern JavaScript projects), you split your code across multiple JavaScript files - so-called modules. You do this, to keep each file/ module focused and manageable.

To still access functionality in another file, you need export  (to make it available) and import  (to get access) statements.

You got two different types of exports: default (unnamed) and named exports:

default => ```export default ...; ```

named => ```export const someData = ...; ```

You can import default exports like this:

```import someNameOfYourChoice from './path/to/file.js'; ```

Surprisingly, someNameOfYourChoice  is totally up to you.

Named exports have to be imported by their name:

```import { someData } from './path/to/file.js'; ```

A file can only contain one default and an unlimited amount of named exports. You can also mix the one default with any amount of named exports in one and the same file.

When importing named exports, you can also import all named exports at once with the following syntax:

```import * as upToYou from './path/to/file.js'; ```

upToYou  is - well - up to you and simply bundles all exported variables/functions in one JavaScript object. For example, if you ```export const someData = ...  (/path/to/file.js ) ```you can access it on upToYou  like this: upToYou.someData .

### Classes
Classes are a feature which basically replace constructor functions and prototypes. You can define blueprints for JavaScript objects with them. 

Like this:
```
class Person {
    constructor () {
        this.name = 'Max';
    }
}
 
const person = new Person();
console.log(person.name); // prints 'Max'
```
In the above example, not only the class but also a property of that class (=> name ) is defined. The syntax you see there, is the "old" syntax for defining properties. In modern JavaScript projects (as the one used in this course), you can use the following, more convenient way of defining class properties:
```
class Person {
    name = 'Max';
}
 
const person = new Person();
console.log(person.name); // prints 'Max'
```
You can also define methods. Either like this:
```
class Person {
    name = 'Max';
    printMyName () {
        console.log(this.name); // this is required to refer to the class!
    }
}
 
const person = new Person();
person.printMyName();
```
Or like this:
```
class Person {
    name = 'Max';
    printMyName = () => {
        console.log(this.name);
    }
}
 
const person = new Person();
person.printMyName();
```
The second approach has the same advantage as all arrow functions have: The this  keyword doesn't change its reference.

You can also use inheritance when using classes:
```
class Human {
    species = 'human';
}
 
class Person extends Human {
    name = 'Max';
    printMyName = () => {
        console.log(this.name);
    }
}
 
const person = new Person();
person.printMyName();
console.log(person.species); // prints 'human'
```
### Spread & Rest Operator
The spread and rest operators actually use the same syntax: ... 

Yes, that is the operator - just three dots. It's usage determines whether you're using it as the spread or rest operator.

Using the Spread Operator:

The spread operator allows you to pull elements out of an array (=> split the array into a list of its elements) or pull the properties out of an object. Here are two examples:
```
const oldArray = [1, 2, 3];
const newArray = [...oldArray, 4, 5]; // This now is [1, 2, 3, 4, 5];
```
Here's the spread operator used on an object:
```
const oldObject = {
    name: 'Max'
};
const newObject = {
    ...oldObject,
    age: 28
};  
```
```newObject```  would then be
```
{
    name: 'Max',
    age: 28
}
```
The spread operator is extremely useful for cloning arrays and objects. Since both are reference types (and not primitives), copying them safely (i.e. preventing future mutation of the copied original) can be tricky. With the spread operator you have an easy way of creating a (shallow!) clone of the object or array. 

### Destructuring
Destructuring allows you to easily access the values of arrays or objects and assign them to variables.

Here's an example for an array:
```
const array = [1, 2, 3];
const [a, b] = array;
console.log(a); // prints 1
console.log(b); // prints 2
console.log(array); // prints [1, 2, 3]
```
And here for an object:
```
const myObj = {
    name: 'Max',
    age: 28
}
const {name} = myObj;
console.log(name); // prints 'Max'
console.log(age); // prints undefined
console.log(myObj); // prints {name: 'Max', age: 28}
```
Destructuring is very useful when working with function arguments. Consider this example:
```
const printName = (personObj) => {
    console.log(personObj.name);
}
printName({name: 'Max', age: 28}); // prints 'Max'
```
Here, we only want to print the name in the function but we pass a complete person object to the function. Of course this is no issue but it forces us to call personObj.name inside of our function. We can condense this code with destructuring:
```
const printName = ({name}) => {
    console.log(name);
}
printName({name: 'Max', age: 28}); // prints 'Max'
```
We get the same result as above but we save some code. By destructuring, we simply pull out the name  property and store it in a variable/ argument named name  which we then can use in the function body.



____
## 24. JS Array Functions
Not really next-gen JavaScript, but also important: 
JavaScript array functions like map() , filter() , reduce()  etc.

You'll see me use them quite a bit since a lot of React concepts rely on working with arrays 
(in immutable ways).

The following page gives a good overview over the various methods you can use on the array prototype - 
feel free to click through them and refresh your knowledge as required: 
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array

Particularly important in this course are:

map()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map
find()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
findIndex()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex
filter()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
reduce()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce?v=b
concat()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat?v=b
slice()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice
splice()  => https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice