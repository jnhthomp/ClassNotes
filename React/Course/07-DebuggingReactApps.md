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




___
## 85. Analyzing Code Flow & Warnings
That error is solved and our application is running 
We can try adding goals
Say we add `test 1`, `test 2`, and `test 3` as goals
However if we click on `test 2` or `test 3` to delete them we can see test 1 is the one that gets deleted

If we follow the logic of our delete it looks like it all makes sense but what if we look at the logic of our `addGoalHandler`?
`addGoalHandler` is indeed always assigning the same id of `goal1` to every object it creates
This is a problem because this id is supposed to be unique and used to target an element for deletion
If we have multiple elements with the same id then it becomes difficult for react to target the correct instance
We can see this because if we open developer tools in the browser and trigger our bug we will see an error
```
Warning: Encountered two children with the same key, `goal1`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.
    at ul
    at CourseGoalList (http://localhost:3000/static/js/main.chunk.js:764:21)
    at section
    at div
    at App (http://localhost:3000/static/js/main.chunk.js:266:95)
```

We can see that there are multiple components with the same key so that is where our issue lies




___
## 86. Working With Breakpoints
Another approach we can take is to go to the sources tab in our developer tools
This shows all the files that are used to construct the website including our js code
Normally react bundles all of our code together so that it is vanilla js and executable in the browser but very difficult to make sense of with a lot of other js that we didn't write
However react also gives a bunch of extra information to our browser so that we can see the source files as we wrote them as well
This allows us to debug our code in the browser
Sometimes the folders containing our react code are in different places so check the webpack folder if you can't find it or continue looking

We can go into our `<CourseGoalItem>` component and add a breakpoint by clicking the line number where we want to pause the execution of our code
In our case we will place one where we call `props.onDelete(props.id)`
Just click the line number and it should highlight the number
Once this breakpoint is added we can try executing this action by clicking a item to delete
You can see that instead of just deleting it the page pauses once it reaches this step of the code
Then we can step through the code step by step
To do this click the arrow that is labeled "Step into next function call"
When you click that it will take you to the next line that executes in the `deleteItemHandler`
You are also able to hover over variables to see their current values
For example if you hover over goalId you will see it is equal to "g1" or whatever you clicked
Then if we do the same again we might notice that the next one we click also has a value of "g1" and we might start to notice that is not correct
Now we know that we can look at the code where we add goals since that is where we set id's
By looking at it it should be clear (it won't always be though) why our `goalId` is getting assigned incorrectly
Now we can fix our line by changing 
from:
```
updatedGoals.unshift({ text: enteredText, id: 'Goal1' });
```
to:
```
updatedGoals.unshift({ text: enteredText, id: Math.random().toString() });
```




___
## 87. Using the React Dev Tools
Now we will look at a tool which can help us with react specific problems and can help us understand react better
It is called "React Dev Tools"
If you search for this you should find an entry here: https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en

It is available for firefox as well but I have heard it works best with chrome 
Simply click "add to chrome" and it should install itself
You may need to restart your browser

Once you have added them in your dev tools you will have two new tabs
- components
- profiler

We will look at profiler alter in the course but will check out components now

If we click the components tab we should see a little component tree
What is good here is that you can see each individual component and component structure instead of just the html elements in the dom
We can also see props and children that these components are getting
You can also search for components and pick some settings

You can also see hooks and not just props
Remember how we said `useState` is a react hook?
That is why it is listed there
You can also change state values in here which can be helpful




___
## 88. Module Resources
You may want to compare your code to mine (e.g. to find + fix errors).

For that, you find multiple code snapshots for this module here in this Github repository: https://github.com/academind/react-complete-guide-code/tree/07-debugging

Usage instructions can be found on the page that link is leading to.

Simply pick one of the snapshots in the /code folder - the subfolder names are chosen such that they are easy to match against lecture names in this course section.

You also find section slides (if available) in that Github repository.


___
<h3><center>---Section 7 Complete---</center></h3>