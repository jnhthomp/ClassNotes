# Section 1 Introduction 
____
## 1. Introduction
- React is a good library for building reactive a javascript driven web applications
- It is fast and feels like a mobile app
  - users don't have to wait for page reloads

### Course will cover
- What is react, how it works, and why you want to use it
- build components with react
- use redax for better state management
- how to use react router
- Do the above by building onto a single larger app through the course




____
## 2. What is react
- React is  a javascript library for building user interfaces
  - Javascript library
    - React is about building js driven apps 
    - React apps run in the browser
    - Things happen instantly since they happen in the browser
  - User interfaces
    - React uses components to build these user interfaces
    - Any website can be broken up into components
      - Header bar
      - Side bar 
      - Headline
      - Article content
    - We can build up these compents into blocks of code which can be used modularly and reused as needed
    - They are basically custom html elements




____
## 3. Join Our Online Learning Community
As a student of this course you also get free access to our "Academind Community" on Discord: https://academind.com/community/

There, you can find like-minded people, discuss issues, help each other, share progress, successes and ideas and simply have a good time!

I believe that you learn the most if you don't learn alone but find learning partners and other people with similar interests. Our community is a great place for this - it's the perfect complimentary resource for this course.

Joining it is of course free and 100% optional.




____
## 4. Real-World SPA's & React Web Apps

reactjs.org is the official webpage of the react team and is built with react

If you look you can see there are several components
- header block
- banner image
- code snippets
- elements with different content

Udemy is another example of a website that uses react components
Reusing components makes it easier to have a comprehensive layout and to update the layout without having to update over many instances throughout the site




____
## 5. Writing Our First React Code
As a trial and to get started quickly use codepen.io for the following lesson
This won't be used for real apps but will be fine to get our feet wet

Create a new 'pen'

We will create a demo application with normal html and js and then use react to demonstrate how we would use that to make creating an app like that easier

Use the following html and css to create a basic card

```
#HTML:
<div class="person">
  <h1>Max</h1>  
  <p>Your Age: 28</p>
</div>
<div class="person">
  <h1>Manu</h1>  
  <p>Your Age: 29</p>
</div> 

#CSS:
.person { 
  display: inline-block;
  margin: 10px;
  border: 1px solid #eee;
  box-shadow: 0 2px 2px #ccc;
  width: 200px;
  padding: 20px;
}
```

Now we have created a card that can hold info about a person with html and css

One limitation is that we are re-using the html code 

We can think of the person div as a component
The div is always structured in the same way and only the data inside is different

We can use react to create a re-useable component instead

In codepen we have to import react by clicking the gear icon in the js tab
You can then add react and react-dom resources
Also set js preprocessor to babel which will help utilize new features

Now we can start writing react in js section
First to create a react component 
We will be able to use this component instead of the html blocks we are using now
Since react components are functions we will create a new js function 
The name of this function must be uppercase in order for it to work properly and it must return the code that should be shown in the DOM (This syntax is called jsx)
```
#JS:
function Person(){
  return(
    <div class="person">
      <h1>Max</h1>  
      <p>Your Age: 28</p>
    </div>
  );
}
```

Babel allows us to use process the html as js and return it to show it in the dom

Now we have to call this function in our html delete the Max div and create a new div with a unique id
```
#HTML:
<div id="p1"></div>
...
```
Now we have to render the function that we created earlier
Since we imported react we have access to an object called ReactDOM which has a method that allows us to render whatever is returned by a method to the DOM to use this we add it to the bottom of our js along with the div that we would like to render the html inside of 
```
#JS
...
ReactDOM.render(<Person />, document.querySelector('#p1'));
# Notice that Person is called in a different way than expected
# Simply put <Person /> is the html that is being passed and react knows it has an associated function. 
# The html that is returned from person is passed as the html instead
```

Now we are able to render a component using react!
However it is not a very good component because it is not reusable and will only show information for one person
We have to update our function to accept arguements
We can pass arguements into our function when we call it so that we can create new people cards on the fly
React has something for this called props we can update our function to use these props by adding props as an argument
Then instead of hardcoding a name we can add a variable with ```{props.name}``` and ``` {props.age} ```
Finally to fill those variables we add a name and age argument when we render the Person block when finished it should look like this:

```
 #JS:
 function Person(props){           //pass in props argument
  return(
    <div class="person">
      <h1>{props.name}</h1>        //add props.name variable
      <p>Your Age: {props.age}</p> //add props.age variable
    </div>
  );
}

// Name and age passed into function in render call
ReactDOM.render(<Person name="Max" age="28"/>, document.querySelector('#p1'));
```

Now we can add a new div and recall this method with unique people and data without having to repeat the html

```
#HTML:
<div id="p1"></div>
<div id="p2"></div>

#JS:
function Person(props){
  return(
    <div class="person">
      <h1>{props.name}</h1>  
      <p>Your Age: {props.age}</p>
    </div>
  );
}

ReactDOM.render(<Person name="Max" age="28"/>, document.querySelector('#p1'));
ReactDOM.render(<Person name="Manu" age="29"/>, document.querySelector('#p2'));
```
Lastly we can fix this to make it more correct and not repeat calling our render

Instead of 2 seperate html divs we can render both into one div and instead of both render statements we can call both with one statement
To do this we will create a new html div and a new js variable (both called app but can be named differently)

```
#HTML:
<div id="app> </div>

#JS:
function Person(props){
  return(
    <div class="person">
      <h1>{props.name}</h1>  
      <p>Your Age: {props.age}</p>
    </div>
  );
}

var app = (
  <div>
    <Person name="Max" age="28"/>
    <Person name="Manu" age="29"/>
  </div>
);

ReactDOM.render(app, document.querySelector('#app'));
```
Now this will render "app" which is a single div containing the output of both of our Person calls were data was passed in
This will be rendered in the div with an id of app



____
## 6. Why Should We Chose React?
Why React?
- UI State becomes difficult to manage with vanilla js
  - When elements are added or removed from the DOM it can make it more difficult to target them properly in complicated apps
- Focus on business logic on preventing app from exploding
- Huge ecosystem, actice community, high performance



____
## 7. React Alternatives
- Angular
- Vue
All three are great at creating scalable web apps that look and feel good to user




____
## 8. Understanding Single Page Applications and Multi Page Applications
Two kinds of applications:
  Single page application - Only get 1 HTML page from the server and the content is rendered by the client
  Multi Page application - Multiple html pages content is rendered on server

Single page can help give a good user experience because the page doesn't have to reload since everything has already been fetched from the server

On a multipage application there may be components that are react based but not the entire page like in a single page web app

In a single page application there will typically only be one ReactDOM.render() call whereas in a multipage app there will be a ReactDOM.render() call for each react widget

This course will focuse on single page because it uses popular libraries like react router and the most popular way of creating web apps these days



____
## 9. Course Outline

- Getting Started
  - Section 2 Refreshing Next Generation JS
    - Discuss next gen js features used in this course
    - You want to use these features to keep your code clean and is standard
- The Basics
  - Section 3 Understanding the Base Features and Syntax
    - How to create react components (more than 1 way)
    - How to communicate between components 
  - Section 4 Working with lists and conditionals
- Styling Components
  - Section 5 Styling React Components and Elements
- Debugging
  - Section 6 Debugging React Apps
- Components Deep Dive
  - Section 7 Diving Deeper Into Components and Elements
  - How to control whether react should look for updates in components or not
  - Get tools needed for bigger more advanced react projects
- Section 8 A Real App: The Burger Builder (Basic Version)
- HTTP Requests
  - Section 9 Reaching out to the web (Http/Ajax)
  - Section 10 Burger Builder Project Accessing a Server
- Routing
  - Secton 11 Multi-page-feeling in a single pae app: Routing
  - Section 12 Adding Routing to our Burger Project
- Forms and Validation
  - Section 13 Forms and Validation
- Redux
  - Section 14 Redux
  - Section 15 Adding Redux to our Project
  - Section 16 Redux advanced
  - Section 17 Redux advanced: Burger Project
- Authentication
  - Section 18 Adding authentication to our Burger Project
- Section 19 Improving our Burger Project
- Testing Introduction
  - Section 20 Testing
- Deployment
  - Section 21 Deploying the app to the web
- Bonus (Animations, Next Steps, Webpack, NextJS)
  - Section 22 Bonus working with webpack
  - Section 23 Bonus Next.js
  - Section 24 Bonus Animations in React Apps
  - Section 25 Bonus A Brief Intro to Redux Saga
  - Section 26 React Hooks
  - Section 27 Using Hooks in the Burger Builder
  - Section 28 Bonus Replacing Redux with React Hooks
  - Section 29 Bonus Building the Burger CSS
- Section 30 Next Steps and Course Roundup



____
## 10. How To Get The Most Out Of This Course
Always code along
Check source code when running into issues (links at end of sections and some lessons)
Using debugging lessons to handle and fix react errors
Use the Q&A to ask questions and post solutions when you can
Practice by building your own demo projects



____
## 11. Useful Resources and Links
Helpful Resources

You shouldn't need it right now - but in case you ever want to dive in, here's the official React documentation: https://reactjs.org/

Had issues with the Codepen demo? Here's the finished source code: https://codepen.io/anon/pen/MELQaQ
