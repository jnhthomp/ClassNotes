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




____
## 87. Comparing Stateless and Stateful Components
Now that our app is optimized we are going to discuss stateful vs stateless and presentational vs container component

Stateful components means components that manage state within them
An example of this in our code is App.jsx
A functional component that manages its own state with use state would also be a stateful component

Presentational (dumb or stateless components) have always been functional components
This is because until React 16.8 they could not manage state
Presentational components are functional components that does not manage state
You want to have many presentational components in your app
Cockpit.jsx is an example of a presentational component in our app

Why do you want many presentational (and few stateful) components in our app?
By splitting the app into containers (stateful) and presentational components (stateless) you keep the app more manageable
This is because there is a predictable flow of data
You can tell where state changes are going to be and you can know that the other components are only there to render a nice user interface




____
## 88. Class-Based vs Functional Components
With class based and funcntional components it is important to now which component can do what and when to use them

- Class based components
  - contain ``` class XY extends Component ```
  - Have access to state
  - Have access to lifecycle hooks (discussed later this section)
  - Access state and props via ``` this. ``` keyword
- Functional components
  - contain ``` const xy = (props) => {...} ```
  - Access to state w/ ``` useState() ``` (has limitations)
  - Does not have access to lifecycle hooks
  - Access to props as any other variabe

When working with state or need lifecycle hooks use the classbased approach 
If you are in a project with react hooks it is not as simple
You may want to use functional components only but you can also split it to have a separation between components that use state management and components that don't

``` <Sidenote> ```
  this.props is discussed  as being necessary for class based components to access their props but we haven't seen this in action 
  (since all of our components are functional besides App.js)
  We can see this in action by passing a prop into our ``` <App /> ``` component
  To do this go to ``` index.js ``` (this is where our ``` <App> ``` component is called)
  Then in the ``` <App> ``` element we can add an ``` appTitle ``` and a string
  ```
  ReactDOM.render(<App appTitle="Hello there!" />, document.getElementById('root'));
  registerServiceWorker();
  ```
  Then in App.js we can access this appTitle by using ``` this.props.appTitle ```
  We can forward this prop into the ``` Cockpit ``` module by passing it in as a prop there
  ```
  <Cockpit 
    title={this.props.appTitle}
    clicked={this.togglePersonsHandler}
    showPersons={this.state.showPersons} 
    persons={this.state.persons} />
  ```
  
  Now in our Cockpit component we can access this title

  ```
  return (
    <div className={classes.Cockpit}>
      <h1> {props.title}</h1>
      <p className={assignedClasses.join(' ')}>General Kenobi, you are a react app!</p>
      <button className={btnClass} onClick={props.clicked}>
        Toggle Name
      </button>
    </div>
    
  );
  ```
  Now when we run our app we should have the title being passed all the way from index.js 
``` </Sidenote> ```

TLDR; Always use functional components UNLESS one of the following is true:
  - You need to manage state (has exceptions)
  - You need access to lifecycle hooks
  - You cannot (or don't want to) use React hooks

  ____
  ## 89. Class Component Lifecycle Overview

Last lecture mentioned the component lifecycle but we haven't talked about that
What is it?
One thing to note is that it is only available in class based components (there is a functional component equivelant that is not quite the same that will be discussed later in this module)

There are a set of methods that come with react ``` { component } ``` class
Each one will execute at different points and are used to do specific things (such as fetch data from the web or do some cleanup work before a component is removed from the dom)

We have seen a couple of them before but here is the list
- constructor()
- getDerivedStaetFromProps()
- shouldComponentUpdate()
- getSnapshotBeforeUpdate()
- componentDidUpdate()
- componentDidCatch()
- componentDidMount()
- componentWillUnmount()
- render()

How can we use them and in which order do they execute?
- Component Lifecycle
  - Creation
    - ``` constructor(props) ``` executes on component creation
      - This is not technically a React Lifecycle hook, it is a default ES6 class feature but it receives the props of the component AND you have to call ``` super(props) ``` in the constructor if you add it. You don't have to add it just to make that call. You only have to do this if you want your own logic in the constructor
      - It exists for basic initialization work (such  as setting a state)
      - You should NOT cause 'side-effects' (things like sending http request or storing something in local storage of browser or sending google analytics)
        - This is because you will hinder performance by causing unnecessary re-render cycles
    - ``` getDerivedStateFromProps(props, state) ``` runs after constructor is complete
      - This allows you to sync your state to your props when they change (very rare cases)
      - Still do not cause any side effects
    - ``` render() ``` prepare and structure your JSX code
      - Still do not cause any side effects
      - If you render any child components then these child components will also run any of their lifecycle hooks 
      - Only once all child components have finished rendering and completed their lifecycle hooks will this ``` render() ``` method will end
    - ``` componentDidMount() ``` called after render is complete
      - important and used a lot with classbased components
      - This is where you CAN cause side effects like make http requests
      - But do NOT update state as this will trigger a re-render
        - If you need to change state based on the response of an http request you can save that value and update the state with it later




____
## 90. Component Creation Lifecycle In Action

Back in our Application we will go to App.jsx which is a class based component so we can access these lifecycle hooks

The first thing that we will execute is the constructor which will receive some props
Don't forge to add ``` super(props); ``` inside!
Inside the constructor we can do something simple like a ``` console.log('[App.js] constructor') ```
We can also assign our state here in the constructor
The way we were doing it is just a more modern syntax which will end up doing the same thing we are but if you have a constructor anyway then you might as well initialize your state in it
(note I am not going to move state to the constructor in the actual project I am just putting it in the example below so you can see how it is done)
```
class App extends Component {

  constructor (props) {
    super(props);
    console.log('[App.js] constructor')
    this.state = {
      persons: [
        {id: 'lwkvciw', name: 'Max', age: 27},
        {id: 'mv0wvo2', name: 'Manu', age: 29},
        {id: 'q2v021n', name: 'Marcy', age: 26}
      ],
      showPersons: false
    }
  }
...
```

Now we know that the next thing that happens is ``` getDerivedStateFromProps() ``` runs
We can add that below our constructor
This is a 'static' method so we have to add the 'static' keyword in front of it
We will pass in both ``` props ``` and ``` state ``` as arguments
Inside we will do a simple ``` console.log('[App.js] getDerivedStateFromProps', props, state) ```
Then we also must return the state (normally we would be updating the state with values in props so returning the updated state is to help that)
```
static getDerivedStateFromProps(props, state){
  console.log('[App.js] getDerivedStateFromProps', props, state)
  return state;
}
```

Next the ``` render() ``` method will execute
We already have that but we can add a console.log to it for this example
At this point all of our Persons, Person, and Cockpit components would also run and be rendered
If they were class based components they would go through the same lifecycle
We can still add a ``` console.log ``` to our Persons component
This one will take some adjusting because we have to move from the 'single-line' syntax we were using to wrapping our method in curly braces and declaring our return statement
```
const persons =  (props) => {
  console.log('[Persons.js] rendering...');
  return props.persons.map((person, index) => {
    return (
      <Person 
        key={person.id}
        click={() => props.clicked(index)}
        changed={(event) => props.changed(event, person.id)}             
        name={person.name} 
        age={person.age} 
      />
    );
  });
};
```
Next we can add a ``` console.log() ``` to our ``` Person.jsx ``` component
```
console.log('[Person.js] render');
```

After all of these components have finished rendering and loading our next method will run which is ``` componentDidMount() ```
Here we can make our http requests but for now we will just make another ``` console.log() ```
```
componentDidMount(){
  console.log('[App.js] componentDidMount')
}
```

Now if we load our page and click our button you can see that it runs each of these in the order that was discussed [App.js]constructor => [App.js]getDerivedStateFromProps=>[App.js]render=>[Persons.js]rendering...=>[Person.js]render=>[Person.js]render=>[Person.js]render

There are also some 'discontinued' or old methods that are available as well and while you can still use them they were rarely used or used incorrectly so while they still work (at least for now) they aren't common
One of these is called ``` componentWillMount() ``` which goes right before ``` componentDidMount ``` 
It is difficult to describe exactly what goes in here but it was things like preparing state or something which is generally done in other places now
```
componentWillMount(){
  console.log('[App.js] componentWillMount');
}
```

Another thing to keep in mind is that accessing the render method doesn't cause the real dom to be rendered it just causes react's virtual dom to re-render to decide if it needs to update the dom




____
## 91. Component Update Lifecycle (For Props Changes)
Just like we have a lifecycle for creating components there is also one for updating components
When Props or state change there is a trigger for components to be re-evaluated by react to determine if they need re-rendered or not
This life cycle is the update lifecycle It 

- Component Lifecycle
  - Update
    - ``` getDerivedStateFromProps(props, state) ``` is the first to execute on component update
      - used to initialize state of a component that is updating based on props you are getting
      - This could be form control which gets external properties but internally handles user input but update the state based on outside changes
      -  We won't use this lifecycle hook very often because we very rarely need it
      - Sync state to props
      - Do NOT cause side-effects
    - ``` shouldComponentUpdate(nextProps, nextState) ``` allows you to cancel the updating process
      - you can decide whether or not React should continue to try to re-render to component
      - One reason to do this would be for performance reasons
      - This should be used carefully because you can break components if you are not careful and block updates from happening
      - Very powerful because it allows you to prevent unnecessary update cycles
      - Decide whether to continue with the update or not
      - Do NOT cause side-effects here
    - ``` render() ``` constructs virtual dom to evaluate to determine if it needs to update the real dom
      - prepare and structure jsx in here
      - Update child component props during this render
    - ``` getSnapshotBeforeUpdate(prevProps, prevState) ``` takes prevProps and prevState as input and returns snapshot object
      - niche lifecycle hook
      - last minute DOM ops like getting current scroll position of user
    - ``` componentDidUpdate() ``` signals that updates are done and that render method has been updated
      - Side effects are allowed here but be careful not to enter an infinite loop here
      - Do NOT update state (this will trigger re-render) [although this is fine to do as the result of an async request]

Now let's see these in practice
To do this we will convert Persons and Person to class based components instead of functional components just so we can use the lifecycle hooks

To do this we need to make a few changes (I am just going to comment out our current version so it is easy to revert back if needed)

Starting with Person.jsx
The first is our import statement
```
import React, { Component } from 'react';
```

Then we can create a new class that extends component with a render method that returns jsx inside
Simply pop our old code right inside and make sure you still have css imported and an export statement (uppercase now)
The last change is to change all of our ``` props.x ``` calls to ``` this.props.x ```
```
import React, { Component } from 'react';
import classes from './Person.css';

class Person extends Component {
  render(){
    console.log('[Person.js] render');
    return (
      <div className={classes.Person}>
        <p onClick={this.props.click}> I'm {this.props.name} and I am {this.props.age} years old!</p> 
        <p>{this.props.children} </p>
        <input type="text" onChange={this.props.changed} value={this.props.name} />
      </div>
    )
  }
}

export default Person;
```

Now convert the Persons componet as well following the same pattern
```
import React, { Component } from 'react';
import Person from './Person/Person';

class Persons extends Component {
  render(){
    console.log('[Persons.js] rendering...');
    return (
      <Person 
        key={person.id}
        click={() => this.props.clicked(index)}
        changed={(event) => this.props.changed(event, person.id)}             
        name={person.name} 
        age={person.age} 
      />
    );
  }
}

export default Persons;
```

Now that both of these are converted we can see the update lifecycle hooks for props in action
We can start in Persons.jsx
We need to add the ``` getDerivedStateFromProps(props, state) ``` again
Remember this is a static method so we have to include the 'static' keyword
It should also return state just like in the creation part of the lifecycle
```
static getDerivedStateFromProps(props,state){
  console.log('[Persons.js] getDerivedStateFromProps')
  return state;
}
```

Next we can add ``` shouldComponentUpdate(nextProps, nextState) ```
Something interesting about this one is we have to update true or false
Usually we would be comparing nextProps to something to determine whether or not we should update but we will simply return true for now
```
shouldComponentUpdate(nextProps, nextState) {
  console.log('[Persons.js] shouldComponentUpdate')
  return true;
}
```
At this point render should execute

The next lifecycle hookt to add is ``` getSnapShotBeforeUpdate() ```
Null (or a snapshot) must be returned by this method to not throw an error
```
  getSnapshotBeforeUpdate(prevProps, prevState){
    console.log('[Person.js] getSnapshotBeforeUpdate');
    return {message: 'Snapshot!'};
  }
```

Next ``` componentDidUpdate() ```
```
componentDidUpdate(prevProps, prevState, snapShot) { // snapShot = 'Snapshot!'
 console.log('[Persons.js] componentDidUpdate');
}
```

Now when we look at and run our app when we type something in the inputs (to make the persons/person component(s) update)
We can see follow the order in which these methods are activated when a component is updated

The hook that will be used most often is ```componetDidUpdate()```

____
## 91. Component Update Lifecycle (for State Changes)

Now to look at the lifecycle update for state changes
We can look at this in App.js since we update state there

After component did mount we can add ``` componentDidUpdate() ```
```
componentDidUpdate(){
  console.log('[App.js] componentDidUpdate');
}
```

Another we can add right before this is ``` shouldComponentUpdate() ```
One cool thing about this one is if we were to return false here then our components inside app wouldn't show even when we click the button because this method will stop it
```
shouldComponentUpdate(nextProps, nextState){
  console.log('[App.js] shouldComponentUpdate');
  return true;
}
```




____
## Component lifecycle full list:
- Component Lifecycle
  - Creation
    - ``` constructor(props) ``` executes on component creation
      - This is not technically a React Lifecycle hook, it is a default ES6 class feature but it receives the props of the component AND you have to call ``` super(props) ``` in the constructor if you add it. You don't have to add it just to make that call. You only have to do this if you want your own logic in the constructor
      - It exists for basic initialization work (such  as setting a state)
      - You should NOT cause 'side-effects' (things like sending http request or storing something in local storage of browser or sending google analytics)
        - This is because you will hinder performance by causing unnecessary re-render cycles
    - ``` getDerivedStateFromProps(props, state) ``` runs after constructor is complete
      - This allows you to sync your state to your props when they change (very rare cases)
      - Still do not cause any side effects
    - ``` render() ``` prepare and structure your JSX code
      - Still do not cause any side effects
      - If you render any child components then these child components will also run any of their lifecycle hooks 
      - Only once all child components have finished rendering and completed their lifecycle hooks will this ``` render() ``` method will end
    - ``` componentDidMount() ``` called after render is complete
      - important and used a lot with classbased components
      - This is where you CAN cause side effects like make http requests
      - But do NOT update state as this will trigger a re-render
        - If you need to change state based on the response of an http request you can save that value and update the state with it later
  - Update
    - ``` getDerivedStateFromProps(props, state) ``` is the first to execute on component update
      - used to initialize state of a component that is updating based on props you are getting
      - This could be form control which gets external properties but internally handles user input but update the state based on outside changes
      -  We won't use this lifecycle hook very often because we very rarely need it
      - Sync state to props
      - Do NOT cause side-effects
    - ``` shouldComponentUpdate(nextProps, nextState) ``` allows you to cancel the updating process
      - you can decide whether or not React should continue to try to re-render to component
      - One reason to do this would be for performance reasons
      - This should be used carefully because you can break components if you are not careful and block updates from happening
      - Very powerful because it allows you to prevent unnecessary update cycles
      - Decide whether to continue with the update or not
      - Do NOT cause side-effects here
    - ``` render() ``` constructs virtual dom to evaluate to determine if it needs to update the real dom
      - prepare and structure jsx in here
      - Update child component props during this render
    - ``` getSnapshotBeforeUpdate(prevProps, prevState) ``` takes prevProps and prevState as input and returns snapshot object
      - niche lifecycle hook
      - last minute DOM ops like getting current scroll position of user
    - ``` componentDidUpdate() ``` signals that updates are done and that render method has been updated
      - Side effects are allowed here but be careful not to enter an infinite loop here
      - Do NOT update state (this will trigger re-render) [although this is fine to do as the result of an async request]




____
## 93. Using ``` useEffect() ``` In Functional Components
Functional components don't have access to lifecycle hooks
So what if you want to execute code at a certain point during a functional components lifecycle?
To explore this we will be in Cockpit.jsx
We cannot add things like ``` componentDidMount() ``` but we can manage state with ``` useState() ```
One way to help give us access to some of these lifecycle is something called ``` useEffect() ```
In order to utilize this we have to import it from react much like a component
We need to change our import react statement to:
```
import React, { useEffect } from 'react';
```

Now we can cover the same functionality as normal lifecycle hooks with this one method
At the top of our component body we can add our useEffect method and pass an anonymous function into it
```
useEffect(() => {
  console.log('[Cockpit.js] useEffect');
});
```
Now whatever is inside the {} will  run everytime Cockpit.js component is re-rendered
If you need to send an http request it is perfectly fine to do so in here
``` useEffect() ``` can be described as ``` componentDidMount() ``` and ``` componentDidUpdate() ``` in one function

Some things like ``` useDerivedStateFromProps() ``` are not covered by ``` useEffect() ``` 
But that is ok because you should probably be using something like ``` useState() ``` for that




____
## 94. Controlling the ``` useEffect() ``` Behavior

Now how do we go about using ``` useEffect() ``` ?
It can be a little tricky because it compoines ``` componentDidMount() ``` and ``` componentDidUpdate() ``` and runs all the time

What if we did want to send an http request but only on the first time the component is rendered but not everytime it is re-rendered?
To simulate this we can use a ``` setTimeout() ``` function that will run for 1 second
 ```
useEffect(() => {
  console.log('[Cockpit.js] useEffect');
  setTimeout(() => {
    alert('I will deal with this jedi slime, myself!');
  }, 1000);
}); 
```
Imagine we are ok with showing this message when the page loads but not every other time the component loads
Right now we will get that message everytime the cockpit updates (or anything else for that matter since our app is not optimized)

One way to do this is we can add an argument after our function
this argument is an array that points at differnt data that will be used in ``` useEffect() ```
If we know we only want to run the method in useEffect if props.persons is updated then we can pass in ``` props.persons ```
```
useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    setTimeout(() => {
      alert('Saved data to cloud!');
    }, 1000);
  }, [props.persons]); 
```

If you have different functions that rely on different types of data then you can call useEffect again without issue
You can have as many useEffect methods as needed

Now we can toggle our list of persons as many times as we want but the pop up won't show anymore since ``` useEffect() ``` only runs when ``` props.persons ``` changes

Before we wanted to make it so this method would only run on page load
To do this we can simply pass in an empty array instead of ``` props.persons ```
```
useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    setTimeout(() => {
      alert('Saved data to cloud!');
    }, 1000);
  }, []); 
```

This tells react to only update this on page load and when this list of dependencies changes
If that list is empty then it will not be run again




____
## 95. Cleaning Up With Lifecycle Hooks & ``` useEffect() ```
What about cleanup work?
Lets start with the class based components first
We will start with Persons.js because it is a component that actually gets removed from the dom when we toggle the button
Let's say we want to cleanup some eventlisteners or something

To do this we can add ``` componentWillUnmount() ```
```
componentWillUnmount(){
  console.log('[Persons] componentWillUnmount');
}
```

Now if we add toggle our list of persons we can see this method activating in the console
In this method we could execute any code that needs to run right before the component is removed

If we were using hooks like in Cockpit.js we can also use ``` useEffect() ``` for this cleanup work
To do this
in the anonymous arrow function if you return a function this function will run after every render cycle
```
useEffect(() => {
  console.log('[Cockpit.js] useEffect');
  setTimeout(() => {
    alert('I\'ll kill that jedi slime, myself!');
  }, 1000);
  return () => {
    console.log('[Cockpit.js] cleanup work in useEffect')
  }
}, [ ]); 
```

We will not be able to see this console log because the Cockpit function is never removed

Just to make it so that we can see this we can go into App.js and add a new button to toggle the Cockpit element

In App.js first add the button
```
<button>Remove Cockpit</button>
```

Then add a showCockpit boolean (true) to our state
```
  ...
  showPersons: false,
  showCockpit: true
```

Now we need to add an onClick to our button with an anonymous function that will toggle the value of state.showCockpit
```
<button
  onClick={() => {
    this.setState({showCockpit: false});
  }}
>Remove Cockpit</button>
```

Now on our Cockpit element we can simply use a ternary operation to decide whether to show it or not
```
<button
  onClick={() => {
    this.setState({showCockpit: false});
  }}
>Remove Cockpit</button>
{this.state.showCockpit ? (
  <Cockpit 
    title={this.props.appTitle}
    clicked={this.togglePersonsHandler}
    showPersons={this.state.showPersons} 
    persons={this.state.persons} 
  />
): null }
```

Now when we click our 'Remove Cockpit' we can see the cleanup method being executed

If you pass an empty array then the method in side will only be run when it is rendered and the method returned by that method will only run when it is unmounted

Now we will add another useEffect call for a 2nd useEffect

```
useEffect(() => {
  console.log('[Cockpit.js] 2nd useEffect')
  return () => {
    console.log('[Cockpit.js] cleanup work in 2nd use effect')
  }
});
```
Notice that there is no argument watching any changed props so this will run every time the Cockpit.js component is re-rendered

This allows you to run a method no every update cycle (right before it is rendered)




___
## 96. Cleanup Work with ``` useEffect() ``` - Example
We had a look at the useEffect hook but there is one interesting change we can do to it
What if we removed the cockpit?
The alert still show (which is done in the Cockpit component)
We have the area to return code when that component unmounts so what if we cancelled the alert there before it shows if hidden fast enough?

We could do that by first storing our timer in a constant called ``` timer ```
Then in our return statement if we run ``` clearTimeout(timer) ``` it will cancel the alert at the end of the timer

```
useEffect(() => {
  console.log('[Cockpit.js] useEffect');
  const timer = setTimeout(() => {
    alert('I\'ll kill that jedi slime, myself!');
  }, 1000);
  return () => {
    clearTimeout(timer);
    console.log('[Cockpit.js] cleanup work in useEffect')
  }
}, []); 

``` 

Remove this code since it was added to the lesson retroactively and the code moving forward does not include it but it was worth mentioning




___
## 97. Using ``` shouldComponentUpdate() ``` For Optimization

Now we will look at an example of something that is wrong with our app as is

We currently have ``` shouldComponentUpdate() ``` in Persons.js but this always just returns true
This means that anytime anything is updated in Persons is re-rendered (ie everytime App rerenders it or right now everytime app re-renders)
Basically anytime App is re-rendered we are re-rendering every single persons component even though their values may not have changed and they do not need to be updated

For example if we were to Show our list of persons and then toggle the Cockpit to be off then all 3 of the person elements will each be re-rendered even though nothing in them changed
Also if we were to type in one of the persons then all 3 person elements will re-render instead of just the one that we typed in

To fix this we can add a check to see if we need to rerender the person component
```
shouldComponentUpdate(nextProps, nextState) {
  console.log('[Persons.js] shouldComponentUpdate');
  if(nextProps.persons !== this.props.persons) {
    return true;
  } else {
    return false;
  }
}
```

Now when we show our persons list then hide the cockpit we can see that '[Persons.js] shouldComponentUpdate' still runs but there is no sign of '[Persons.js] componentDidUpdate'
This means that the application saw we didn't need to update the component and skipped it, giving us better performance
If we type all 3 person elements are still rerendered but we could go in and do the same kind of thing to optimize more

One big thing to note is that when we make the comparison between ``` nextProps.persons !== this.props.persons ``` we are comparing 2 arrays
This is important because arrays are reference data types
This means that simply changing a value in the array is not enough so if the only difference is that we had updated the same array then the page would not rerender with the new values because the array is still the same array
The ony reason this works is because in App.jsx we create an entirely new person object
```
const person = {
  ...this.state.persons[personIndex]
}
```
...as well as an entirely new persons array...
```
const persons = [...this.state.persons];
```
So the arrays that we are comparing are actually entirely new arrays and not just the same arrays with updated values




___
## 98. Optimizing Functional Components With ``` React.memo() ```
Let's see how we can optimize functional components since ``` shouldComponentUpdate() ``` is only available to class based components

In our console we can see that Cockpit is rerendered when we type in one of the input boxes even though nothing changes
In order to prevent this and optimize we need to look at what the cockpit uses internally to trigger a refresh
The only thing that can do that is the length of .persons

In our Cockpit functional component we can wrap our export in ```React.memo()```
```
export default React.memo(cockpit);
```

This will do something called memo-ize this component
Only if the input of the component changes will it re-render
Otherwise if .persons does not change then the cockpit will not rerender

This still doesn't quite fix it since persons is different when typed in
Instead of passing in persons we can instead pass in persons.length since we don't really care about the content within persons for our cockpit
```
// In App.js
<Cockpit 
  title={this.props.appTitle}
  clicked={this.togglePersonsHandler}
  showPersons={this.state.showPersons} 
  personsLength={this.state.persons.length} 
/>
```

Now the cockpit will see that persons.length has not changed even though the value of persons did and won't update the Cockpit until persons.length is changed




___
## 99. When Should You Optimize?
So why not just add ``` shouldComponentUpdate() ``` and ``` React.memo() ``` to everything?
You will have components that always update when their parents update
If you are running these checks and the answer is always or usually yes then it may actually cost more performance to continually make that check than to just allow it to update as needed




___
## 100. PureComponents instead of ``` shouldComponentUpdate ```
If you want to use shouldComponentUpdate and just compare all props there is an easier way than using ``` shouldComponentUpdate ```

We wil demonstrate this in the persons component

We don't only have the persons attributes being passed into each person child component but you are also passing in a 'click' method and a 'changed' method
Let's pretend that we would want to update should the click or changed references update
Basically what we  really want to check is now:
```
if (nextProps.persons !== this.props.persons || 
    nextProps.changed !== this.props.changed || 
    nextProps.clicked !== this.props.clicked) {
  ...
}
```

Now if we had a bunch of props this could get cumbersome
There is a better way to do this

Instead of using `shouldComponentUpdate()` we can extend a different component called `PureComponent`
To do this update your React import statement in Persons.js
```
import React, { PureComponent } from 'react';
```

Then instead of extending `component` we will extend `PureComponent`

Now PureComponent will run as a normal component except with a `shouldComponentUpdate` that does a complete props check




___
## 101. How React Updates the DOM
How does React updates the 'real' dom? (the one you see)
When render is called it does not render something to the dom necessarily
It is providing a suggestion for what the html should look like in the end
If the result is the same as the current state of the dom then there will not be another rerender
Even if a prop changes if the resulting html would be the same the there is no rerender in the real dom 
To determine this react creates and compares 2 virtual DOMs
One is the old virtual dom an done is the re-rendered virtual dom or what the dom would contain if the rerender were to happen
React uses a virtual dom because it is faster than the wasted processing power of rerendering without changes
Even when there are differences react won't rerender the entire dom it will only rerender it in the parts that react detects have changes
For example if the text on a button changed it would only rerender the text and not the button

Why is this important?
Accessing and updating the dom is very slow and performance intensive
Ideally your app should update the DOM as little as possible




___
## 102. Rendering Adjacent JSX Elements

Now we are going to discuss something that was mentioned when we first started discussing components
Remember that all components that return jsx must return it all wrapped in a single div?
There is normally only allowed 1 root div per return

One thing to note though is that react will allow us to return an array of adjacent elements as long as they all have a key

We can see this in action in our person component
We want the wrapping div normally but for now let's get rid of it 
Then instead of returning 2 different p tags and an input we will return an array
Then we can seperate each element we are returning with a comma ,
```
return [
    <p onClick={this.props.click}> I'm {this.props.name} and I am {this.props.age} years old!</p>, 
    <p>{this.props.children} </p>,
    <input type="text" onChange={this.props.changed} value={this.props.name} />
];
```

Now if you save this it will technically work but we will get a warning because we never added a key

To do that we can simply add it and hardcode a unique key for each element in the array
```
class Person extends Component {
  render(){
    console.log('[Person.js] render');
    return [
        <p key="i1"onClick={this.props.click}> I'm {this.props.name} and I am {this.props.age} years old!</p>,
        <p key="i2">{this.props.children} </p>,
        <input key="i3"type="text" onChange={this.props.changed} value={this.props.name} />
    ];
  }
}
```

Now it will work without any issues or warning (although our styling is missing because our wrapping div provided styling)

This is only one way to do this but there are others

Another way to do this looks weird but is totally fine and built into react
You can create a wrapping component that does not output any html but is there to fulfill the requirement of having a wrapping element

You can create a new folder/file called src/hoc/Aux.js (windows users this will not work because of windows so name it Auxiliary.js instead)

(hoc stands for higher order component. This means basically components that wrap other components)

Now how do we set up the Aux component?
We import react like normal
```
import React from 'react';
```

Then for our component we receive props but only return the children of the component
```
const aux = (props) => props.children;
```
This component simply outputs whatever elements are put inbetween the opening and closing tags of the component

Now we just have to import this to Person.jsx and we can add the component to our return statement
```
import React, { Component } from 'react';
import classes from './Person.css';
import Aux from '../../../hoc/Aux';

class Person extends Component {
  render(){
    console.log('[Person.js] render');
    return (
      <Aux>
        <p key="i1"onClick={this.props.click}> 
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>
        <p key="i2">{this.props.children} </p>
        <input 
          key="i3"
          type="text" 
          onChange={this.props.changed} 
          value={this.props.name} 
        />
      </Aux>
    );
  }
}

export default Person;
```

This will work and is totally acceptable within react

We can technically remove the React import from our Aux.js since we are not returning any jsx and it will still work as it should




___
## 103. Windows Users Must Read
On Windows, the Aux.js  filename is not allowed in ZIP archives. 
Hence when extracting the attached source code, you might get prompted to rename the Aux.js  file. 
You might also face difficulties creating an Aux folder and Aux.js file.

I really apologize for that inconvenience, Windows is really doing an amazing job here ;-).

Follow these fixes:

1) Problems when unzipping the attached file:
Simply skip this step (e.g. by pressing "No") and ignore the upcoming error message.

- In the extracted folder, you'll then find all source files EXCEPT for the Aux.js  file. 
- In later course modules (where we work on the course project), the Aux.js  file can be found in an Aux/  subfolder inside hoc/ .

- Make sure to take the Aux.js  file attached to this lecture and place it inside the hoc/  or hoc/Aux/  folder (which ever of the two you got).

2) Problems with the creation of an Aux folder and/ or file:
 - Simply name both differently. For example, you may create an Auxiliary  folder and name the file inside of it Auxiliary.js . 
 - Make sure to then adjust your imports (import Aux from './path/to/Auxiliary/Auxiliary' ) and you should be fine.




___
## 104. Using React.Fragment

We just learned about the Aux trick which is useful to load adjacent elements without loading a wrapping div
Since React 16.2 there is a built in feature that works just like Aux component
It can be interchanged with anywhere an `<Aux>...</Aux>` tag is used
Instead you can use a tag called `<React.Fragment>`
You can use it in the exact same way as aux

If you do not like the `.Fragment` syntax you can import it (with component or any other react imports you may be using)
```
import React, { Component, Fragment } from 'react';
```
Then you can simply call `<Fragment>` instead




___
## 105. Higher Order Components (HOC) - Introduction
It was mentioned that the `<Aux>` component is a higher order component (HOC)
It is named a higher order component because all it does is it wraps another component - It does not contain its own logic, styling, or add any structure

Another example for a higher order component could be a component that sets up a div that contains a div or sets up a class
In App. we are creating a div and we are assigning a class and we were doing the same before we added Aux
There is nothing wrong with doing things this way but if we were to create class tags we could assign classes throughoout the app and change them more dynamically from a centralized place

For example in our hoc folder we can create a new file `WithClass.js`
(It is convention to name hoc with 'with' at the beginning but it is up to you)

Inside of this component we can add import and export statements along with our method which will accept props and not have any logic, just return
It will return a div where we use our props to assign a classname (we will pass a classname into the component when we call it)
Then inside of that div we will render any children
```
import React from 'react';

const withClass = (props) => (
  <div className={props.classes}>
    {props.children}
  </div>
);

export default withClass;
```

Now we can test this in App.js
First don't forget to import it
```
import WithClass from '../hoc/WithClass';
```

Now we can use this component instead of the wrapping div with the className assignment in our return statement
```
return (
  <WithClass classes={class.App}>
    <button
      onClick={() => {
        this.setState({showCockpit: false});
      }}
    >Remove Cockpit</button>
    {this.state.showCockpit ? (
      <Cockpit 
        title={this.props.appTitle}
        clicked={this.togglePersonsHandler}
        showPersons={this.state.showPersons} 
        personsLength={this.state.persons.length} 
      />
    ): null }

    {persons}
  </WithClass> 
);
```

For now this isn't anything too crazy but in the future we can do something like wrap error handling around a component that makes http requests




___
## 106. Another Form Of HOCs
There is anothe way to create HOCs
The other way does not return a functional component but instead is a regular js function
This function receives arguments 
The first argument will be a `WrappedComponent` (must be capital)
The second argument is something you need in your HOC (depends on what you need it for)
Here it will be our `className`
Then we will have our function
```
const withClass = (WrappedComponent, className) {

};
```

Now inside of this function we will return a functional component
Inside of which we will have our div where we will assign the passed in classname and then we will also pass the `<WrappedComponent />` into it
```
const withClass = (WrappedComponent, className) {
  return props => (
    <div className={className}>
      <WrappedComponent />
    </div>
  );
};
```

Now instead of calling it as we did before we will call Aux (don't forget to import it)
Then in our import for `WithClass` we will instead import `withClass` (now lowercase)
(You can also rename the file itself to be lowercase to make it really clear there is no functional component)

Now to call it we will call our new method in the export
Remember that the first argument we pass in should be the component we want wrapped (App)
The second argument we pass should be the name of the class to assign
```
export default withClass(App, classes.App);
```

Now our classname will be assigned to what is rendered by the App component which is what we were doing before

There are other hoc that handle more behind the scenes things like run js code or handle analytic data
Components like that should probably be done in this way to make it clear they don't have any real output itself but it is semantical and up to you




___
## 107. Passing Unknown Props

Now with our HOC created let's also use it in Person.js for singular person
We could import withClass from our hoc folder and call it on our person component
```
import React, { Component } from 'react';
import classes from './Person.css';
import Aux from '../../../hoc/Aux';
import withClass from '../../../hoc/withClass';

class Person extends Component {
  render(){
    console.log('[Person.js] render');
    return (
      <Aux>
        <p key="i1"onClick={this.props.click}> 
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>
        <p key="i2">{this.props.children} </p>
        <input 
          key="i3"
          type="text" 
          onChange={this.props.changed} 
          value={this.props.name} 
        />
      </Aux>
    );
  }
}

export default withClass(Person, classes.Person);
```

Now if we save and reload we can see that our styling is back but all of our data is missing
Why is this?
We are passing in our Person component into withClass but the `<WrappedDiv>` it is exported as doesn't receive any props so they are lost
Luckily we can pass props dynamically
We do accept the props at the begining of our return statement
These props will be passed from Persons and there is jsx syntax that allows us to accept them even if we do not know what they are going to be
To do this we can use:
```
const withClass = (WrappedComponent, className) => {
  return props => (
    <div className={className}>
      <WrappedComponent {...props} />
    </div>
  );
};
```
Now we are using the spread operator to take the props and distribute them within the wrapped component as new key value pairs (as we passed them into Person previously)




___
## 108. Setting State Correctly

Now we will get back to our regular components that use state like App.js
We are already using setState correctly but there is a way to use it incorrectly that we need to be aware of 

Let's say when the name changes (we execute `nameChangedHandler()`) we want to count every time this is called (basically counting the number of keystrokes/changes)

So to do this we would want to add a counter to our state
```
...
showCockpit: true,
changeCounter: 0
```

Then in `nameChangedHandler()` in our set state call we can incrememnt our changeCounter
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
  this.setState({ persons: persons, changeCounter: this.state.changeCounter + 1 });
}
```
If we run our code like this we will see the changeCounter go up as we type but we are updating state incorrectly
This is because we are not triggering an update of the component and a rerender cycle
So if we had another method going that also updated `changeCounter` and then we ran this one again the this.state we are referring to may not have actually been updated to be the correct value yet 
This is because this.state.changeCounter makes sure we are pointing to the last value that was stored in state at the last rerender + any changes that this specific method has made
The danger is that this.state.changeCounter can end up being behind the real value because of the timing of updates and retreival of data 
See the below scenario for a visual of what I'm trying to explain

```
this.state.value = 0

method 1 starts

method 1 retreives this.state.value

method 2 starts

method 2 retreives this.state.value

method 1 updates this.state.value to be +1 

method 1 saves this.state.value as 2

method 2 updates this.state.value to be +1

method 2 saves this.state.value as 2
```
In the above example this.state.value should have been updated to 3 but because of the timing of the calls it was only updated to 2
In the above if we had forced a rerender and saving of the state then we could have ensured that method 2 was adding to the most recent and up to date value in state

When you want to update state in a way that is dependent on the previous value there is a better way to do it
Instead of just passing in our object to `setState()` we can pass in an anonymous function
This function will receive 2 argument
The first argument is the previous state (prevState)
The second argument are the curent props (props)
Then in our function we will return the new state object
Now instead of referring to this.state we can refer to prevState
```
this.setState((prevState, props) => {
  return {
    persons: persons,
    changeCounter: prevState.changeCounter + 1
  };
});
```




___
## 109. Using PropTypes

Now we will explore how we can improve the way we are receiving props
Specifically we will look at the person component
There we have `name` `age` and `changed`
There is nothing wrong with the  way we are doing it but we can be more clear about which props our component uses and to throw an error or warning if you try to pass in incorrect props

If you are working alone on your own app this may not be important but when working as a team it can make it much easier to identify issues
(For example they may try to pass in `age` as a string instead of a number and it must be a number you can use propTypes to help them find this error)

You can do this by installing an extra package via npm
```
npm install --save prop-types
```

Now in our application we can use PropTypes by importing it
```
import PropTypes from 'prop-types';
```

Now in our component we can add an extra property after our component definition (before export)
We call the name of our component and add a new property with a `.propTypes` and adding an object list of properties
```
Person.PropTypes = {
  
};
```

Now inside of this object you can define the props that this component uses and the datatypes of those props
PropTypes gives us the ability to declare what type of data each prop is expecting:
```
Person.propTypes = {
  click: PropTypes.func, // click prop will be function
  name: PropTypes.string, // name prop will be string
  age: PropTypes.number, // age prop will be number
  changed: PropTypes.func // changed prop will be function
};
```

Now our app will still work as expected but we can 'break' it by going to App.js and changing state.age to hold strings instead of numbers

Now if we reload our page whenever we toggle our list of persons we can see an error in the console with the following message:
```
Warning: Failed prop type: Invalid prop `age` of type `string` supplied to `Person`, expected `number`.
```

This can be really helpful when people are trying to build onto unfamiliar code

You don't have to use propTypes on every component but feel free to if you think it would be helpful 
Definitely add them if you plan on sharing your library with other developers




___
## 110. Using Refs
Now we have seen a lot of the features of react and its components 
We will be retouching on everything discussed as we will be using this stuff throughout our react applications

These sections are to introduce us to these concepts so when we use them or see them in action in a more realistic scenario we understand them already
This will become clearer over time

There are a few more things to touch on though
In person what if we wanted to make it so that when the page loads the cursor is automatically focused on the last person element so you can begin typing and editing the name straight away

One potential solution is to use `componentDidMount()` (remember it handles actions after the component has finished loading)
Then we could use `document.querySelector.('input').focus()`
```
componentDidMount() {
  document.querySelector('input').focus();
}
```

This will actually kind of work and is valid since person is a class based component and therefore has access to `componentDidMount()` 
However it will put the cursor on the very first Person element and we wanted it on the last one

We could set up an id here and that would accomplish what we are looking for but react has an easier way built in

To do this we can use a concept called refs
On any element (including components) you can add a special keyword called 'ref'
There are a couple of ways to use ref

First way:
Pass an anonymous arrow function into ref
This function would accept an argument of a reference to the element you place this on (in this case you cuold use `inputEl`)
Then in the function body you can add a new property of your choice to hold the element we want
```
<input 
  key="i3"
  ref={(inputEl) => {this.inputElement = inputEl}}
  type="text" 
  onChange={this.props.changed} 
  value={this.props.name} 
/>
```
What is happening here exactly?
Well we are creating a new global value called inputElement and we are assigning it a reference value of the input box we are creating when we call the Person component
Because the Person components are made sequentially the last one that is created overrides the previous call to assign an input box to `this.inputElement` with its own input box being assigned to `this.inputElement`

Now in `componentDidMount()` we are able to call a focus method on that input box by referencing the global variable we created
```
componentDidMount(){
    this.inputElement.focus();
  }
```

The second way:
Since react 16.3 there is another way to setup a reference using the constructor (again components need to be class based to use refs)
We can use a method called `React.createRef()` on our `this.inputElementRef`
(don't forget to call `super(props)`)
```
constructor(props) {
  super(props)
  this.inputElementRef = React.createRef();
}
```
Now instead of passing a function into our ref attribute we can just pass in `this.inputElement`

```
ref={this.inputElementRef}
```

Now in `componentDidMount` we do have to do things slightly differently
First we have to select a current reference, then we can focus it like before
```
componentDidMount() {
  this.inputElementRef.current.focus();
}
```

Now if we reload our page we should be able to toggle our list of people and focus the last input box again




___
## 111. Refs With React Hooks

That was useful for class based components but what about functional components?
We cannot use the the first method where we pass a function into refs but we can *kind of* do the second version

To explore this we will make changes to Cockpit.jsx
Let's say we want to automatically click the button in Cockpit on page load
First of all we have to set up reference
Since this is a functional component we don't have a contstructor we only have our function body

Towards the top we can set up our reference by creating a new const variable
In a functional component instead os assigning this to createRef as we did in Person we can instead use a new react hook called useRef

To use this we need to first import it from react
```
import React, { useEffect, useRef } from 'react';
```

Then we can assign our button to it
```
const cockPit = props => {
  const toggleBtnRef = useRef(null);
}
```

Now we have a reference created with the useRef hook
We have to pass this reference to our button
```
<button ref={toggleBtnRef} className={btnClass} onClick={props.clicked}>
```

Now that we have assigned our reference to our button we can try clicking it at the start of our method
```
const toggleBtnRef = useRef(null);
toggleBtnRef.current.click();
```

If we save at this point we get an error about not being able to read property of 'null' on click

This is because we are calling the click right after we initialized the reference and at that point the button hasn't been created and assigned to the reference yet (that doesn't happen until the return statement)
So what we need to do is wait to activate our click until after the return statement has finished rendering our button

Remember we can run functions after the render by utilizing `useEffect()`!
Now we can initialize the reference at when the component is created, assign the button to the reference when it is rendered, and then click it after it has finished rendering.
```
useEffect(() => {
  console.log('[Cockpit.js] useEffect');
  // setTimeout(() => {
  //   alert('I\'ll kill that jedi slime, myself!');
  // }, 1000);
  toggleBtnRef.current.click();
  return () => {
    console.log('[Cockpit.js] cleanup work in useEffect')
  }
}, []); 
```

Now instead of the timer with the alert running after the page has finished rendering we can instead click the button automatically

```
// Cockpit.js for reference:
import React, { useEffect, useRef } from 'react';
import classes from './Cockpit.css';

const cockpit = (props) => {

  const toggleBtnRef = useRef(null);


  useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    // setTimeout(() => {
    //   alert('I\'ll kill that jedi slime, myself!');
    // }, 1000);
    toggleBtnRef.current.click();
    return () => {
      console.log('[Cockpit.js] cleanup work in useEffect')
    }
  }, []); 

  useEffect(() => {
    console.log('[Cockpit.js] 2nd useEffect')
    return () => {
      console.log('[Cockpit.js] cleanup work in 2nd use effect')
    }
  }); 
  
  const assignedClasses = [];

  if (props.personsLength <= 2) {
    assignedClasses.push(classes.red); // classes = ['red'];
  }

  if (props.personsLength <= 1) {
    assignedClasses.push(classes.bold); // classes = ['red', 'bold'];
  }


  let btnClass = '';

  if (props.showPersons) {
    btnClass = classes.Red;
  }

  return (
    <div className={classes.Cockpit}>
      <h1> {props.title}</h1>
      <p className={assignedClasses.join(' ')}>General Kenobi, you are a react app!</p>
      <button ref={toggleBtnRef} className={btnClass} onClick={props.clicked}>
        Toggle Name
      </button>
    </div>
    
  );
};

export default React.memo(cockpit);
```




___
## 112. Understanding Prop Chain Problems
The next feature we will look at will help us avoid overly long chains of props when creating elements
What does that mean?
We have a person component and lets say we managed an authentication status and we wanted to output whether or not we were authenticated to that person component but we want to manage the authentication in the cockpit
We don't want to manage the status we just want to trigger a change
So in our cockpit we can create a button that will receive a prop called 'login' to it's onClick handler
```
<button onClick={props.login}>Log in</button>
```

Now in App.js we need to add a login prop where we call our `<Cockpit>` component
We will have to add a new method to our App.js component that called 'loginHandler'
This will reach out to the state and set an authentication status to true from false so we will have to add our authentication status to state as well

First add an 'authenticated' status to state:
```
...
changeCounter: 0,
authenticated: false
```

Then create the loginHandler method which will only set state.authenticated to true
```
loginHandler = () => {
  this.setState({authenticated: true});
}
```

Now we can make sure that this method is being passed as the login prop to our `<Cockpit>` element
```
<Cockpit 
  title={this.props.appTitle}
  clicked={this.togglePersonsHandler}
  showPersons={this.state.showPersons} 
  personsLength={this.state.persons.length} 
  login={this.loginHandler}
/>
```

Now remember we wanted to show the status of our authentication in the Person component
We only have acces to the Persons component
We can pass in our state.authenticated status into persons
```
<Persons 
  persons={this.state.persons}
  clicked={this.deletePersonHandler}
  changed={this.nameChangedHandler} 
  isAuthenticated={this.state.authenticated}
/>
```

Then in the persons component we just need to forward this to the Person component
```
<Person 
  key={person.id}
  click={() => this.props.clicked(index)}
  changed={(event) => this.props.changed(event, person.id)}             
  name={person.name} 
  age={person.age} 
  isAuth={this.props.isAuthenticated}
/>
```

Now inside of our person component we can do a ternary operation and if isAuth is true then we can output that to the screen 
```
<Aux>
  {this.props.isAuth ? <p>Authenticated</p> : <p>Please Log In</p>}
  ...
```

Luckily passing the data works as it should but this isn't the best implementation
Part of the issue is that there is more code to maintain and more steps

A feature called context allows us to help solve this issue and allows us to make data available to multiple components when we don't want to pass that data between multiple other layers of components that do not need that data (just to get it to the last component)
a( has component)-> B -> C -> D (needs component)
|_____________________________|
React context allows you to send the data straight to the component that needs it




___
## 113. Using the Context API
To get started using context we need to create a new folder/filer called src/contex/auth-contex.js
In this file we create a context object (which is given to us by react so import react)
By calling `React.createContext();
Then don't forget to export your file
```
// auth-context.js
import React from 'react';

const authContext = React.createContext();

export default authContext;
```

One thing createContext allows us to do is initialize it with a default value when we are creating it
But what are we creating?
Well context is basically a 'globally' available object except it isn't actually globally available
It is only available where you want it to be available
This can be passed to react components without props behind the scenes

We can initialize ours with any value
For ours we will add an 'authenticated' value of false and a login method
Login will be an empty anonymous function
```
const authContext = React.createContext({
  authenticated: false,
  login: () => {}
});
```
The reason we are adding this is because our ide will give us better autocompletion otherwise we don't really care in this instance

Now in App.js we need to import our new AuthContext file
```
import AuthContext from '../context/auth-context';
```

Now we are able to call AuthContext as a component that wraps all parts of our application that need access to that context

Here we need to add it to the cockpit component and the person component
```
return (
  <Aux>
    <button
      onClick={() => {
        this.setState({showCockpit: false});
      }}
    >Remove Cockpit</button>
    <AuthContext.Provider>
    {this.state.showCockpit ? (
      <Cockpit 
        title={this.props.appTitle}
        clicked={this.togglePersonsHandler}
        showPersons={this.state.showPersons} 
        personsLength={this.state.persons.length} 
        login={this.loginHandler}
      />
    ): null }

    {persons}
    </AuthContext.Provider>
  </Aux> 
);
```

Now Cockpit, Persons and App.js should all have access to the AuthContext
App has access because we used .Provider
.Provider also accepts a 'value' prop
We can pass in values here that overwrite the default values we had set within AuthContext itself
In this case we can pass in the status of state.authenticated as well as the loginHandler we created
```
<AuthContext.Provider 
  value={{
    authenticated: this.state.authenticated, 
    login: this.loginHandler
  }}
>
```

Now how do we get access to this inside of our Persons component?
First we have to import it again
```
import AuthContext from '../../context/auth-context';
```

Now instead of using a context .provider we will use a consumer
This will wrap our Person div and pass it the values that we provided in app.js
In order to keep our previous jsx valid we will need  to wrap it in {} and have it be the result of a function that accepts context as an argument (provided by the react context api)
```
render(){
  console.log('[Persons.js] rendering...');
  return 
  <AuthContext.Consumer>
    {(context) => this.props.persons.map((person, index) => {
      return ( 
        <Person 
          key={person.id}
          click={() => this.props.clicked(index)}
          changed={(event) => this.props.changed(event, person.id)}             
          name={person.name} 
          age={person.age} 
          isAuth={this.props.isAuthenticated}
        />
      );
    })}
  </AuthContext.Consumer>
}
```

This kind of defeats the purpose though since we didn't want to have to pass anything through Persons in order to access it in person
So lets reset persons back to how it was (remove the `<AuthContext>` tag along with the isAuth tag)
```
render(){
  console.log('[Persons.js] rendering...');
  return this.props.persons.map((person, index) => {
    return ( 
      <Person 
        key={person.id}
        click={() => this.props.clicked(index)}
        changed={(event) => this.props.changed(event, person.id)}             
        name={person.name} 
        age={person.age} 
      />
    );
  });
}
```

Now instead lets import it straight into the Person component
```
import AuthContext from '../../../context/auth-context';
```

Now we want to add the consumer block where we wnat to add the data
We only need it in the one line with our ternary operation to display 'authenticated' or 'log in
Inside of our consumer element we have a jsx object which returns a function that receives context as an argument
Now since we have passed the context in we can access it's values such as .authenticated
```
<Aux>
  <AuthContext.Consumer>
    {(context) => context.authenticated ? <p>Authenticated</p> : <p>Please Log In</p>}
  </AuthContext.Consumer>
  <p key="i1"onClick={this.props.click}> 
    I'm {this.props.name} and I am {this.props.age} years old!
  </p>
  <p key="i2">{this.props.children} </p>
  <input 
    key="i3"
    // ref={(inputEl) => {this.inputElement = inputEl}}
    ref={this.inputElementRef}
    type="text" 
    onChange={this.props.changed} 
    value={this.props.name} 
  />
</Aux>
```

Now our persons has access to the context we would like but we still have to update the Cockpit to allow it access
First we have to import auth-context
```
import AuthContext from '../../context/auth-context';
```

Then wrap our button with it
Remember we don't just wrap jsx code
We wrap a function that receives context and returns jsx code accessing that context object
```
return (
  <div className={classes.Cockpit}>
    <h1> {props.title}</h1>
    <p className={assignedClasses.join(' ')}>General Kenobi, you are a react app!</p>
    <button ref={toggleBtnRef} className={btnClass} onClick={props.clicked}>
      Toggle Name
    </button>
    <AuthContext.Consumer>
      {(context) => <button onClick={context.login}> Log in</button>}
    </AuthContext.Consumer>
    
  </div>
  
);
``` 

Now we should have the same functionality that we did before except now we are doing it by using the context api




___
## 114. `contextType` & `useContext()`
There is another way to use context api in class based components

There is also an alternative way to use them in functional components

We will start with class based components 
Look in Person since it is a class based component
In class based components you can use an alternative pattern
One other advantage of this pattern is it gives you access to this context outside of our jsx code 
Previously we could only use the context if it was to be executed in our jsx return but we couldn't pass in a value that would be used in a function for example

What if we needed to access the context in something like `componentDidMount()`?
Thankfully react has this covered
You can add a special static property called contextType
It has to be named exactly like this and it has to be a static property
A static property is a property that can be accessed from the outside without the need to instantiate it within the class (react will handle this)
We set this `contextType` equal to our context module that we imported
```
static contextType = AuthContext;
```

Now React is able to connect the Person component and the AuthContext component behind the scenes
Now we can access our context values with `this.context`
Let's console.log our authentication status after our component mounts
```
componentDidMount(){
  // this.inputElement.focus();
  this.inputElementRef.current.focus();
  console.log(this.context.authenticated)
}
```
Now we are able to access our context outside of the return statement so this is a little more useful than the other way we were doing it

Now instead of using the `<AuthContext.Consumer>` tag we can instead simply say:
```
return (
  <Aux>
    {this.context.authenticated ? <p>Authenticated</p> : <p>Please Log In</p>}
    ...
```

Now in functional components this is not available
Lets take a look at our Cockpit where we were utilizing context
In order to use the alternate method for context we can use react hooks
First we must import the react hook
```
import React, { useEffect, useRef, useContext } from 'react';
```

Then in our component body we simply define a constant using useContext
Then we pass in the context that we imported as an argument
```
const authContext = useContext(AuthContext);
```

Now `authContext` will be a constant that will hold our context data
To check we can console.log
```
console.log(authContext.authenticated);
```

Next we can replace our jsx call with our new authContext call and point our button to the correct attributee
```
<button onClick={authContext.login}> Log in</button>     
```

Now if we save and reload our login button will still work

There is another tool that helps with this concept called redux but it is generally for more complicated applications




___
## 115. Wrap Up
That covered a lot of behind the scenes stuff in react and its components as well as a lot of react features
Think of this module as a reference module that lightly covers all these topics which we will dive more deeply into later
Come back here when you see something in the course that is covered here that you need to remember or need to brush up on something




___
## 116. Useful Resources & Links
Useful Resources:

- More on useEffect(): https://reactjs.org/docs/hooks-effect.html

- State & Lifecycle: https://reactjs.org/docs/state-and-lifecycle.html

- PropTypes: https://reactjs.org/docs/typechecking-with-proptypes.html

- Higher Order Components: https://reactjs.org/docs/higher-order-components.html

- Refs: https://reactjs.org/docs/refs-and-the-dom.htmls



___
## Final version of code to this point:
```
App.js
import React, { Component } from 'react';
import classes from './App.css';
import Persons from '../components/Persons/Persons';
import Cockpit from '../components/Cockpit/Cockpit';
import withClass from '../hoc/withClass';
import Aux from '../hoc/Aux';
import AuthContext from '../context/auth-context';

class App extends Component {

  constructor (props) {
    super(props);
    console.log('[App.js] constructor')
  }

  state = {
    persons: [
      {id: 'lwkvciw', name: 'Max', age: 27},
      {id: 'mv0wvo2', name: 'Manu', age: 29},
      {id: 'q2v021n', name: 'Marcy', age: 26}
    ],
    showPersons: false,
    showCockpit: true,
    changeCounter: 0,
    authenticated: false

  }

  static getDerivedStateFromProps(props, state){
    console.log('[App.js] getDerivedStateFromProps', props, state)
    return state;
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
    
    // Don't do this:
    // this.setState({ persons: persons, changeCounter: this.state.changeCounter + 1 });
    // Do this instead:
    this.setState((prevState, props) => {
      return {
        persons: persons,
        changeCounter: prevState.changeCounter + 1
      };
    });
  }

  togglePersonsHandler = () => {
    const doesShow = this.state.showPersons;
    this.setState({showPersons: !doesShow})
  }

  loginHandler = () => {
    this.setState({authenticated: true});
  }

  deletePersonHandler = (personIndex) => {
    const persons = [...this.state.persons];
    persons.splice(personIndex, 1);
    this.setState({persons: persons});
  }

  render() {

    console.log('[App.js] render')

    let persons = null;
    
    if (this.state.showPersons) {
      persons = (
        <div>
          <Persons 
            persons={this.state.persons}
            clicked={this.deletePersonHandler}
            changed={this.nameChangedHandler} 
            isAuthenticated={this.state.authenticated}
          />
        </div>
      );     
    }

    return (
      <Aux>
        <button
          onClick={() => {
            this.setState({showCockpit: false});
          }}
        >Remove Cockpit</button>
        <AuthContext.Provider 
          value={{
            authenticated: this.state.authenticated, 
            login: this.loginHandler
          }}
        >
        {this.state.showCockpit ? (
          <Cockpit 
            title={this.props.appTitle}
            clicked={this.togglePersonsHandler}
            showPersons={this.state.showPersons} 
            personsLength={this.state.persons.length} 
            login={this.loginHandler}
          />
        ): null }

        {persons}
        </AuthContext.Provider>
      </Aux> 
    );
  }

  // componentWillMount(){
  //   console.log('[App.js] componentWillMount');
  // }

  componentDidMount(){
    console.log('[App.js] componentDidMount');
  }

  shouldComponentUpdate(nextProps, nextState){
    console.log('[App.js] shouldComponentUpdate');
    return true;
  }

  componentDidUpdate(){
    console.log('[App.js] componentDidUpdate');
  }

}

export default withClass(App, classes.App);


```
```
Cockpit.jsx
import React, { useEffect, useRef, useContext } from 'react';
import classes from './Cockpit.css';
import AuthContext from '../../context/auth-context';

const cockpit = (props) => {

  const toggleBtnRef = useRef(null);

  const authContext = useContext(AuthContext);
  console.log(authContext.authenticated);

  useEffect(() => {
    console.log('[Cockpit.js] useEffect');
    // setTimeout(() => {
    //   alert('I\'ll kill that jedi slime, myself!');
    // }, 1000);
    toggleBtnRef.current.click();
    return () => {
      console.log('[Cockpit.js] cleanup work in useEffect')
    }
  }, []); 

  useEffect(() => {
    console.log('[Cockpit.js] 2nd useEffect')
    return () => {
      console.log('[Cockpit.js] cleanup work in 2nd use effect')
    }
  }); 
  
  const assignedClasses = [];

  if (props.personsLength <= 2) {
    assignedClasses.push(classes.red); // classes = ['red'];
  }

  if (props.personsLength <= 1) {
    assignedClasses.push(classes.bold); // classes = ['red', 'bold'];
  }


  let btnClass = '';

  if (props.showPersons) {
    btnClass = classes.Red;
  }

  return (
    <div className={classes.Cockpit}>
      <h1> {props.title}</h1>
      <p className={assignedClasses.join(' ')}>General Kenobi, you are a react app!</p>
      <button ref={toggleBtnRef} className={btnClass} onClick={props.clicked}>
        Toggle Name
      </button>
      <button onClick={authContext.login}> Log in</button>     
    </div>
    
  );
};

export default React.memo(cockpit);
```
```
Persons.jsx
import React, { PureComponent } from 'react';
import Person from './Person/Person';

class Persons extends PureComponent {
  // static getDerivedStateFromProps(props,state){
  //   console.log('[Persons.js] getDerivedStateFromProps');
  //   return state;
  // }

  // shouldComponentUpdate(nextProps, nextState) {

  //   console.log('[Persons.js] shouldComponentUpdate');

  //   if (nextProps.persons !== this.props.persons || 
  //       nextProps.changed !== this.props.changed || 
  //       nextProps.clicked !== this.props.clicked) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  getSnapshotBeforeUpdate(prevProps, prevState){
    console.log('[Person.js] getSnapshotBeforeUpdate');
    return null;
  }

  componentDidUpdate() {
    console.log('[Persons.js] componentDidUpdate');
  }

  componentWillUnmount(){
    console.log('[Persons] componentWillUnmount');
  }

  render(){
    console.log('[Persons.js] rendering...');
    return this.props.persons.map((person, index) => {
      return ( 
        <Person 
          key={person.id}
          click={() => this.props.clicked(index)}
          changed={(event) => this.props.changed(event, person.id)}             
          name={person.name} 
          age={person.age} 
        />
      );
    });
  }
}

export default Persons;

// Function Persons Component
// import React from 'react';
// import Person from './Person/Person';

// const persons =  (props) => {
//   console.log('[Persons.js] rendering...');
//   return props.persons.map((person, index) => {
//     return (
//       <Person 
//         key={person.id}
//         click={() => props.clicked(index)}
//         changed={(event) => props.changed(event, person.id)}             
//         name={person.name} 
//         age={person.age} 
//       />
//     );
//   });
// };


// export default persons;
```
```
Person.jsx
import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classes from './Person.css';
import Aux from '../../../hoc/Aux';
import withClass from '../../../hoc/withClass';
import AuthContext from '../../../context/auth-context';

class Person extends Component {
  constructor(props) {
    super(props);
    this.inputElementRef = React.createRef();
  }

  static contextType = AuthContext;

  componentDidMount(){
    // this.inputElement.focus();
    this.inputElementRef.current.focus();
    console.log(this.context.authenticated)
  }
  
  render(){
    console.log('[Person.js] render');
    return (
      <Aux>
        {this.context.authenticated ? <p>Authenticated</p> : <p>Please Log In</p>}
        <p key="i1"onClick={this.props.click}> 
          I'm {this.props.name} and I am {this.props.age} years old!
        </p>
        <p key="i2">{this.props.children} </p>
        <input 
          key="i3"
          // ref={(inputEl) => {this.inputElement = inputEl}}
          ref={this.inputElementRef}
          type="text" 
          onChange={this.props.changed} 
          value={this.props.name} 
        />
      </Aux>
    );
  }
}

Person.propTypes = {
  click: PropTypes.func,
  name: PropTypes.string,
  age: PropTypes.number,
  changed: PropTypes.func
};

export default withClass(Person, classes.Person);


// Functional Person Component
// import React from 'react';
// import classes from './Person.css';

// const person = (props) => {
//   console.log('[Person.js] render');
//   return (  
//     <div className={classes.Person}>
//       <p onClick={props.click}> I'm {props.name} and I am {props.age} years old!</p> 
//       <p>{props.children} </p>
//       <input type="text" onChange={props.changed} value={props.name} />
//     </div>
    
//   )
// };

// export default person;
```
```
auth-context.js
import React from 'react';

const authContext = React.createContext({
  authenticated: false,
  login: () => {}
});

export default authContext;
```
```
Aux.js
const aux = (props) => props.children;

export default aux;
```
```
withClss.js
import React from 'react';

const withClass = (WrappedComponent, className) => {
  return props => (
    <div className={className}>
      <WrappedComponent {...props} />
    </div>
  );
};


// const withClass = (props) => (
//   <div className={props.classes}>
//     {props.children}
//   </div>
// );

export default withClass;
```