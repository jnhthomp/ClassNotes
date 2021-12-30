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
