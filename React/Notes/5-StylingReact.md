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