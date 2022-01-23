# Section 13: An Alternative Way of Building Components: Class-based Components
Section github: https://github.com/academind/react-complete-guide-code/tree/13-class-based-cmp
___
## 163. Module Introduction
In this section we are going to learn how to builld components in an alternative way
So far we have built components as functions
However in react you can also define components as classes

One important note: This is 100% optional and in most modern react projects you will probably not use this
You can skip this section but know that you will see a lot of class based components in older projects
This is because class based components used to be required but there has recently been a shift to functional components

This section will cover:
- What class based components are and why they exist
- How to work with class based components
- Error boundaries (require class based components but we will not build a lot of these)

This section holds a lot of information about reacts past, how to build class, based components, why they exist, and how they work




___
## 164. What & Why
Class based components are an alternative to functional components
So far our components have looked like this:
```
function Product(props) {
  return <h2>Hello there!</h2>
}
```
Or if you used arrow function components:
```
const Product = (props) => {
  return <h2>Hello there!</h2>
}
```
These are equivalent and are both functional components because they are both ways of expressing a function

Just as functional components are regular js functions that return jsx
Class based components are regular js CLASSES that return jsx
These are defined like this:
```
class Product extends Component {
  render() {
    return <h2>Hello there!</h2>
  }
}
```

Here we are defining a component by creating a class
Classes are not a react feature they are a feature of js
They provide a render method that provides the jsx we want to return

Remember functional components are the default and modern way of building components but it is important to know about class based components
There is really no reason to use class based components other than personal preference and error boundaries which are not common

You can build anything that can be built with functional components with class based components, you just may need a slightly different approach

But why do they exist?
Class based components exist because they used to be required and used to be the only way to manage state and side effects
In React 16.8 "React Hooks" were introduced which allowed state to be managed by functional components
This brought features to functional componets that before could only be used in class based components

An important notes is that class based components cannot use these hooks that were introduced to help functional components
This is really important and why we generally have to take a different approach when using class based components




___
## 165. Adding a First Class-based Component
To help understand class based components there is a starting project here: https://github.com/academind/react-complete-guide-code/tree/13-class-based-cmp/code/01-starting-project
Copy, npm install, and git init this to your project folder

Then use `$npm start` to see the app
This is simply an app that has a list of users that shows/hides the list when a button is clicked

This only uses three components a `<Users>`, `<User>`, and `<App>` components

`<Users>` has some dummy data and a state to determine whether the users list should show
If it should show it takes the dummy data and maps each user to a `<User>` component

See `<Users>`
```
import { useState } from 'react';
import User from './User';

import classes from './Users.module.css';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

const Users = () => {
  const [showUsers, setShowUsers] = useState(true);

  const toggleUsersHandler = () => {
    setShowUsers((curState) => !curState);
  };

  const usersList = (
    <ul>
      {DUMMY_USERS.map((user) => (
        <User key={user.id} name={user.name} />
      ))}
    </ul>
  );

  return (
    <div className={classes.users}>
      <button onClick={toggleUsersHandler}>
        {showUsers ? 'Hide' : 'Show'} Users
      </button>
      {showUsers && usersList}
    </div>
  );
};

export default Users;

```

The `<User>` component simply outputs the data passed in when mapping each user via props

Nothing fancy going on here

To get started learning about classes lets convert the `<User>` component to a class based component since it is simply and simply receives props and doesn't manage any state

To do this we start with the class keyword and use the template from the previous lesson
Remember this is just like you would use a class in js because this is a js feature, not a react feature

So start with the 'class' keyword, then the name of your class followed by curly braces
```
class User {

}
```

Now we can start adding methods to this class
We can theoretically add as many methods as we want and we can name them how we want
The first we will want to add though is a very specific method called `render()` which will be used to output the content of this component

`render()` is expected by react and will call it from the component to determine what should be rendered to the screen
`render()` is basically equivalent to the `return` statement used in functional components
Within  `render()` we will want to return the result we are looking for
```
class User{ 
  render(){
    return <li className={classes.user}>{props.name}</li>;
  }
}
```
There is something missing though and that is props
For functional components we receive these automatically we just have to let the component know we are expecting them by passing them in as an argument to the function
It is a little different for class based componets

Instead we need to do something else, not just for props but to make the component work in general
We need to import 'Component' from react (just like we did with hooks)
```
import { Component } from 'react';
```

Then we need to EXTEND our user class to this components class
This is a built in js concept to allow classes to inherit from other classes
```
class User extends Component{ 
  render(){
    return <li className={classes.user}>{props.name}</li>;
  }
}
```

This `Component` class we imported provides functionality to make our class work as a component and gives us access to a few important properties
One of these is the 'props' property
We can access this with `this.props`
This only works because we extended the component class
This adds the prop property which can only be accessed via the `this` keyword
```
return <li className={classes.user}>{this.props.name}</li>;
```

Now we have a class based equivelant to the functional component which can be removed or commented out
```
import { Component } from 'react';
import classes from './User.module.css';

class User extends Component{ 
  render(){
    return <li className={classes.user}>{this.props.name}</li>;
  }
}

// const User = (props) => {
//   return <li className={classes.user}>{props.name}</li>;
// };

export default User;
```

Looking at these you can see that the functional component is a little leaner which is one reason they are more popular
We still have to export 'User'
If we save it will act just like before

Notice that `<Users>` is still a functional component calling a class based component 
This is completely ok in react as class based and functional components can work together and for the most part interchangebly

It is more ideal to use one or the other (function or class based)
However sometimes in older projects you will update class based components to become functional over time and slowly migrate to functional

If you are starting a new project it is better to use one or the other, whichever you prefer




___
## 166. Working with State & Events
Now we will convert the `<Users>` component to a class-based component
We know the first thing to do is to import 'Component' then create our 'Users' class that extends 'Component'
```
import {Componet, useState} from 'react';
...
class Users extends Component {

}
```

Then we can add our `render()`method which returns the jsx from the original functional component
```
class Users extends Component {
  render(){
    return (
      <div className={classes.users}>
        <button onClick={toggleUsersHandler}>
          {showUsers ? 'Hide' : 'Show'} Users
        </button>
        {showUsers && usersList}
      </div>
    );
  }
}
```

We aren't using any props here, but we do rely on state and a function that should be executed when the button is clicked
In class based components we don't add functions inside the render method
Instead we group functionality by grouping it in the class
We simply add a new method to the class
```
class Users extends Component {
  toggleUsersHandler(){
    
  }

  render(){
    return (
      <div className={classes.users}>
        <button onClick={toggleUsersHandler}>
          {showUsers ? 'Hide' : 'Show'} Users
        </button>
        {showUsers && usersList}
      </div>
    );
  }
}
```

Now we have the method but don't have the state
This is much different with classes than in functional components
In order to manage state we need to do two things
1. Initialize and define state
2. Update it when needed

To define state in a class based component we use a `constructor()` this is a special function that is automatically called whenever the `<Users>` component is instantiated
Inside of this constructor we initialize state by accessing `this.state` and setting it equal to an object
Notice that we are setting it to an object even though it is just a boolean value
WITH CLASS BASED COMPONENTS STATE IS ALWAYS AN OBJECT
```
constructor(){
  this.state={
    showUsers: true
  }
}
```
We have access to `this.state` for the same reason we have access to `this.props` because it is provided by the `Constructor` that our Users class extends
Because of this our state MUST be named state although you can name the content inside of the object how you wish
This also means we have to group ALL state values that will be used into this object
This is different from a functional component where we could call `useState` however many times we wanted and have different state objects for each one
Note that we can nest objects in here or arrays or whatever we want for the values but `this.state` must be set equal to an object

We can drop this constructor in our `<Users>` component
```
class Users extends Component {

  constructor(){
    this.state={
      showUsers: true
    }
  }

  toggleUsersHandler(){
    
  }

  render(){
    return (
      <div className={classes.users}>
        <button onClick={toggleUsersHandler}>
          {showUsers ? 'Hide' : 'Show'} Users
        </button>
        {showUsers && usersList}
      </div>
    );
  }
}
``` 

Now that we have a state object how can we edit it as our `toggleUsersHandler` does in the functional version?
We can do this by accessing `this.setState()` which is also provided by the `Component` class
`this.setState` always accepts an object and this object is used to update the old state object
This is different than updating a state object in a functional component because before it would overwrite the entire object
However with class based components and `this.state`/`this.setState` react will MERGE the changes into the object so you don't have recreate the entire object every time you update it
So we can simply apply a change by setting the new value of only the state propery we want to change
For example if we had the following state object
```
constructor(){
  this.state={
    showUsers: true,
    more: 'test'
  }
}
```
If we were to update state
```
toggleUsersHandler(){
  this.setState({showUsers: false});
}
```
Then `this.state.more` would still be `'test'`

However we don't want `showUsers` to always be false
We want to toggle it from the previous value of `this.state.showUsers`
If we rely on a previous state value we will use the functional form of `setState` just like we did with functional components
We still have to return state updates as an object however and can't just return a single value
```
toggleUsersHandler(){
  this.setState((curState) => {
    return {showUsers: !curState.showUsers};
  });
}
``` 
Whatever we return in this setState call will be merged to the old state
Now we need to call this in our render method to check the state value to determine whether the button should say 'Hide Users' or 'Show Users' as well as to render the `usersList` if `showUsers === true`
```
class Users extends Component {

  constructor(){
    this.state={
      showUsers: true
    }
  }

  toggleUsersHandler(){
    this.setState((curState) => {
      return {showUsers: !curState.showUsers};
    });
  }

  render(){
    return (
      <div className={classes.users}>
        <button onClick={toggleUsersHandler}>
          {this.state.showUsers ? 'Hide' : 'Show'} Users
        </button>
        {this.state.showUsers && usersList}
      </div>
    );
  }
}
```

Now we need to get the usersList function 
This is easy as we just need to drop in the same `usersList` constant we were using before into our `render()` method
```
render(){
  
  const usersList = (
    <ul>
      {DUMMY_USERS.map((user) => (
        <User key={user.id} name={user.name} />
      ))}
    </ul>
  );

  return (
    <div className={classes.users}>
      <button onClick={toggleUsersHandler}>
        {this.state.showUsers ? 'Hide' : 'Show'} Users
      </button>
      {this.state.showUsers && usersList}
    </div>
  );
}
```
One last thing is still missing and that is that we are calling `toggleUsersHandler` which is not inside of our render method
Since it is a method of the class we access it with the `this` keyword
```
class Users extends Component {

  constructor(){
    this.state={
      showUsers: true
    }
  }

  toggleUsersHandler(){
    this.setState((curState) => {
      return {showUsers: !curState.showUsers};
    });
  }

  render(){

    const usersList = (
      <ul>
        {DUMMY_USERS.map((user) => (
          <User key={user.id} name={user.name} />
        ))}
      </ul>
    );

    return (
      <div className={classes.users}>
        <button onClick={this.toggleUsersHandler}>
          {this.state.showUsers ? 'Hide' : 'Show'} Users
        </button>
        {this.state.showUsers && usersList}
      </div>
    );
  }
}
```

However this still doesn't work because of how the `this` keyword works
`this` can be quite confusing so if you need to know more see the following
More on the 'this' keyword: https://academind.com/tutorials/this-keyword-function-references

If you understand the above then you know that the `this` keyword refers to the function that calls it
So whenever `toggleUsersHandler()` is called BY THE BUTTON the `this` keyword refers to the button itself
However we can tie the fact that before we call the button `this` does in fact refer to the component using `.bind()`
Remember from the previous component that we can use `.bind()` on the end of a function so that way the values it is passed are fixed to the instance in which it was passed
If we pass the `this` keyword into `toggleUsersHandler` then when we use `this` inside of the function it will refer to the context that it held with `.bind()` was called
Since when `this` was passed into `toggleUsersHandler` it refered to the `Users` class it will continue to do so even though it would normally refer to the button

`this` is really important and knowing how it works and what it references is complicated but important
```
class Users extends Component {

  constructor(){
    this.state={
      showUsers: true
    }
  }

  toggleUsersHandler(){
    this.setState((curState) => {
      return {showUsers: !curState.showUsers};
    });
  }

  render(){

    const usersList = (
      <ul>
        {DUMMY_USERS.map((user) => (
          <User key={user.id} name={user.name} />
        ))}
      </ul>
    );

    return (
      <div className={classes.users}>
        <button onClick={this.toggleUsersHandler.bind(this)}>
          {this.state.showUsers ? 'Hide' : 'Show'} Users
        </button>
        {this.state.showUsers && usersList}
      </div>
    );
  }
}
```

Now we can comment out our functional component, save, and take a look
```
import { Component, useState } from 'react';
import User from './User';

import classes from './Users.module.css';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

class Users extends Component {

  constructor(){
    this.state={
      showUsers: true
    }
  }

  toggleUsersHandler(){
    this.setState((curState) => {
      return {showUsers: !curState.showUsers};
    });
  }

  render(){

    const usersList = (
      <ul>
        {DUMMY_USERS.map((user) => (
          <User key={user.id} name={user.name} />
        ))}
      </ul>
    );

    return (
      <div className={classes.users}>
        <button onClick={this.toggleUsersHandler.bind(this)}>
          {this.state.showUsers ? 'Hide' : 'Show'} Users
        </button>
        {this.state.showUsers && usersList}
      </div>
    );
  }
}

// const Users = () => {
//   const [showUsers, setShowUsers] = useState(true);

//   const toggleUsersHandler = () => {
//     setShowUsers((curState) => !curState);
//   };

//   const usersList = (
//     <ul>
//       {DUMMY_USERS.map((user) => (
//         <User key={user.id} name={user.name} />
//       ))}
//     </ul>
//   );

//   return (
//     <div className={classes.users}>
//       <button onClick={toggleUsersHandler}>
//         {showUsers ? 'Hide' : 'Show'} Users
//       </button>
//       {showUsers && usersList}
//     </div>
//   );
// };

export default Users;

```
You will see we get an error:
```
Uncaught ReferenceError: Must call super constructor in derived class before accessing 'this' or returning from derived constructor
```
This is because in js when a class extends another class (like `Users` does `Component`)
We MUST call `super()` within the constructor if it uses one
This makes sure the constructor for `Component` is also run and passed into this constructor so the class can be extended properly

As a final touch you can remove `useState` import since class based components cannot use `useState`
```
import { Component } from 'react';
import User from './User';

import classes from './Users.module.css';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

class Users extends Component {

  constructor(){
    super();
    this.state={
      showUsers: true
    }
  }

  toggleUsersHandler(){
    this.setState((curState) => {
      return {showUsers: !curState.showUsers};
    });
  }

  render(){

    const usersList = (
      <ul>
        {DUMMY_USERS.map((user) => (
          <User key={user.id} name={user.name} />
        ))}
      </ul>
    );

    return (
      <div className={classes.users}>
        <button onClick={this.toggleUsersHandler.bind(this)}>
          {this.state.showUsers ? 'Hide' : 'Show'} Users
        </button>
        {this.state.showUsers && usersList}
      </div>
    );
  }
}

// const Users = () => {
//   const [showUsers, setShowUsers] = useState(true);

//   const toggleUsersHandler = () => {
//     setShowUsers((curState) => !curState);
//   };

//   const usersList = (
//     <ul>
//       {DUMMY_USERS.map((user) => (
//         <User key={user.id} name={user.name} />
//       ))}
//     </ul>
//   );

//   return (
//     <div className={classes.users}>
//       <button onClick={toggleUsersHandler}>
//         {showUsers ? 'Hide' : 'Show'} Users
//       </button>
//       {showUsers && usersList}
//     </div>
//   );
// };

export default Users;

```




___
## 167. The Component Lifecycle (Class-based Componets Only!)
Now we know how to build class-based components and manage state but what about side effects?
Remember we can't use react hooks in class-based components so we can't use `useEffect`

Class-based components instead have a concept called the Component lifecycle
There are methods we can use to tie events to different points in this lifecycle

The first most important lifecycle you can add is the `componentDidMount()` method
This is a built in method that react will call for you when the component is mounted (as the name suggests)
Other lifecycle methods are `componentDidUpdate()` and `componentWillUnmount()`

There are others but they are less important

These three lifecycle methods are the most important and common
- `componentDidMount()`: Called when a component is mounted 
  This happens when it is evaluated and rendered to the dom
  It is like using `useEffect` with an emtpy dependency array like this
  `useEffect(...function, [])`
  In this case every effect function is executed when the component is mounted
- `componentDidUpdate`: Called when a component is updated
  If there is a state change that causes the component to be re-evaluated and re-rendered then this method will activate
  It is like using `useEffect` with dependencies
  `useEffect(...function, [someValue])`
- `componentWillUnmount`: Called right before the component is removed from the dom
  This is like the cleanup function in `useEffect` which is called right before the component is called again and when it is to be removed from the dom
  `useEffect(()=>{return()=>{...likethis}, []}) `

Lets take a look at this in action
To do this the project has been altered slightly
Add the `<UserFinder>` component and `UserFinder.module.css` to the 'Components' folder in your project (available on github)
- `<UserFinder>` component: https://github.com/academind/react-complete-guide-code/blob/13-class-based-cmp/extra-files/UserFinder.js
- `UserFinder.module.css` style: https://github.com/academind/react-complete-guide-code/blob/13-class-based-cmp/extra-files/UserFinder.module.css

Once you have added these go to the `<Users>` component and remove the `DUMMY_USERS` array
Then where we refer to `DUMMY_USERS` instead refer to `this.props.users`
Next in `<UserFinder>` where we call the `<Users>` component pass in `filteredUsers` (should be done already)
Lastly within `<App>` instead of rendering `<Users>` we will render `<UserFinder>`

There may be an error within `<UserFinder>` in that it does not have a `DUMMY_USERS` array as it should, copy/paste it from Users.js
Also be sure to import the css module to `<UserFinder>` and wrap the input with a div and assign `className={classes.finder}`
```
import { Fragment, useState, useEffect } from 'react';
import classes from './UserFinder.module.css';

import Users from './Users';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];


const UserFinder = () => {
  const [filteredUsers, setFilteredUsers] = useState(DUMMY_USERS);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    setFilteredUsers(
      DUMMY_USERS.filter((user) => user.name.includes(searchTerm))
    );
  }, [searchTerm]);

  const searchChangeHandler = (event) => {
    setSearchTerm(event.target.value);
  };

  return (
    <Fragment>
      <div class={classes.finder}><input type='search' onChange={searchChangeHandler} /></div>
      <Users users={filteredUsers} />
    </Fragment>
  );
};

export default UserFinder;
```

Now there should be an input box above the list of users and if you type it should filter out users in the list that match that user

In the next lesson we will convert this `<UserFinder>` functional component to a class-based component to explore how they manage side effects




___
## 168. Lifecycle Methods In Action
Now our project should be ready to start working with the previously mentioned lifecycle methods

We will start converting the `<UserFinder>` functional component to a class based component
Remember we need to import `Component` and create our `UserFinder` class
```
import { Fragment, useState, useEffect, Component } from 'react';
import classes from './UserFinder.module.css';

import Users from './Users';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

class UserFinder extends Component {
  
}
...
```
Then we will add the DUMMY users array to state like in the functional component
Remember we need to do this within the `constructor()` function and we need to call `super()` inside that function
Then we can create a state object to hold the `filteredUsers` and `searchTerm` values
```
class UserFinder extends Component {
  constructor(){
    super();
    this.state = {
      filteredUsers: DUMMY_USERS,
      searchTerm: ''
    }
  }
}
```

Now we have the `searchChangedHandler` to move over
This will be a method that receives the event object and use it to read the value from the user and add it to the `searchTerm` state
```
searchChangeHandler(event){
  this.setState({searchTerm: event.target.value});
};
```

Then we can add our render method to handle the return statement
Don't forget that in the `onChange` prop for the input we need to pass in `this.searchChangeHandler` and ALSO bind the `this` keyword to it
Also `filteredUsers` should now reference `this.state.filteredUsers`
```
render(){
  return (
    <Fragment>
      <div class={classes.finder}><input type='search' onChange={this.searchChangeHandler.bind(this)} /></div>
      <Users users={this.state.filteredUsers} />
    </Fragment>
  );
}
```

Now our component has almost been switched over but there is one part missing
```
import { Fragment, useState, useEffect, Component } from 'react';
import classes from './UserFinder.module.css';

import Users from './Users';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

class UserFinder extends Component {
  constructor(){
    super();
    this.state = {
      filteredUsers: DUMMY_USERS,
      searchTerm: ''
    }
  }

  searchChangeHandler(event){
    this.setState({searchTerm: event.target.value});
  };

  render(){
    return (
      <Fragment>
        <div class={classes.finder}><input type='search' onChange={this.searchChangeHandler.bind(this)} /></div>
        <Users users={this.state.filteredUsers} />
      </Fragment>
    );
  }

}
```

We still have to transfer the `useEffect` method that is used to updated the state value for `filteredUsers` whenever the state `searchTerm` is changed

We can't use `useEffect` in a class based component
We will use a lifecycle method to do this
The one of interest to use is `componentDidUpdate()`
This is perfect because `componentDidUpdate()` will run whever the component updates because of something like a state change
This is perfect because everytime a user types a character the state is updated 
We will use this to run a method whenever there is a change to `state.searchTerm`
```
componentDidUpdate(){

}
``` 

Then inside of here we can update the state and pass in the same logic that was used to update state in the functional version
Make sure to update the old functional state `searchTerm` in this logic to look at `this.state.searchTerm` instead
```
componentDidUpdate(){
  this.setState({
    filteredUsers: DUMMY_USERS.filter((user) => user.name.includes(searchTerm))
  })
}
```

Except this will cause an infinite loop
This is because when the state is changed `componentDidUpdate` is called and inside of there we are changing the state
This means `componentDidUpdate` will execute again and update the state etc.

To fix this we can check whether only `state.searchTerm` was updated
To do this `componentDidUpdate` is able to receive to arguments to help
`prevProps` and `prevState`
This is much like the how some of our hooks are able to access these values
We can use an if statement to see if the value of `prevState.searchTerm` changed and if so we can continue with updating the state
```
componentDidUpdate(prevProps, prevState){
  if (prevState.searchTerm !== this.state.searchTerm ){
    this.setState({
      filteredUsers: DUMMY_USERS.filter((user) => user.name.includes(this.state.searchTerm))
    })
  }
}
```

At this point our class based component can handle the side effect of comparing the new state values and only do this when a certain value changes just like `useEffect` would do
```
import { Fragment, useState, useEffect, Component } from 'react';
import classes from './UserFinder.module.css';

import Users from './Users';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

class UserFinder extends Component {
  constructor(){
    super();
    this.state = {
      filteredUsers: DUMMY_USERS,
      searchTerm: ''
    }
  }

  searchChangeHandler(event){
    this.setState({searchTerm: event.target.value});
  };

  componentDidUpdate(prevProps, prevState){
    if (prevState.searchTerm !== this.state.searchTerm ){
      this.setState({
        filteredUsers: DUMMY_USERS.filter((user) => user.name.includes(this.state.searchTerm))
      })
    }
  }

  render(){
    return (
      <Fragment>
        <div class={classes.finder}><input type='search' onChange={this.searchChangeHandler.bind(this)} /></div>
        <Users users={this.state.filteredUsers} />
      </Fragment>
    );
  }

}
```

Now we will explore a couple other lifecycle methods like `componentDidMount` and `componentWillUnmount`

Let's say our dummy users were actually loaded from a server
In that case `state.filteredUsers` would start as an empty array and then be filled once we received that data from the server
We can't use `componentDidUpdate` because we wouldn't want to fetch the users over and over again
Instead we want to fetch this list when the component is loaded for the first time
We also wouldn't want to do this in the constructor because it could cause a delay in loading our component
If the server holding the data was unreachable our component may never render properly which would be really bad

If we use `componentDidMount` it will run once (when the component is mounted for the first time)
Inside there we would be able to send an http request, receive the data, and add that data to our state
```
componentDidMount(){

}
```

Be sure to set the initial state value for `state.filteredUsers` to an empty array
```
constructor(){
  super();
  this.state = {
    filteredUsers: [],
    searchTerm: ''
  }
}
```

Then within `componentDidMount` we can 'send an http request' (just a comment) and assign `DUMMY_USERS` to state to simulate receiving that data from a server
```
componentDidMount(){
  // Send http request...
  this.setState({filtredUsers: DUMMY_USERS});
}
```
Remember `componentDidMount` will only run the very first time this component is mounted and will not run when it is updated like `componentDidUpdate`
This is equivelant to `useEffect` with no dependencies

Last is `componentWillUnmount` we can practice this one in our `<User>` component
It actually is unmounted whenever the button is clicked to hide the users list so this is perfect

So within `<User>` we can add `componentWillUnmount` and add a console log message
```
componentWillUnmount() {
  console.log('<User> unmounted...')
}
```

If you run this you will notice that there are 3 console log messages added everytime the hide button is clicked
That is because we are actually calling the `<User>` component 3 seperate times within `<Users>` so each one of them is outputting a message when they unmount




___
## 169. Class-based Components & Context
Context can still be created and provided we can pass values to that context
To follow along get the updated `<App>` component and `users-context` provided on github
`<App>`: https://github.com/academind/react-complete-guide-code/blob/13-class-based-cmp/extra-files/App.js
`users-context`: https://github.com/academind/react-complete-guide-code/blob/13-class-based-cmp/extra-files/users-context.js

Create a store folder to hold the `users-context` file and replace `<App>`

We still use the provider as we learned it
The only thing that changes is how we use it within the component that needs it

We need to go into the `<UserFinder>` component in there we no longer want to receive `DUMMY_USERS` from within, instead we want to get that from context
In a functional component we have to call `useContext` but class based components don't have access to hooks

One approach is called the `context.consumer` which we briefly covered already
We can import UsersContext from the context file we created
```
import UsersContext from '../store/users-context.js';
```
Then in our `render()` method we can acess the `<UsersContext.Consumer>` tag
```
render(){
  return (
    <Fragment>
      <UsersContext.Consumer></UsersContext.Consumer>
      <div className={classes.finder}><input type='search' onChange={this.searchChangeHandler.bind(this)} /></div>
      <Users users={this.state.filteredUsers} />
    </Fragment>
  );
}
```

This is used in jsx only which allows us to use it in class based or functional components but we want access it outside of our jsx
Remove the consumer and we will prepare our context for use OUTSIDE of our jsx

There is no perfect replacement because in a functional component you can call `useContext` multiple times and access different contexts with different constants

This is not possible in class based components
In class based components you can only connect to a single context
To do this we must use the `static` keyword with the property `contextType` and assign it the value of `UsersContext` which we imported
```
class UserFinder extends Component {

  static contextType = UsersContext;
  ...
```
However the static keyword can only be used once to add a `contextType`
One workaround includes adding the other context inside of another component that we call within `UserFinder`

However, now that we have access to the context we need we can access it within `componentDidMount` to set our state value
```
componentDidMount(){
  // Send http request...
  this.setState({filteredUsers: this.context.users});
}
```
We also need to use this context instead of the `DUMMY_USERS` in `componentDidUpdate`
```
  componentDidUpdate(prevProps, prevState){
    if (prevState.searchTerm !== this.state.searchTerm ){
      this.setState({
        filteredUsers: this.context.users.filter((user) => user.name.includes(this.state.searchTerm))
      })
    }
  }
```

Note that we accessed these values with `this.context.users` this is because within `users-context.js` we have our data saved under the `users` key within our context object

Now our application should work as it did before except it is now using context instead of having the `DUMMY_VALUES` directly inside of the component