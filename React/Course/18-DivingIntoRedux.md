# Section 17: Practice Project: Adding Http & Forms To The Food Order App
Section github: https://github.com/academind/react-complete-guide-code/tree/18-diving-into-redux
___
## 226. Module Introduction
Now we will cover a popular 3rd party library called redux
We will cover what it is, why it is important in the react ecosystem, and how we use it in react apps

We will cover:
1. What is Redux and why?
2. Redux basics & Using Redux with React
3. Redux toolkit which simplifies working with redux




___
## 227. Another Look At State In React Apps
First what is redux?
It is a state management system for cross-component or app-wide state
This means if there is state that needs managed by more than one component redux is there to help
This is the same kind of scenario that we have used context for in the past

We have used state in the past to monitor whether data has changed and allow the app to update
We can kind of split the definition of state to three main kinds of state
1. Local State
  - State that belongs to a single component
    For example listening to user input in an input field; toggleing a show more details field
  - Managed with inside of the component with `useState` or `useReducer`
2. Cross-Component State
  - State that affects multiple components
    For example open/closed state of a modal overlay (may have multiple components to make modal)
  - Can still use `useState` and `useReducer` but must pass their values and methods to update down via props
3. App-Wide State
  - State the affects the entire app (most/all components)
    For example user authentication may make some options or data available/unavailable
  - Can still be used with `useState` and `useReducer` but props must again be used

For cross component and app wide state passing props down can be cumbersome so we have used react context to do this instead
This is a built in feature in react that makes managing cross component and app wide state easier

Redux solves this same problem
Redux and context both accomplish the same thing




___
## 228. Redux Vs React Context
So if redux and context do the same thing we do we have both of them?

Context has a few potential disadvantages
These reasons may not matter in the app you are building so sometimes context will be totally fine to use
You can also use both of them in the same application for different reasons
You may use Redux for general app wide state but use context for multi component state

First the disadvantages of react context:
- One is that it may have a very complicated setup and managing state with context can get complex
For small or medium sized applications this may not be a problem but you may eventually have a lot of provider components that are nested within each other like this:
```js
return (
  <AuthContextProvider>
    <ThemeContextProvider>
      <UIInteractionContextProvider>
        <MultiStepFormContextProvider>
          <UserRegistration />
        <MultiStepFormContextProvider/>
      <UIInteractionContextProvider/>
    <ThemeContextProvider/>
  <AuthContextProvider/>
)
```
This can be hard to read, write, or modify
You could just use one big context provider for managing the entire state and different kinds 
But that could result in a large context provider component which is also hard to manage
You may have a single context which is in charge of authentication, theming, and everything else from the above example

- Another is performance the context we are using is good for changes that don't happen often (like a theme change or authentication) 
But shouldn't be used for high frequency updates (like tracking keystrokes but nothing specific as far as how frequent)




___
## 229. How Redux Works
So now we know what redux is and why we would use it lets see how it works

Redux is about having one central data store (state) within the application
In this store you would have every type of cross component state that you would need to manage in the entire application
The good thing is that we don't need to directly manage this store all the time

What do we do with this central data store?
We have this data store so that way we can use it inside of our components
Then if it changes our components will know about it and can react as needed
For this components set up something called "subscriptions" to the data store
Whenever the data a component is subscribed to changes the store notifies the components
Then the components can get the data that they need (such as a slice from the redux store)
That is how we get data out of the store

What about putting data into the store or changing it?
To start components NEVER direclty manipulate redux store data
Instead we use a concept called 'reducers' which is a function that mutates the store data
The term reducer is something we have heard before with `useReducer` this is NOT the same function but does follow the general concepts
Reducer functions are a concept and not limited to the specific hook `useReducer` which specifically manages state
In general reducers take an input and reduces it to an output

How do we connect components with these reducer functions?
There is a third concept called 'actions' which components can dispatch
Components cannot manipulate the store directly but they can trigger actions within it
An action is a javascript object which describes the operation the reducer should perform
Redux forwards the action to the reducer, reads the description, and performs the specified operation
The operation will return a new state to the data store to update the state
Then any component subscribed to that state will update (like the one that triggered the dispatch action)

This is the same pattern that `useReducer` utilizes but applied to an app wide state like context




___
## 230. Exploring the Core Redux Concepts
For exploring the redux basics the teacher is going to use a brand new project
This is not a react project, it is an empty folder so feel free to follow along in an empty folder

In that folder create a new js file with any name
create: 'redux-demo.js'

We will execute this file with node.js which allows us to run js outside the browser
It should already be installed since we need it to create and develop react apps

In the folder where we created the file run `$npm init -y` in the terminal
This will create a 'package.json' file which we need to install third party packages

We need this to install redux
To do this we run `$npm install redux`
This will install redux to our empty project folder
This will give us `node_modules` folder with redux and it's dependencies

Now in our 'redux-demo.js' we can import and use redux
The syntax is a little different since we are using node instead of the browser but the concept is the same
Import redux
```js
const redux = require('redux');
```

Now we need to do a couple of things such as creating the store, reducer function, actions, and a component (or js code that sets up a subscription since we aren't using react)

We will start with the store since that is the core of redux and the most important piece of it
We can create the store by calling the redux object we imported
It has a function built in called `createStore()`
This will return a store so we will need to store it in a constant
```js

const redux = require('redux');

const store = redux.createStore();
```

Now what do we do with this store?
It should manages some data
This data is managed by the reducer function and it is the reducer function that will provide state snapshots to this store

When we run our `createStore()` call is run for the first time it will also need to run this reducer function in order to get an initial state
So we can now create the reducer function that will return an initial state to this `createStore()` call
A reducer function is a standard type of js function but when it is called by the redux library it will always receive two parameters
The old state, and the action that was dispatched
Then the reducer must return a new state object
A reducer function should be a pure function
The same values for the same inputs should produce the exact same outputs and there should be no side effects
Do not send http requests inside of this reducer or write to local storage or fetch from local storage

So we need to include `state` and `action` parameters to our reducer function
Then we need to return a new state object which will replace the existing state object
In this case the object will just be a key with an initial value of 0
```js
// import redux
const redux = require('redux');

// Redux reducer function
const counterReducer = (state, action) => { 
  return { counter: 0}
}

// Create redux store
const store = redux.createStore();
```
Now our reducer function will always return an object with a counter set to 0
To make it a little more realistic we will just output the current value of the counter + 1
```js
const counterReducer = (state, action) => { 
  return { counter: state.counter + 1}
}
```
Now we can pass this `counterReducer` to the `createStore()` function so that it can receive an initial state and know which function will handle updating the state
```js
// Create redux store
const store = redux.createStore(counterReducer);
```

Now we need something to subscribe to the store and an action to dispatch
We will start with the subscription
We will create a new constant called `counterSubscriber` which will hold a function
It does not receive any arguments but can use the store object to call `.getState()`
We will just console.log that state
```js
const counterSubscriber = () => { 
  const latestState = store.getState(); 
  console.log(latestState);
}
```

Now we can make redux aware of the subscriber function
we have to call `store.subscribe()` and pass in the method we created as an argument

Redux will execute the method passed in as an argument any time that the state value changes
```js
store.subscribe(counterSubscriber);
```

Now we have a subscriber and reducer but we don't have an action
But lets just open a terminal/command prompt and see what this does
In the project folder run `$node redux-demo.js`

We will get an error and this is expected because we are creating a store and the store has a reducer and we are returning a state object which sets the counter to the old state counter + 1
The problem is that when the store is initialized there is no previous state counter

So we should give state a default value in our reducer 
This will assign a default value to state the first time the reducer function is run since no state is passed in as an argument
```js
const counterReducer = (state = { counter: 0 }, action) => { 
  return { counter: state.counter + 1}
}
```

Now if we try again we still aren't getting anything in the console

Instead we are initializing the state and subscribing a component to it but that component does not update because the state value does not change (it is just initialized to 1)

We need to write a dispatch function which we can access by calling `store.dispatch()` this function receives an object as an argument
This object should have a key called `type` which holds a string that will 'choose' the action we want to take
```js
store.dispatch({type: 'increment'});;
```

If you remember reducer functions then technically this is all that we need
We do not have an action defined in our reducer function to andle an `'increment'` action so the default return statement is returned instead
This will update `state.counter` by 1 which triggers our `counterSubscribe` function since it is subsrcibed to this state
`counterSubscribe` will then get the current value of state and then log it to the console as 2 (count was initialized to 1)





___
## 231. More Redux Basics
Currently we are dispatching an action that has a type of 'increment' 
Normally when we use redux the goal is to do different things with different actions which is why we receive the action object

We can choose what kind of action we take by looking at the action and using an if statement to return different values based on the action provided
```js
const counterReducer = (state = { counter: 0 }, action) => { 

  if(action.type === 'increment') {
    return { counter: state.counter + 1 }
  }

  return state;
}
```

Now when we initialize counter will be 0
Then when we increment it will go to 1 each time that dispatch action is called
This will trigger `counterSubscriber` to trigger since it is called when state is updated
We can also dispatch other actions as well
```js
// import redux
const redux = require('redux');

// Redux reducer function
const counterReducer = (state = { counter: 0 }, action) => { 

  if(action.type === 'increment') {
    return { counter: state.counter + 1 }
  }
  if(action.type === 'decrement') {
    return {counter: state.counter - 1}
  }

  return state;
}

// Create redux store
const store = redux.createStore(counterReducer);

// Create subscriber
const counterSubscriber = () => { 
  const latestState = store.getState(); 
  console.log(latestState);
}

// add subscriber function to redux
store.subscribe(counterSubscriber);

// dispatch an action on our state
store.dispatch({type: 'increment'});
store.dispatch({type: 'decrement'});
// => { counter: 1 }
// => { counter: 0 }
```

This is basically how redux works and can be used in any js project, not just react




___
## 232. Prepping a New Project
Now we try using redux in a react application
See the starting app here: https://github.com/academind/react-complete-guide-code/tree/18-diving-into-redux/code/01-starting-project

Now in our demo project there are a few prepared components
We will transfer our previous counter example to this react application

We will need to install the redux package to do this
We will also need to install react-redux
This is because redux isn't react specific so we need a package so that react can manage redux
This makes it easy to subscribe components to the redux store
Install these two components with `$npm install redux react-redux` in the terminal




___
## 233. Creating a Redux Store for React
Now to get started with redux we have to again make a store just like in our vanilla js version
To do this we will create a store folder inside the src folder
create 'src/store/index.js'
In here we want to repeat what we did before
We want to create a store and reducer

First we need to import something from redux
```js
import {createStore} from 'redux'
```
Then we need to use the `createStore()` function and pass in a reducer
```js
const store = createStore(counterReducer)
```
Then we need to provide the reducer function
```js
const counterReducer = (state = { counter: 0 }, action) => { 
  return state
}
```

Now we can write our dispatch functions and pass in an action argument
```js
store.dispatch({ type: 'increment' })
store.dispatch({ type: 'decrement' })
```

Now we need to create actions for these types in our reducer function
```js
const counterReducer = (state = { counter: 0 }, action) => { 
  if(action.type === 'increment'){
    return{
      counter: state.counter + 1
    }
  }
  if (action.type === 'decrement') {
    return {
      counter: state.counter - 1
    }
  }
  return state
}
```

Now instead of calling these dispatch actions inside of this file we want to call them in our react components

Add an export to the end of our file to export the store constant
```js
import {createStore} from 'redux';

const counterReducer = (state = { counter: 0 }, action) => { 
  if(action.type === 'increment'){
    return{
      counter: state.counter + 1
    };
  }
  if (action.type === 'decrement') {
    return {
      counter: state.counter - 1
    };
  }
  return state;
}

const store = createStore(counterReducer);

store.dispatch({ type: 'increment' });
store.dispatch({ type: 'decrement' });

export default store;
```




___
## 234. Providing the Store
To provide the store to our react application
We will typically go to the `src/index.js` file 
This is because it renders app and therefore is able to provide our store to the `<App>` component as well as all of it's children and nested children
This is the exact same idea as we did with context where we wrapped components that needed access to that context with a provider component

Here we import the provider component from react redux and wrap `<App>` with it
```js
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';

import './index.css';
import App from './App';

ReactDOM.render(<Provider><App /></Provider>, document.getElementById('root'));
```

You could also wrap nested components with the provider with this provider but only the wrapped components and their children will have access to redux
If most components need access to the store then you should provide it on the highest level

We haven't told react-redux which store to provide
We only have one store but react-redux doesn't know that file holds the store
So we have to import this store  and add it as the store property of the `<Provider>`
```js
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import store from './store/index.js';

import './index.css';
import App from './App';

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>, 
  document.getElementById('root')
);
```

Now our redux store has been provided to the react app
This doesn't do much but your components can now tap into the store, setup a subscription, and dispatch actions




___
## 235. Using Redux Data in React Components
What if we wanted to use the store data from redux inside of the `<Counter>` component?
This is the component we see when we run the app
It is a container that outputs the counter value and we can get a toggle counter button which will show or hide the counter

To start we want to output the current counter value
We can get that by using the 'react-redux' library
It has a custom hook that is made by the react-redux team called `useSelector`

It allows us to automatically select a part of our state managed by the store
We could use `useStore` but that would select the entire store which we don't necessarily want to do
If we were using a class based component and not a functional component then there is a 'connect' function to use instead
This can be used as a wrapper around the class component to connect it to the store

For now we will focus on `useSelector` since we are using functional components
import
```js
import { useSelector } from 'react-redux';
```

Now we can call this function to get that data
We need to pass a function inside that will be executed by react redux to determine which piece of data we want to extract from the store
For now we have a very simple store but in a large application there can be a large store with a bunch of data and getting a slice will be very helpful
This function will get the current state as an argument fromm react redux
We just want to return the part of state that we want to access
```js
useSelector((state) => state.counter )
```

This will pass the redux state into the function and retrieve the part of state that we specified and return it
```js
const counter =  useSelector((state) => state.counter )
```

Now that we have used `useSelector` react redux will automatically setup a subscription to this component for this store
Changes to that store will cause the componet to rerender

If you unmount the component react redux will also clear the subscription for you

Now that we have the coutner we can use it in our return to output the counter value
```js
import { useSelector } from 'react-redux';
import classes from './Counter.module.css';

const Counter = () => {
  const counter =  useSelector((state) => state.counter );

  const toggleCounterHandler = () => {};

  return (
    <main className={classes.counter}>
      <h1>Redux Counter</h1>
      <div className={classes.value}>{counter}</div>
      <button onClick={toggleCounterHandler}>Toggle Counter</button>
    </main>
  );
};

export default Counter;

```




___
## 236. Dispatching Actions From Inside Components
Now we want to dispatch some actions
We are going to want two new buttons that activate these actions
One will increment and the other will decrement

Simply add two buttons to the counter component
```js
import { useSelector } from 'react-redux';
import classes from './Counter.module.css';

const Counter = () => {
  const counter =  useSelector((state) => state.counter );

  const toggleCounterHandler = () => {};

  return (
    <main className={classes.counter}>
      <h1>Redux Counter</h1>
      <div className={classes.value}>{counter}</div>
      <div>
        <button>Increment</button>
        <button>Decrement</button>
      </div>
      <button onClick={toggleCounterHandler}>Toggle Counter</button>
    </main>
  );
};

export default Counter;

```
Then for spacing we will change the css a little
Add this css rule to Counter.module.css
```css
.counter button {
  margin: 1rem;
}
```

Now we want to wire up these two buttons so that they increase or decrease the counter by one
We know we need to dispatch an action but how do we do that in a react component?
There is another hook we can use called `useDispatch` which we also need to import
```js
import { useSelector, useDispatch } from 'react-redux';
```

When we call `useDispatch` we don't pass any arguments to it
Instead we receive a function back that we can call which will dispatch an action against our redux store
```js
const dispatch = useDispatch();
```

So let's add two new functions to handle the increment and decrement
Inside of these handler functions which will be executed by the buttons we will call the dispatch function we just recieved back from `useDispatch`
It will need to be passed an object with the appropriate type values just like with other reducer functions
```js
const incrementHandler = () => {
  dispatch({type: 'increment'})
}

const decrementHandler = () => {
  dispatch({type: 'decrement'});
}
```

Now we need to wire up these handler functions to the buttons
```js
<div>
  <button onClick={incrementHandler}>Increment</button>
  <button onClick={decrementHandler}>Decrement</button>
</div>
```




___
## 237. Redux With Class-Based Components
Even though they aren't the focus of the course we should cover how class based components use redux
There are some projects that will already be using class based components so it is good to know

For this we will just add another component to our counter component below our existing code while we swap it out

Remember for class based components we need to import `Component` from react
```js
import { Component } from 'react';
```

Next we need to create a class component add the render method which will return our jsx code
```js
class Counter extends Component {
  render(){
    return (
      <main className={classes.counter}>
        <h1>Redux Counter</h1>
        <div className={classes.value}>{counter}</div>
        <div>
          <button onClick={incrementHandler}>Increment</button>
          <button onClick={decrementHandler}>Decrement</button>
        </div>
        <button onClick={toggleCounterHandler}>Toggle Counter</button>
      </main>
    );
  }
}
```

Now we will need to add the increment/decrement handler, the toggle handler, and get access to our counter
First the methods
Then when we hook them up remember we have to use the `this` keyword since we are using class based components
```js
class Counter extends Component {

  incrementHandler(){}
  decrementHandler(){}
  toggleCounterHandler(){}

  render(){
    return (
      <main className={classes.counter}>
        <h1>Redux Counter</h1>
        <div className={classes.value}>{counter}</div>
        <div>
          <button onClick={this.incrementHandler}>Increment</button>
          <button onClick={this.decrementHandler}>Decrement</button>
        </div>
        <button onClick={this.toggleCounterHandler}>Toggle Counter</button>
      </main>
    );
  }
}
```

Now how do we get access to redux?
In the functional component we used hooks but we cannot do that in class based components
react-redux allows you to import a connect method which is used in class based components 
Technically you could use connect in a functional component as well but our hooks are more simpler
```js
import { useSelector, useDispatch, connect } from 'react-redux';
```

To use connect we call `connect()` in the export
When it is executed it will return a new function which we execute immediately, passing our class as an argument
```js
export default connect()(Counter);
```
This looks weird but connect is called a higher order component which is used in this way
connect will execute which will return a function which will also execute and receive our counter as an argument

We do it this way because connect also wants some arguments
Both arguments are functions
The first is one that maps redux state to props which will be recieved in our component
We will call this function `mapStateToProps` this name isn't required but is convention in a lot of projects
This function will receive the redux state as an argument return an object 
For this object the keys will be available as props inside of our counter component
The value of the keys are the logic for drilling into the redux state
```js
const mapStateToProps = (state) => { 
  return {
    counter: state.counter
  };
}
```
This is the first argument we pass to `connect`
```js
export default connect(mapStateToProps,)(Counter);
```

Now we need to map our dispatch actions to props
It is the same idea as maping state except we are going to map our dispatch actions to props that will be available to our component
This will give us certain props that we can execute as a function which will execute actions in the redux store

This functions receives `dispatch` as an argument
Then it returns an object which uses the names we want the props to be as keys
For the value of these keys we call 'dispatch' with the action we want to pass as the result of an anonymous arrow function
```js
const mapDispatchToProps = (dispatch) => {
  return {
    increment: () => dispatch({ type: 'increment' }),
    decrement: () => dispatch({ type: 'decrement' })
  };
}
```
This ensures that when increment and decrement are called it will call the function and execute the action

Now we can add this method as the second argument to connect
```js
export default connect(mapStateToProps, mapDispatchToProps)(Counter);
```

Now react redux will setup and manage a subscription for us

Now lets take advantage of these props in our component
Now we can execute these functions in our component
We will have to call `.bind(this)` on our methods so that they can keep track of the fact that `.this` within them refers to the class
```js
class Counter extends Component {

  incrementHandler(){
    this.props.increment() // Add dispatch
  }
  decrementHandler(){
    this.props.decrement() // Add dispatch
  }
  toggleCounterHandler(){}

  render(){
    return (
      <main className={classes.counter}>
        <h1>Redux Counter</h1>
        // Add counter state
        <div className={classes.value}>{this.props.counter}</div>
        <div>
          <button onClick={this.incrementHandler.bind(this)}>Increment</button>
          <button onClick={this.decrementHandler.bind(this)}>Decrement</button>
        </div>
        <button onClick={this.toggleCounterHandler}>Toggle Counter</button>
      </main>
    );
  }
}

const mapStateToProps = (state) => { 
  return {
    counter: state.counter
  };
}

const mapDispatchToProps = (dispatch) => {
  return {
    increment: () => dispatch({ type: 'increment' }),
    decrement: () => dispatch({ type: 'decrement' })
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Counter);
```

If we comment out the functional component and save it should work as before but with a class based component
I will switch the project back to the class based version before continuing




___
## 238. Attaching Payloads to Actions
So far we have only dispatched actions that have a type
Sometimes we will want to attach a value to that type to so that we can have the action use that value in its assignment

Say we want to add a button to the counter component to increase by 5
```js
<div>
  <button onClick={incrementHandler}>Increment</button>
  <button onClick={incrementHandler}>Increase by 5</button>
  <button onClick={decrementHandler}>Decrement</button>
</div>
```

We could go to the store and prepare the reducer for another type to increase by 5 but that is not scaleable
The counter is just a dummy example but you may need to insert a value to a state that is passed in via these actions

So we could create an action called increase that instead of just incrementing by 1 it increases state by a value we expect to pass via the action object
```js
const counterReducer = (state = { counter: 0 }, action) => { 
  
  if(action.type === 'increment'){
    return{
      counter: state.counter + 1
    };
  }

  if(action.type === 'increase'){
    return{
      counter: state.counter + action.amount
    };
  }

  if (action.type === 'decrement') {
    return {
      counter: state.counter - 1
    };
  }

  return state;
}
```

Now we will make an `increaseHandler` back in the counter to dispatch this action and pass in the value
```js
const Counter = () => {
  const dispatch = useDispatch();
  const counter =  useSelector((state) => state.counter );

  const incrementHandler = () => {
    dispatch({type: 'increment'})
  }

  const increaseHandler = () => {
    dispatch({type: 'increase', amount: 5});
  }

  const decrementHandler = () => {
    dispatch({type: 'decrement'});
  }
  ...
```

Now when we attach an amount key the value will be passed into the action object
When we point at this handler in our button we will update our counter by 5 each click
```js
<button onClick={increaseHandler}>Increase by 5</button>
```

We could even get rid of the `increment` action and just pass in 1 but will keep it as is for now since this is just a sample app




___
## 239. Working With Multiple State Properties
So far we have been using redux with only a single state value
Let's add another via a toggle state

There is a toggle counter button
We want to be able to click it to show and hide the counter
Obviously we could and even should do this locally with `useState` but for the sake of the example we are going to use redux

When we click the button the toggleCounterHandler is triggered
We will want to make sure that it triggers an action to update state in redux to control whether the counter div shows

To do this we need a new state in our redux store
We need to go to our reducer and add it to all of our state snapshots
Starting with the initial state snapshot 
We don't want to change this value in any of our existing actions so we can use the spread operator to drop in the current value of state before updating the counter
```js
const counterReducer = (state = initialState, action) => { 

  if(action.type === 'increment'){
    return{
      ...state,
      counter: state.counter + 1
    };
  }

  if(action.type === 'increase'){
    return{
      ...state,
      counter: state.counter + action.amount
    };
  }

  if (action.type === 'decrement') {
    return {
      ...state,
      counter: state.counter - 1
    };
  }

  return state;
}
```

Now we will add a new action type that handles changing the value of `showCounter` without changing the value of counter
```js
if (action.type === 'toggleShowCounter') {
  return {
    ...state,
    showCounter: !state.showCounter
  }
}
```

Now that we have this action we can dispatch it in our `toggleCounterHandler`
```js
const toggleCounterHandler = () => {
  dispatch({type: 'toggleShowCounter'});
};
```

Now in order to read and do something based on the value of `showCounter` state we need to access it just like we did to access the value of `counter` with `useSelector`
```js
const showCounter = useSelector((state) => state.showCounter);
```

Now we can use `showCounter` to conditionally render the counter div
```js
{showCounter && <div className={classes.value}>{counter}</div>}
```

If we save and reload and click the toggle button the counter value is hidden




___
## 240. How To Work With Redux State Correctly
It was mentioned that we always return a brand new snapshot of a state object that redux will use to replace the existing state with

This is important because it means the objects we return in the reducer will not be merged with the existing state, they will OVERRIDE the existing state
If we were to forget to set showCounter when we increment then our counter will hide when we click increment
This is because since `showCounter` is no longer defined it is falsey and therefore hides the counter
So you have to be careful to set all of the other states
This is why I use the spread operator instead of listing them in each
That way if there is a new piece of state added you don't have to add it to every action when you are making the update

So why do you have to return a whole new state object every time?
Why can't you just do something like this?
```js
state.counter++
return state
```
If we were to do that it would work so it isn't easy to see that is wrong but it is wrong
Do not ever do this
Never mutate the existing state always override it by returning a brand new state object
Because objects and arrays are reference values it is easy to override and change the existing state
You should absolutely not mutate the existing objects in state
You can see an article and video about this here: https://academind.com/tutorials/reference-vs-primitive-values

If you were to do it this way there could be bugs, unpredictable behavior, and make debuggin difficult
It is possible for the state to get out of sync when updating the state this way
If you always return a brand new object as state then you shouldn't run into this problem

When you have a state with nested objects and arrays it is easy to accidentally mutate your existing state so you need to be careful
Never just dive into an existin object and start manipulating its properties




___
## 241. Redux Challenges & Introducing Redux Toolkit
The more complicated our complex become the more complicated it is to manage redux directly
There is a slightly different way that redux can be managed as well that can be easier to setup and maintain

First we will look at some issues our project could face if it were to continue to grow

One issue is the action types
We have to make sure to avoid any typos the action we want won't be handled correctly
This can be a problem in bigger applications where clashing or messed up identifiers showup

Another potential problem is the amount of data we have
The more data we have, the bigger the state is and the more state we have to copy whenever we are writing these actions
It can be a challenge to make sure you are nesting any data that you are saving properly

There could also be an issue with the state immutability and don't accidentally change the existing state anywhere, especially with more complex data that has nested objects and arrays

There are solutions we could implement for all of these problems but there is also an easier way to manage this called redux toolkit

This is a library that is developed by the same team that builds react-redux and redux
It is an extra package that makes working with redux a little easier but isn't required to use




___
## 242. Adding State Slices
Now lets get started with redux toolkit
Be able to quit any running instances of our application and install it by using the following command from a terminal in your project folder
```bash
$npm install @reduxjs/tookit
```

Once installed we can uninstall redux because it is included in the toolkit we just installed
To do that simply go to package.json and remove the redux entry
Then a quick `$npm install` should have us ready to go

Now we are ready to use it but how?
We use it in the store folder in index.js just like we did with redux
We will start with the reducer
We can import something called `createSlice` from the toolkit
```js
import { createSlice } from '@reduxjs/toolkit';
```

There is also `createReducer` but `createSlice` is more powerful
Once this is imported we can call it
We will call it below our `initialState`
We can create multiple slices but for now we will create one slice
This method should receive an object with a few different key/values
One is the name of the slice, one is the initial value of the slice and one is reducers that are associated with that slice
The reducers property is also an object holding all the reducer methods that this slice of state will need
```js
createSlice({
  name: 'counter',
  initialState,
  reducers: {
    increment() {},
    decrement() {},
    increase() {},
    toggleCounter() {}
  }
});
```
Each of the methods in the reducers will automatically receive the latest state as an argument when it is called so we need to add that to each
```js
createSlice({
  name: 'counter',
  initialState,
  reducers: {
    increment(state) {},
    decrement(state) {},
    increase(state) {},
    toggleCounter(state) {}
  }
});
```
We don't need to pass in an action because we will have a way of targetting these methods without if checks

Now we need to write our methods inside of these methods
We can do something a little different and we are allowed to mutate the state
Why can we do this when this was previously forbidden?
That is because even though it looks like we are mutating the state redux toolkit makes it so you CANNOT mutate the original state
Redux toolkit uses another package that will detect our code and automatically clone the existing state, create a new state objects, keep the state that we are not editing, and put in the state we are changing
This means it actually isn't immutable and is replacing the entire object behind the scenes thanks to redux toolkit
But it looks like we are editing the state directly
This makes it much easier to work with redux
```js
createSlice({
  name: 'counter',
  initialState,
  reducers: {
    increment(state) {
      state.counter++; 
    },
    decrement(state) {
      state.counter--;
    },
    ...
```

Now for our `increase` method we need some extra data so how do we pass that in?
We can add an action argument for these we just don't need to include them in methods that don't have extra arguments since redux toolkit handles the type value that we have been using to select actions
```js
createSlice({
  name: 'counter',
  initialState,
  reducers: {
    increment(state) {
      state.counter++; 
    },
    decrement(state) {
      state.counter--;
    },
    increase(state, action) {
      state.counter = state.counter + action.value;
    },
    toggleCounter(state) {
      state.showCounter = !state.showCounter
    }
  }
});
```

Now we have a slice created and need to make our store aware of it and dispatch the actions inside