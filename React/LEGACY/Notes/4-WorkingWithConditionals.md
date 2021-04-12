# Section 4: Working With Lists and Conditionals
____
## 52. Module Introduction
This section will help us create truly dynamic apps
We will learn how to do things only render certain html elements if a certain condition is true and output lists

One thing we could do is render the number of Person elements dynamically based on the number of state.persons




____
## 53. Rendering Content Conditionally
Back in App.js in our render method we output 3 different Persons elements with different values
We also have persons listed in our state

We could make it so that we create and output a persons element for each persons entry in our state and use the state entries data to fill in the Persons props

First lets work on our conditional statements so we can build up to that

Instead of switching names on our button click we will instead show or hide the persons we have listed on our dom

To do that we can wrap all of our Person elements in a div and we can choose to show or hide the contents within that div from the button push
```
<div>
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
```

Now we will change the method in our button to toggle our list of persons

We will have to change the method name and we can remove the arguments as well

```
<button 
  style={style} 
  onClick={this.togglePersonsHandler}>Toggle Name
</button>
```

Then we can create a new method called togglePersonsHandler
```
togglePersonsHandler = () => {    

}
```

Now to make our method work we will use a state property to determine whether we should show the list of persons or not (boolean called state.showPersons)

So let's add this state property
```
state = {
    persons: [
      {name: 'Max', age: 27},
      {name: 'Manu', age: 29},
      {name: 'Marcy', age: 26}
    ],
    showPersons: false
  }
```

Now in our div since it is just javascript code (even though it looks like js) we can wrap it in {} and use ternary expressions to toggle the contents of the div
Note that we cannot use an if statement block and must use a ternary expression

As a reminder on ternary expressions
 ``` conditional ? ifTrue : ifFalse ```
In our case we want to render our wrapper div and our list of persons so that will take the place of ``` ifTrue ```
Since we don't want anything to happen if showPersons is false we will simply put null in which case nothing will be output
```
{
  this.state.showPersons ? 
    <div>
      <Person 
        name={this.state.persons[0].name} 
        age={this.state.persons[0].age}>My Hobbies: Racing</Person>
      <Person 
        name={this.state.persons[1].name} 
        age={this.state.persons[1].age}
        changed={this.nameChangedHandler}>My Hobbies: Racing</Person>
      <Person 
        name={this.state.persons[2].name} 
        age={this.state.persons[2].age}>My Hobbies: Racing</Person>
    </div> : null
}
```
Something to consider is that ``` this.state.showPersons ``` could also be a method that returns true or false to determine if the div should show or not

Now if we run our react app we won't see our list of persons (unless we switch state manually in our code in which case they will show again)

The last thing we need to do is fix our togglePersonsHandler to correctly toggle the state between true and false
One way we can do this is by using the following thinking
We can create a new variable which will be set equal to the current value of showPersons
Then we will use setState to change the value of showPersons to be the opposite of doesShow
```
togglePersonsHandler = () => {
  const doesShow = this.state.showPersons;
  this.setState({showPersons: !doesShow})
}
```
Now when we click our button it toggles the list of people on and off!
Keep in mind that setState does not overwrite the entire state and only the updated status of showPersons is merged to state

Another thing to note is that if you inpsect the page before and after clicking the button then you can see that the html for our Persons components is missing entirely when showPersons is false
This means that those divs aren't just hidden but they do not exist at all which is an important distinction




____
## 54. Handling Dynamic Content "The JavaScript Way"

One thing from our last lessoon is that our ternary operation worked in this insance but is not the most optimal way
It can get pretty messy when things get nested and start to get confusing quickly
Instead in this lesson we will cover a different way
Let's go back to just having our wrapping div with the children Persons elements

```
<div>
  <Person 
    name={this.state.persons[0].name} 
    age={this.state.persons[0].age}>My Hobbies: Racing</Person>
  <Person 
    name={this.state.persons[1].name} 
    age={this.state.persons[1].age}
    changed={this.nameChangedHandler}>My Hobbies: Racing</Person>
  <Person 
    name={this.state.persons[2].name} 
    age={this.state.persons[2].age}>My Hobbies: Racing</Person>
</div>
```

Now an important thing to keep in mind is that when the screen is refreshed we are returning jsx inside of a render statement
When react needs to update the screen this render statement does run everything inside of it not just the return statement

So we can create a method inside of our render method that will execute before we returns something

lets create a variable called persons which will initially be set to null
Then we can create an if statement inside of that if statement we will say that if showPersons is true then we will update the value of the persons variable from null to be the wrapping div and person elements from before
Then instead of having the div and person elements that were just assigned to the person variable in our return statement we can simply return the person variable after the button

```
render() {

  const style={
    backgroundColor: 'white',
    font: 'inherit',
    border: '1px solid blue',
    padding: '8px',
    cursor: 'pointer' 
  };

  let persons = null;

  if (this.state.showPersons) {
    persons = (
      <div>
        <Person 
          name={this.state.persons[0].name} 
          age={this.state.persons[0].age}>My Hobbies: Racing</Person>
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

  return (
    <div className="App">
      <h1> Hello there! General Kenobi, you are a react app</h1>
      <button 
        style={style} 
        onClick={this.togglePersonsHandler}>Toggle Name
      </button>
      {persons}
    </div>
  );
}
```
Now when our page is displayed it will look for the value of state.showPersons and if it is true will fill persons with a list of person elements
(if it is false then persons will remain null)
Then when our page is displayed it will display the content of the persons variable (being either a list of person elements or a null and nothing is displayed there)

This is the prefered way of outputting dynamic content like this




____
## 55. Outputting Lists (intro)

Now that we know how to output content conditionally we want to render our list of persons in a dynamic way
Since we have a state with a persons object we should use that as our "source of truth" and only have Person elements that correlate with that state.persons object

The next lectures will cover utilizing lists to make our app much more dynamic and flexible and allow us to address each Person element more individually




____
## 56. Outputting Lists
if we look we can see that we have 3 elements in our state.persons array
We can use this as a list to create new Person elements

How would we go about doing that?
Just like we did with conditional statements we can take a similar approach with our list within our if statement

javascript has a built in function (.map) which allows us to map every element in a given array (like state.persons) into something else
It does this by executing a provided method on each element in an array (this method is passed into the map method)
```
this.state.persons.map(person => { 

  return (What this person item should become)
})

// this.state.persons => the array we will be doing stuff to
// .map the method we are using to do this
// (person) what we will call each element in the array (can be whatever you want)
// {} Inside of these we will put our method that we will perform on each person element
```
Since we are putting this in a jsx object we need to include it in {} so it is executed as js so in the end it should look like:
```
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map(person => {
        return
      })}
      <Person 
        name={this.state.persons[0].name} 
        age={this.state.persons[0].age}>My Ho bbies: Racing</Person>
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

We can use this to take each item in the persons array and return it as a person component and use the attributes of each person as props in the component

This is easy to do all we have to do is follow the same pattern we did before
(We can also get rid of our hardcoded person element calls)
```
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map(person => {
        return <Person 
          name={person.name} 
          age={person.age} />
      })}
    </div>
  );
}
```
Note this will disable the ability to change the name for the one that we were able to before
This is because we don't have the event handler attached anymore but we can re-add that soon




____
## 57. Lists & State
In our last lecture we did end with an error called a key warning which we will touch on later
First we want to see how we can manipulate this array

To do that let's add a new click listener
We already have one click event that can happen in our Person element but we aren't passing a 'click' method into props to be called when it is clicked (previously was switchNameHandler which can now be removed from the application entirely)

Instead we will add a new handler called ``` deletePersonHandler ```
This will delete the person from our array of persons when it is clicked
We will have to pass this method into our props in our if statement where we are generating our Person elements and passing in name and age
In order for this to work though we will have to pass another argument into our map function which is available called index
Then we can pass in the index toour deletePersonHandler to ensure that it executes on the correct person
In order to pass in this argument we will need to use a trick we did from previous lessons where we put the method after () => so that it doesn't execute when we pass in an argument
When updated our if statement should look like this:
```
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map((person, index) => {
        return <Person 
          click={() => this.deletePersonHandler(index)}
          name={person.name} 
          age={person.age} />
      })}
    </div>
  );
}
```

Now in our deletePersonHandler method we need to be able to accept the index argument
Now in our method we will first fetch the current list of persons
Then we will use the splice method to remove 1 item from the array starting at the index we passed in (so deleting the item at the index that was passed in)
Then we will use setState to update the state with our new persons array
```
deletePersonHandler = (personIndex) => {
  const persons = this.state.persons;
  persons.splice(personIndex, 1);
  this.setState({persons: persons});
}
```
You may be wondering why we can update a const persons
This is because arrays are referential data types as discussed in some of the early lectures
This means that it is still the same array just one or some of the values inside may have changed but the same point in memory is being referenced still which is what const refers to

There is one flaw with this approach that we will fix in the next lecture




____
## 58. Updating State Immutably
Since arrays are referential and when we assign const person to this.state.persons we are calling splice which is being performed on the original persons object from when our app was first ran
Then we setState to persons to be equal to itself since new variable const persons is referencing the original persons
We never actually created a new array to manipulate and then use to update our state afterwords

In order to do that we have to use the slice method with no arguments when assigning our const persons variable
```
deletePersonHandler = (personIndex) => {
  const persons = this.state.persons.slice();
  persons.splice(personIndex, 1);
  this.setState({persons: persons});
}
```
Now when we call splice we are actually performing it on a new copy of state.persons but the original state.persons is unaffected
Furthermore our update fuses the original state.persons with our copy instead of itself

The other option is to use the spread operator to create a new array
instead of using splice we could have set persons equal to a new array with the spread operator called on state.persons to fill the array
This would have made a copy of state.persons that could be manipulated without affecting the original state.persons
```
  deletePersonHandler = (personIndex) => {
    const persons = [...this.state.persons];
    persons.splice(personIndex, 1);
    this.setState({persons: persons});
  }

```

The lesson to take away is to always update state in an immutable fashion first
That means to create a copy of state, edit the copy, then use setState to merge the copy into the original




____
## 59. Lists & Keys

Now we are able to run some code which runs on specific elements

We want to fix the error message we are getting about the ``` key ``` prop
This is a property we should add when rendering lists of data
This is something that should be specified when we are calling the Person element and is a default tag available

Normally if we were dealing with real data from a database or something we would likely have a unique key we could point to here instead but since we do not and name is not guaranteed to be unique we can add simply add a new property called id and fill it with random keystrokes or something
Then we will point our key at this id

```
state = {
  persons: [
    {id: 'lwkvciw', name: 'Max', age: 27},
    {id: 'mv0wvo2', name: 'Manu', age: 29},
    {id: 'q2v021n', name: 'Marcy', age: 26}
  ],
  showPersons: false
}
...
render(){
  ...
  if (this.state.showPersons) {
    persons = (
      <div>
        {this.state.persons.map((person, index) => {
          return <Person 
            key={person.id}
            click={() => this.deletePersonHandler(index)}
            name={person.name} 
            age={person.age} />
        })}
      </div>
    );
  }
}
```

Now we know that each element will have a unique key which will allow react to better keep track of dom changes and only update what it needs to

We should also notice that our key warning is gone in our application




____
## 60. Flexible Lists

Now we still have the input with the changeHandler that allows us to change the displayed name
Now that we are using a lits and have dynamic content we are able to handle this on an individual basis

Before we were using the changed prop to pass in a method to do this
Lets pass in that same method through the prop when constructing our Person element
We will also want to pass in the event (which will give us access to event.target.value) as well as the person.id so we can be sure to target the correct person when making our updates
```
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
```

Then in our nameChangedHandler we want to be sure we are receiving the id
Then we want to create a new variable to help target the person we want to make the change on
To do this we will use the ``` .findIndex() ``` method
This is a js method that takes a function as an input and execute the function on every element in the array 
The function we execute will just check if the id of the current element matches the id that was passed into nameChangedHandler and if so it returns the index of that object
```
const personIndex = this.state.persons.findIndex(p => {
  return p.id == id;
});
```

Then we can then access the person themselves by using the index that was returned to us on state.persons
```
const person = this.state.persons[personIndex];
```

The only issue with this is the same that we discussed about manipulating state immutably and referential variables
If we were to make a change to person we would be making a change directly to the state
Instead we want to create a new person object using the spread operator, make our changes there, and then merge those changes to the state

```
const person = {
  ...this.state.persons[personIndex];
}
```

Note an alternative method is to use the Object.assign method to create a new object instance using state.persons
```
const person = Object.assign({}, this.state.persons[personIndex])
```

Now we want to update the person name since we aren't updating the original and we are updating a copy
We can use event.target.value just like before
```
person.name = event.target.value;
```

Now we can get the latest copy of our state
```
const persons = [...this.state.persons]
```

Then we can use the index to find the appropriate person again and update it with the new value for person
```
persons[personIndex] = person;
```

Now we have an updated persons array that we can pass through setState to update the state
```
this.setState({ persons: persons });
```
Final nameChangedHandler:
```
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
```

Now if we save and run our app we can click the button to toggle the list, type in any of the input boxes to change the displayed name, or click any of the boxes to delete the box without any errors
Our app is working :)
```
// App.js:
import React, { Component } from 'react';
import './App.css';
import Person from './Person/Person.js'

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

    const style={
      backgroundColor: 'white',
      font: 'inherit',
      border: '1px solid blue',
      padding: '8px',
      cursor: 'pointer' 
    };

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

    return (
      <div className="App">
        <h1> Hello there! General Kenobi, you are a react app</h1>
        <button 
          style={style} 
          onClick={this.togglePersonsHandler}>Toggle Name
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
// Person.js
import React from 'react';
import './Person.css';

const person = (props) => {
  return (
    <div className="Person">
      <p onClick={props.click}> I'm {props.name} and I am {props.age} years old!</p> 
      <p>{props.children} </p>
      <input type="text" onChange={props.changed} value={props.name} />
    </div>
    
  )
};

export default person;
```




____
## 61. Wrap Up
This module covered conditionally outputting content and outputting lists
To briefly summarize:
We learned that we should output content conditionally using js
We can do that with ternary expressions but the better approach is to create variables that are output in our return and adjusted with if statements
If we want to render lists we should use the .map method
Don't forget that .map not only gives you the element but also the index of the element
We learned that you should always include key when outputtting lists of data so that React can know which elements need updated and which can be ignored




____
## Assignment 2: Time to Practice - Lists & Conditionals
(Create a new app for this assignment)

Lists and conditional content are key features of any web app and it's therefore crucial that you understand how to work with both concepts. Time to practice it!

Foolow the instuctions explained in the problem video and try to implement a solution on your own
Compare it to the teacher solution (video + downloadable files available in course)

You'll also need to transform a string into a real array and then join it back into a string again to complete task 5 of the assignment

You can split a string into an array of its characters with the ``` split('') ``` method
By pasing just an empty string it's split after every character

You may the re-create a string from that array by using ``` join('') ``` here we join with an empty string as the separator

Questions for this assignment
1. What did you find most challenging and how did you overcome the challenge?

Video:
- 1. Create an input field (in App component) with a change listener which outputs the length of the entered text below it (e.g. in a paragraph)
  - Use state to store/display this length
- 2. Create a new component (=> ValidationComponent) which receives the text length as a prop
  - This prop can be fetched from the state
- 3. Inside the ValidationComponent, either output "text too short" or "text long enough" depending on the length (e.g. take 5 as a minimum length)
  - inside of ValidationComponent we shouldn't have to mess with state at all
- 4. Create another component (=> CharComponent) and style it as an inline box (=> display: inline block; padding: 16px; text-align: center; margin: 16px; border: 1px solid black;)
  - Example styling provided but it doesn't have to be just like this
- 5. Render a list of CharComponents where each CharComponent receives a different letter of the entered text (in the initial input field) as a prop
  - 1 CharComponent per character entered
- 6. When you click a CharComponent it should be removed from the entered text
  - Recommended to set up 2 way binding so the input field changes to match when a character is deleted

Hint: Keep in mind that js strings are basically arrays!

### My Solution:
```
// App.js
import React, { Component } from 'react';
import './App.css';
import Validation from './ValidationComponent/ValidationComponent.js';
import CharComp from './CharComponent/CharComponent.js';

class App extends Component {
  state = {
    textLength: 0,
    textValue: ""
  }

  inputChangedHandler = (event) => {
    const newLength = event.target.value.length;
    const newValue = event.target.value;
    this.setState({
      textLength: newLength,
      textValue: newValue
    });
  }

  deleteCharHandler = (charIndex) => {
  
    const stateCopy = {
      ...this.state
    };

    let textValueArray = stateCopy.textValue.split('');
    textValueArray.splice(charIndex, 1);
    stateCopy.textValue = textValueArray.join('');
    
    this.setState({textValue: stateCopy.textValue})
  }


  render() {
    let charCompList = null;

    if (this.state.textValue) {
      let stateCopy = {
        ...this.state
      }

      const charArray = stateCopy.textValue.split('');

      charCompList = (
        <div>
          {charArray.map((el, index) => {
            return <CharComp 
              click={() => this.deleteCharHandler(index)}
              charEl={el} />
          })}
        </div>
      );


    }

    return (
      <div className="App">
        <input type="text" onChange={(event) => {this.inputChangedHandler(event)}} value={this.state.textValue} />
        <p>{this.state.textLength}</p>
        <Validation length={this.state.textLength} />
        {charCompList}
      </div>
    );
  }
}

export default App;

```

```
// ValidationComponent.js
import React from 'react';

const validation = (props) => {

  return (
    <div className="Validation">
      {
        props.length > 5 ? <p> Text long enough</p> : <p> Text too short</p>
      }
    </div>
  )
}

export default validation;
```

```
// CharComponent.js
import React from 'react';

const charComponent = (props) => {
  const style = {
    display: "inline-block", 
    padding: "16px",
    textAlign: "center",
    margin: "16px", 
    border: "1px solid black"
  };

  return (
    <div className="CharChomponent" style={style} onClick={props.click}>
      <p>{props.charEl}</p>
    </div>
    
  )
}

export default charComponent;
```




____
## 62. [OPTIONAL] Assignment Solution

- 1. Create an input field (in App component) with a change listener which outputs the length of the entered text below it (e.g. in a paragraph)

First we have to create the input box that will be used which can be added directly to the app component
```
<input type="text" onChange={this.inputChangedHandler} value={this.state.userInput} />
```

Then we must create a method to handle our onChange event and update our value 
```
inputChangedHandler = (event) => {
  this.setState({userInput: event.target.value});
}
```

We will also want to get started on setting up our state
```
state = {
  userInput: ''
}
```

Then we must output the length of our string below our input box
```
<p> {this.state.userInput}</p>
// I realize this doesn't follow the instruction yet but this is what the teacher did
```
- 2. Create a new component (=> ValidationComponent) which receives the text length as a prop
Now create folder/file ``` ValidationComponent/ValidationComponent.js ``` 
Make sure to create a new function called validation, import react, return something, and export our method
```
import React from 'react';

const validation = (props) => {
  return (
    <div>
      <p>Text too short</p>
    </div>
  )
}

export default validation;
```

Then we can import this component into app
```
import Validation from './ValidationComponent/ValidationComponent.js';
```

Then we can add our new component under our ``` <p> ``` tag and pass in our length as a prop
```
<Validation inputLength={this.state.userInput.length}/>
```

- 3. Inside the ValidationComponent, either output "text too short" or "text long enough" depending on the length (e.g. take 5 as a minimum length)
Inside Validation component add another ``` <p> ``` tag for 'text long enough'
Then we have to decide which one of those p tags to show
We can use a ternary expression to do this since it is something simple
```
<div>
  {
    props.inputLength > 5 ?
      <p>Text Long enough</p> :
      <p>Text too short</p>
  }
</div>
```

For practice here is the other approach:
Outside of our return statement in ValidationComponent create a new variable to hold our validation message
Then use an if statement to change validationMessage as needed based on length of props.inputLength
```
let validationMessage = 'Text long enough';
if (props.inputLength <= 5) {
  validationMessage = 'Text too short';
}
```
Then we can just input validationMessage into our ``` <p> ``` tag by itself
```
<p>{validationMessage}</p>
``` 
- 4. Create another component (=> CharComponent) and style it as an inline box (=> display: inline block; padding: 16px; text-align: center; margin: 16px; border: 1px solid black;)

Create a new folder/file called ``` CharComponent/CharComponent.js ```
Add our compnent function, import, export, and return statements
Add a const variable for style with styling options
Add styling to div in return statement 
```
import React from 'react';

const char = () => {
  const style = {
    display: 'inline-block',
    heading: '16px',
    margin: '16px',
    border: '1px solid black',
    textAlign: 'center'
  };

  return (
    <div style={style}>

    </div>
  )
}

export default char;
```

Import our new component to our main app

```
import Char from './CharComponent/CharComponent.js';
```

- 5. Render a list of CharComponents where each CharComponent receives a different letter of the entered text (in the initial input field) as a prop
Now under our validation we will render a variable ``` charList ``` which we will define in our render method above our return statement
When we define this charList we will perform the .map() method on state.userInput so that we can perform an action on each character
For each character we will return a Char component and pass in the current character as a prop
```
const charList = this.state.userInput.map((ch)=>{
  return <Char character={ch} />;
});

return(
  ...
  <Validation inputLength={this.state.userInput.length} />
  {charList}
);
```

One issue that we hit at this point is calling .map() on a string
To fix this we can call .split('') before we call .map to convert our string into an array
```
const charList = this.state.userInput.split('').map((ch)=>{
  return <Char character={ch} />;
});
```
Then in our CharComponent we have to make sure we are receiving props and then output props.character inside our div

Next we will fix our key error it is not optimal but better than no solution but we can pass the index as well with our map function and use that as a key when creating our Char components
```
const charList = this.state.userInput.map((ch, index)=>{
  return <Char character={ch} key={index} />;
});
```
- 6. When you click a CharComponent it should be removed from the entered text
Now we need to add a new method in our app component called ``` deleteCharHandler ```
it will receive an index so it knows which character to target
We will also have to add the clicked property to our Char component contstructor
```
const charList = this.state.userInput.map((ch)=>{
  return <Char character={ch} key={index} clicked={() => this.deleteCharHandler(index)} />;
});
```

Now to add the clicked prop to our CharComponent
```
return (
    <div style={style} onClick={props.clicked}>
      {props.character}
    </div>
  )
```

Next we can work on the actual method to delete the correct char
We will first want to get a copy of our text from our state and store it as an array
Then we want to remove a character with splice at the index position
After that we will fuse our array back into a string and update the state
```
deleteCharHandler = (index) => {
  const text = this.state.userInput.split('');
  text.splice(index, 1);
  const updatedText = text.join('');
  this.setState({userInput: updatedText});
}
```
Now our app should work as expected since we already set up 2 way binding in our input at the very beginning of the lesson

### Teacher Solution:
```
// App.js
import React, { Component } from 'react';
import './App.css';
import Validation from './ValidationComponent/ValidationComponent.js';
import Char from './CharComponent/CharCompnent.js';

class App extends Component {

  state = {
    userInput: ''
  }

  inputChangedHandler = (event) => {
    this.setState({userInput: event.target.value});
  }

  deleteCharHandler = (index) => {
    const text = this.state.userInput.split('');
    text.splice(index, 1);
    const updatedText = text.join('');
    this.setState({userInput: updatedText});
  }

  render() {
    const charList = this.state.userInput.split('').map((ch, index)=>{
      return <Char character={ch} key={index} clicked={() => this.deleteCharHandler(index)} />;
    });
    return (
      <div className="App">
        <input type="text" onChange={this.inputChangedHandler} value={this.state.userInput} />
        <p> {this.state.userInput}</p>
        <Validation inputLength={this.state.userInput.length} />
        {charList}
      </div>
    );
  }
}

export default App;
```
```
// ValidationComponent.js
import React from 'react';

const validation = (props) => {
  let validationMessage = 'Text long enough';
  if (props.inputLength <=5) {
    validationMessage = 'Text too short';
  }
  return (
    <div>
      <p>{validationMessage}</p>
    </div>
  )
}

export default validation;
```
```
// CharComponent.js
import React from 'react';

const char = (props) => {
  const style = {
    display: 'inline-block',
    heading: '16px',
    margin: '16px',
    border: '1px solid black',
    textAlign: 'center'
  };

  return (
    <div style={style} onClick={props.clicked}>
      {props.character}
    </div>
  )
}

export default char;
```


____
## 63. Useful Resources & Links

Conditional Rendering: https://reactjs.org/docs/conditional-rendering.html
Lists & Keys: https://reactjs.org/docs/lists-and-keys.html
