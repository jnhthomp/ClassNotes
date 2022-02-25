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