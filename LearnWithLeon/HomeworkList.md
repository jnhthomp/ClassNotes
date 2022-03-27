# Due 3/31
Watch/Do: https://youtu.be/PFmuCDHHpwk
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
// If you call start and try calling start again you will get an error because you cannot call start twice
//  start increases duration counter
// Same with stop (can only be called once in a row)
// Access duration property to output the time
// Can be restarted to continue duration counter
// Can be reset so duration goes back to 0

function sw(){
  
}
```
COMPLETE https://youtu.be/0fKg7e37bQE​
🚨Do: https://aka.ms/learnwithleon (Intro. To Github)
  - This link is a great intro to github & part of our sponsored class on Thursday. Also, please use this link, so Microsoft can see how many folx are participating. If you fill out the email submission, you will be entered into an extra raffle for a surface go laptop! 

Read and do the tasks: https://javascript.info/ Whole Chapter - Objects: the basics 
Read: Pillars of OOP - https://medium.com/@hamzzza.ahmed95/four-pillars-of-object-oriented-programming-oop-e8d7822aa219
Complete and Submit this project: https://github.com/leonnoel/100devs-calculator