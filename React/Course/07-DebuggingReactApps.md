# Section 7: Debugging React Apps
Section github: https://github.com/academind/react-complete-guide-code/tree/07-debugging
___
## 83. Module Introduction
We have learned about a lot of Reacts important features, core pillars, and how to style them
When you are building apps with React (or developing with any language/framework for that matter) you will run into errors
In this module we will learn how to debug react apps by finding and fixing errors in your code
This is one of the most important things you need to be able to do as a developer
It is vital that you are able to find and solve your own issues without having somebody help you
We will learn:
- How to understand error messages and what they mean
- Learn how debug and analyze react apps and understand our code and how it is executing
- Explore react dev tools which is an extension in the browser that will make it easier to develop with react




___
## 84. Understanding React Error Messages
We will explore debugging in this section and to do  this we will use another starting project.
Be sure to actually get this project from the github directory above 
It looks a lot like the project we were working on last lessson but does have some minor differences so be sure you get this version

The easiest way to do this is to switch to the starting project branch from the terminal and copy paste the starting project into your project directory
Then rename it to what you want your project to be named
Next run `$npm install` to be sure you have all of the correct dependencies
Then to track changes to this project in git
run:
```
$git init
```
Then you will want to add a `.gitignore` I just copy/pasted from my other `course-goal-list` application or you could use a different react project
The important thing is to make sure the `/node_modules` folder is excluded
Finally you can add a readme if you want and make an initial commit

Now if we run `$npm start` to boot up this application we will immediately get an error in our terminal
This should look like:
```
Failed to compile.

./src/App.js
SyntaxError: /home/jthomp/Dev/React/debugging-course-goal-list/src/App.js: Adjacent JSX elements must be wrapped in an enclosing tag. Did you want a JSX fragment <>...</>? (43:6)

  41 |         <CourseInput onAddGoal={addGoalHandler} />
  42 |       </section>
> 43 |       <section id="goals">
     |       ^
  44 |         {content}
  45 |       </section>
  46 |
```

One helpful thing about this error is it does its best to find the error for us and give us clues on how to fix it
We can see here that there might be some issue within our `<App>` component near line 43
We also see that the error says
"Adjacent JSX elements must be wrapped in an enclosing tag"

If we look at our code within `<App>` in that area we can see
```
<section id="goal-form">
  <CourseInput onAddGoal={addGoalHandler} />
</section>
<section id="goals">
  {content}
</section>
```
We have two sections that are side by side here and do not have a wrapping div to hold them
We know we can only return 1 parent element with jsx although that parent can have children
Therefore we can fix this by simply wrapping our two sections in a div so they can be children of that div and sibling to each other
Remember this is because react runs `React.createElement(element)` which can only accept a single root element as an argument
```
<div>
  <section id="goal-form">
    <CourseInput onAddGoal={addGoalHandler} />
  </section>
  <section id="goals">
    {content}
  </section>
</div>
```
If we do this our app should now compile successfully!

Other common mistakes are incorrect names of functions or variables
Typos are very common sources of mistakes and errors
By mistyping a handler function we can get something like:
```
Failed to compile.

src/App.js
  Line 41:33:  'adGoalHandler' is not defined  no-undef

Search for the keywords to learn more about each error.
```
Again this gives us a hint as to why there is a disconnect between when we call the function and the function to be excecuted
