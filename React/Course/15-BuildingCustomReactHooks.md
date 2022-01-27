# Section 15: Building Custom React Hooks
Section github: https://github.com/academind/react-complete-guide-code/tree/15-building-custom-react-hooks
___
## 186. Module Introduction
We will continue diving deeper and deeper into react

Another core feature of react and something you will use while building applications are custom hooks
Up to this point we have worked a lot with hooks such as
`useState`, `useReducer`, `useEffect`, `useContext` etc.

Rememeber that we can only use react hooks in component functions and in custom hooks
Before we said we would cover that later and now we are there

This section will cover
- What & why?
- Building a custom hook
- Custom hook rules and practices




___
## 187. What Are Custom Hooks?
First we need to clarify what these are before we discuss why we use them
They are just functions but they are functions that contain 'stateful' logic
You can build custom hooks outsource stateful logic into reuseable functions

Unlike regular functions custom hooks can use other react hooks and react state
With custom hooks you can outsource logic you might use in different components to a custom hook
Then this custom hook can be used within different components
Think of it as a mechanism to reuse logic
It is like a regular function except we are allowed to use react hooks inside




___
## 188. Creating a Custom React Hook Function
For this excercise we will use a sample project 
This will only be used for the next few lessons while we learn before we move on to a bigger project
You can find the sample starting code here: https://github.com/academind/react-complete-guide-code/tree/15-building-custom-react-hooks/code/01-starting-project

This app just has two counters, one counts up and the other counts down
You can see there are only three components (other than `<App>`)
One component is a card which is used for wrapping/styling the other two are the backwards and forwards counters
You can see that they both manage their own state and use `useEffect` with an interval set to increase/decrease the value in state when the interval is met
This will update state which will start the counter again due to the empty dependency array in `useEffect` which causes it to run on every component reload

These two components are pretty similar
In a real application you may have different components which to a certain extent do related tasks
Here we can see that we have quite a bit of code duplication in our forwards and backwards counter since they are both doing the same thing
One just shows the positive value of a number and the other shows the negative value
However they are both updating a number at the same interval and both should stay in sync on the 'same' but opposite numbers

We want to refactor this to create a function that allows our counters to share code
The issue is that the code we want to duplicate uses hooks like `useState` and `useEffect`

To create a custom hook we create a new folder called hooks under our src folder
create: src/hooks

Then we will create a file to hold our function 
create: src/hooks/use-counter.js

We can name the file whatever we want but the function name inside of this file does need to start with `use`
This function MUST start with 'use' 
This signals to react that it will call react hooks and is a promise to react that we will only call this function in places where we can call hooks
Otherwise if you were to use react hooks in custom hooks and then use the custom hook in the wrong place you would be using react hooks in the wrong place
Some editors will give you a warning if you start a function with use and then start to use it in the wrong place
First create our function and export it
```js
const useCounter = () => {

};

export default useCounter;
```

Now we can start adding the logic we want to reuse
If we start with the forward counter we can just copy our `useState` and `useEffect` code
Be careful not to take any of the return jsx from `<ForwardCounter>`

Since we are using `useState` and `useEffect` now within `use-counter.js` we will need to import them
```js
import { useState, useEffect } from 'react';

const useCounter = () => {
  const [counter, setCounter] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setCounter((prevCounter) => prevCounter + 1);
    }, 1000);

    return () => clearInterval(interval);
  }, []);
};

export default useCounter;
```

Now we have our logic in a custom hook function but still want to use it in the forward counter