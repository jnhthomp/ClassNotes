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
