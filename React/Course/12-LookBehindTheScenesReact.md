# Section 12: A Look Behind the Scenes of REact & Optimization Techniques
Section github: https://github.com/academind/react-complete-guide-code/tree/12-a-look-behind-the-scenes
___
## 151 Module Introduction
At this point we are able to build basic react apps and have covered many of reacts features
There is still one thing missing that we haven't covered
That is how React works behind the scenes
This may not be interesting but it is important to have an idea how this works
This can ensure you are using it correctly and makes troubleshooting easier

This module will look at:
- How React works behind the scenes
    Not the source code but how it works and updates our components and how that relates to state
- Understanding the Virtual DOM & DOM Updates
- Understanding State & State Updates




___
## 152. How React Really Works
How does React work?
We know React is a js library for building user interfaces
We have also seen that React is all about components which we use to build these interfaces
Components are used to compose and update user interfaces
We also saw something called ReactDOM during the last project
That is our interface to the web itself
React.js does not know the web or the browser
It only knows how to work with components but does not care what they contain
It does not check if the elements are html or totally fictional
It does not matter to react

ReactDOM is the one that cares about this and is responsible for bringing html elements to the screen
React just manages different components and state and understands which components need to change/update
React hands off this information off to ReactDOM which works with the real dom in the browser

React only cares about components, props (data between components), state, and context
There are other features but these are the core features
Whenever any of these change components that use those concepts are updated by react
Then react will check if the component wants to draw something new on the screen
If so React will tell ReactDOM what should be drawn and ReactDOM handles the actual drawing of that update

So how does this work?
React uses a concept called the "Virtual DOM"
It determines what the component tree that you are building currently looks like and what it should look like
If there is a difference those differences are handed off to ReactDOM which will manipulate the real DOM to make those changes

Remember we would say that React would re-evaluate a component this is when it checks for differences
However re-evaluating is not the same as re-rendering
If there are no changes to the component then the component is not re-rendered
React uses the virtual dom to compare to the previous virtual dom to determine if the component even needs re-rendered after it has been re-evaluated
This is much more efficient than re-rendering the DOM every time a component is re-rendered since it saves the browser from performing unnecessary renders
The real DOM also only has to re-render the differences and not the entire page

Say for example you had a component that evaluated to:
```
<div>
  <h1>Hello there!</h1>
</div>
```
Then after a state change the component evaluated to:
```
<div>
  <h1>Hello there!</h1>
  <p>General Kenobi, you are a bold one!</p>
</div>
```
React would only submit the `<p>` tag and its contents to the dom to render instead of rerendering the `<h1>` tag since it has not changed




___
## 153. Component Updates In Action
The teacher has provided a small starting project to use to demonstrate component updates
Find this project here: https://github.com/academind/react-complete-guide-code/tree/12-a-look-behind-the-scenes/code/01-starting-setup

If you have forked this repo just switch to the branch with `$git checkout` then copy the `code/01-starting-setup` folder to your project folder with `code>$cp-r 01-starting-setup path/to/project/folder/plus/new/name/of/folder`
Then switch to the project folder you just created and run `$npm install`
If you would like to make this a git repository run `$git init`

This is a very simple application which just has an `<App>` component with a `<div>` and `<h1>` tag
```
import React from 'react';

import './App.css';

function App() {
  return (
    <div className="app">
      <h1>Hello there!</h1>
    </div>
  );
}

export default App;

```

Let's say we wanted to add a small `<p>` below just like in the previous lesson but we don't want it to always be there, we want to trigger it
We can do that with a state change
We could have a state so that initially there is no paragraph but because a button was clicked the paragraph is displayed
Let's get that setup

First we will start getting the state setup
```
function App() {
  const [showParagraph, setshowParagraph] = useState(false);
  ...
```

Then we will use a conditional expression to show the `<p>` we want if `showParagraph` is true
```
return (
  <div className="app">
    <h1>Hello there!</h1>
    {showParagraph && <p>General Kenobi, you are a bold one!</p>}
  </div>
);
```

Now we just need to include a button that toggles true/false when it is clicked
Fortunately the teacher included a `<Button>` component wthin the components folder
We can import and call it from `<App>`
Pass some text as a child along with an `onClick` method we will call `toggleParagraphHandler`
```
return (
  <div className="app">
    <h1>Hello there!</h1>
    {showParagraph && <p>General Kenobi, you are a bold one!</p>}
    <Button onClick={toggleParagraphHandler}>Click to return greeting</Button>
  </div>
);
```

Now we can write our fuction to toggle state value to be the opposite of the current value
This does depend on the previous state value so we need to use the functional form of `setState`
```
const toggleParagraphHandler = () => {
  setshowParagraph((prevState) => {
    return !prevState;
  });
}
```

(add `text-align: center` to `.app` class in 'App.css' to fix alignment)

Now if we click the button the paragraph will toggle so we can analyze what is happening
As mentioned state, prop, and context changes trigger re-evaluation of components
If taht is the case we should be able to add a console log within `<App>` below where we initialize state and see our message every time we click the button
```
function App() {
  const [showParagraph, setshowParagraph] = useState(false);
  console.log('App Running')
  ...
```

That does in fact happen so we know `<App>` is being re-evaluated everytime the state changes
How does this affect the real dom?
If we reload and look at the inspect element you can see changes to the dom flash
When we click the button only the new `<p>` tags flash and nothing else does
That is because React is only updating that single element and not wasting resources on the rest of the page




___
## 154. A Closer Look At Child Component Re-Evaluation
We saw how the `<p>` component was the only change made to the dom whenever we had a state change
But what about child components?

We can test this by making a simple demo component
Create: src/components/Demo/DemoOutput.jsx

Tip you can create a new folder/file from wsl terminal with `$mkdir src/components/Demo && touch src/components/Demo/DemoOutput.jsx`
The within this file just add our standard react component function
```
import React from 'react'

const DemoOutput = () => {
  return (
    <div>
      
    </div>
  )
}

export default DemoOutput
```

Now we will take the paragraph from our `<App>` that we were showing and set that as the return value within `<DemoOutput>` 
Also remove the conditional expression within `<App>`
Instead of conditionally rendering this component we will change the html structure slightly and render the text within the paragraph conditionally by passing in a boolean prop that determines if the text should be shown or not
```
const DemoOutput = (props) => {
  return (
    <p>{props.show ? 'General Kenobi, you are a bold one!' : ''}</p>
  )
}
```
Now the `<p>` will always render but the text itself will not

In `<App>` import and call this component being sure to pass in the `show` prop set equal to our state `showParagraph`
```
return (
  <div className="app">
    <h1>Hello there!</h1>
    <DemoOutput show={showParagraph} />
    <Button onClick={toggleParagraphHandler}>Click to return greeting</Button>
  </div>
);
```

Now if we look at our dom we can see that the paragraph tag is always there and is still the only thing changed whenever we toggle the text just like before

This is interesting because we are changing state within `<App>` but no part  of `<App>` was rerendered even though we still see the `console.log` so we know it is being re-evaluated
It was just the content inside of `<DemoOutput>` that was rerendered because that was the only change to the virtual dom

If we add a console log to `<DemoOutput>` we will obviously see that message everytime we click the button since it is being re-evaluated as well (parent had a state change causing this)
```
const DemoOutput = (props) => {
  console.log('DemoOutput RUNNING');
  
  return (
    <p>{props.show ? 'General Kenobi, you are a bold one!' : ''}</p>
  )
}

```

Now for something a little different
Instead of passing in the state value as our `show` prop to `<DemoOutput>` we will hadrcode false so it never shows the `<p>` content
```
return (
  <div className="app">
    <h1>Hello there!</h1>
    <DemoOutput show={false} />
    <Button onClick={toggleParagraphHandler}>Click to return greeting</Button>
  </div>
);
```

Now when we click the button we can still see both of our components being re-evaluated with console logs since `<App>` had a state change and `<DemoOuput>` is a child of `<App>` but the `<p>` tags no longer flash because the content is not changing
Since there were no changes to the virtual dom React didn't tell the real dom to update anything

This makes sense that `<DemoOutput>` would need re-rendered when the parent state changes because when a components state changes it is re-evaluated
This also means that components return statement is re-evaluated
Therefore any components inside of that return also need to be recalled because a component is itself a function that is being called within the return statement

If we were to check we could also see that the button is being re-evaluated 
```
const Button = (props) => {
  console.log('Button RUNNING');
  
  return (
    <button
      type={props.type || 'button'}
      className={`${classes.button} ${props.className}`}
      onClick={props.onClick}
      disabled={props.disabled}
    >
      {props.children}
    </button>
  );
};
```

You can see that when state in `<App>` changes `<DemoOuput>` and `<Button>` are both re-evaluated

But if these had child components they would also be re-evaluated obviously

To test this we can create a paragraph component to render inside of `<DemoOutput>`
Create: src/components/Demo/MyParagraph.jsx;

This can just output any children in a `<p>` tag and a console log so we know it is running just like `<DemoOutput>`
```
import React from 'react'

const MyParagraph = (props) => {
  console.log('MyParagraph RUNNING');

  return (
    <p>{props.children}</p>
  )
}

export default MyParagraph

```

Then within `<DemoOutput>` we call this new component instead of standard `<p>` tags
```
const DemoOutput = (props) => {
  console.log('DemoOutput RUNNING');

  return (
    <MyParagraph>{props.show ? 'General Kenobi, you are a bold one!' : ''}</MyParagraph>
  )
}
```

Now when we click the button we can see that when state in `<App>` changes it ALL children components are re-rendered even children of `<App>`'s children components

This does bring a question
Couldn't this be bad?
That is a lot of ongoing function executions and virtual comparisons that are unnecessary
In a large app this trickle down could cause a lot of unnecessary computation
There needs to be a way to say 'This component will never change' so we can skip re-evaluation any time one of it's parent change state




___
## 155. Preventing Unnecessary Re-Evaluations With React.memo()
How can we avoid these unnecessary re-evaluations
Well React is built especially to handle these kinds of things so in many apps (especially simple ones) this does not matter
However it will matter sometimes and there is a way to handle it so we will cover it here
We have a way of telling react that it should only re-evaluate a component given a certain circumstance

Those circumstances might be that the props to `<DemoOutput>` changed or something
To do this we have to go to the component that we want to add this restriction to

When we export our component we wrap it with `React.memo()`
```
import React from 'react'
import MyParagraph from './MyParagraph';

const DemoOutput = (props) => {
  console.log('DemoOutput RUNNING');

  return (
    <MyParagraph>{props.show ? 'General Kenobi, you are a bold one!' : ''}</MyParagraph>
  )
}

export default React.memo(DemoOutput);
```
This is available to functional components and does not work for class based components (not yet covered but will cover in section 13)

What does `React.memo()` do it will look at the props this component gets and check the new value of all those props and compare them to the previous values of all of those props
So in short react memo will compare
```
if({ ...DemoOutput.prevProps } !== { ...DemoOutput.newProps }){ re-evaluate}
```

If the parent component changed but the prop values for this component did not change then the component re-evaluation will be skipped

If we save this and reload our application we can see the results
Since `DemoOutput.props.show` is hardcoded to `false` the props never change and therefore the component is not re-evaluated even when its parent `<App>` has a state change
Now when we click the button we only see a console log for `'App RUNNING'` and `'Button RUNNING'` and only a single console log for `'DemoOutput RUNNING'` when it was initially rendered and evaluated

Notice that `<MyParagraph>` was also not re-evaluated since it's parent `<DemoOutput>` was not re-evaluated
This is where you can run into trouble if you are not careful
Maybe you don't want a child component to be re-evaluated on a state change but you DO want one of its children to be re-evaluated
This can cause an issue if you aren't careful

Why don't we use this on almost all components then?
This does come at a performance cost itself
Since react does have to store the previous and current props and then perform a comparison on them that does take computing resources
Sometimes it will actually take less resources to simply re-evaluate the component than to make this comparison
This is why this is much more beneficial in larger apps and components

You are trading the performance cost of re-evaluating the component with the performance cost of performing this comparison and in many cases it is not worth it
The more complex and more children your component has the more likely `React.memo()` is worth it

For practice we will also add `React.memo()` to the `<Button>` component
```
import React from 'react';

import classes from './Button.module.css';

// Accepted props: type, className, onClick, disabled, children
const Button = (props) => {
  console.log('Button RUNNING');

  return (
    <button
      type={props.type || 'button'}
      className={`${classes.button} ${props.className}`}
      onClick={props.onClick}
      disabled={props.disabled}
    >
      {props.children}
    </button>
  );
};

export default React.memo(Button);

```

If you do this you will notice something weird
Even though we didn't change props in the button when we click it, it is still being re-evaluated
This is because we are passing a function into it and since `<App>` is a function every time it is called it must re-create the function being passed
A new `toggleParagraphHandler` function is being created and referenced every time `<App>` is ran
It may be a function that does the same thing but to js it is as good as an entirely new function

Technically the same thing is happening when we hardcode false but the difference is that our value was a boolean which is a primitive value in js
What `React.memo()` does is does a regular comparison (like mentioned above)
```
props.show === props.previous.show
```
For primitive values this works and is fine but is not true with arrays, objects, or functions
For example in js if we were to do:
```
[1, 2, 3] === [1, 2, 3]
=> false
```

To really understand this see this extra article/info: https://academind.com/tutorials/reference-vs-primitive-values

Functions are just objects in js so a new function object is created and when compared to the old function object they will never be the same just like with the array above

However there is a way to accomplish the goal of react memo when components receive functions




___
## 156. Preventing Function Re-Creation with useCallback()
We can make react memo work for props that are objects (like functions and arrays) as well
We do have to tweak how we create and store those objects
We have to use a new hook called `useCallback`
Import it like any other hook first
```
import React, { useCallback } from 'react';
```
`useContext()` allows us to store a function across component executions
This allows react to save a function or object and prevent it from being recreated every execution of a component
Then only 1 version of that function is stored in memory and `React.memo()` comparison will work
Think of it like this
Before with react memo we were doing a comparison between the function (which in js is an object) before and after it was recreated just like this: (empty for simplicity but same concept)
```
let obj1={}
let obj2={}
obj1 === obj2 //=>false
```
But if you use `useCallback` it will create the new function my referencing the old one each re-evaluation like this:
```
let obj1 = {}
let obj2 = obj1
obj1 === obj2 //=> true
```
Since they are referencing the same pointer in memory at the same function now we will be able to use `React.memo()` once we implement this

Now how do we use `useCallback()`?
We just have to wrap the function we want to save with it
Since we are passing `toggleParagraphHandler` into our button which is breaking `React.memo()` we can wrap that function in `useCallback()` 
The function that we want to persist across evaluations will be the first argument in `useCallback`
```
const toggleParagraphHandler = useCallback(() => {
  setshowParagraph((prevState) => {
    return !prevState;
  });
});
```

`useCallback` does still want a second argument just like `useEffect` does
Also just like `useEffect` the second argument will be an array of dependencies
Anything you use in the function coming from the surrounding component should be specified
Because we are only using `setShowParagraph` and react guarantees that won't change we can use an empty array
```
const toggleParagraphHandler = useCallback(() => {
  setshowParagraph((prevState) => {
    return !prevState;
  });
}, []);
```

Now whenever we click the button we can see that the `<Button>` is not re-evaluated even though it is being passed a function object as a prop with `React.memo()`




___
## 157. useCallback() and its Dependencies
`useCallback` allows you to save a function to be reused
You needed to use a weird dependency array and you might be wondering why you need this since your function always has the same logic across rerender cycles

Remember that functions are closures which means they close over the values that are available in the environment
See more on closure here: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures

For example say you have a second button that enables the toggling feature
For this you will need a button call and state
```
function App() {
  const [showParagraph, setshowParagraph] = useState(false);
  const [allowToggle, setAllowToggle] = useState(false)

  console.log('App Running')

  const toggleParagraphHandler = useCallback(() => {
    setshowParagraph((prevState) => {
      return !prevState;
    });
  }, []);

  return (
    <div className="app">
      <h1>Hello there!</h1>
      <DemoOutput show={false} /> 
      <Button onClick={toggleParagraphHandler}>Allow Toggle</Button>
      <Button onClick={toggleParagraphHandler}>Click to return greeting</Button>
    </div>
  );
}

export default App;

```
Then we can start our function to allow the toggle
```
const allowToggleHandler = () => {
  setAllowToggle(true)
}
```

Now we can bind this function to the new button (go ahead and re-add `showParagraph` to `show` prop in `<DemoOutput>` too)
```
<DemoOutput show={showParagraph} /> 
<Button onClick={allowToggleHandler}>Allow Toggle</Button>
<Button onClick={toggleParagraphHandler}>Click to return greeting</Button>
```

Next we weill check the value of `allowToggle` within our `toggleParagraph` handler
```
  const toggleParagraphHandler = useCallback(() => {
    if(allowToggle){
      setshowParagraph((prevState) => {
        return !prevState;
      });
    }
  }, []);
```

Now you will see if the app reloads and you click `toggleParagraph` nothing happens as expected since `allowToggle` is set to false
However if you click the `allowToggle` button then `toggleParagraph` STILL won't work
That is because when `useCallback` is called the first time it locks in all the variables in the function that it is surrounding
So when it is re-evaluated it keeps all the values of those variables and doesn't know that some of those values are allowed to change

If we list `allowToggle` in the dependency array then `useCallback()` will take that into consideration when re-evaluating and update that value
This will result in a re-evaluation of that component since the function object does have different values

We can add that to the array easily
```
const toggleParagraphHandler = useCallback(() => {
  if(allowToggle){
    setshowParagraph((prevState) => {
      return !prevState;
    });
  }
}, [allowToggle]);
```




___
## 158. A First Summary
Just to make sure everything is clear before we move on
In React apps you work with components (typically functional components)
Their job is to return jsx code which tells react what the output of the component should be
Within our react component we can work with state, props, or context to make changes to a component or its data
Whenever you change state in a component that component is re-evaluated along with its children and children's children etc
All of the code in the component is run again and a new output is given this output may be the same or different as before
React will compare the output from before and after on something called a virtual dom and submit any differences between the old virtual dom and the new virtual dom to the real dom in the browser
This will cause only changes to the component to be rerendered and nothing else
To avoid unnecessary re-renders of the child component when you know none of the props inside will change you can use `React.memo()`
However this will only work on props that are primitive data types
Any props that are referential data types like objects, arrays, or funcions (which are just js objects) need to use `useCallback()` and list any dependencies in the function that may change between evaluations in order for components receiving these functions to be able to use `React.memo()`




___
## 159. A Closer Look At State & Components
State is a crucial concept in react and ultimately everything comes down to state when it comes to re-evaluating and rerendering state
Components and their interaction with state is the core aspect of react
Both of these are managed by react (both components and state)

One way this is managed is `useState` which is the most common form of managing state
With `useState` you create  a new piece of state and it is automatically attached to a component
This attachment is done behind the scenes in react
When you call `useState` react creates a new state variable which react manages for us and ties it to the component for us

What is interesting is even though a component that is calling `useState` sets an initialized value and gets re-evaluated the state values it sets are not reset
The reason for this is that `useState` is coming from react which manages the state and its  connection to the component
Because of this management the default value you pass into `useState` is only really cosidered once when the component is rendered for the very first time

On the first render react will create the state and initialize it with the appropriate value
Every re-evaluation thereafter however react is aware that state has already been created and initialized and received this default value so it will not change it unless it is supposed to
The only time the state would be re-initialized is if the component was totally removed from the dom and then readded


Now if our components are being re-evaluated and we are calling `useState` where we initialize state values why aren't these state values being reset every time the component is re-evaluated?

