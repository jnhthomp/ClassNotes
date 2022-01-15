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