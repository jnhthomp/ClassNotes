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