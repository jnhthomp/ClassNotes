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