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