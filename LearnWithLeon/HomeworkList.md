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
function createCircle(radius){
  return {
    radius, // same as radius: radius,
    draw: function(){
      console.log('createCircle.draw() called')
    }
  }
}

const circle = createCircle(1);
// circle.draw(); //=> createCircle.draw() called

// Constructor function
function Circle(radius){
  this.radius = radius;
  this.draw = function(){
    console.log('Circle.draw() called')
  }
}

// New operator creates an empty object
// Then sets '.this' to point to the created object
const anotherCircle = new Circle(1);
anotherCircle.draw() //=> 'Circle.draw() called'

// (Re-)add location to existing object
anotherCircle.location = {x: 1, y: 1} // same as anotherCircle['location'] = {..}
// Can also be used for names not valid in js 
//  ex: anotherCircle['center-location'] (valid)
//    vs anotherCirlce.center-location (invalid) 
console.log(anotherCircle);

// Remove location key and value
delete anotherCircle.location


// Loop over the properties of an object
for(let key in anotherCircle){
  // output each key and value of anotherCircle
  console.log(key, anotherCircle) 
}

// Paused at 41:50 of video
```
COMPLETE https://youtu.be/0fKg7e37bQE​
🚨Do: https://aka.ms/learnwithleon (Intro. To Github)
  - This link is a great intro to github & part of our sponsored class on Thursday. Also, please use this link, so Microsoft can see how many folx are participating. If you fill out the email submission, you will be entered into an extra raffle for a surface go laptop! 

Read and do the tasks: https://javascript.info/ Whole Chapter - Objects: the basics 
Read: Pillars of OOP - https://medium.com/@hamzzza.ahmed95/four-pillars-of-object-oriented-programming-oop-e8d7822aa219
Complete and Submit this project: https://github.com/leonnoel/100devs-calculator