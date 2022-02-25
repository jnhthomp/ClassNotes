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