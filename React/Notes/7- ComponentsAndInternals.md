# Section 7: Diving Deeper Into Components & React Internals
____
## 84. Module Introduction

Now that we have a grasp on the core features and basics we can dive deeper into components

These are the biggest feature of the react library so it is important that we understand how they work




____
## A Better Project Structure

From our starting project lets improve it
So far we only have 2 components 
- App which contains state and our content
- Persons which loads person item to the page

While our page works as intended and as it should we can still tweak it behind the scenes so it is easier to build on in the future
One thing we can do is split our application into more components

The decisions have to make are what deserves to be it's own component and what decides if something should be in a particular component?

We can see that the ``` Person ``` component is pretty focused and only shows a single Person on the page and handles a click action
This one doesn't really need split up since it is already simple
If we wanted to add custom styling into the paragraph that is shown and pass values into it we might want to put that into a component but as is we don't need to worry about it

We can split up our App.jsx file since we are doing quite a bit there

In our render method we are rendering a list of Persons and we are rendering a button
Best practice is to keep App component as lean as possible and have little to no jsx in the return statement

One thing we could do here is create a Persons list component

Then we could pass an array into that component and inside of it we would do the mapping for persons to create each individual person
Then the output would be the entire list and we would only need to call the Persons list component in App.js

Another improvement we ould make is to outsource the upper section of the page (heading, paragraph, and button) to its own component

First let's get started on making a ``` Persons ``` component
Create folder/file ``` Persons.Persons.jsx ```

It is also a good idea to move our ``` Person ``` (singular) folder into our ``` Persons ``` (plural) folder
This nesting will make it easier to use and call our components since a Person is just a singular item within the Persons element
Don't forget to change your imports (VSCode might do this for you automatically)

We can go even further and create a 'components' folder which we will place all of our components in

Another folder we might have is an assets folder which would hold any images, logos, or media

Containers is another popular folder which would hold containers like App.js, App.css, and App.test (Go ahead and make that folder/move)

Now our app is restructured to:
- config
- node_modules
- public
- scripts
- src
  - assets
  - components
    - Cockpit
      - Cockpit.jsx (Heading, paragraph, button will go here)
    - ErrorBoundary
      - ErrorBoundary.jsx
    - Persons
      - Person
        - Person.css
        - Person.jsx
      - Persons.jsx
  - containers
    - App.css
    - App.jsx
    - App.test.js
  - index.css
  - index.js
  - registerServiceWorker.js
- .gitignore
- package-lock.json
- package.json
- README.md
- yarn.lock


Since we did a lot of moving around double check that all of our imports are still correct before continuing to the next lesson

At this point you can also remove all references to our ErrorBoundary as well (remove import, remove call, move key prop back to persons, remove folder and file)

We will continue to compartmentalize our app in the next lectures




____
## 86. Splitting an App Into Components

Now let's start filling ``` Cockpit.jsx ``` and ``` Persons.jsx ``` to give them functionality (starting with ``` Persons.jsx ```)

Persons is going to be a functional component since we don't plan on managing state in this component
```
const persons =  (props) => ()
```
We can do it in one line here without having to specify return although we can write inside () in multiple lines if we need
Inside of () we will add our jsx code

Don't forget your import statement
```
import React from 'react';
```

Then we can start adding functionality
Most of it already exists within App.js so we can take it from there and drop it in and adjust it as needed

The first thing we need is code where we map the persons array to individual persons elements, although we will need to make some adjustments
```
persons.map((person, index) => {
  return <Person 
    key={person.id}
    click={() => this.deletePersonHandler(index)}
    changed={(event) => this.nameChangedHandler(event, person.id)}             
    name={person.name} 
    age={person.age} />
})
```

We can paste this directly into our persons component but will use props to access the persons array

Since ``` props.persons.map(...) is normal js code we can even omit the () in our compnent call
```
const persons =  (props) => props.persons.map((person, index) =>
    return <Person 
      key={person.id}
      click={() => this.deletePersonHandler(index)}
      changed={(event) => this.nameChangedHandler(event, person.id)}             
      name={person.name} 
      age={person.age} />
  )
);
```

Now that we are calling the ``` <Person> ``` component we need to add Person to our import statment
```
import Person from './Person/Person';
```

Now we need to adjust 2 methods we are passing into our ``` <Person> ``` component the click method ``` deletePersonHandler() ``` and changed method ``` nameChangedHandler ```
Currently they both use this but because those functions are no longer in the same class this will not work
Instead we need to call ``` props.clicked ``` and ``` props.changed ``` then we will pass those methods in as props when we call the ``` <Persons> ``` component
```
const persons =  (props) => (
  props.persons.map((person, index) => {
    return <Person 
      key={person.id}
      click={() => props.clicked(index)}
      changed={(event) => props.changed(event, person.id)}             
      name={person.name} 
      age={person.age} />
  })
);
```

Now we are ready to export our component
```
export default persons;
```

Next we can take what was transfered out of App.jsx and instead replace it with a call to our Persons component
```
if (this.state.showPersons) {
  persons = (
    <div>
      <Persons />
    </div>
  );     
  btnClass.push(classes.Red);
}
```

Now we need to add an import statement for Persons
(You can also get rid of the import statement for Person)
```
import Persons from '../components/Persons/Persons';
```

Now we need to add our props into our ``` <Persons> ``` component (persons array,  clicked method, changed method)
```
<Persons 
  persons={this.state.persons}
  clicked={this.deletePersonHandler}
  changed={this.nameChangedHandler} />
```

Now we should have everything passed that we need to work
Make sure everything is saved before running in the browser
Everything should work as it did before but now the structure of our app is improved

Now we want to do the same for ``` Cockpit.jsx ``` and put our 'heading' area of our application in there

This 'Cockpit' will hold the heading, the paragraph, and the button

In ``` Cockpit.jsx ``` we will use a functional component since we don't need to manage any state
However we will use the multiline version since we will need to do a little more in our component

Do not forget to add import and export statements
```
import React from 'react'

const cockpit = (props) => {
  return ();
};

export default cockpit;
```

Now what do we want to do in here?
We want to take the heading, paragraph, and button and move them into our return
If we just copy paste them we will get an error because you cannot have multiple top level elements returned
In order to avoid this error we have to wrap everything in a wrapper div
```
const cockpit = (props) => {
  return (
    <div>
      <h1> Hello there!</h1>
      <p className={assignedClasses.join(' ')}>General Kenobi, you are a react app!</p>
      <button className={btnClass.join(' ')} onClick={this.togglePersonsHandler}>
        Toggle Name
      </button>
    </div>
    
  );
};
```

Now we see that thereis an ``` assignedClasses ``` and ``` btnClass ``` that we no longer have access to since we moved the out of App.jsx
We will need to copy/paste assignedClasses into our new component
```
const assignedClasses = [];

  if (props.persons.length <= 2) {
    assignedClasses.push(classes.red); // classes = ['red'];
  }

  if (props.persons.length <= 1) {
    assignedClasses.push(classes.bold); // classes = ['red', 'bold'];
  }
```
We can see that the if statements try to access the state which will not work
So we will need to pass these in as props instead
We also need to import our classes or we will not have access to the css needed for our styles
We don't want to reach out to App.css where the stles currently are so we will create ``` Cockpit.css ``` and copy/paste our styles into there
Since we only want these styles applied to buttons in the cockpit we can also add ``` .Cockpit ``` so that these styles are not applied on accident somewhere else
```
/* Cockpit.css */

.red {
  color: red;
}


.bold {
  font-weight: bold;
}

.Cockpit button {
  background-color: green;
  color: white;
  font: inherit;
  border: 1px solid blue;
  padding: 8px;
  cursor: pointer;

}


.Cockpit button:hover {
  background-color: lightgreen;
  color: black;
}

.Cockpit button.Red {
  background-color: red;
}

.Cockpit button.Red:hover {
  background-color: salmon;
}
```

Now we need to import the file
```
import classes from './Cockpit.css';
```

Then we can assign the ``` .Cockpit ``` class to our wrapper div
```
<div className={classes.Cockpit}>
```

We still need to set up the ``` btnClass ``` though
To do that we can take our btnClass toggle which is being done based on the status of ``` state.showPersons ```
We will need to move this logic to our Cockpit component
Remove the variable assignment for btnClass from App.jsx and remove the ``` btnClass.push(classes.Red); ``` line from App.jsx

In Cockpit.jsx we will again create a btnClass variable which will start as an empty string
```
let btnClass = '';
```

Then we have to add the logic for turning the button red we can use an if statement and check if showPersons is true (we will pass showPersons in as a prop)
If so then we will add the ``` .Red ``` class
```
  let btnClass = '';

  if (props.showPersons) {
    btnClass = classes.Red;
  }
```

Now we should be ready to add the Cockpit component to App.js

In App.js first import Cockpit component
```
import Cockpit from '../components/Cockpit/Cockpit';
```

Now in our return statement of App.js we can call our Cockpit element
However we still need to pass in the props that we use in the component
```
return (
      <div className={classes.App}>
        <Cockpit 
          showPersons={this.state.showPersons} 
          persons={this.state.persons} />
        {persons}
      </div>
    );
  }
```

Now our App.js is nice and leans and only contains a clean list of components and methods that directly alter the state
Save all files and check that it still works

It will not work because we did forget one thing in the button
```
<button className={btnClass.join(' ')} onClick={this.togglePersonsHandler}>
  Toggle Name
</button>
```

You can see we try calling ``` this.togglePersonsHandler ``` which we do not have access to
We need to replace this call with a prop and pass the method into our Cockpit component

Change button to:
```
<button className={btnClass.join(' ')} onClick={props.click}>
  Toggle Name
</button>
```

and in app.js pass in ``` this.togglePersonsHandler ```
```
<Cockpit 
  clicked={this.togglePersonsHandler}
  showPersons={this.state.showPersons} 
  persons={this.state.persons} />
```

Now if we load our page it should work as expected and is nice and organized

