# Section 10: Advanced: Handling Side Effects, Using Reducers & Using the Context API
Section github: https://github.com/academind/react-complete-guide-code/tree/10-side-effects-reducers-context-api
___
## 109. Module Introduction
Now that we have the core basics foundation and it's most important features covered we will taket he next step
We will look at 3 important concepts
- effects 
- reducers
- context

These features are a little more advanced 
This does not mean difficult you just need to know the concepts we have already covered
These features will allow  us to make big steps towards building more complex applications

In this module we will take a closer look at 
- what effects are and how you can work with sideeffects
- How we can manage more complex state within our components with reducers 
- Explore appwide (or at least multiple component wide) state with context (makes sharing state and state updates across components easier)




___
## 110. What are "Side Effects" & Introducting useEffect
So what is an effect or a side effect? 
These terms are used interchangeably but what do they mean?
Remember that our components, our react app as a whole, the react library all work to accomplish one main job
That is to render content to the screen and react to user input and to rerender the ui when needed
So far the main job has been to render something to the screen and make sure the user can interact with it and then change the content on the screen based on that interaction

If we look at a component it is just a function and everything within it contributes to rendering or reacting to user input

Side Effects are everything else that might happen in our application
One example may be sending an http request or adding something to the browser storage or maybe timers or intervals
These tasks are not related to bringing something to the screen directly
You may send an http request and render something based on the response but react doesn't care about handling the request or the response as that is not what it is there for

Because components are process top to bottom these tasks must happen outside of the normal component function and render cycle because they could block or delay rendering
For example if you send an http request and it takes a while to get a response the page load would be delayed until you get the response

Also our components are rerendered whenever state changes and we wouldn't want to perform another http request for the same data because it is inefficient
Also if the response from the http request changed the state and the request itself was within the component you could create an infinite loop

That is why side effects should not generally go directly inside of the component function
Instead we have a better tool for handling side effects 
This is a react hook called `useEffect`
This is another built in hook like `useState` that will do something special

It is called with two arguments
The first argument is a function that should be run AFTER every component evaluation but only if the specified dependencies change
The second argument is an array of the dependencies that should be watched to determine whether the function in the first argument should rerun
Therefore if we put our side effect code into into the first argument it will only run when the dependencies change and not when the component rerenders




___
## 111. Using the useEffect() Hook
Install and get setup the starting project from the github link: https://github.com/academind/react-complete-guide-code/tree/10-side-effects-reducers-context-api

Again in cli you can just checkout the branch, go to the code folder, copy/paste the starting project, into a new project directory, run npm install and git init, and make sure you have a `.gitignore and you should be ready to go

```$git checkout 10-side-effects-reducers-context-api ```
```$cd code/ ```
```$cp -r  01-starting-project path/to/react/projects/folder/this-project-name```
```$cd path/to/react/projects/folder/this-project-name ```
```$npm install```
potentially optional but I did this
```npm audit fix --force```
create .gitignore
```$vim .gitignore```
press 'i' to edit and add at least
```/node_modules```
Here is a good react .gitignore template to use feel free to copy/paste it into this .gitignore
```
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
```
When done writing to .gitignore hit 'esc` followed by ':wq' the 'enter'
Then initialize a git repo
```$git init```
```$git add *```
for some reason this doesn't add .gitignore
```$git add .gitignore```
```$git commit```
write your commit message save with 'esc' ':wq' 'enter' again
```$git branch -m master main```
Now you should be ready to open it up 
```$code .```
Run the project
```$npm start```

When you run the project you will see a login screen
It isn't a real login screen because there is no validation but as long as you enter a valid email format and any password you should be able to login
email format must be string@string.com
password must be at least 7 characters

When logged in the links in the header will not do anything but the logout button will return you to the previous screen

We will cover how to add authentication in another module but this will be a good dummy app to practice `useEffect` and the other concepts discussed

So what is up with useEffect?
A side effect here could be that we send an http request to a backend server that validates the username and password
But right now we don't have that server so we will do something else
Currently when we login with any dummy credentials and login we are logged in
However if you reload the page then you are immediately logged out again and lose the logged in status
In reality you would want to get the user credentials, send it to the backend, and receive some login data like a token that identifies the user as authenticated (again will be covered later)
But normally you would want to ensure that the authentication status is still there when the page is reloaded (in the real world save the token to do this)
We lose this now because where we manage the logged in status within `<App>` it is just managed via state
While state does get saved by react whenever react forces components to reload it does not get saved by react when the browser reloads the application
This is because this is saved in a js variable behind the scenes and not as a value that should be remembered within the browser
Since we lose this data we want the ability to save it somewhere so it persists after the reload
We also want to make sure that whenever the app starts we check to see if the data was persisted and if it is we log the user in automatically
This prevents the user from needing to re-enter the details
That is where we can use `useEffect()`

First let's start with storing the data
Within `<App>` inside of the `loginHandler` we are using a `setState` to set the state value for `isLoggedIn` to true
This is the point where we want to store this piece of information in the browser storage
The browser has multiple storages we can use but the most common would be cookies or local storage
Local storage is easy to work with so we will use that

So within the login handler we will run `localStorage.` which is a global object that is built into the browser
It has a method called `.setItem()` we will use to set a value to local storage
`.setItem()` accepts two arguments 
1. `keyName` string to name the variable with
2. `keyValue` the value of the variable we are saving (also string)
We will simply pass in a name of `'isLoggedIn'` and a value of `'1'` to represent a true status you could use any string to identify this as long as you reuse it later when checking but we will use 1 and 0 to keep it simple
```
import React, { useState } from 'react';

import Login from './components/Login/Login';
import Home from './components/Home/Home';
import MainHeader from './components/MainHeader/MainHeader';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const loginHandler = (email, password) => {
    // We should of course check email and password
    // But it's just a dummy/ demo anyways

    localStorage.setItem('isLoggedIn', '1');
    setIsLoggedIn(true);
  };
...
...
```
Now if we save and reload our project and open developer tools we can navigate to the application tab
Inside here there is a storage section with a 'local storage' drop down
If you click in there you will see that there is a key of `isLoggedIn` listed with a value of `1`

Now we haven't used useEffect yet but we are all setup to
We are currently saving this value now we want to use it to verify if the user is logged in

We could do this by using `localStorage.getItem('isLoggedIn')` and saving that to a variable
Then we could use an if statement to check the value of that variable and if so set the log in status within state
```
import React, { useState } from 'react';

import Login from './components/Login/Login';
import Home from './components/Home/Home';
import MainHeader from './components/MainHeader/MainHeader';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

// Important bit here
  const storedUserLoggedInInformation = localStorage.getItem('isLoggedIn');

  if (storedUserLoggedInInformation === '1') {
    setIsLoggedIn(true);
  }

  const loginHandler = (email, password) => {
    // We should of course check email and password
    // But it's just a dummy/ demo anyways
    localStorage.setItem('isLoggedIn', '1');
    setIsLoggedIn(true);
  };

  const logoutHandler = () => {
    setIsLoggedIn(false);
  };

  return (
    <React.Fragment>
      <MainHeader isAuthenticated={isLoggedIn} onLogout={logoutHandler} />
      <main>
        {!isLoggedIn && <Login onLogin={loginHandler} />}
        {isLoggedIn && <Home onLogout={logoutHandler} />}
      </main>
    </React.Fragment>
  );
}

export default App;

```

The problem with this is we are making an infinite loop when a user is logged in
This is because we are checking the storage and if it is '1' we are updating state
Then at that point the `<App>` component reruns and will immediately check the value of local storage and again immediately update state etc

Instead we want to use `useEffect` so we can control when that check runs and when we update state
We have to import `useEffect` in the exact same way we import `useState`
Then within our `App` component we can call `useEffect` and pass in the arguments we talked about last lecture
Remember the first is a function that should be run after the component loads but only if the dependencies in the second argument change
In this case our function will be an anonymous arrow function
The dependencies will be an array which we will come back to later but will just be empty for now
```
useEffect(() => {
  
}, [])
```
Now for our function we DO want to run the code taht we discussed above
We will fetch the value from local storage and save it to a variable and if it is 1 then we will update state
```
useEffect(() => {
  const storedUserLoggedInInformation = localStorage.getItem('isLoggedIn');

  if (storedUserLoggedInInformation === '1') {
    setIsLoggedIn(true);
  }
}, [])
```

Now this still won't ever run (except for the first load)because we haven't added any dependencies for it to watch
Remember that the arrow function that was passed will only run if the dependencies in the array change and currently there are none
When the app starts for the first time the dependencies are considered to have changed because you had no dependencies and now you have some
This is actually exactly what we want because we only want to run this code once and that is when the page reloads we don't need to watch any dependencies and run the code because when we reload the application behaves as if it is loading for the first time
This works because localStorage data is persistent even across page loads

If you save and reload the page you should see that you remain logged in which is exactly what we want
If you right click the value in local storage we can delete it and then reloading the page will take you to the login screen because that value is no longer in local storage

This is a perfect application of `useEffect` because we are handling a side effect
Data fetching is not directly related to the UI (the result is) but the data storage access itself is
This also helps us avoid an infinite loop and ensures code that may be performance intensive is not run everytime the component is reloaded but only when it needs to

One last touch before we move on is to make sure that whenever we activate the `logoutHandler` we reach out to `localStorage` and remove the `'isLoggedIn'` key
you can do this with a method on `localStorage` called `.removeItem` and pass in the key of the item to remove
```
const logoutHandler = () => {
  localStorage.removeItem('isLoggedIn');
  setIsLoggedIn(false);
};
```
Watch changes to local storage in the browser to make sure this works or you won't be able to logout without clearing it maunually with dev tools




___
## 112. useEffect & Dependencies
Last lesson we learned about `useEffect` without dependencies
However often you will need to have dependencies to trigger useEffect instead of just on page reloads or initial loads

An example of this can be in the `<Login>` component
There is quite a bit of validation built in
- The inputs will turn red if the username or password does not meet the requirements 
- The login button is greyed out if there is not valid username and password

This works with every keystroke there is an event handler run that checks the values in the email field and sees if it has certain values
Then there is another validation that runs whenever the input is "blurred" or unselected and the user goes to the next input

Where can we use `useEffect` here?
We could use it to restructure our validation logic
Currently we have very similar logic within the `emailChangedHandler` and the `passwordChangedHandler`
we can use `useEffect` to have one place to mark the form as valid or invalid with a singular piece of logic
This should trigger when either the email or the password change and will then check both
This is where we will need to make use of dependencies
Remember to import `useEffect` and then we will call it below where we initialize all the state values
```
import React, { useState, useEffect } from 'react';

import Card from '../UI/Card/Card';
import classes from './Login.module.css';
import Button from '../UI/Button/Button';

const Login = (props) => {
  const [enteredEmail, setEnteredEmail] = useState('');
  const [emailIsValid, setEmailIsValid] = useState();
  const [enteredPassword, setEnteredPassword] = useState('');
  const [passwordIsValid, setPasswordIsValid] = useState();
  const [formIsValid, setFormIsValid] = useState(false);

  useEffect(() => {
    
  }, [])
...
...
```
Now in our function we will call `setFormisValid` with the email validation just like in `emailChangeHandler` except instead of checking the event we will check the state value for entered Email
```
  useEffect(() => {
    setFormIsValid(
      enteredEmail.target.value.includes('@') && enteredPassword.trim().length > 6
    );
  }, [])
```
Again this function is only going to be run once as is when the component is rendered and that is not what we want
If we remove the logic from `emailChangeHandler` and `passwordChangeHandler` the form never gets enabled because in input is never going to be valid on page load

We want this `useEffect` call to be re-evaluated and potentially set state for the form being valid for every keystroke within the email and password changed handler

Now if we were to completely omit the dependencies array like this:
```
  useEffect(() => {
    setFormIsValid(
      enteredEmail.target.value.includes('@') && enteredPassword.trim().length > 6
    );
  })
```
This would trigger an infinite loop since this would run on over and over because we are setting state and re-evaluating every time the component rerenders instead of just the first time like when we had the empty array
So this is definitely not what we want

But empty dependencies is also not what we want since then it will only run once on page load

There is a simple rule, you add as dependencies what you are using in the side effect function
We are currently using: `setFormisValid`, `enteredEmail`, `enteredPassword`
So we can add all three of these as dependencies in the array
Remember not to add the execution of `setFormIsValid()` because then you would be adding the result of that function and not the function itself
```
useEffect(() => {
  setFormIsValid(
    enteredEmail.target.value.includes('@') && enteredPassword.trim().length > 6
  );
}, [setFormIsValid, enteredEmail, enteredPassword]);
```
We can actually omit `setFormIsValid` because state setting functions from react are composed by default to never change so looking for a change in it is non necessary

Now everytime `enteredEmail` and `enteredPassword` is changed the function in `useEffect` is ran and the form is set to valid or not based on that validation
This only changes the button from being greyed out to not greyed out and clickable though
This is a good example of using `useEffect` to run a function when certain data or props change

One thing that is confusing is that we are not working with local storage, setting http requests, or setting a timer
Instead we are updating the react state 
This can be confusing since in the slide from a previous lecture we were told that managing state was not a typical function of `useEffect` 
To clear that up it is called `useEffect` it has on main job and that job is to manage side effect
Often that means performing the above mentioned tasks but it is also a side effect to listen to every keystroke and then save that data we also then want to trigger another action IN RESPONSE TO THAT
Triggering that other action is a side effect of that data changing
`useEffect` is super helpful for dealing with code that should be executed in response to something
Something could be the component being loaded or the email address being updated or anything
Whenever there is an action that should be activated in response to another action `useEffect` can help




___
## 113. What to add & Not to add as Dependencies
In the previous lecture, we explored useEffect() dependencies.

You learned, that you should add "everything" you use in the effect function as a dependency - i.e. all state variables and functions you use in there.

That is correct, but there are a few exceptions you should be aware of:

You DON'T need to add state updating functions (as we did in the last lecture with setFormIsValid): React guarantees that those functions never change, hence you don't need to add them as dependencies (you could though)

You also DON'T need to add "built-in" APIs or functions like fetch(), localStorage etc (functions and features built-into the browser and hence available globally): These browser APIs / global functions are not related to the React component render cycle and they also never change

You also DON'T need to add variables or functions you might've defined OUTSIDE of your components (e.g. if you create a new helper function in a separate file): Such functions or variables also are not created inside of a component function and hence changing them won't affect your components (components won't be re-evaluated if such variables or functions change and vice-versa)

So long story short: You must add all "things" you use in your effect function if those "things" could change because your component (or some parent component) re-rendered. That's why variables or state defined in component functions, props or functions defined in component functions have to be added as dependencies!

Here's a made-up dummy example to further clarify the above-mentioned scenarios:
```
import { useEffect, useState } from 'react';
 
let myTimer;
 
const MyComponent = (props) => {
  const [timerIsActive, setTimerIsActive] = useState(false);
 
  const { timerDuration } = props; // using destructuring to pull out specific props values
 
  useEffect(() => {
    if (!timerIsActive) {
      setTimerIsActive(true);
      myTimer = setTimeout(() => {
        setTimerIsActive(false);
      }, timerDuration);
    }
  }, [timerIsActive, timerDuration]);
};
```
In this example:

`timerIsActive` is added as a dependency because it's component state that may change when the component changes (e.g. because the state was updated)

`timerDuration` is added as a dependency because it's a prop value of that component - so it may change if a parent component changes that value (causing this `MyComponent` component to re-render as well)

`setTimerIsActive` is NOT added as a dependency because it's that exception: State updating functions could be added but don't have to be added since React guarantees that the functions themselves never change

`myTimer` is NOT added as a dependency because it's not a component-internal variable (i.e. not some state or a prop value) - it's defined outside of the component and changing it (no matter where) wouldn't cause the component to be re-evaluated

`setTimeout` is NOT added as a dependency because it's a built-in API (built-into the browser) - it's independent from React and your components, it doesn't change




___
## 114. Using the useEffect Cleanup Function
There is one last important thing about `useEffect` we need to know
It is a built in feature of `useEffect`
We learned about the function that gets passed as well as dependencies and what happens if you pass an empty dependency array, or ommit dependencies, and how to add dependencies

Sometimes you also have an effect that needs to do cleanup work
An example of this would be
In our useEffect we are running it on every keysroke since state is updating on every keystroke and the dependency is changed 
What we do in the function could be a problem although it is not in this case
Within ours we are updating state and this may not be ideal 
This means that it triggers another call for our component and react checks if it needs to change something
But that may not be something we really want to do for every keystroke
Imagine you would do something more complex like send an http request to a backend where we check if a username is already in use
We don't want to do that with every keystroke because if we do we will be sending a lot of requests
That may be a lot of unnecessary network traffic so you will want to avoid that
You might want to collect a certain amount of keystrokes or wait for a pause after the keystrokes and only if the pause is long enough should we do the function
For example while the user is actively typing we won't want to check if it a valid email address
We only care about when the user stops typing
Let the user type and then when they stop for maybe 500 miliseconds or longer should we check that what they entered is valid
(and the same for password)

This is a technique called debouncing
This means we want to check user input but not on every keystroke, only after the user has made a pause during typing
With `useEffect` this is easy
We can use `setTimeout()` which is a method built into the browser and we can make it wait 500 ms before it executes some function
```
useEffect(() => {
  setTimeout(() => {
    //this stuff will happen after 500ms
  }, 500);
  setFormIsValid(
    enteredEmail.includes('@') && enteredPassword.trim().length > 6
  );
}, [enteredEmail, enteredPassword]);
```
In this function we will want to check and update our form validity
```
useEffect(() => {
  setTimeout(() => {
    setFormIsValid(
      enteredEmail.includes('@') && enteredPassword.trim().length > 6
    );
  }, 500);
}, [enteredEmail, enteredPassword]);
```
Now we are only doing this after 500ms
Now if we move this into our form we see that it doesn't do much
We are still logging every keystroke just waiting 500ms to do so
This makes sense because for every keystroke we are setting a timer and after 500ms doing the function
The trick is that we actuallys ave the timer and then during the next keystroke we clear it
Then we will only have one ongoing timer going at a time and only the last timer will ever complete
As long as the timer keeps on going we always clear subsequent calls of it
Then only 1 timer will complete after 500ms and submit the `formIsValid` once with the last most up to date version
This may sound complicated but `useEffect` makes this easy 
Within `useEffect` we can do something we have never done before
You can return something
The something you return has to be a specific thing which is a function itself
It could be a named function but we will do an anonymous arrow function
This function that is returned is called a "cleanup" function
this will run as a cleanup process to run before `useEffect` executes its function the next time
To be clear except for the first time whenever `useEffect` runs the cleanup function will run first
In addition the cleanup function will run whenever the component you are specifying the effect in unmounts from the dom
The cleanup function runs before every new `useEffect`  side effect function is used and when the component is umounted from the dom and does not run before the first side effect function execution
After the first time it will run before the next side effect function execution

You can see this in action by adding a couple `console.logs`
```
useEffect(() => {
  setTimeout(() => {
    console.log("Checking form validity");
    setFormIsValid(
      enteredEmail.includes('@') && enteredPassword.trim().length > 6
    );
  }, 500);

  return () => {
    console.log('Cleanup');
  }
}, [enteredEmail, enteredPassword]);
```
On the initial page load there is no log for 'Cleanup' but as soon as you type you can see 'Cleanup' in the logs and then the next 'Checking form validity' is shown

With this in mind we can use the fact that `setTimeout()` returns a handler/identifier that we can use to clear the timer with the built in `clearTimeout()` function
We want to run this in our cleanup function
there we want to run the `clearTimeout()` function and pass in the identifier to it
This will ensure that if the timer is cancelled the function inside of it does not run
```
useEffect(() => {
  const identifier = setTimeout(() => {
    console.log("Checking form validity");
    setFormIsValid(
      enteredEmail.includes('@') && enteredPassword.trim().length > 6
    );
  }, 500);

  return () => {
    console.log('Cleanup');
    clearTimeout(identifier)
  }
}, [enteredEmail, enteredPassword]);
```
Now when we type into our inputs the cleanup will run and cancel the previous timer as soon as `useEffect` is called that ensures that we don't get multiple 'Checking form validity' logs meaning we are only running that function when the user pauses

If the order is not clear to you play more with the console log statements




___
## 115. useEffect Summary
`useEffect` besides `useState` is the most important react hook we have besides `useState` 
So be sure that you are clear when to use it and when each part kicks in and executes

To do this within login we will add a `useEffect` call where we only add the first argument
(for the mooment no second argument)
Within there we will log 'EFFECT RUNNING'
```
useEffect(() => {
  console.log('EFFECT RUNNING');
})
```
Now we don't have any dependencies we just have the first argument
Although this is valid you will rarely use `useEffect` like this
The reason for this is that it will execute as the last step every single time after the component is mounted or rerendered including the first time

This changes if we add an empty array
```
useEffect(() => {
  console.log('EFFECT RUNNING');
}, []);
```
Now the component will only execute the `useEffect` after the first time the component is rendered/mounted

any rerendering due to state changes will not trigger `useEffect`

We can add a dependency like `enteredEmail` or `enteredPassword`
```
useEffect(() => {
  console.log('EFFECT RUNNING');
}, [enteredEmail]);
```
Now `useEffect` will only run at the end of the component being rendered the first time and then only if the component is reloaded AND the value of `enteredEmail` is changed
Changes to `enteredPassword` and rerenders that are caused by that would not trigger `useEffect`


We also have the cleanup function which is returned by the function within `useEffect`
```
useEffect(() => {
  console.log('EFFECT RUNNING');

  return () => {
    console.log('EFFECT CLEANUP');
  }
}, [enteredEmail]);
```
After `useEffect` has been run once this will run after subsequent calls to the same `useEffect` and when the component it is attached to is removed or unmounted from the dom




___
## 116. Intorucing useReducer & Reducers in General
`useReducer` is another built in hook and will help us with state management
It is a bit like `useState` but with more abilities and more useful with complex states
States can be considered more complex when you have multiple states, multiple ways of changing state, or dependencies to other states
Like if you have multiple states that manage the same thing but different properties of that thing
`useState` often becomes hard or error prone to use
it is easy to write bad inefficient or buggy code in such scenarios
`useReducer` can be used as a replacement for `useState` if you neeed more powerful state management
That doesn't mean you should ALWAYS use it in place of `useState` because it is more complex to use and requires more setup
For a majority of scenarios `useState` will be the best choice but there are some scenarios where gettting `useReducer` to work is worth it

For a concrete example we can look at the `<Login>` component in our project
Within there we are managing several different `useState` calls
```
const [enteredEmail, setEnteredEmail] = useState('');
const [emailIsValid, setEmailIsValid] = useState();
const [enteredPassword, setEnteredPassword] = useState('');
const [passwordIsValid, setPasswordIsValid] = useState();
const [formIsValid, setFormIsValid] = useState(false);
```
There is some related state in that we manage entered emails and password and we check the validity of the email and password and then we check the validity of the whole form
You could easily argue that these should all be in the same state or at least treat the inputs as one state (the email and the validity of the email should be together)
We do have some redundency because we check the validity of the entire form 
This checks the validity of username and password even though we already have handlers to determine if email and password are valid

We could rewrite this and pass in two states to `useEffect` to check validity
but we still have two states which belong together (email and password) and should be managed together
Also we want to come back to something that we don't have anymore since we are using `useEffect`
Remember before in `emailChangedHandler` and `passwordChangedHandler` we had different code
We had logic to check the validity within the handler on each keypress and it was using the `event.target.value` to check instead of the state value as we do in our `useEffect`

Imagine for a second that we didn't go the route of `useEffect` and instead of caling `setFormIsValid` in `useEffect` we were calling it in both the `emailChangedHandler` and the `passwordChangedHandler` as we were before
Like this:
```
  const emailChangeHandler = (event) => {
    setEnteredEmail(event.target.value);
    setFormIsValid(
      event.target.value.includes('@') && enteredPassword.trim().length > 6
    );
  };
```
Here we kind of have a problem because we are updating a state based on the value of state 
This is okish but since we don't rely on the previous value of `setFormIsValid` but it is still possible to use an outdated state when checking form validity
However we can't use the functional form of `setState` for `setFormIsValid` because `prevState` would only have the previous state of `formIsValid` and not have the most up to date version of `enteredPassword`

This is a scenario we could use `useReducer` in
It is good to use for state that belongs together or you have state updates that depend on other state

We don't have to revert our code like I mentioned in the example because we are actually already breaking the rule of setting state based on the value of another state within our `validateEmailHandler` and `valiatePasswordHandler` 
Within there we are using the value of `enteredEmail` or `enteredPassword` and using the value of that to determine what the values of `emailIsValid` and `passwordIsValid` should be
```
  const validateEmailHandler = () => {
    // set value of emailIsValid based on value of enteredEmail both in state
    setEmailIsValid(enteredEmail.includes('@'));
  };

  const validatePasswordHandler = () => {
    // set value of passwordIsValid based on value of enteredPassword both in state
    setPasswordIsValid(enteredPassword.trim().length > 6);
  };
```
Yes both of these states are related but they are different states and could become out of sync and are deriving one value based on the other which could cause problems
Most of the time yes it will work but it is not a good practice or habit
Normally we would use the functional form of `setEmailIsValid` (and the same for password)
However that would only give us access to the most up to date version of `emailIsValid` and not necessarily the most up to date version of `enteredEmail` like we are interested in

`useReducer` is a good choice here because we are updating a state based on another state 
Then merging them into one state may be a good idea 
We could of course make them into a single object but that can make larger states much more complicated




___
## 117. Using the useReducer() Hook
Now that we know when we might want to use `useReducer` we can learn how it works
This is how it looks when you write it:
```
const [state, dispatchFn] = useReducer(reducerFn, initialState, initFn)
```
What does each of this mean?
Well `useReducer` always returns an array with exactly two values
You can use array destructuring just like we did with `useState` to give these returned items variables to access them with
These two values are

state: The latest state snapshot used in the component re-render/re-evaluation cycle

dispatchFn: A function that can be used to dispatch a new action (i.e. trigger an update of the state)
Again this is similar to `useState` but this doesn't set a value it dispatches an action
That action will be consumed by the first argument we pass to `useReducer` (reducerFn above)

reducerFn: `(prevState, action) => newState`
This is a function that is triggered automatically once an action is dispatched (via `dispatchFn`)
This is a function which gets the latest state snapshot automatically and it gets the action that was dispatched
React will call this reducerFn whenever a new action is dispatched
So it gets the latest state snapshot by react and the action that was dispatched that triggered the reducer function execution

initialState: an initial state that can be set

initFn: a function to set the initial state programmatically

Lets try this in action
Remember we said we could use `useReducer` to combine our entered values and validity checks for the email and password and we could also use it to manage the form state with it
We can either use it to manage one big state or multiple smaller states
To keep things simple we will start by managing our email state with `useReducer` 
The goal is to combine the email itself and the validity into one state managed by `useReducer` 

First of all we need to import `useReducer` in the same way import `useState` and `useEffect`
```
import React, { useState, useEffect, useReducer } from 'react';
```

Now we can call `useReducer` directly under our `useState` statements
remember it returns an array so we will use array destructuring to capture the two values it returns
Since we will be working with email we will call the two values `emailState` and `dispatchEmail`
```
const [emailState, dispatchEmail] = useReducer(reducerFn, initialState, initFn)
```

Now we know that `useReducer` accepts a function for the first argument
We could use an anonymous arrow function but to make it easier to read we will define a function outside of this `useReducer` call and call it `emailReducer`
```
const emailReducer = () => {};

const Login = (props) => {
  const [enteredEmail, setEnteredEmail] = useState('');
  const [emailIsValid, setEmailIsValid] = useState();
  const [enteredPassword, setEnteredPassword] = useState('');
  const [passwordIsValid, setPasswordIsValid] = useState();
  const [formIsValid, setFormIsValid] = useState(false);

  const [emailState, dispatchEmail] = useReducer(emailReducer, initialState)
```

Note that we created the `emailReducer` function outside of the component function because we won't need any data that is generated within the component for this function
It doesn't need to interact with anything defined inside of the component function
All of the data that is needed by this function will be passed into it when it is executed by react automatically

This email reducer function receives to arguments as mentioned above
`state` The last sttate snapshot
`action` the action that was dispatched (we will cover this shortly)
Within our function we will be returning a new state
It will be an object with a `value` and `isValid` keys 
```
const emailReducer = (state, action) => {
  return {value: '', isValid: false};
};
```

This object can also be the second argument we pass to `useReducer`
This will be the initial state we pass for our initial state snapshot
```
const [emailState, dispatchEmail] = useReducer(emailReducer, {value: '', isValid: false})
```


To make this next part more clear we will also go the route of commenting out `useEffect` and adding the `setFormIsValid` back into the `emailChangeHandler` and `passwordChangeHandler` as mentioned a couple of lessons ago
```
  // useEffect(() => {
  //   const identifier = setTimeout(() => {
  //     console.log("Checking form validity");
  //     setFormIsValid(
  //       enteredEmail.includes('@') && enteredPassword.trim().length > 6
  //     );
  //   }, 500);

  //   return () => {
  //     console.log('Cleanup');
  //     clearTimeout(identifier)
  //   }
  // }, [enteredEmail, enteredPassword]);

  const emailChangeHandler = (event) => {
    setEnteredEmail(event.target.value);

    setFormIsValid(
      enteredEmail.includes('@') && enteredPassword.trim().length > 6
    );
  };

  const passwordChangeHandler = (event) => {
    setEnteredPassword(event.target.value);

    setFormIsValid(
      enteredEmail.includes('@') && enteredPassword.trim().length > 6
    );
  };
```

Now instead ofaccessing `enteredEmail` we will want to access `emailState.value` since that is where we are going to be storing the value for these emails now
```
const emailChangeHandler = (event) => {
  setEnteredEmail(event.target.value);

  setFormIsValid(
    emailState.value.includes('@') && enteredPassword.trim().length > 6
  );
};

const passwordChangeHandler = (event) => {
  setEnteredPassword(event.target.value);

  setFormIsValid(
    emailState.value.includes('@') && enteredPassword.trim().length > 6
  );
};
```

However we can actually do better than this
We are going to use `emailState.isValid` to check the validity of `emailState.value` so instead of rechecking validity we can just check the value of `emailState.isValid`
```
const emailChangeHandler = (event) => {
  setEnteredEmail(event.target.value);

  setFormIsValid(
    emailState.isValid && enteredPassword.trim().length > 6
  );
};

const passwordChangeHandler = (event) => {
  setEnteredPassword(event.target.value);

  setFormIsValid(
    emailState.isValid && enteredPassword.trim().length > 6
  );
};
```

We can also use the same idea for the `validateEmailHandler`
```
const validateEmailHandler = () => {
  setEmailIsValid(emailState.isValid);
};
```

Also within `submitHandler` we can access `emailState.value` instead of `enteredEmail` 
```
  const submitHandler = (event) => {
    event.preventDefault();
    props.onLogin(emailState.value, enteredPassword);
  };
```

Then in our jsx we want to access `emailState.isValid` instead of `emailIsValid`
as well as a set value to `enteredEmail` that we can update to `emailState.value`
```
return (
  <Card className={classes.login}>
    <form onSubmit={submitHandler}>
      <div
        className={`${classes.control} ${
          emailState.isValid === false ? classes.invalid : ''
        }`}
      >
        <label htmlFor="email">E-Mail</label>
        <input
          type="email"
          id="email"
          value={emailState.value}
          onChange={emailChangeHandler}
          onBlur={validateEmailHandler}
        />
      </div>
  ...
```

Now we aren't using `enteredEmail` and `emailIsValid` anywhere so we can remove both `useState` calls (just comment them out)

Now we are closer to what we want to do but currently we are only returning an object with an empty and false value inside which is not what we want
Instead we need to dispatch an action eventually
We want to dispatch it in `emailChangeHandler` when we want to update the value and `validateEmailHandler` when we want to update the validity

First we will start with the value
We start by calling `dispatchEmail` instead of `setEnteredEmail` within `emailChangeHandler` and we pass in what is called an action
It is up to us what this action is sometimes this is just a string and sometimes this is a number
Often times it is an object which we will use in this case
When doing this you should use a `type` key which should have a valiue of a string that makes it easily identifiable (all caps is convention)
Then we can add a second key to that object but we don't have to 
We will want to since we want to access the value that was entered by the user
So we could use something like `val: event.target.value` to pass that value in
```
const emailChangeHandler = (event) => {
  dispatchEmail({type: 'USER_INPUT', val: event.target.value})

  setFormIsValid(
    emailState.isValid && enteredPassword.trim().length > 6
  );
};
```

Now we have an action
It is an object with a type field that describes the data and a value that was collected from the user
This will now trigger the `emailReducer` function since that is the action we passed into `useReducer`
`emailReducer` will have access to this object through the action variable that was passed in
We can use an if statement to check the value of type and if it is `USER_INPUT` then we can set the value of `emailState.value` instead of empty as well as check the validity
```
const emailReducer = (state, action) => {
  if (action.type === 'USER_INPUT'){
    return {value: action.val, isValid: action.val.includes('@')};
  }
  return {value: '', isValid: false};
};
```

Now we are updating both `emailState.value` and `emailState.isValid` whenever we receive the `USER_INPUT` action
For any other action that might reach the reducer a default state of `emailState.value` is empty and `emailState.isValid` is false

We also need to dispatch an action on the `validateEmailHandler`
instead of setting the email as valid within there we will use our reducer to determine that

Again inside of `validateEmailHandler` we want to call `dispatchEmail` and pass in an action object
Since we already used an object with `.type` and are checking that we should be consistent and pass in another object with a type key and string which we will check in our reducer function
This time we will call it `INPUT_BLUR` since this is triggered whenever the user moves off of the input (which is called blurring as mentioned several lessons ago see the blur prop this method is passed to)

```
const validateEmailHandler = () => {
  dispatchEmail({type: 'INPUT_BLUR'})
  // setEmailIsValid(emailState.isValid);
};
```
We don't need to add a value key here because we don't need any extra data we just need to know that the input field lost focus

Now within `emailReducer` we will check for this new action type and if so we will return a new state snapshot
The value of the object we return should not be empty but we do have access to the last state via the `state` argument that is passed in
```
const emailReducer = (state, action) => {
  if (action.type === 'USER_INPUT'){
    return {value: action.val, isValid: action.val.includes('@')};
  }

  if(action.type === 'INPUT_BLUR') {
    return {value: state.value, isValid: state.value.includes('@')};
  }
  return {value: '', isValid: false};
};
```

Now if we save and look at our page you will see that the email field has a red color becausd `isValid` is initiallized to false
If we change that to `null` or `undefined` we can get rid of this error
```
const [emailState, dispatchEmail] = useReducer(emailReducer, {value: '', isValid: null})
```

Now when typing and using the application it should work as before (not with the delay from `useEffect` since we commented that out)

Now try to do the same for the password before the next lesson

MY SOLUTION:
First I will get the outline for the `useReducer` function written
```
const [passwordState, dispatchPassword] = useReducer(passwordReducer, {value: '', isValid: null})
```

Now we can write our `passwordReducer` function
```
const passwordReducer = (state, action) => {
  return {value: '', isValid: false}
};
```

Next we can replace calls to `enteredPassword` to instead access `passwordState.value`
These are in: `emailChangeHandler`, `passwordChangeHandler`, `validatePasswordHandler`, `submitHandler`, and the value within the password input field in jsx
Except when we are running validation on `enteredPassword.value` such as when we call `setFormIsValid` we can actually just check `enteredPassword.isValid` instead of running validation

Replace this logic:
```
setFormIsValid(
  emailState.isValid && passwordState.value.trim().length > 6)
);

```
With this:
```
setFormIsValid(
  emailState.isValid && passwordState.isValid
);
```

Next in the `passwordChangeHandler` we want to call our dispatch function to update the password
Remember to do this we pass in a type so we can use an if statement to determine what action to take as well as the value that we will get from the `onChange` event
```
const passwordChangeHandler = (event) => {
  dispatchPassword({type: 'USER_INPUT', val: event.target.value})

  setFormIsValid(
    emailState.isValid && passwordState.isValid
  );
};
```

Now we will write that if statement and tell the reducer what to do when `dispatchPassword` receives an object with a key/value `type: 'USER_INPUT'`
Remember we have access to the value through the action object and we can run our validation to set the value of `passwordState.isValid`
```
const passwordReducer = (state, action) => {
  if (action.type === 'USER_INPUT') {
    return {value: action.val, isValid: action.val.trim().length > 6}
  }
  return {value: '', isValid: false}
};
```

Then in the `validatePasswordHandler` we want to call our dispatch function to update the state
```
const validatePasswordHandler = () => {
  dispatchPassword({type: 'INPUT_BLUR'})
};
```

Now we can use an if statement to return the last value of state and update whether it is valid or not
```
const passwordReducer = (state, action) => {
  if (action.type === 'USER_INPUT') {
    return {value: action.val, isValid: action.val.trim().length > 6}
  }
  if (action.type === 'INPUT_BLUR') {
    return {value: state.value, isValid: state.value.trim().length > 6}
  }
  return {value: '', isValid: false}
};
```
Now we should have `useReducer` applied to both email and password




___
## 118. useReducer & useEffect
Now the teacher will show us how he did the assignment from the end of last lesson
First create the password reducer function
He just copy/pasted the one for the email directly below and changed the validation so it ended up looking just like mine
```
const passwordReducer = (state, action) => {
  if (action.type === 'USER_INPUT') {
    return {value: action.val, isValid: action.val.trim().length > 6};
  }
  if (action.type === 'INPUT_BLUR') {
    return {value: state.value, isValid: state.value.trim().length > 6};
  }
  return {value: '', isValid: false};
};
```

Then he makes is `useReducer` call 
```
const [passwordState, dispatchPassword] = useReducer(passwordReducer, {value: '', isValid: null})
```
Now he just goes through and updates calls to `enteredPassword` to reference `passwordState.value` instead and changes calls to `passwordIsValid` to reference `passwordState.isValid`

Next he makes his calls to `dispatchPassword` and passes in the type and value when needed
```
const passwordChangeHandler = (event) => {
  dispatchPassword({type: 'USER_INPUT', val: event.target.value})

  setFormIsValid(
    emailState.isValid && passwordState.isValid
  );
};
```

```
const validatePasswordHandler = () => {
  dispatchPassword({type: 'INPUT_BLUR'})
};
```
Now the project should be set to continue and work as expected

This is the exact same as what we did for email reducer
It is possible to use 1 reducer instead of 2 but it would take a little bit more work

However the form validity is still being derived from the value of these two states which we want to avoid
Notice that within `emailChangeHandler` and `passwordChangeHandler` we are calling `setFormIsValid` and relying on `emailState.isValid` and `passwordState.isValid` to be up to date which they may not be

To fix this issue we wil comment out the `setFormIsValid` within these two handlers and go back to the `useEffect` solution we used before
We will need to change any references to old states to make the reference our `useReducer` states instead
```
useEffect(() => {
  const identifier = setTimeout(() => {
    console.log("Checking form validity");
    setFormIsValid(
      emailState.isValid && passwordState.isValid
    );
  }, 500);

  return () => {
    console.log('Cleanup');
    clearTimeout(identifier)
  }
}, [emailState, passwordState]);

const emailChangeHandler = (event) => {
  dispatchEmail({type: 'USER_INPUT', val: event.target.value})

  // setFormIsValid(
  //   emailState.isValid && passwordState.isValid
  // );
};

const passwordChangeHandler = (event) => {
  dispatchPassword({type: 'USER_INPUT', val: event.target.value})

  // setFormIsValid(
  //   emailState.isValid && passwordState.isValid
  // );
};
```

Now this is a fine way to call `setFormIsValid` because `useEffect` will guarantee we have the correct state values

We do still have a problem though
This will run correctly and have the bouncing like we wanted
The problem we have is that our `useEffect` runs too often
It will run whenever `emailState` or `passwordState` values change at all which may not be what we want
That is because our dependency is the entire `emailState` and `passwordState` and not just the validity of it

Instead we can use a technique called object destructuring to pull certain properties of objects
For example for emailState we can pull out `isValid` and store it in a new constant 
```
const { isValid: emailIsValid } = emailState;
const { isValid: passwordIsValid} = passwordState
```
This is an alias assignment because it is part of object destructuring syntax

Now we have these constants we can use as our dependencies and our values within `useEffect` remember that dependencies should match values within `useEffect`
```
const { isValid: emailIsValid } = emailState;
const { isValid: passwordIsValid } = passwordState;

useEffect(() => {
  const identifier = setTimeout(() => {
    console.log("Checking form validity");
    setFormIsValid(
      emailIsValid && passwordIsValid
    );
  }, 500);

  return () => {
    console.log('Cleanup');
    clearTimeout(identifier)
  }
}, [emailIsValid, passwordIsValid]);
```

Now the advantage to this is that because we are pulling out the `isValid` state whenever the value changes but not the validity then `useEffect` will not rerun 
This results in more efficient code and ensures we are not running `useEffect` to update the state of `formIsValid` only when necessary




___
## 119. Adding Nested Properties As Dependencies to useEffect
In the previous lecture, we used object destructuring to add object properties as dependencies to useEffect().
```
const { someProperty } = someObject;
useEffect(() => {
  // code that only uses someProperty ...
}, [someProperty]);
```
This is a very common pattern and approach, which is why I typically use it and why I show it here (I will keep on using it throughout the course).

I just want to point out, that they key thing is NOT that we use destructuring but that we pass specific properties instead of the entire object as a dependency.

We could also write this code and it would work in the same way.
```
useEffect(() => {
  // code that only uses someProperty ...
}, [someObject.someProperty]);
```
This works just fine as well!

But you should avoid this code:
```
useEffect(() => {
  // code that only uses someProperty ...
}, [someObject]);
```
Why?

Because now the effect function would re-run whenever ANY property of someObject changes - not just the one property (someProperty in the above example) our effect might depend on.




___
## 120. useReducer vs useState for State Management
Now that we know about `useReducer` we will sum up what we know about `useReducer` and `useState`

Generally you will know when you need `useReducer`
This will become obvious because using `useState` starts to become cumbersome or you're getting bugs/unintended behaviors due to state

To give a few ideas on when to use the two

useState:
 - Main state management "tool"
 - Typically starts with useState and many times it is all you need
 - Great for independent pieces of state/data
 - Great if state updates are easy and limited to a few kinds of updates

useReducer:
 - Great if you need more power
 - Can write a reducer function that contains more complex state updating logic
 - Can potentially move complex logic out of the component body into a seperate reducer function to restructure code
 - Should consider `useReducer` if you have related state values
 - Can be helpful if you have complex state updates and different cases/actions that can change a state