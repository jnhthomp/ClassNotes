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




___
## 189. Using Custom Hooks
Now that we have created our custom hook we need to use it
It turns out that we can use custom hooks the same way we use built in hooks
We just have to call it like a function

First we have to import it
```js
import { useState, useEffect } from 'react';
import useCounter from '../hooks/use-counter.js';
...
```

Then within the `<ForwardCounter>` we can call `useCounter`
If we are to call a hook that sets state within another component (like we will here with `useCounter` and `<ForwardCounter>`) then that state will be registered to that component as if it was called within that component
The state created within `useCounter` it will be tied to `<ForwardCounter>`
If we call `useCounter` again in another component (like `<BackwardCounter>`) that component will have it's OWN state to manage as well
Using a custom hook to set a state is the same as using a regular hook to set a state, that state is tied to the component it is called in
Only the logic is shared not the state values

Within the `<ForwardCounter>` we can call our hook
```js
import { useState, useEffect } from 'react';
import useCounter from '../hooks/use-counter.js';

import Card from './Card';

const ForwardCounter = () => {
  useCounter();
  ...
```
Now we have added the hook but we don't have access to any of the values because it isn't assigned to any variable
We can make this happen the same way we do for `useState` 
`useState` returns an array that we destructure
Therefore we can have our custom hook return our counter value in a return and capture it in a variable when we call `useCounter`

First return our state value
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

  return counter;
};

export default useCounter;
```

Then capture this value when we call `useCounter`
This also allows us to remove all the old `useState` and `useEffect` logic including removing the imports
```js
import useCounter from '../hooks/use-counter.js';

import Card from './Card';

const ForwardCounter = () => {
  const counter = useCounter();

  return <Card>{counter}</Card>;
};

export default ForwardCounter;

```

Now if we save and reload the counter should work just as before but now with a custom hook




___
## 190. Configuring Custom Hooks
Now in the `<BackwardCouter>` component we are using the same logic that we were using in the `<ForwardCounter>`
The only difference is subtracting 1 each `setInterval` instead of adding one

We can still use our custom hook this in our component
We just need to make it more re-usable by allowing it accept arguments just like other hooks can

We could expect any calls to `useCounter` to pass in a counter updating function like this:
```js
const useCounter = (counterUpdateFn) => {
  const [counter, setCounter] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setCounter(counterUpdateFn()); // counterUpdatFn = (prevCounter) => prevCounter + 1
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  return counter;
};
```

That is pretty flexible but takes more work each time we call it
We could make it less flexible by just expecting a boolean flag (called forwards)
If it is true the counter will count positive
If it is false the counter will count negative
Don't for
Like this:
```js
const useCounter = (forward = true) => { // forward = true sets a default value, overwritten if a value is passed in
  const [counter, setCounter] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      // If forward was ommited or set to true when passed
      if(forward){
        setCounter((prevCounter) => prevCounter + 1);
      } else{ // false (or anything other than 'true' was passed) uses backward counter
        setCounter((prevCounter) => prevCounter - 1);
      }
    }, 1000);

    return () => clearInterval(interval);
  }, [forward]);// Must add forward as dependency as it is not defined within useEffect and passed from outside

  return counter;
};
```

Now that we have a way to differentiate between counting forwards and backwards within our state when we call our hook we can use it in the `<BackwardCounter>`

We can import and call it just like we did before and make sure we are saving the returned value then output it in jsx
```js
import useCounter from '../hooks/use-counter';

import Card from './Card';

const BackwardCounter = () => {
  const counter = useCounter(false);

  return <Card>{counter}</Card>;
};

export default BackwardCounter;
```

We don't need to specify `true` in the `<ForwardCounter>` because we set that as the default value within `useCounter` although you could pass true in for clarity if you wanted




___
## 191. Onwards To A More Realistic Example
Now to use what we have learned in a more realistic scenario
Use the starter project in the following github repo:
github: https://github.com/academind/react-complete-guide-code/tree/15-building-custom-react-hooks/code/04-onwards-to-a-more-realistic-example

<center>🚨🚨🚨Important Make sure you replace the firebase link in App AND NewTask components<br>
Point to your own firebase that was set up in section 14<br>
Be sure to keep the '/tasks.json' ending🚨🚨🚨</center>

This app is just a simple task app that will use http requests to add and fetch new tasks like we learned in the last section

Adding tasks should add tasks to your firebase realtime database
Make sure that works before moving on and if it doesn't double check that you updated the link properly in the fetch request in both `<App>` and `<NewTask>`

This works with sending http requests with the fetch api, handling errors and loading, transforming the data all of which we learned last section

Importantly in `<App>` we are fetching tasks with `fetchTask`
This is done on component load because of `useEffect` or because inside of `<Tasks>` a button was clicked if there was an error that willt ry again
Then in `<NewTask>` there is a post requests which we are using to add new task data to firebase
This function is triggered when the task form is submitted

Explore the code if you don't understand so you can follow what is happening
This gives us another chance of adding a custom hook

We have two very similar operations
One is the `<NewTask>` component when we send a request to store data and in `<App>` when we send the request to get data
We can use a hook to put both of these in a single hook and call whichever function we need as we need it
In both components we are managing a loading and error state in the same way and also have the same error handling logic
Because of this we should pull it out and put it in a custom hook
It cannot be a regular function because both of these require state management




___
## 192. Building A Custom Http Hook
Now to build out our custom hook
Remember first we need to build a new folder/file
create: src/hooks/use-http.js

Then inside we can start writing our hook function
```js
const useHttp = () => {
  
};

export default useHttp;
```

Now we can think about what kind of logic we want to outsource
1. The loading and error state
2. Post/fetch functionality
3. Error handling 

We can go to the component and grab the `fetchTasks` function and state functions we use and copy them into our new hook
We don't need  the `tasks` state though so we can delete that
We will keep the loading and error state though
Remember we also need to import our hooks
We will also change the name of our function from `fetchTasks` to `sendRequest` as we will make it more generic so that it doesn't only have to be used for fetching tasks
In theory we might be able to use it for a different fetch/push request entirely if we make it reusable enough
```js
import { useState } from 'react';

const useHttp = () => {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const sendRequest = async (taskText) => {
    setIsLoading(true);
    setError(null);
    try {
      const response = await fetch(
        'https://react-http-82bca-default-rtdb.firebaseio.com/tasks.json'
      );

      if (!response.ok) {
        throw new Error('Request failed!');
      }

      const data = await response.json();

      const loadedTasks = [];

      for (const taskKey in data) {
        loadedTasks.push({ id: taskKey, text: data[taskKey].text });
      }

      setTasks(loadedTasks);
    } catch (err) {
      setError(err.message || 'Something went wrong!');
    }
    setIsLoading(false);
  };
}; 

export default useHttp;
```

So what can we make configurable in here?
We could make the url configurable so we could send requests to different firebase urls if we wished
The method, body, and headers should also be configurable
To do this we will expect an object that has all of these config options specified
```js
const useHttp = (requestConfig) => {
  ...
```

Then we can replace the url we specified with the `requestConfig.url` that we are expecting to get
```js
try {
  const response = await fetch(
    requestConfig.url
  );
```
Since we will want to use this hook for both GET and POST requests we should include another argument to fetch where we pass in an object describing our request in more detail
Remember by default fetch will use GET as the method
Since we want to do post requests also whenever we call this hook the object we pass in (`requestConfig`) will have all of these options specified
```js
    try {
      const response = await fetch(
        requestConfig.url, {
          method: requestConfig.method,
          headers: requestConfig.headers,
          body: JSON.stringify(requestConfig.body)
        }
      );
```
By using `JSON.stringify` the body itself is passed in as regular js object but is converted to json before we submit it

Now our request and how it is sent is more configurable
If we were to pass in two different objects we could get two different requests
```js
// GET object ex:
const requestConfig = {
  url: 'https://link-to-firebase-url-rtdb.firebaseio.com/tasks.json',
  method: 'GET',
  headers: null,
  body: null
}

// POST object ex
const requestConfig = {
  url: 'https://link-to-firebase-url-rtdb.firebaseio.com/tasks.json',
  method: 'POST',
  headers: {
            'Content-Type': 'application/json',
          },
  body: {text: taskText}
}
```

Now in our code we are making a configurable request, and the response will get saved to an object
We check the `.ok` value of that object which is expected to be returned by the server to tell us if our request was successful or not
If not we create an error object which will throw us into the `catch` block
If there is no error we save the data from the response and convert it from a json object to a javascript object
```js
const useHttp = (requestConfig) => {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const sendRequest = async (taskText) => {
    setIsLoading(true);
    setError(null);
    try {
      const response = await fetch(
        requestConfig.url, {
          method: requestConfig.method,
          headers: requestConfig.headers,
          body: JSON.stringify(requestConfig.body)
        }
      );

      if (!response.ok) {
        throw new Error('Request failed!');
      }

      const data = await response.json();
```

Below that we within the try block is actually not important to our hook as we don't need to save any of the tasks since this hook will not be managing those tasks
So we can remove the array, for loop, and `setTasks` call

To keep this configurable we will expect a function to format the data we have saved
That way when we call this hook we can manipulate the data object in a way that makes sense for the type of request calling it
For example on a get request the data object will be the list of tasks which we will need to process to output
However for a post request it may just be an object saying the post was successful
```js
import { useState } from 'react';

const useHttp = (requestConfig) => {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const sendRequest = async (taskText, applyData) => {
    setIsLoading(true);
    setError(null);
    try {
      const response = await fetch(
        requestConfig.url, {
          method: requestConfig.method,
          headers: requestConfig.headers,
          body: JSON.stringify(requestConfig.body)
        }
      );

      if (!response.ok) {
        throw new Error('Request failed!');
      }

      const data = await response.json();
      applyData(data);
    } catch (err) {
      setError(err.message || 'Something went wrong!');
    }
    setIsLoading(false);
  };
}; 

export default useHttp;
```
Now we have the two states that are being managed and the `sendRequest` function listed
We still need to make these states available to the component that calls it as well as the `sendRequest` function

So at the end of our custom hook we need to return something that allows us to access these
We can return an object that has these values/functions available
```js
const useHttp = (requestConfig) => {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const sendRequest = async (taskText, applyData) => {
    setIsLoading(true);
    setError(null);
    try {
      const response = await fetch(
        requestConfig.url, {
          method: requestConfig.method,
          headers: requestConfig.headers,
          body: JSON.stringify(requestConfig.body)
        }
      );

      if (!response.ok) {
        throw new Error('Request failed!');
      }

      const data = await response.json();
      applyData(data);
    } catch (err) {
      setError(err.message || 'Something went wrong!');
    }
    setIsLoading(false);
  };

  return {
    isLoading: isLoading,
    error: error,
    sendRequest: sendRequest
  }
}; 
```

Since we are using matching names we can use a javascript shortcut
```js
return {
  isLoading,
  error,
  sendRequest
}
```
This does the same thing as the previous return statement just with a different/shorter syntax