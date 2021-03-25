# Section 5: Styling React Components & Elements
____
## 64. Module Introduction

So far we have learned about creating components and creating/outputting dynamic content
We touched on styling our application with inline styles and stylesheets
One thing we will look at is dynamically adjusting styles and classnames
We will also look at working around restrictions of inline styles or using css styles and having global styles




____
## 65. Outlining the Problem Set
Back in our first-react-app project that we were working on 
We have a button that toggles the cards and 3 cards

One issue with the button is that when we hover over it does not change its styles
This is because we did use inline styles for this button and one shortcoming of that is that we cannot use sudo selectors
This means we can't use things like ``` button::hover ``` to set special css rules
The advantage of course is the styling is appied to only this button
The alternative would be to use a stylesheet but if we were to use ``` button::hover ``` then it would affect the look of all of our buttons and we only want to style this one

Another thing we want to look at is what if we wanted to change our style dynamically
For example what if we want a green background color if we are about to show Person with a click and a red background color if we are about to remove Person with a click

We will see how we can dynamically change these styles in the next lecture




____
## 66. Setting Styles Dynamically

Now lets look at how we can change the color of the button depending on whether we will hide or show Person elements
The approach we will take will be to set the background color of the button to green by default
Then if there showPersons is true we will set the color to red
Also would be a good idea for the text color to be white for legibility

First get the default background color set and add the changed text color
```
const style={
  backgroundColor: 'green',
  color: 'white',
  font: 'inherit',
  border: '1px solid blue',
  padding: '8px',
  cursor: 'pointer' 
};
```

Now the color is green if the people are hidden but doesn't change
Since we already have an if statement that handles showPersons being true we can add our css change there
After we make our change to persons simply add the following to make a change to our style as well
```
style.backgroundColor = 'red';
```

Now when we click our button the color will change depending on if the Persons elements are showing or not

Another thought here is there is nothing stopping us from having dynamic class names or that is a list of classes with predefined styles and changing the class names inside our components to update the style at once which we will touch in the next lecture




____
## 67. Setting Class Names Dynamically
We can also set class names dynamically

Let's create a new class to change one of our paragraphs 
In our App.css create a new class that we will use to provide alternate styles

In our case we wil change the color of our paragraph text depending on if it has 3 elements or less than 3 elements
We can also add a class where the font is bold if there is only 1 item left

First we have to add our new classes to App.css

```
.red{
  color: red;
}

.bold {
  font-weight: bold;
}
```

Now we can add these classes to our paragraph tag dynamically back in App.js
We will create a new variable to hold the class names which we will choose from to add classes to our paragraph
For now we will use ``` .join(' ') ``` on our array which will allow us to easily manage classes while we tinker
```
let classes = ['red', 'bold'].join(' '); //classes= 'red bold';
```

Now we can add our classes variable as a classname in our paragraph tag
```
<p className={classes}>General Kenobi, you are a react app!</p>
```

Now if we save our paragraph will have both styles applied to our paragraph tag
Instead we want to apply these styles dynamically so we will need to make some adjustments

So let's remove the the join and classes from the array and use an if statement to add to the array and then join before assigning to our paragraphs

So one way we can handle this is using an if statement to check if state.persons has 2 or less items
If so then we can add the 'red' class to the 

Then we can have another if statement to check if there is 1 or less items and if so then add the 'bold' class to the classes array
```
if (this.state.persons.length <= 2) {
  classes.push('red'); // classes = ['red'];
}
if (this.state.persons.length <= 1) {
  classes.push('bold'); // classes = ['red', 'bold'];
}
```

Now when we call our classes variable in our paragraph we can use ``` .join(' ') ``` to create a valid list of classes
```
<p className={classes.join(' ')}>General Kenobi, you are a react app!</p>
```

Now when we reload our page the paragraph has no formatting when first displayed
Then when we delete one of the names the text turns red
Then when we delete another name the text is made bold (and stays red)




____
## 68. Adding and Using Radium

Now that we can dynamically assign styles lets cover some of the limitations of inline styles (like not being able to assign :hover properties for our button)

One way to fix this would be to style the button in a css stylesheet but one issue would be that the styling would not be scoped correctly
(We could use css id's or classes but stop thinking about it)
Inline is convenient so we want to try to be able to open these options with inline styling

One option we have is a popular third party package called Radium
To add this package we will need add a new package via npm (use your terminal)
Be sure you are in terminal and in your project directory
Use the following:
```
npm install --save radium
```
This will install a package which allows us to use inline styles with sudo selectors and media queries

Now that we have installed radium we have to import it to our application
(Npm added the necessary files and folders to node_modules in our project but we still have to import it just like react or components)
Since our button is in App.js we will import Radium to App.js
Add to our import statements:
```
import Radium from 'radium';
```

Then in our export statement we will change it to export Radium as a function with our app passed into it
This allows our styles to be run through Radium and 'fixed'
```
export default Radium(App);
```

Now we are ready to set up our hover properties with inline styling
To do that we can add a new property to our 'style' variable (this is the object being used to style our button)
In order for Radium to properly handle this we have to set the :hover property in '' 
Then we can use an object to hold any css properties we would like to be active for :hover
```
':hover': {
  backgroundColor: 'lightgreen',
  color: 'black'
}
```

Note: We also want to set this where we override the background color and change it to red 
In order to do that the syntax is a little different since we only want to call it on the :hover property
```
style[':hover'] = {
    backgroundColor: 'salmon',
    color: 'black'
}
```

Now if we save and hover over the button we can see our styling changes worked for both when names are showing and when they are hidden

This is great because now we have the advantage of being able to inline style with sudo-selectors while also being able to maintain really tight scopes when needed

We can also add media queries which we will cover in the next lecture




____
## 69. Using Radium for Media Queries

Now let's add radium to help handle media queries

We will do this in the person component
We already have a Person.css that is linked so we could simply add the following to it:
```
@media (min-width: 500px;) {
  .Person {
    width: 450px;
  }
}
```

But we want to do it with Radium which we might need in some situations

First we need to define a new style in a person function
In order to use a media query with radium we will make the call a string
Then we will put our properties in the object
```
const style = {
  '@media (min-width: 500px)': {
    width: '450px'
  }
}
```

Now we have to add this style to our div
```
<div className="Person" style={style}>
```

Don't forget to import
```
import Radium from 'radium';
```

...and export
```
export default Radium(person);
```

Then save and run in the browser
...
You can see we get a bunch of errors in the console

We need to wrap our app in another component called styleRoot
This is a component made available by Radium
Wrapping with Radium is enough to handle sudo selectors but if you have any media queries you will also have to wrap with styleRoot
Note that the error said we have to wrap our ENTIRE application in this so we need to import and add this to our App.js
To import we can ammend our Radium import to the following:
```
import Radium, { StyleRoot } from 'radium';
```

Then we can wrap our application with styleRoot
Inside of our return statement in App.js wrap it all in a ```<StyleRoot> ``` tag

```
return (
  <StyleRoot>
    <div className="App">
      <h1> Hello there!</h1>
      <p className={classes.join(' ')}>General Kenobi, you are a react app!</p>
      <button 
        style={style} 
        onClick={this.togglePersonsHandler}>Toggle Name
      </button>
      {persons}
    </div>
  </StyleRoot>
);
```

Now if we save and reload our application should work and we can see our boxes adjust when we narrow the browser to 500px




____
## 70. Introducing Styled Components

Now that we have used Radium and have become more familiar with it let's look at another popular package called ``` <StyledComponents>```

This library is focused on making styling components simple

To get started we have to install it with the following command: (make sure you are in your project directory)
```
npm install --save styled-components
```

While it installs get rid of the Radium import and export wrapper as well as ``` <StyleRoot> ```
Make sure you clear both App.jsx and Person.js

Now that we have gotten rid of Radium how do we use 'styled components'?
If we look at the docs we can see that we have to import the package and then use some weird syntax to call it

```
import styled from 'styled-components'

const button = styled.button``
```

What are these ``?
This is a js feature called taggged templates which is a vanilla js feature

Instead of parenthesis with function arguments we can pass text which is passed into our button method in a special way

Whatever we pass into the backticks (grave) will be taken as styling properties of the button

This will make more sense as we use it
First lets add our import statement to our Person component
```
import styled from 'styled-components'
```

Then instead of adding the style as a prop to our div we can call our div directly from styled and pass our styling directly into it
copy/paste all the styling from Person.css (then comment it out and comment out the import statement)
When pasted into the backticks you can remove the person property and just leave the styling properties
The styles listed will be applied to the div this has been called on
```
const person = (props) => {

  return (
    styled.div`
      width: 60%;
      margin: 16px auto;
      border: 1px solid #eee;
      box-shadow: 0 2px 3px #ccc;
      padding: 16px;
      text-align: center;

    @media (min-width: 500px;) {
      width: 450px;
    }
    `
      <p onClick={props.click}> I'm {props.name} and I am {props.age} years old!</p> 
      <p>{props.children} </p>
      <input type="text" onChange={props.changed} value={props.name} />
    </div>
    
  )
};
```

Now we are closer but this is still invalid code
What we want to do is put this styling into it's own component (still inside Peson.jsx)

Then we can copy paste our ``` styled.div`...` ``` block into this component
```
const StyledDiv = styled.div`
  width: 60%;
  margin: 16px auto;
  border: 1px solid #eee;
  box-shadow: 0 2px 3px #ccc;
  padding: 16px;
  text-align: center;

  @media (min-width: 500px;) {
    width: 450px;
  }
`
```

Next all we have to do is call this within our person component as normal and place our content within it
```
import React from 'react';
import styled from 'styled-components';
import './Person.css';

const StyledDiv = styled.div`
  width: 60%;
  margin: 16px auto;
  border: 1px solid #eee;
  box-shadow: 0 2px 3px #ccc;
  padding: 16px;
  text-align: center;

  @media (min-width: 500px;) {
    width: 450px;
  }
`


const person = (props) => {

  return (
    <StyledDiv>
      <p onClick={props.click}> I'm {props.name} and I am {props.age} years old!</p> 
      <p>{props.children} </p>
      <input type="text" onChange={props.changed} value={props.name} />
    </StyledDiv>
    
  )
};

export default person;
```

What is important to note is that every single Styled method returns a react component which means we can call it where we need it
We aren't writting a compnent above we are storing a call that creates a component which is why we aren't using the arrow function syntax to create a component

Now if we save and run we can see that our css is StyledDiv is working and applying the same css still

To test change border/background colors




____
## 71. More on Styled Components

These are nice but how do they work?
What is going on behind the scenes?

If we inspect a Person div in our browser we can see there are css classes attached to them (with weird names)
These class names are automatically added by the StyledComponent library
When we call styled.div Styled component will automatically create a div and apply generated classnames to hold the properties we pass into ``
Now where are the class properties stored?
If you look in the head of the document you can see the styles defined with the same classnames
This means StyledComponents is not using inline styles and importing with the ``` <style> ``` tag in ``` <head> ```

Let's also use this in App.jsx
We have the style contant already that we use for our button
We can do this with the ``` styled.button`` ``` call
Don't forget to import StyledComponents in App.jsx first
Then we can create a StyledButton component (using our old style as a blueprint)
Remember to make changes to our old style such as removing '' and , and removing camelCase property names and providing the correct ones
One weird thing we have to do is add an & symbold before our ``` :hover ``` sudo selector for StyledComponents to process it correctly
```
const StyledButton = styled.button`
  background-color: green;
  color: white;
  font: inherit;
  border: 1px solid blue;
  padding: 8px;
  cursor: pointer;
  
  &:hover {
    background-color: lightgreen;
    color: black;
}
`;
```

Then we can remove the old style variable and calls (including if statement that changed color to red) and add our styled button tag (don't forget to add style prop)
```
<StyledButton 
  onClick={this.togglePersonsHandler}>Toggle Name
</StyledButton>
```

Now our green is working but we need to learn how to do styled components dynamically like we did before with the button color (and paragraph color)




____
## 72. Styled Componets & Dynamic Styles
Now lets add our color change to red and salmon on hover
StyledComponents allows us to do this easily
In our ``` <StyledComponents> ``` tag we can add a prop (any name) and pass in a js argument
In this case we want to pass in ``` this.state.showPersons ``` since whetehr showPersons is true or false will determine the color of our button

Inside of our template literal where we define our styled button we are able to inject js by adding ``` ${} ```
Inside of that we can add a function where we receive props and return a value based on the value of props
```
background-color: ${props => props.alt ? 'red' : 'green'};
```
Here we check props and if props.alt is true we return a string 'red' and if it is false we return a string 'green'
Now we can do the same for our background color in hover
```
background-color: ${props => props.alt ? 'red' : 'green'};
```

Now we can see our button dynamically changing color as it should



____
## 73. Working with CSS Modules

While some people like StyledComponents others prefer to keep their css in css files instead
This reduces clutter in .jsx files and allows us to use css stylesheets but still scope our styles to a specific component

For this we will remove our StyledComponent items from our App.jsx file
(import, StyledButton component [add properties to app.css as .button], StyledButton element [replace with normal button and button class])
```
// App.jsx
import React, { Component } from 'react';
import './App.css';
import Person from './Person/Person'


class App extends Component {
  state = {
    persons: [
      {id: 'lwkvciw', name: 'Max', age: 27},
      {id: 'mv0wvo2', name: 'Manu', age: 29},
      {id: 'q2v021n', name: 'Marcy', age: 26}
    ],
    showPersons: false
  }

  nameChangedHandler = (event, id) => {
    const personIndex = this.state.persons.findIndex(p => {
      return p.id === id;
    });

    const person = {
      ...this.state.persons[personIndex]
    }

    person.name = event.target.value;
    
    const persons = [...this.state.persons];
    persons[personIndex] = person;
    this.setState({ persons: persons });
  }

  togglePersonsHandler = () => {
    const doesShow = this.state.showPersons;
    this.setState({showPersons: !doesShow})
  }

  deletePersonHandler = (personIndex) => {
    const persons = [...this.state.persons];
    persons.splice(personIndex, 1);
    this.setState({persons: persons});
  }

  render() {

    let persons = null;

    if (this.state.showPersons) {
      persons = (
        <div>
          {this.state.persons.map((person, index) => {
            return <Person 
              key={person.id}
              click={() => this.deletePersonHandler(index)}
              changed={(event) => this.nameChangedHandler(event, person.id)}             
              name={person.name} 
              age={person.age} />
          })}
        </div>
      );      
    }

    let classes = [];

    if (this.state.persons.length <= 2) {
      classes.push('red'); // classes = ['red'];
    }

    if (this.state.persons.length <= 1) {
      classes.push('bold'); // classes = ['red', 'bold'];
    }
    
    

    return (
      <div className="App">
        <h1> Hello there!</h1>
        <p className={classes.join(' ')}>General Kenobi, you are a react app!</p>
        <button className="button" alt={this.state.showPersons} onClick={this.togglePersonsHandler}>
          Toggle Name
        </button>
        {persons}
      </div>
    );
    //return React.createElement('div', { className: 'App' }, React.createElement('h1', null, 'Hello there! General Kenobi, you ARE a react app!'));
  }
}

export default App;
```
```
// App.css
.App {
  text-align: center;
}

.red {
  color: red;
}


.bold {
  font-weight: bold;
}

.button {
  background-color: green;
  color: white;
  font: inherit;
  border: 1px solid blue;
  padding: 8px;
  cursor: pointer;

}


.button:hover {
  background-color: lightgreen;
  color: black;
}
```

One more thing we need to do is tweak the configuration if we are using react-scripts v1 (recommended for course check in package.json)

If you are running react-scripts one do the following
- Stop server (if running)
- Make a commit of your project
- Run ``` $npm run eject ```
  - This will unmount the project and make the configuration files for it available to us
  - We can now see a new 'scripts' and 'config' folder
  - ``` config/webpack.config.dev.js ``` and ``` config/webpack.config.prod.js ``` are the two config files that are used by React under the hood to give us a development server and bundle it for production
  - In these webpack there are a lot of options to tweak but they should only be messed with if you know what you are doing
- Find ``` config/webpack.config.dev.js ```
- Look within for ``` test: /\.css$/, ``` where we can find the loader being used ``` 'css-loader' ``` likely by default
- In the options we will need to add a modules entry set to true and a local ident entry
  ```
  test: /\.css$/,
  use: [
    require.resolve('style-loader'),
    {
      loader: require.resolve('css-loader'),
      options: {
        importLoaders: 1,
        modules: true,
        localIdentName: '[name]__[local]__[hash:base64:5]'
      },
    },
  ```
  - These changes will enable to css modules feature which we are about to use
  - The ``` localIdentName ``` is used to generate unique css clases
- Make these same changes to ``` config/webpack.config.prod.js
  ```
  test: /\.css$/,
  loader: ExtractTextPlugin.extract(
    Object.assign(
      {
        fallback: {
          loader: require.resolve('style-loader'),
          options: {
            hmr: false,
          },
        },
        use: [
          {
            loader: require.resolve('css-loader'),
            options: {
              importLoaders: 1,
              modules: true,
              localIdentName: '[name]__[local]__[hash:base64:5]',
              minimize: true,
              sourceMap: shouldUseSourceMap,
            },
          },
  ```
- Run ``` npm run start ``` to restart our server
```
FOR react-scripts 2.0+ you only need to rename your App.css file to App.module.css then change your import statement to match
You do not need to eject in this case
```

Now if we go to App.js we can now import from our css files differently
For example we can do the following:
```
import classes from './App.css';
```

This will import all of the classes that are created in our css files
Then we can add our button class to our button with the following:
```
<button className={classes.Button} alt={this.state.showPersons} onClick={this.togglePersonsHandler}>
```
Since we already have variable called classes changed the previously assigned one to assignedClasses (the one that changes our ```<p>``` tag with if statements)

We also need to update how we assign the App classname for our main div
```
<div className={classes.App}>
```

Now if we save and look at our app it should have styling as expected

How does this work?
Well React is able to see the import statement on the css file and knows it should import each class within as a unique entry and mapped to the clasnames we chose

This means that each item that we call ``` classes.Button ``` on is scoped to that specific instance since it is getting a unique classname behind the scenes that follow the same rules as ``` .Button ``` 

Now in order to make these dynamic we just have to add more css styles based on the style we want and swap them out as needed.

In App.css add a new class ``` .Button.Red ```
where we can apply our style and hover style
```
.Button.Red {
  background-color: red;
}

.Button.Red:hover {
  background-color: salmon;
}
/* Note that .Button.Red means this .Red class can only be applied an element with .Button as well */
```

Now we can set a btnClass variable that will hold either ``` .Button ``` or ``` .Button.Red ``` depending on a condition
```
let btnClass = [classes.Button];
```

Inside of our if statement to show persons we can add the command to add the ```.Red ``` class to the array as well since that is the trigger to turn the button red
```
btnClass.push(classes.Red);
```

Then simply assign btnClass to our button and it should change for us as needed
Don't forget ``` .join(' ') ``` to combine our array into a string first
```
<button className={btnClass.join(' ')} alt={this.state.showPersons} onClick={this.togglePersonsHandler}>
```




____
## 74. CSS Modules and Media Queries
Now let's also apply css modules to Person.jsx

We first have to change our import statement
```
import classes from './Person.css';
```
You can also remove the StyedComponent import, variable, and element

Instead our wrapping div will have a ``` .Person ``` class following the same conventions as last lesson
```
<div className={classes.Person}>
```

Now in Person.css we have to be sure we have .Person




____
## 75. More On CSS Modules
CSS Modules are a relatively new concept 
(you can dive super-deep into them here: https://github.com/css-modules/css-modules). 
With CSS modules, you can write normal CSS code and make sure, that it only applies to a given component.
It's not using magic for that, instead it'll simply automatically generate unique CSS class names for you. 
And by importing a JS object and assigning classes from there, you use these dynamically generated, unique names. 
So the imported JS object simply exposes some properties which hold the generated CSS class names as values.

Example:\
In Post.css File
```
.Post {
    color: red;
}
```
In Post Component File
```
import classes from './Post.css';
 
const post = () => (
    <div className={classes.Post}>...</div>
);
```
Here, classes.Post refers to an automatically generated Post property on the imported classes object. 
That property will in the end simply hold a value like Post__Post__ah5_1 .
So your .Post class was automatically transformed to a different class (Post__Post__ah5_1 ) which is unique across the application. 
You also can't use it accidentally in other components because you don't know the generated string! 
You can only access it through the classes object. 
And if you import the CSS file (in the same way) in another component, the classes object there will hold a Post property which yields a different (!) CSS class name. 
Hence it's scoped to a given component.
By the way, if you somehow also want to define a global (i.e. un-transformed) CSS class in such a .css file, you can prefix the selector with :global .

Example:
``` 
:global .Post { ... } 
```
Now you can use ``` className="Post" ``` anywhere in your app and receive that styling.




____
## 76. Useful Resources and Links
- Using CSS Modules in create-react-app Projects: 
  -https://medium.com/nulogy/how-to-use-css-modules-with-create-react-app-9e44bec2b5c2
- More information about CSS Modules: 
  - https://github.com/css-modules/css-modules