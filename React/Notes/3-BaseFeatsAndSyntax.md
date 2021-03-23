# Section 3: Understanding the Base Features and Syntax
____
## 25. Module Introduction
This module will focus on the base concepts and syntax of React
This module will also demonstrate how to build projects locally
We will experiment with some of Reacts core features and how to use them




____
## 26. The Build Workflow
First we have to get React on our local machine instead of using a web editor such as codepen and jspen
For real projects we need something more elaborate for single and multipage webapplications

With a local environment we will begin with building our workflow

First why do we want a more complex workflow?
- Optimize code
  - For large projects we want to ship code that is small and optimized as possible, which will increase performance
- Use next gen js features
  - Using next gen features will make it easier to code, make it run better, and react is built with the idea that these new features will be taken advantage of
  - Since not all browsers support next gen features we have to use a compiler that will bundle our code in a way that will make our app available to these browsers
- Be more productive
  - Prefixes are handled automatically
  - Linting is included

How do we set up this workflow?
First we need a dependency management tool
- This is like npm or yarn (we will use npm)
- These are used to install new packages and keep packages and dependencies up to date

We will also need a bundler
- Webpack
- This is so we can break up our code into multiple smaller files
- The bundler will put everything together so it can all run properly

Another thing we will need is a compiler
- Babel + presets
- This will take all of our code and translate it for browsers as needed
- It will also make next gen features available in browsers that may not normally support those js features

Last we will need a development server
- This will emulate the app running on a webserver and run it on our local machine


We will use something called Create-React-App which will help us to get react apps set up quickly

____
## 27. Using Create React App

create-react-app is the recommended way for creating a new react app from scratch
You can find the official github repository for this [here](https://github.com/facebook/create-react-app) (https://github.com/facebook/create-react-app)


We can install this globally with npm which comes with node.js
If you do not have node.js you can find it at nodejs.org
If using linux on a vm I believe I was able to install via apt-install or something

With node.js (and npm which comes with node.js) run the following
```
// On linux/mac you may need to add sudo before this
$npm install create-react-app -g
```

Now navigate to the directory where you want to create your react app
To create a react app run the following command
```
$create-react-app name-of-react-app

// To get the same folder structure as the instructor (and these notes) use the following altered command instead

$create-react-app name-of-react-app --scripts-version 1.1.5
```

Doing this will create our new application

Just change into our create application
```
cd name-of-react-app
```

and run the server
```
npm start
```

Doing this should automatically open a browser tab with the page or you can visit it at
```
http://localhost:3000
```

You can stop this with ctrl+c in the terminal

With this server running in the background our webpage will reflect any changes we make in real time




____
## 28. Understanding the folder structure

Now let's look at the project we created in the last lesson and explore the files and folders that were created

- node_modules/
  - Holds all dependencies and sub-dependencies of our application. You should't have to touch anything in this folder is created and maintained automatically from package.json and our setup command
- public/
  - This is the root folder that will get seen by the webserver in the end. Currently it only holds the favicon for the site and the single html page that will be used for our project. If we were creating a multipage project we would create a new project for each page not add more pages to the current project
  - favicon.ico
  - index.html
    - This is the page that our application will live on and is currently standard html. The div with the root id is where we will mount our react application. If we wanted to add any imports, css libraries, or meta tags we could add that in this file.
  - manifest.json
    - We can use this to define some metadata about our application
- src/
  - These are the files that will drive our application
  - App.css
  - App.js
    - Here we can see our first react component. The default export ```App``` method has everything that currently shows in the browser
  - App.test.js
  - index.css
  - index.js
    - You can see this file has access to the ``` root ``` div from ```public/index.html``` and rendering our react application to it ( <App />). This is the App.js
  - logo.svg
    - Can delete
  - registerServiceWorker.js
- .gitignore
- .package-lock.json
  - Locks in versions of dependencies from package.json
- .package.json
  - Defines general dependencies. There are three stored here at time of creation (react, react-dom, react-scripts). There are also several scripts listed here. Two important ones are start which start the development server and build which will bundle our app when we are finished developing.
- README.md
- yarn.lock
  - Locks in versions of dependencies

To slim down the project template do the following
- Delete everything inside wrapping div from ```App``` method in src/App.js
- Delete logo.svg import in src.App.js
- Add a short h1 title in the wrapping div from above
- Delete all css except for App from src/App.css
- Delete src/logo.svg




____
## 29. Understanding Component Basics
Now let's look more into how react components work

We saw the src/App.js and app component but let's take a closer look at what is going on
This is what src/App.js looks like:
```
import React, { Component } from 'react';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1> Hello there, I'm a react app</h1>
      </div>
    );
  }
}

export default App;

```
So What is going on?
First we see one way to define a component
``` class App extends Component ```
extends component means we are inheriting from the component class
We can see this class imported from the react library in line 1
``` import React, { Component } from 'react'; ```
The other benefit of importing React is that we need it to show anything to the DOM
We will see another way to define a component soon

Another thing we can see is the ```render()``` method in the App class
App needs this because it will be called anytime we need to render something to the screen
One important job of every react component is to return html code that can be rendered to the screen

Lastly this page is exporting the App component.
Default is specified because as a feature of ES6 if App.js is imported the app is what is exported because of the default keyword

One note is that sometimes you will see App.js with a jsx extension instead of js
That is because of the 'html' that is returned by the components
That is not valid js and is actually jsx expression
However because of our workflow (Babel) it is translated to valid js before it gets processed so there is no issue




____
## 30. Understand JSX

Now to play around with JSX let's comment out the return block of our App class 
```
class App extends Component {
  render() {
    // return (
    //   <div className="App">
    //     <h1> Hello there, I'm a react app</h1>
    //   </div>
    // );
  }
}
```
Instead we will return a method that is built into react called ```createElement(x,y,z)```
 ```createElement``` takes at least 3 arguments (but you can add as many as you would like)
- Element you want to render to the dom
  - This can be a div or your own component if you have one available there
- Configuration for the above element
  - This can be a list of configs in {} separated by a comma or null
- Children for the above element anything that should go inside of the element should be put here

Now let's try to use the above to convert our old return statement to the new version using createElement

```
class App extends Component {
  render() {
    return React.createElement('div', null, 'Hello there! General Kenobi, you ARE a react app')
  }
}
```
Now this looks ok but we don't have our bolding because we don't have the h1 tag anymore
If we try to add it in front like:
```
return React.createElement('div', null, 'h1', 'Hello there! General Kenobi, you ARE a react app')
```
We get weird output like this:
```
h1Hello there! General Kenobi, you ARE a react app
```

In order to add another h1 element we have to create another element which luckily we can do like this:
```
return React.createElement('div', null, React.createElement('h1', null, 'Hello there! General Kenobi, you ARE a react app!'));
```

If we want to get fancy we can pass the App class into our div so it gets the formatting from our css file 
To do this we only have to change the null value for our div to ``` { className: 'App' } ``` 
This is a js object which will assign a class name of app to our element automatically

Now we will normally use the orignal version that we commented out
The changes we made are the changes that our compiler will make for us when we save and run our project
It is important to remember that while what we are returning looks a lot like html it is actually js




____
## 31. JSX restrictions

There are some restrictions that jsx faces
Even though what we are writing looks like html it is js so in some ways that does add restrictions
For example when we added the App class to our div we had to use className instead of class
This is because in js class is a reserved word (and is used to create a new class)
This is why we have to use className
We are also using div and h1 and react is converting them to html tags behind the scenes

Another restriction we face is that we can only return 1 root element
So this would be valid return statement
```
return(
  <div>
    <h1> Title 1 </h1>
    <h1> Title 2 </h1>
  </div>
);
```
But this isn't:
```
return(
  <h1> Title 1 </h1>
  <h1> Title 2 </h1>
);
```




____
## 32. Creating a Functional Component

Now we have the knowledge we need to start creating components
To do this we will add a new file and folder in our src folder which we will name ```Person/``` and ```Person.js```

We will create our component in this Person.js file similar to the way we have a component in the App.js file

First we will create a new js function (named person as lowercase is convention)
There are a couple of different ways to declare  a function in js but we should utilize let and const as it is best practice and offers advantages
Since we don't want to change our function during the app we will use const here

```
const person = () => {

};
```
Notice that we are using an arrow function since this is best practice and offers us advantages

Now there are 2 more things we have to do
First in order for this to work with React and work as a React component we have to import react which we can do at the top of the page with:
```
import React from 'react';
```

We also have to export our function or it can not be called
we can do that with:
```
export default person;
```

Finally in order to make this component useful we have to actually return something within our function
For now it can be something simple like:
``` return <p> I'm a Person! </p> ```


Now we can import this component to use it and have it show up in our app
In our App.js file we need to add a new import statement before we can use our new component

Since we are exporting a default within our component we can "Name it whatever we want"
However it is important that it is uppercase and named something relevant to the component
For the from we simply have to type the relative path to the component and the name of the file we are getting the component from (Person.js)
Technically we can omit the .js file extension and React will add it automatically but I am going to leave it until i have a better understanding

``` import Person from './Person/Person.js'; ```

Now we can start include our component in our app
Put it in our existing "App" div with the name we gave it above inside a self closing tag

 ``` <Person /> ```

Now our App.js should look like this:
```
import React, { Component } from 'react';
import './App.css';
import Person from './Person/Person.js'

class App extends Component {
  render() {
    return (
      <div className="App">
        <h1> Hello there! General Kenobi, you are a react app</h1>
        <Person />
      </div>
    );
    //return React.createElement('div', { className: 'App' }, React.createElement('h1', null, 'Hello there! General Kenobi, you ARE a react app!'), React.createElement(<Person />, null, null));
  }
}

export default App;

```

Now we should see our Person component showing within our app

What is intersting is if you use inspect in browser tools it is all put together into regular neat html

In the next lessons we will see the benefits of using components modularly as we did here instead of adding those lines directly in the App.js file




___
## 33. Components & JSX Cheat Sheet

Components & JSX Cheat Sheet
Components are the core building block of React apps. 
Actually, React really is just a library for creating components in its core.

A typical React app therefore could be depicted as a component tree - 
having one root component ("App") and then an potentially infinite amount of nested child components.

Each component needs to return/ render some JSX code - 
it defines which HTML code React should render to the real DOM in the end.

JSX is NOT HTML but it looks a lot like it.
Differences can be seen when looking closely though 
(for example className in JSX vs class in "normal HTML"). 
JSX is just syntactic sugar for JavaScript, 
allowing you to write HTMLish code instead of nested React.createElement(...) calls.

When creating components, you have the choice between two different ways:

Functional components 
(also referred to as "presentational", "dumb" or "stateless" components - more about this later in the course)
 ``` const cmp = () => { return <div>some JSX</div> } ```
(using ES6 arrow functions as shown here is recommended but optional)

class-based components 
(also referred to as "containers", "smart" or "stateful" components) => 
``` class Cmp extends Component { render () { return <div>some JSX</div> } } ```

We'll of course dive into the difference throughout this course, you can already note that you should use 1) as often as possible though. It's the best-practice.





____
## 34. Workign with Components & Re-Using Them
We have created a Person component but what is so useful about it

Well having person helps us compartmentalize everything
When projects start getting large it wuld be unmanageable to have every piece of the website in a single file

It allows our components to be re-useable 
All we have to do is copy/paste the ```<Person />``` tag in the same return statement (inside the wrapping div remember) and it will show again

We can configure our components as well so that it can change each time it is called
We can do this by setting arguments for our components and passing those arguments when the component is called
They will be run through the function of the component which will alter the output




____
## 35. Outputting Dynamic Content

Now let's make our components more interactive and dynamic

Let's change our Person component so that it says:
``` "I am a Person and I am X years old!" ```

But instead of x we want to display a random number
Instead of using X we could use ``` Math.floor(Math.random() * 30)```

However if we just make a straight swap then that won't work
Our function will be processed as plain text and displayed on screen
We have to let React know that the text should actually be processed as js

If we want our jsx code to process as js instead of plain text then we have to wrap it in single curly braces {}. Whatever is returned by our function in those braces will be displayed instead

So we can update our Person component to look like this:

```
import React from 'react';

const person = () => {
  return <p> I'm a Person and I am { Math.floor(Math.random() * 30) } years old!</p> 
};

export default person;
```

Now copy/paste Person a few more times in the App.js so it shows multiple times if you didn't before

If you save and look at the react server site then you should see our Person component is repeated 3 times and each time has a different random number

Keep in mind we can't define classes or anything too complicated in these functions only short 1 line expressions
We could call an existing function that does more complext things but we cannot define one

Now that we can output dynamic content lets make our component more dynamic and pass configuration from App.js to our Person component




____
## 36. Working with Props

Now let's make our component a little more configurable and flexible
For normal html we can pass in some attributes like class name with syntax like:
``` class="example" ```

With our components we can do something similar and pass in arguments in a similar way

``` <Person name="Max" age="28" /> ```

We could even open the tag and make it wrap (instead of self closing)
 ``` <Person name="Max age="28">My Hobbies: Racing</Person> ```

We do have to first edit our function to accept these attribtues/arguments
it gives us these through a vaue called props (you can actually name it yourself but props is a good idea)

So add props to the arguments in our person function
``` 
const person = (props) => {
  ...
}
```

Now that we have props included we have access to the name and age attributes that were provided earlier

Now we can add these with the curly braces {} that we used last lesson by calling them with ```props.name``` and ```props.age```

** Important Note ** 
If we were using a class component (like maybe we should be doing here but aren't we will touch on these more later. They are briefly mentioned in the notes from 3.33)
We would need to use the this keyword instead of props
For instance:
```
class Person extends Component {
  render() {
    return <p> My name is {this.props}</p>
  }
}
```
\****

When we use theses curly braces and pass in these props values it looks like:
```
const person = (props) => {
  return <p> I'm {props.name} and I am {props.age} years old!</p> 
};
```

Now if we have 3 different calls to person within App.js we get three different Person components with different data in each

```
class App extends Component {
  render() {
    return (
      <div className="App">
        <h1> Hello there! General Kenobi, you are a react app</h1>
        <Person name="Max" age="27">My Hobbies: Racing</Person>
        <Person name="Manu" age="29">My Hobbies: Racing</Person>
        <Person name="Marcy" age="26">My Hobbies: Racing</Person>

      </div>
    );
    //return React.createElement('div', { className: 'App' }, React.createElement('h1', null, 'Hello there! General Kenobi, you ARE a react app!'));
  }
}
```
Now what about the hobbies part?
We will discuss how to pass content between opening and closing tags (or children) in the next lesson




____
## 37. Understanding the Children Prop
Now we will handle the part between the tags and how to pass that into our custom components
There is a special prop that we can access that react gives us access to
In the Person component wrap our return output in () so we can use multiple lines
Then we will add a wrapping div and put our existing p tag content inside and add a new empty p tag at the end
By this point our person function should look like this:
```
const person = (props) => {
  return (
    <div>
      <p> I'm {props.name} and I am {props.age} years old!</p> 
      <p></p>
    </div>
    
  )
};
```
Now we can use the special prop to access any children that are passed into this function and have that displayed as well.
To do this we use the curly braces {} and ``` props.children ```
Note that children is a reserved word
We didn't pass anything named children it is there by default and will catch anything that is placed inside of the Person tags when it is called
 ``` <Person name="no" age="nope">THIS STUFF HERE</Person> ``` 

You could nest html here or other react components but in this case our child is just a simple piece of text

Fill in our method to include the curly braces and children prop
```
const person = (props) => {
  return (
    <div>
      <p> I'm {props.name} and I am {props.age} years old!</p> 
      <p>{props.children} </p>
    </div>
    
  )
};
```

Now our page should show each of our people and another line with hobbies
What is cool is that each line has unique values (except the hobbies that are copy pasted unless you change that) because we passed all of the data in

What is cool is that if we wanted to pass some structured html content we could by including it when calling Person and adding props.children to our return




____
## 38. Understanding and Using State

So far we have looked at props which is an object that gives us access to attributes that we pass into the component
Sometimes you don't want to take info from outside but want to change info from inside of the component.

For example let's add a button that when we click it switches one of the names we use

First we can create a simple button with the button tag and some text inside
Above our list of Person in App.js add:
```
<button> Switch Name </button>
```

First we need to stop hardcoding the names that are being shown
Since App is a class we have the ability to create and assign properties just like any other class

One way to do this is to access a special property called ```state```
This property is only available to classes that extend Component (such as App)

Where props are set and passed from outside, states are managed from inside components
We should use function components as often as possible because we should use state with care
This is because state can make the application unpredictable and dificult to manage
To do this we define a new object called state in our App class (in App.js)
This object will hold an array of persons (what we will name it the array)
This array will hold a list of objects with each object having a name and age properties and values

In the end it will look like this:
```
state = {
    persons: [
      {name: 'Max', age: 28},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  }
```

Double check that it is plugged into the correct place
Now our App class should have to different properties one variable called state holding an object and a method called render which returns jsx to be displayed
Note that we can define other properties if we wish but state is a special property that will pop up more

```
import React, { Component } from 'react';
import './App.css';
import Person from './Person/Person.js'

class App extends Component {
  state = {
    persons: [
      {name: 'Max', age: 28},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  }

  render() {
    return (
      <div className="App">
        <h1> Hello there! General Kenobi, you are a react app</h1>
        <button>Switch Name</button>
        <Person name="Max" age="27">My Hobbies: Racing</Person>
        <Person name="Manu" age="29">My Hobbies: Racing</Person>
        <Person name="Marcy" age="26">My Hobbies: Racing</Person>

      </div>
    );
    //return React.createElement('div', { className: 'App' }, React.createElement('h1', null, 'Hello there! General Kenobi, you ARE a react app!'));
  }
}

export default App;
```
Now that we have 2 properties within our class we have to point at these when calling our Person component instead of manually entering the Person details
To do this we will have to use the this keyword
this is refering to the App class that these functions are taking place inside of

We can access these by simply calling them with ``` this.state.person[0].name ``` as expected
We can do the same with age ``` this.state.person[0].age ```
We will also have to replicate this for our other two Person calls as well
Now our person calls should look like this:
```
<Person name={this.state.persons[0].name} age={this.state.persons[0].age}>My Hobbies: Racing</Person>
<Person name={this.state.persons[1].name} age={this.state.persons[1].age}>My Hobbies: Racing</Person>
<Person name={this.state.persons[2].name} age={this.state.persons[2].age}>My Hobbies: Racing</Person>

```




____
## 39. Props and State
props  and state  are CORE concepts of React. 
Actually, only changes in props  and/ or state trigger React to re-render your components and potentially update the DOM in the browser 
(a detailed look at how React checks whether to really touch the real DOM is provided in section 6).

Props
-props  allow you to pass data from a parent (wrapping) component to a child (embedded) component.

Example:

AllPosts Component:
```
const posts = () => {
    return (
        <div>
            <Post title="My first Post" />
        </div>
    );
}
```
Here, title  is the custom property (prop) set up on the custom Post  component. 
We basically replicate the default HTML attribute behavior we already know 
(e.g. \<input type="text">  informs the browser about how to handle that input).

Post Component:
```
const post = (props) => {
    return (
        <div>
            <h1>{props.title}</h1>
        </div>
    );
}
```
The Post  component receives the props  argument. 
You can of course name this argument whatever you want - it's your function definition, React doesn't care! 
But React will pass one argument to your component function => An object, which contains all properties you set up on <Post ... /> .

{props.title}  then dynamically outputs the title  property of the props  object - 
which is available since we set the title  property inside AllPosts  component (see above).



State

Whilst props allow you to pass data down the component tree (and hence trigger an UI update), state is used to change the component, well, state from within. Changes to state also trigger an UI update.

Example:

NewPost Component:
```
class NewPost extends Component { // state can only be accessed in class-based components!
    state = {
        counter: 1
    };  
 
    render () { // Needs to be implemented in class-based components! Needs to return some JSX!
        return (
            <div>{this.state.counter}</div>
        );
    }
}
```
Here, the NewPost  component contains state . 
Only class-based components can define and use state . 
You can of course pass the state  down to functional components, but these then can't directly edit it.

state  simply is a property of the component class, you have to call it state  though - 
the name is not optional. 
You can then access it via this.state  in your class JSX code 
(which you return in the required render()  method).

Whenever state  changes (taught over the next lectures), the component will re-render and reflect the new state. 
The difference to props  is, that this happens within one and the same component - you don't receive new data (props ) from outside!




____
## 40. Handling Events With Methods
Last lecture we set up state but haven't done anything special with it. Currently it isn't much different than any other variable

We are going to add a click to our button
To do this we can use the onclick method just like in html
The only difference is instead of it being ``` onclick ``` it is ``` onClick ``` 
This is because this is actually jsx and not html 
We then can include curly braces to define what we want to happen when the button is clicked
What we want to execute is a function of our class as this is convention
So that means we have to create a new method in our App.js app class since that is where the button click is 
We will name this function switchNameHandler
Handler is usually added to the end of method to indicate that it is not something that is actively called but is being used as an event handler

Keep in mind we want to use ES6 arrow functions when creating this
Now our App class should look like this:
```
class App extends Component {
  state = {
    persons: [
      {name: 'Max', age: 27},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  }

  switchNameHandler = () => {
    
  }
  render() {
    return (
      <div className="App">
        <h1> Hello there! General Kenobi, you are a react app</h1>
        <button onClick={}>Switch Name</button>
        <Person name={this.state.persons[0].name} age={this.state.persons[0].age}>My Hobbies: Racing</Person>
        <Person name={this.state.persons[1].name} age={this.state.persons[1].age}>My Hobbies: Racing</Person>
        <Person name={this.state.persons[2].name} age={this.state.persons[2].age}>My Hobbies: Racing</Person>

      </div>
    );
    //return React.createElement('div', { className: 'App' }, React.createElement('h1', null, 'Hello there! General Kenobi, you ARE a react app!'));
  }
}
```
We will fill in the ``` switchNameHandler ``` to perform the methods we need on the button click where it will be called for the button

To test let's add a quick ``` console.log('Was clicked!') ``` to our ``` switchnameHandler ```
Then also don't forget to call the function in button like this:
```
<button onClick={this.switchNameHandler}>Switch Name</button>

/* Note that we didn't add () when calling our function
This is because if we were to do that it would execute as soon as that button is rendered
Instead we are putting a reference to the function 
so that when the button is clicked it will find that function and execute then */
```

Another important note is that if we do not use the ES6 syntax when creating our methods we are keeping the ``` this ``` keyword pointing in the correct and predictable places

If we use ``` this ``` inside of  ``` switchNameHandler ``` as is it will be able to point within the class but would not work if we did not use ES6 syntax

Now if you save, open the console in browser dev tools, and click the button - 
You can see your message from our console.log in the ``` switchNameHandler ``` function





____
## 41. To Which Events Can You Listen?

In the last lecture, we saw that you can react to the onClick event - but to which other events can you listen? You can find a list of supported events here: https://reactjs.org/docs/events.html#supported-events

### Clipboard Events
- Event names:
 ``` onCopy onCut onPaste ```

- Properties:
 ``` DOMDataTransfer clipboardData ```

### Composition Events
-Event names:
 ``` onCompositionEnd onCompositionStart onCompositionUpdate ```

- Properties:
 ``` string data ```

### Keyboard Events
- Event names:
 ``` onKeyDown onKeyPress onKeyUp ```

- Properties:
 ```
 boolean altKey
number charCode
boolean ctrlKey
boolean getModifierState(key)
string key
number keyCode
string locale
number location
boolean metaKey
boolean repeat
boolean shiftKey
number which
```
### Focus Events
-Event names:
 ``` onFocus onBlur ```
These focus events work on all elements in the React DOM, not just form elements.

-Properties:
 ``` DOMEventTarget relatedTarget ```

### Form Events
- Event names:
 ``` onChange onInput onInvalid onSubmit ```
For more information about the onChange event, see Forms.

### Mouse Events
- Event names:
``` 
onClick onContextMenu onDoubleClick onDrag onDragEnd onDragEnter onDragExit
onDragLeave onDragOver onDragStart onDrop onMouseDown onMouseEnter onMouseLeave
onMouseMove onMouseOut onMouseOver onMouseUp 
```
The ``` onMouseEnter ``` and ``` onMouseLeave ``` events propagate from the element being left to the one being entered instead of ordinary bubbling and do not have a capture phase.

- Properties:
```
boolean altKey
number button
number buttons
number clientX
number clientY
boolean ctrlKey
boolean getModifierState(key)
boolean metaKey
number pageX
number pageY
DOMEventTarget relatedTarget
number screenX
number screenY
boolean shiftKey
```

### Selection Events
- Event names:
``` onSelect ```

### Touch Events
-Event names:
 ``` onTouchCancel onTouchEnd onTouchMove onTouchStart ```

-Properties:
```
boolean altKey
DOMTouchList changedTouches
boolean ctrlKey
boolean getModifierState(key)
boolean metaKey
boolean shiftKey
DOMTouchList targetTouches
DOMTouchList touches
```

### UI Events
-Event names:
 ``` onScroll ```

-Properties:
```
number detail
DOMAbstractView view
```

### Wheel Events
-Event names:
 ``` onWheel ```

-Properties:
```
number deltaMode
number deltaX
number deltaY
number deltaZ
```

### Media Events
-Event names:
```
onAbort onCanPlay onCanPlayThrough onDurationChange onEmptied onEncrypted
onEnded onError onLoadedData onLoadedMetadata onLoadStart onPause onPlay
onPlaying onProgress onRateChange onSeeked onSeeking onStalled onSuspend
onTimeUpdate onVolumeChange onWaiting
```

### Image Events
-Event names:
 ``` onLoad onError ```

### Animation Events
- Event names:
 ``` onAnimationStart onAnimationEnd onAnimationIteration ```

- Properties:
```
string animationName
string pseudoElement
float elapsedTime
```

### Transition Events
-Event names:
 ``` onTransitionEnd ```

- Properties:
```
string propertyName
string pseudoElement
float elapsedTime
```

### Other Events
-Event names:
 ``` onToggle ```




 ____
 ## 42. Manipulating the State
 Last time we manipulated switchNameHandler on click but now we want to manipulate the state
 We will do this within switchNameHandler
 We can access the state property with ``` this.state ```
 So since we can access this we can try to make a change to one of the values within state
 Remember to comment out our console.log and update switchNameHandler to try to change the name of one of the persons in state:
 ```
switchNameHandler = () => {
    //console.log('Was clicked!');
    this.state.persons[0].name = "Maximilian"
  }
 ```

If we do this we will see a warning saying that we shouldn't edit state directly and to instead use setState()
If we ignore the warning and click anyway you can see that our button does not work as expected

Let's try it their way then.
We can access setState() with the ``` this ``` keyword as well (it is inherited into the class since the class extends component)
The reason that setState is superior is because setState tells React that a value was changed and React updates the DOM accordingly in realtime
 ``` this.setState() ```

So how does setState work?
It receives an object and will use that object to overwrite or merge the previous object with the new one

For example since we have the persons object above we can copy/paste it into our ``` setState ``` object and make the changes we need
(Note there is certainly a better way to do this with the spread operator but that is 
not the point right now)

Now our ``` state ``` object and ```switchNameHandler ``` function should look like this:
```
state = {
  persons: [
    {name: 'Max', age: 27},
    {name: 'Manu', age: 29},
    {name: 'Marcy', age: 26}
  ]
}

switchNameHandler = () => {
  //console.log('Was clicked!');
  // DON'T DO THIS: this.state.persons[1].name = "Changed Bitch"
  this.setState({persons:[
    {name: 'Maximilian', age: 28},
    {name: 'Mant', age: 30},
    {name: 'Steph', age: 27}
  ]})
}
```

Now when we save and click the button the names and values will change just like we wanted
This time the DOM  was updated because React recognized that the state of our app changed

Ther are only two things that cause React to update the DOM so we have to do things in a certain way if we want our page to update properly
- Changing state
- Changing Props

If either of these things happen
React will analyze what was rendered to the DOM and what would be rendered with those changes to determine if it needs to update the DOM or not




____
## 43. Function Components Naming

Function Components Naming
In the next lecture, we'll learn how to manage state in functional components
(instead of class-based components).

In case you're getting an error with the code shown in the next lecture, 
simply assign a capitalized variable name to the variable that holds your functional component.

Example:
Use
 ``` const App = () => { ... } ```

instead of
 ``` const app = () => { ... } ```

Technically, that's not required but depending on your project setup, 
the built-in linter (a code quality checking tool) 
that comes with create-react-app might not like the lowercase variable name.

You can also avoid this by creating projects with the right react-scripts version,
which I would recommend for this course anyways (see the setup video, lecture 26)
 ``` create-react-app my-app --scripts-version 1.1.5 ```



 ____
 ## 44. Using the useState() Hook For State Manipulation
 The last lessons covered setting state and using ``` setState() ``` to edit those values
 However these features are only available in class based components and are not available in functional components so what do you do in that case?
 Since React 16.8 we are able to use something called React hooks that allow us to manage state in functional components as well

We will have a brief look at them here but there are 2 later modules that cover react hooks
One teaches from the beginning and the other converts our project to use react hooks

That is because for this course we will stick to the more traditional way of using class based components although functional components are becoming more common

We are donig it this way because it is the way it has been done and if you were to join a react team with an existing react project there is a high likelihood it would be class based

This new way is totally optional and we aren't sure if it will be the main way to do this in the future (hello from the future; it will be.)

So let's take a quick look at these react hooks
To do that we will have to convert our app class component to a functional component
To do that we need to change our declaration to be like when we created person.js
So it should look like this:
```
const app = props => {

}
```

Then we need to change our export statement to use lowercase since lowercase component names are convention for functional components

``` 
export default app;
```

Instead of using ``` render() ``` to return jsx we can get rid of the render and just keep the returned jsx
```
return (
  <div className="App">
    <h1> Hello there! General Kenobi, you are a react app</h1>
    <button onClick={this.switchNameHandler}>Switch Name</button>
    <Person name={this.state.persons[0].name} age={this.state.persons[0].age}>My Hobbies: Racing</Person>
    <Person name={this.state.persons[1].name} age={this.state.persons[1].age}>My Hobbies: Racing</Person>
    <Person name={this.state.persons[2].name} age={this.state.persons[2].age}>My Hobbies: Racing</Person>
  </div>
);
```

Now we can start to implement the react hooks feature
(double check package.json to make sure you are using react 16.8+)

We can import hooks from react instead of component since we don't need component anymore

Depending on your ide you should be able to type 'use' in the import area where component was to see some of the hooks available

The one we are interested in is called useState
So our import should look like this:
```
import React, { useState } from 'react';
import './App.css';
import Person from './Person/Person.js'
```
Now that we have useState imported lets utilize it
We can call it like any other function before our return statement
The first arguement will be the initial state of our object (copy the object we prevoiusly set up)
It should look like this:
```
useState({
    persons: [
      {name: 'Max', age: 27},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  });
```

So what does this do?
useState will return an array with exactly 2 elements (ALWAYS 2)
We can store these in a state array constant variable
The first value is the initial state before we change it
The second element will be a function that allows us to update the state in a way that react is aware and will re-render components 
(which is the same kind of idea with class based components)

So to store the ouput of this function into a const
```
const stateArr = useState({
    persons: [
      {name: 'Max', age: 27},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  });
```

We can also add a modern feature called array destructuring
This allows us to pull elements out of the array from the right side of the equals sign and assign them to variables
To do this we can change the above to something like:
```
const [ personsState, setPersonsState] = useState({
    persons: [
      {name: 'Max', age: 27},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  });
```

Now we are able to access these persons objects again only instead of using the ``` this ``` keyword we can use ``` personsState ```
So our return needs updated to make the Person calls look more like this:
 ``` <Person name={personsState.persons[0].name} age={this.state.persons[0],age} /> ```
With this small update our page shouldn't have error messages and should display the person objects correctly
We still have to re-add the switchNameHandler functionality via the setPersonsState
How do we do that?
Well we can add methods to functional components without a problem so we can simply store our switchNameHandler in a const
```
const switchNameHandler = () => {
  //console.log('Was clicked!');
  // DON'T DO THIS: this.state.persons[1].name = "Changed Bitch"
  this.setState({persons:[
    {name: 'Maximilian', age: 28},
    {name: 'Mant', age: 30},
    {name: 'Steph', age: 27}
    ]
  });
};
```
Now insetad of calling it with a this keyword we can just call it with its name where we create the button
```
<button onClick={switchNameHandler}>Switch Name</button>
```

Lastly within our switchNameHandler we no longer should be calling this.setState anymore because that function does not exist
Instead we will be calling setPersonsState

Now if you kept up with all of those changes it should looks like this:
```
import React, { useState } from 'react';
import './App.css';
import Person from './Person/Person.js'

const app = props => {
  const [ personsState, setPersonsState] = useState({
    persons: [
      {name: 'Max', age: 27},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ]
  });

  const switchNameHandler = () => {
    //console.log('Was clicked!');
    // DON'T DO THIS: this.state.persons[1].name = "Changed Bitch"
    setPersonsState({
      persons:[
        {name: 'Maximilian', age: 28},
        {name: 'Mant', age: 30},
        {name: 'Steph', age: 27}
      ]
    });
  };

  return (
    <div className="App">
      <h1> Hello there! General Kenobi, you are a react app</h1>
      <button onClick={switchNameHandler}>Switch Name</button>
      <Person name={personsState.persons[0].name} age={personsState.persons[0].age}>My Hobbies: Racing</Person>
      <Person name={personsState.persons[1].name} age={personsState.persons[1].age}>My Hobbies: Racing</Person>
      <Person name={personsState.persons[2].name} age={personsState.persons[2].age}>My Hobbies: Racing</Person>
    </div>
  );
}

export default app;
```

If you save and look at the server page it should show the correct info to start and the that data should change when the button is pressed just like before

One big difference to note between using a class state or these function componenet hooks is that in a class state with you use ``` setState ``` it merges changes that are pushed in
With hooks and ``` useState ``` the original state is completely replaced with whatever is passed in so you have to be careful with how you use or you may not pass in data that was previously in the state
If this happens that data will be lost
You can do that by accessing the other values and setting them equal to themselves when using useState
```
setPersonsState({
  persons:[
      {name: 'Maximilian', age: 28},
      {name: 'Mant', age: 30},
      {name: 'Steph', age: 27}
    ],
    otherState: personsState.otherState
});
```
The more elegant way of doing this is to call useState multiple times and have each time be their own state or object
Then you can update one without losing data on others

For example if we wanted to add otherState permanently we would use another useState instead of combining it with our persons state object like above
We could add this useState method:
```
const [ otherState, setOtherState ] = useState({
  otherState: 'Some other value'
});
```
Then just to make sure that it works correctly add a console.log before the return somewhere
 ``` console.log(personsState, otherState); ```

You should see that when the page loads there are 2 state objects (1 person 1 other)
Then when you press the button the persons state object is updated but the otherstate object is unaffected

We will use the version of our project that we started with before making thesechanges since we will use a class based approach for most of this class
However it is important to know what hooks are and is something we will have to knowlater




____
## 45. Stateless vs Stateful Components
We just learned quite a bit about state and props and how those apply to class vs functional components

Whether a component is class or functional if it is managing state within it 
With setState or useState you can identify it as stateful
our App.js component is a stateful component

If it does not manage state then it is stateless
Our person.js component is a stateless component

It is best practice to have as many stateless components in our application as possible (and as few stateful components as possible)

This is because we want most of our components to be functional presentational components with very few that hold or manipulate data
This is because it makes our app easier to manage
It makes it easier to tell where data is being created/changed/deleted
Then if anyone needs to make a change to the app it is much clearer where that change needs to be made




____
## 46. Passing Method References Between Components
### Important
#### Before starting this lesson make sure that you have reverted the changes from 3.44
#### Our App.js should have a class App within it with the appropriate import and export statements

Now let's say you want to call ``` switchNameHandler ``` also when clicking on a ``` <p> ``` tag in the person component

In the person component we can add an ``` onClick ```but we can't really do anything from there
We don't have any way to call ``` switchNameHandler ```

We are actually able to (from our App class) pass a method into our component through props which allows us access to that method from within Person

We can do this probably how you would expect to be able to (from App.js app class return statement)

```
<Person 
          name={this.state.persons[0].name} 
          age={this.state.persons[0].age}
          click={this.switchNameHandler}>My Hobbies: Racing</Person>
```

Now this person instance will have access to the switchNameHandler by calling ``` props.click ```

Now in our person component within our ``` <p> ``` we can add an ``` onClick ``` that will run ``` props.click ```

```
const person = (props) => {
  return (
    <div>
      <p onClick={props.click}> I'm {props.name} and I am {props.age} years old!</p> 
      <p>{props.children} </p>
    </div>
    
  )
};
```

Now when we click the paragraph it will change the names just like the button
Notice that it only works on the isntance of our component that we passed in switchNameHandler through the click prop and not the other 2 instances since they do not have access to that method even though they try to call it

What is important to take out of this is that you can pass methods that can manipulate or access the state into components that otherwise wouldn't have access to that state.

This is a common and important pattern to know

Now what if we want to pass data into ```switchNameHandler```?
Now we want ```switchNameHandler``` to accept a name argument and change the name to the one that is passed into it

We will have to make some minor changes to the method itself first
```
switchNameHandler = (newName) => {
  //console.log('Was clicked!');
  // DON'T DO THIS: this.state.persons[1].name = "Changed Bitch"
  this.setState({persons:[
    {name: newName, age: 28},
    {name: 'Mant', age: 30},
    {name: 'Steph', age: 27}
  ]})
}
```

Now how do we pass that argument in when we call it?
One option is for our button we can use ``` bind ```
To do that we can add it to the end of where we call ```switchNameHandler```
```
<button onClick={this.switchNameHandler.bind(this, 'Maximilian')}>
```
What does bind do?
It will take the this keyboard and bind it to this context meaning the meaning of 'this' doesn't change within this function when it is called in person
Then it will take the second argument and submit it as an argument to switchNameHandler when it is called
Basically bind is locking in the context of our method so it doesn't behave unexpectedly when it moves contexts to another component

To really see a difference let's copy the bind code into one of our Person intsances and change the newName being passed in
```
<Person 
          name={this.state.persons[0].name} 
          age={this.state.persons[0].age}
          click={this.switchNameHandler.bind(this, 'Max!')}>My Hobbies: Racing</Person>
```

Now when we click the button we get the name changed to 'Maximilian' but if we click on the paragraph the name changes to 'Max!'


This is one way to pass an argument
Now let's try another way
We will change how we call ```switchNameHandler``` for the button but keep the ```<Person>``` call as is to keep as an example

This time we will execute an arrow function for our onClick that will return a function call for switchNameHandler
```<button onClick={() => this.switchNameHandler('Maximilian')}>```
Earlier it was mentioned that you shouldn't include the () when calling switchNameHandler but this time is a little different
That is because that function is actually not returned by our button at all until the click even though the method calling it is 'run' when the button is rendered

Of these two methods the bind syntax is probably the better of the two if possible as React can behave weird with re-rendering things too often




____
## 47. Adding two way binding
Now what if we want to change the name on our own?

In our person object let's add an input box of type text below child props (it can be self closing)
 ```<input type="text" />```

Now there should be an text input box for each of our Person instances we want to set it so that whatever we type will be the new name

we can use a special event cause ```onChange``` and execute a method that is passed from our App.js file
``` <input type="text" onChange={} />```

For the sake of this example we will start a new function instead of trying to fit ```switchNameChangeHandler``` to our needs 

We will create a new function called nameChangedHandler which will receive an event (a value was changed and should receive the new value) and replace the value in the state with the value in the text box 

Now in a real application we would want to change the name of the person we are inputting under but since this we are mainly worried about learning how to receive and display this input and not so worried about directing it to specific places yet
We will point all changes at the 'Manu' Person instance

With all that in mind our method will come out to look like this:
```
nameChangedHandler = (event) => {
  this.setState({
    persons: [
      { name: 'Max', age: 28 },
      { name: 'Manu', age: 29 },
      { name: 'Stephanie', age: 26 }
    ]
  })
}
```
Now we are receiving an event object and this object will contain the value of what was typed (if we know how to access it, it is stored in the even.target.value)
We want to update the state with that value instead of 'Manu'
We can just update the persons object in our function to:
```
persons: [
  { name: 'Max', age: 28 },
  { name: event.target.value, age: 29 },
  { name: 'Stephanie', age: 26 }
]
```

Now we have this handler available to our app class but we have to pass it into our person component for it to be available there as well (we will only pass it into the manu person but we could pass it to anyone)
We can do this in a similar way to the click prop we did earlier when we passed switchNameHandler into the ```<p>``` tag
```
<Person 
          name={this.state.persons[1].name} 
          age={this.state.persons[1].age}
          changed={this.nameChangedHandler}>My Hobbies: Racing</Person>
```

Now in our person component we can add the method via props
```
<input type="text" onChange={props.changed} />
```

Now whenever we type the value in Manu gets updated automatically but the others are unaffected

The other thing we want to do is to add the current name to the input field when the page is loaded so that it always matches

That is really easy since we aleady have that value available via props
We can simply set ```value={props.name}```

Our input box should now look like:
```
<input type="text" onChange={props.changed} value={props.name} />
```

We do get one warning which is because we are passing a value into a form field which is usually able to be changed by the user
However since the changed prop isn't passed into the first and third Person instance there is no way to handle changes to that value
So React does not allow those changed and locks the input boxes to not be editable
However everything does work as expected for Manu which is where we wanted to implement this




____
## 48. Adding Styling with Stylesheets

Now that we have some of the react basics set lets touch up our app to make it a little better looking
What if we made each person component styled so they look like cards?
We can use css to style each component and keep styling consistent between components
First we need to add a Person.css file to our Person component (add Person.css to Person folder)
What is important to keep in mind is that whatever we put in this css file is not scoped to our Person component but rather is global css code 
This means we do have to be a careful when naming and changing styles

Now in that stylesheet we can start defining styles
First we can define .Person which we will also assign to the wrapping div of our component will target the whole component as a css class (hint: use className)

Now we can start filling out the css:
```
// Person/Person.css
.Person {
  width: 60%;
  margin: 16px auto;
  border: 1px solid #eee;
  box-shadow: 0 2px 3px #ccc;
  padding: 16px;
  text-align: center;
}
```

If we save now then nothing happens yet
This is because that React doesn't know to incorporate Person.css as a css file and hasn't imported it as a stylesheet

So we have to take care of that and get our Person.css stylesheet imported
We can do that in our App.js file
It might look weird to do add css to a js file but webpack will use it to help style using the jsx

To import we can follow the same pattern as our other import statement at the top of Person.js (hint: look at App.js and how it imports css)
 ``` import './Person.css'; ```

Now if we save and look at our page we can see nice boxes around each of our Person components

Using the dev tools if you look at the ```<head>``` you can see that the css that we defined for person is there

One interesting thing to note is that there should be css prefixes added already to our css that was determined by react (well babel actually) that would work better with our browser than what we had
This will help our code to work in as many browsers as possible




____
## 49. Working With Inline Styles
Last lecture we styled our app with stylesheets
Now lets use inline styling to style our button
In React inline styling is more common than some other frameworks because components are often styled in javascript and since everything in react is modular and self functioning it can make since to have the styling be within the component
Using inline styling also scopes all of the styling to the component which may be desireable in some situations but not in others
However there are some restrictions in what css you can do and not everything will work as easily as you might hope (like hover)

Let's add some styling for our button in our App.js file
This will go within our render method (before our return)
We can set style by using the following
```
const style={
  backgroundColor: 'white',
  font: 'inherit',
  border: '1px solid blue',
  padding: '8px',
  cusror: 'pointer' 
};
```

Now we can go to our button and add this style to it with a style property it will receive a dynamic value {curly braces so actually js in the "html"}
```
<button style={style} onClick={() => this.switchNameHandler('Maximilian')}>Switch Name</button>
```

Now if we save and look at our page our button should have the styling we defined

Our render method should now look like this:
```
render() {

  const style={
    backgroundColor: 'white',
    font: 'inherit',
    border: '1px solid blue',
    padding: '8px',
    cursor: 'pointer' 
  };

  return (
    <div className="App">
      <h1> Hello there! General Kenobi, you are a react app</h1>
      <button style={style} onClick={() => this.switchNameHandler('Maximilian')}>Switch Name</button>
      <Person 
        name={this.state.persons[0].name} 
        age={this.state.persons[0].age}
        click={this.switchNameHandler.bind(this, 'Max!')}>My Hobbies: Racing</Person>
      <Person 
        name={this.state.persons[1].name} 
        age={this.state.persons[1].age}
        changed={this.nameChangedHandler}>My Hobbies: Racing</Person>
      <Person 
        name={this.state.persons[2].name} 
        age={this.state.persons[2].age}>My Hobbies: Racing</Person>

    </div>
  );
}
```




____
## Assignment 1: Time to Practice - The Base Syntax
You learned a lot about the base syntax and features of React, now it's time to practice all the things you learned!

This is the first assignment which will help us practice the things we have learned
### Question 1
Follow the instructions explained in the problem video and try to implement a solution on your own. 
Compare it with my solution (video + downloadable files) thereafter.

The instructions are:

(Create an entirely new react app for this assignment)
-Create TWO new components: UserInput and UserOutput
-UserInput should hold an input element, UserOutput two paragraphs
-Output multiple UserOutput components in the App component (any paragraph texts of your choice)
-Pass a username (of your choice) to UserOutput via props and display it there
-Add state to the App component (=> the username) and pass the username to the -UserOutput component
-Add a method to manipulate the state (=> an event-handler method)
-Pass the event-handler method reference to the UserInput component and bind it to the input-change event
-Ensure that the new input entered by the user overwrites the old username passed to UserOutput
-Add two-way-binding to your input (in UserInput) to also display the starting username
-Add styling of your choice to your components/ elements in the components - both with inline styles and stylesheets


Questions for this assignment
What did you find most challenging and how did you overcome the challenge?




____
## [OPTIONAL] Assignment Solution
Now we will go step by step and add the teacher solution for the above problem

(Create an entirely new react app for this assignment)

- Create TWO new components: UserInput and UserOutput
  - Create new folder in project called UserInput
    - Create new file in this folder called UserInput.js
  - Create new folder in project called UserOutput
    - Create new file in this folder caleld UserOutput.js

- UserInput should hold an input element, UserOutput two paragraphs
  - In userInput create a functional component by creating an arrow function called userInput that will return a text input box
    ``` 
    const userInput = () => {
        return <input type="text" />;
     };
    ```
  - Don't forget to include import and export
  - For userOutput we can do something similar
  - Create a new arrow function that will return a div with 2 p tags
    ```
      const userOutput = () => {
        return (
          <div> 
            <p> Hello there</p>
            <p> General Kenobi</p>
          </div>
        )
      }
    ```
  - Don't forget an import and export statement
- Output multiple UserOutput components in the App component (any paragraph texts of your choice)
  - In our main app component include both of our components in our return
  - First import both files
    ```
    import UserInput from './UserInput/UserInput.js';
    import UserOutput from './UserOutput/UserOutput.js';
    ```
  - Now we can include our components in our return statement
    ```
    render(){
      return (
        <UserInput />
        <UserOutput />
        <UserOutput />
        <UserOutput />
    )
    ```
-Pass a username (of your choice) to UserOutput via props and display it there
  - We can pass props into the UserOutput component where it is called in App.js
    ```
    <UserOutput userName="User"/>
    <UserOutput userName="User"/>
    <UserOutput userName="User"/>
    ```
  - Then we have to accept it in our UserOutput component and output it in our UserOutput file
  - Add the props argument to the arrow function
    ```
      const userOutput = (props) => {...}
    ```
  - Call props.userName to our paragraphs
    ```
    return (
      <div>
        <p>Hello there!</p>
        <p>General {props.userName}</p>
      </div>
    )
    ```

- Add state to the App component (=> the username) and pass the username to the 
  - First we have to add state and values to the App component
    ```
    // This goes above render as its own property
    state = {
      username: 'SuperUser'
    }
    ```
  - Instead of passing text into our userName prop instead pass this state value (hint must use 'this' keyword)
    ```
    <UserOutput userName={this.state.username} />
    ```
- Add a method to manipulate the state (=> an event-handler method)
  - First create a method in App.js
  - Since it is an event listener it will be able to receive an event object 
    - This will be able to access data like value
  - Add setState to the method so we can merge our state changes
  - update the username in the state with the value from our event 
    ```
    usernameChangedHandler = (event) => {
      this.setState({username: event.target.value})
    }
    ```
- Pass the event-handler method reference to the UserInput component and bind it to the input-change event
  - we can pass this in via props by adding an attribute called changed to where we call UserInput
    - Remember not to add parenthesis so the method is not executed within the UserInput call but rather is passed to UserInput to be made available to it
    ```
    <UserInput changed={this.usernameChangedHandler} />
    ```
  - Now we have to call the method within UserInput so that it activates
  - Within UserInput remember to add props to the argument and add the method that we passed to an onChange event
  - This will activate our method when the value in our text box changes
    ```
    const userInput = (props) => {
      return <input type="text" onChange={props.changed} />;
    };
    ```
- Ensure that the new input entered by the user overwrites the old username passed to UserOutput
 - Ensure ``` npm start ``` is running in the project and check that changing the input change the displayed value
- Add two-way-binding to your input (in UserInput) to also display the starting username
  - we can set the initial value of our input box with the ``` value ``` property
  - Then we can pass the initial name into props and access props to get the name
  - First set up setting value to be props.currentName
    ```
    const userInput = (props) => {
      return <input 
        type="text" 
        onChange={props.changed} 
        value={props.currentName} />
    };
    ```
  - Then set currentName in props where UserInput is called to be equal to the state.username value in App.js
    ```
    // in App.js
    <UserInput changed={this.usernameChangedHandler} currentName={this.state.username}/>
    ```
- Add styling of your choice to your components/ elements in the components - both with inline styles and stylesheets
  - For userInput we will use inline styling to make sure it only gets applied to the input box and not to others
  - You can add a style object then assign it using the 'style' attribute in our input tag
    ```
    const style = {
        border: '2px solid red'
      };
    
      return <input 
        type="text"
        style={style} 
        onChange={props.changed} 
        value={props.currentName}/>;
    };
    ```
  - Now for UserOutput we will use a stylesheet
  - Within the UserOutput folder create a new file ``` UserOutput.css ``` 
  - Add a new class called .UserOutput and add some styling
    ```
    .UserOutput{
      width: 60%;
      padding: 16px;
      margin: 16px;
      border: 2px solid black;
      background-color: #ccc;
      text-align: center;
    }
    ```
  - Now we have to import this styling to our UserOutput.js and add the class to our div
    ```
    import './UserOutput.css';
    
    const userOutput = (props) => {
      return (
        <div className="UserOutput">
          <p>Hello there!</p>
          <p>General {props.userName}</p>
        </div>
      )
    }
    ```

Here is what the final version of each file looks like in the teacher solution:

```
//App.js
import React, { Component } from 'react';
import './App.css';
import UserInput from './UserInput/UserInput.js';
import UserOutput from './UserOutput/UserOutput.js';

class App extends Component {

  state = {
    username: 'Super Space Wizard Jesus Mk2'
  }

  usernameChangedHandler = (event) => {
    this.setState({username: event.target.value})
  }

  render() {
    return(
      <div className="App">
        <UserInput changed={this.usernameChangedHandler} currentName={this.state.username}/>
        <UserOutput userName={this.state.username}/>
        <UserOutput userName={this.state.username}/>
        <UserOutput userName={this.state.username}/>
      </div>
    );
  }
}

export default App;
```
```
//UserInput.js
import React from 'react';

const userInput = (props) => {

  const style = {
    border: '2px solid red'
  };

  return <input 
    type="text"
    style={style} 
    onChange={props.changed} 
    value={props.currentName}/>;
};

export default userInput;
```
```
//UserOutput.js
import React from 'react';
import './UserOutput.css';

const userOutput = (props) => {
  return (
    <div className="UserOutput">
      <p>Hello there!</p>
      <p>General {props.userName}</p>
    </div>
  )
}

export default userOutput;
```
```
//UserOutput.css
.UserOutput{
  width: 60%;
  padding: 16px;
  margin: 16px;
  border: 2px solid black;
  background-color: #ccc;
  text-align: center;
}
```




____
## 51. Useful Resources and Links

- create-react-app: https://github.com/facebookincubator/create-react-app
- Introducing JSX: https://reactjs.org/docs/introducing-jsx.html
- Rendering Elements: https://reactjs.org/docs/rendering-elements.html
- Components & Props: https://reactjs.org/docs/components-and-props.html
- Listenable Events: https://reactjs.org/docs/events.html