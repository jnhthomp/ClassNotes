# Section 3: React Basics & Working With Components
Section Github: https://github.com/academind/react-complete-guide-code/tree/03-react-basics-working-with-components
___
## 24. Module Introduction
In the first section we learned what react is and what it is about
In this course section we are going to dive into the basics we need to build any kind of react app
We are going to explore basic features and explore how to build component driven user interfaces 
Components go hand in hand with react which we will explore in this section

We are going to learn about the base features and core syntax
One special feature we are going to learn is JSX syntax 
This is a hybrid html/js syntax that is returned by our components and used to build our pages

We will learn how to build our own components with react 

We will learn how to work with data in react 
Most web apps do not display static text, they all output data

We won't use boring theory or slides - We will also build example projects that are built entirely with react 
The first project while it looks simple will use basically all of the features we will need in larger projects

The first project we will build is an expense tracker 
It will show our expense by year and have a nice interface that will update when we select different years
We will also be able to add new expenses with a title, cost, and date
When that expense is it will be listed with other expenses and update a graph showing expenses by month




___
## 25. What are Components and Why Is React All About Them?
We know react is about building user interfaces
We also know that html, css, and js are about building user interfaces

Libraries like react are supposed to simplify building these interfaces
Technically you could build any application without using react but it would be much more difficult to build and maintain
You won't have to focus on nitty gritty details and it will be less error prone since you can focus on core business logic

To make this work React uses something called components
This is because in the end all user interfaces are made up of components
Components are like isolated bits of a webpage
It can have its own functions and html and css
Then it can be recalled and each component can be addressed individually

When thinking about components look for building blocks (especially ones that are repeated with different data)
Buttons content areas and places where data is displayed are each things that could be considered components
All of these building blocks and components combine to create a user interface
With react you build these individual components and then tell react how to combine them into a single interface

Succinctly components offer 2 advantages
1. Reusability
    - Don't repeat yourself unnecessarily
2. Sparation of Concerns
    - Don't do too many things in one and the same place (function)
    - Give things small, clear, and concise tasks to each function

These are essential practices within any programming language




___
## 26. React Code is Written In A "Declarative Way"!
One thing to keep in mind is that User Interfaces are about HTML CSS and JS
So when we create components we are working with html css and js to combine them into a single component
Then we combine these components to create the entire ui

React allows you to create reusable and reactive components that consist of html js and css
React uses something called a declarative approach when building components
This basically means that with React you will not tell react that a certain html 
element should be created and placed specifically (as you would with js)
Rather you define what the desired end state (or provide multiple)
Then it is Reacts job to reach the desired end state by following the logic you have provided




___
## 27. Creating a New React Project
To start our work and to start writing react code we need a react project
The easiest way to do this is a tool called create-react-app
You can find the github repo for this tool here: https://github.com/facebook/create-react-app
Full documentation at: https://create-react-app.dev/

Create react app will automatically generate a default skeleton for your react app via a command in the terminal
It will provide necessary tools needed in order for your react app to function properly

To get started with it you need to make sure that you have node.js installed on your system
If you are using Mac: (must have brew for this to work)
```
$brew install node
```
If you are using linux this may be included but if not (this will refer to debian or ubuntu from here on out):
```
$curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
$sudo apt-get install -y nodejs
```

After node.js is installed in order to use (with npx you don't need to install) `create-react-app` use:
```
$npx create-react-app app-name 
$cd my-app
$npm start
```
This will run the create-react-app command 

(npm vs npx vs yarn here: https://www.techgecs.in/2019/12/difference-between-npm-npx-and-yarn.html
The difference between npm and npx is that npx will search the store and run the one in the store without installing which means less installed packages and latest version
In order for npx to work properly you need to make sure there is not an npm or yarn installation of create-react-app by uninstalling globally with:
```
$npm uninstall -g create-react-app
```
After uninstalling you should be free to use the `npx` version of the command) 

After the app has been created we will change directories into it and then run npm start to start the local server and view the app in our browser
(if the page doesn't load automatically visit localhost:3000 in your browser or see the terminal and see if it provided an address)
When you load the page in your browser you will see a dummy react app (probably just a spinning logo)

Now open the app in vscode so we can take a look

We will see a file called `package.json`
Within here are the dependencies which our project is using

The src folder hold the actual source code we will work on

There is a copy of this cleaned up project within this sections folder (named after this lesson or here: https://github.com/academind/react-complete-guide-code/tree/03-react-basics-working-with-components/code/01-starting-setup) 

This is the project we will be continuing in
If using this folder directly then run:
```
$yarn install
```
within the directory before running: (make sure you have stopped any other servers if they are running with ctrl+c)
```
$npm start
```
Make sure to keep this server running as long as you are working on your code
Whenever you make changes to your code they will be automatically applied and show up in the browser.




___
## 28. The Starting Project
In case you skipped the previous lecture, attached you find the starting project snapshot: https://github.com/academind/react-complete-guide-code/tree/03-react-basics-working-with-components/code/01-starting-setup

1. Download it

2. Extract it

3. run npm install in the extracted folder

4. Run npm start to start the development server.
