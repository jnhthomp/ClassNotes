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

There is a copy of this cleaned up project here: https://github.com/academind/react-complete-guide-code/tree/03-react-basics-working-with-components/code/01-starting-setup

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




___
## 29. Analyzing a Standard React Project
Now lets'take a look at the project we have
In the src folder is where most of our time/react code will be spent

If you are using the same starting point as the last lecture then you will see 2 js files and 1 css file
The important take away is that React code is just js code
We will use react features and special syntax but at the end of the day it will just be js

First we will look at index.js
```
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';


ReactDOM.render(<App />, document.getElementById('root'));
```
This is the first code file which will execute when the page is loaded
(there are other things happening behind the scenes that get this to be loaded but that is not important right now)
What is important is that this behind the scenes work will allow us to write and organize our code in a way that is easy for us to access and comprehend
When our code is run by react/webpack/babel etc it will be transformed to look much more like standard html than the js files we see now

Lets take a look line by line:
```
import ReactDOM from 'react-dom';
```
Here we can see that we are importing an object called ReactDOM from a third party 'react-dom' library
This will give us access to methods that allow us to render react components to the DOM

```
import './index.css';
```
Here we import css stying that will be used by our application to style the content that is rendered
The handy thing about css and react is that you can use css modules (much more on this later)
This allows you to easy scope your css properties and apply them very specifically when needed

```
import App from './App';
```
Next we import the `<App />` component which we will render to show our page content

```
ReactDOM.render(<App />, document.getElementById('root'));
```
Here we can see we are calling the `.render` method on the ReactDOM object we imported earlier
This receives two arguments the first is what we want to render
In this case it is a component (first component in action) called `<App />` (we imported this above)
This component will be used to hold all of our site content and we will call the components that we need to display at any given time with `<App>` (more on this later)
The second argument is where the content (the first argument) should be rendered to
In this case we use js to identify a div in our html with an id of 'root'
If you go to the public folder and look at index.html you will indeed see a div with an id of root
This means everything that we do in the app component will get called in index.js which will then be rendered as the only content to an html page
Ultimately this leaves us with 1 actual html file but multiple pages and a ton of content thanks to react and components and the ability to move them on or off the page with js

Now that we know that we are importing and rendering the `<App>` component lets take a look at it
```
function App() {
  return (
    <div className="App">
      <p>Hello There!</p>
    </div>
  );
}

export default App;
```
In App js we can see two things happening first a function and then an export of that function

Lets take a closer look at the function
```
function App() {
  return (
    <div className="App">
      <p>Hello There!</p>
    </div>
  );
}
```
It looks like the only thing this function is doing is returning a div and that div is being assigned a className of "App"
This is really weird since we are not used to having html elements within our js code
This syntax is called jsx and is one of the main things that react handles
It translates this special js/html combination into vanilla js and returns our entire app as vanilla js
We will discuss jsx more in depth in the next lesson for now just know that react allows you to return a combination html/js syntax called jsx
This jsx makes creating content easier for us and is intuitive
This jsx is translated to vanilla js by react before being displayed to the page

Then within that div a simple `<p>` tag with some text inside
Sure enough when we have run `npm start` and look at the page it should display the text from this `<p>` tag
This would make sense since the `<App>` component has this content, is exporting a function that returns this content
This content is being rendered via index.js and then pushed into index.html into the `#root` div




___
## 30. Introducing JSX
Now we will take a look at jsx
jsx stands for javascript xml (html is a type of xml and that's why it is named this way)
This allows us to use html within return statements of our js
This is because react will transform it to valid vanilla js before rendering it in the browser
For example if you look within the developer tools within chrome and go to the sources tab you can see the sources tab
Within here you should see a folder called static/js and several files one of which will contain the transformed code that is used to create our page (note that it is now much more complicated)
The code in these files isn't just our code but also the react package code
If you search within the 'main.chunk.js' file you should see the app function listed (try searching for it)
For me it looked like this:
```
function App() {
  return /*#__PURE__*/Object(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__["jsxDEV"])("div", {
    className: "App",
    children: /*#__PURE__*/Object(react_jsx_dev_runtime__WEBPACK_IMPORTED_MODULE_0__["jsxDEV"])("p", {
      children: "Hello There!"
    }, void 0, false, {
      fileName: _jsxFileName,
      lineNumber: 4,
      columnNumber: 7
    }, this)
  }, void 0, false, {
    fileName: _jsxFileName,
    lineNumber: 3,
    columnNumber: 5
  }, this);
}
```

This is valid js which when combined with the rest of the tools and framework that react provides results in the webpage we expect




___
## 31. How React Works
Now we have this html-ish code in a funcion but what do we do with it?
Well ultimately we will be building our own custom html elements (components)
They will be able to be reused and rendered on demand
The jsx (which is converted to html that is returned by our component is what we want to render to the screen)

Now lets try tweaking the code in our `<App>` component
We can try switching to a header and adding a paragraph below
```
function App() {
  return (
    <div className="App">
      <h2>Hello There!</h2>
      <p>General Kenobi, you are a bold one!</p>
    </div>
  );
}

export default App;
```

Now we should see our page updated and it was really easy to add new content
Keep in mind to do this in regular js you would have to use a special function target where you want to insert content and then insert the content in what would eventually get quite convoluted
Somthing like this:
```
const para = document.createElement('p');
para.textContent = 'General Kenobi, you are a bold one!';
document.getElementById('root').append(para);
```
This is how you would do it in regular js 
This would eventually get really complex once you started adding a bunch of different elements, especially ones that change or appear and disappear

With react we just define the desired endstate for our html
Then react will work behind the scenes to try to reach that end state
You can add instructions and logic along the way but that is the gist of it




___
## 32. Building a First Custom Component
We mentioned that React uses components and that `<App>` is a component
Now lets try building our first custom component
Since we want to build a finance tracker we will build one that is applicable to the tracker

To work towards our expense tracker lets think of the components we have and might need
Even though the application looks fairly simple there are a lot of components we can break it up into

The first component we will get started on is the expense item
This is a row where we have a title, an amount, and a date for a given expense

To build a component we will have to create a new file but where should we put it?
It is considered best practice to store components in their own folders and only have 1 file per component
To organize our code a little better we will add a new folder to hold our components
Then inside of this folder we will create a folder for our expense item component
Finally inside of that folder we will add our .jsx file that will be our component
As you can see continuing to do this will build a sort of component tree where some components that are shared are stored in more shared folders within the folder tree and components that are very specific are stored in folders together

create: src/components/ExpenseItem/ExpenseItem.jsx

Now we can begin writing the code for our component
To do that we have to understand what we need to write a component
As we saw in App.js a component is just a function that returns jsx
We know we will need to create this arrow function and that we will need an export statement to export the function
For now just to get it showing up we will keep it simple with just another `<h2>` tag
```
const ExpenseItem = () => {
  return (
    <h2>
      Expense Item
    </h2>
  )
}

export default ExpenseItem
```

Now we want to get this to show up somewhere
Lets think about how the `<App>` component showed up
We had to import it into index.js then we called it as an element
We can do the same thing except instead of importing and calling our component in index.js we will import call it in App.jsx
```
import ExpenseItem from './components/ExpenseItem/ExpenseItem';

function App() {
  return (
    <div className="App">
      <h2>Hello There!</h2>
      <p>General Kenobi, you are a bold one!</p>
      <ExpenseItem /> // Components with capital letters are custom components by convention
    </div>
  );
}

export default App;
```
The cool thing is that we can now call this as we would any other html element including calling it mutiple times if we wanted




___
## 33. Writing More Complex JSX Code
Now we have created our first component
Lets make it more exciting 
For that we will tweak our html code that is being returned in `<ExpenseItem>`
Instead of just a title we will also display the amount, and the date with the title
So when you think about that we will want to include each of these items in the html we are returning
So that means we need to adjust our html to include these other items
```
// NOTE INVALID/ERROR
 const ExpenseItem = () => {
  return (
    <div>Date</div>
    <div>
      <h2>Title </h2>
      <div>Amount</div>
    </div>
  )
}
```

This leads us to a problem
When returning jsx we are only allowed to return a single root element at a time
This element can have other elements inside of it but it cannot have sibling elements returned

In order to get around this we have a couple of options
The easiest way to get around this is to wrap both of our divs within another div
This will work for us for now
Later we will explore another option but that is not the best choice for us here
```
const ExpenseItem = () => {
  return (
    <div>
      <div>Date</div>
      <div>
        <h2>Title </h2>
        <div>Amount</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```

Now we can fill these in with something a little more specific for now but will later change it to be dynamic
```
const ExpenseItem = () => {
  return (
    <div>
      <div>March 28th 2021</div>
      <div>
        <h2> Car Insurance </h2>
        <div>$150.33</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```




___
## 34. Adding Basic CSS Styling
For styling we are using css and it is easy enough to add more css
To add css for a specific component you just add it to the same folder as the component (with the same name but .css extension)

For `<ExpenseItem>` we will need to make this file
create: src/components/ExpenseItem/ExpenseItem.css

Now we can add our css code
This is not a css course so we will not cover the how/why with css but will include it as a note for copy/paste

The CSS for this lecture can be found here: https://github.com/academind/react-complete-guide-code/blob/03-react-basics-working-with-components/extra-files/ExpenseItem.css
```
.expense-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
  padding: 0.5rem;
  margin: 1rem 0;
  border-radius: 12px;
  background-color: #4b4b4b;
}

.expense-item__description {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  align-items: flex-end;
  flex-flow: column-reverse;
  justify-content: flex-start;
  flex: 1;
}

.expense-item h2 {
  color: #3a3a3a;
  font-size: 1rem;
  flex: 1;
  margin: 0 1rem;
  color: white;
}

.expense-item__price {
  font-size: 1rem;
  font-weight: bold;
  color: white;
  background-color: #40005d;
  border: 1px solid white;
  padding: 0.5rem;
  border-radius: 12px;
}

@media (min-width: 580px) {
  .expense-item__description {
    flex-direction: row;
    align-items: center;
    justify-content: flex-start;
    flex: 1;
  }

  .expense-item__description h2 {
    font-size: 1.25rem;
  }

  .expense-item__price {
    font-size: 1.25rem;
    padding: 0.5rem 1.5rem;
  }
}
```

Now back in our component we need to make our build process aware of the existance of this css file and let it know that it should be used to style our application
We will do that by importing our css file to our ExpenseItem component
At the top of ExpenseItem.js
```
import './ExpenseItem.css';
```

Now we imported a css file that contains a bunch of classes that can be used to style html
We need to add these classes to our html in order for the styling to work
Instead of typing `class="DesiredClass"` like we would in a regular html element to add a class
Becuase this is jsx remember that this is all javascript that just looks like html right now
Instead we have to use the javascript attribute of applying a classname which is instead `className="DesiredClass"`
Now we can assign the classes that were defined in ExpenseItem.css to our divs
Remember to assign the following:
- expense-item
- expense-item__description
- expense-item__price
```
import './ExpenseItem.css';

const ExpenseItem = () => {
  return (
    <div className="expense-item">
      <div>March 28th 2021</div>
      <div className="expense-item__description">
        <h2> Car Insurance </h2>
        <div className="expense-item__price">$150.33</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```

Now if we save we should have an expense item on the page that has a date, a nice looking title as well as stylized amount




___
## 35. Outputting Dynamic Data & Working with Expressions in JSX

Now that our component looks a little better lets do some more work on solving a problem
We will not have only 1 expense and we definitely won't have the same expense over and over again
We need a way to dynamically pass data into a component so that we can call it over and over and pass different data in each time to show different information

Right now the biggest issue is that all of our data is hardcoded this really needs to be dynamic and received whenever the component is called
We don't have the ability to make the data dynamic yet but we can 'fake' it
We can do this by including some js inside of our component instead of just returning html
We can use some variables to store some values and instead of hardcoding values into our html we will call these variables instead

For example starting with the date we can create a new constant variable that creates a new data object (using js built in date object)
Then we will set an initial date value with values of (2021, 2, 28) (note that the 2 there will refer to march since js stores months in an array with jan=0 feb=1 mar=2 etc)
We can also add a simple string variable for a title and a number for price
```
import './ExpenseItem.css';

const ExpenseItem = () => {
  const expenseDate = new Date(2021, 2, 28);
  const expenseTitle = 'Car Insurance';
  const expenseAmount = 135.35;
  
  return (
    <div className="expense-item">
      <div>March 28th 2021</div>
      <div className="expense-item__description">
        <h2> Car Insurance </h2>
        <div className="expense-item__price">$150.33</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```

Now we want to output these values dynamically in our html
We can do this by inserting js into our 'html' with curly braces {}
anything inside of these curly braces will be interpreted as js
So to pass our variable values into our return statement we can use:
```
return (
  <div className="expense-item">
    <div>{expenseDate.toISOString()}</div>
    <div className="expense-item__description">
      <h2>{expenseTitle}</h2>
      <div className="expense-item__price">${expenseAmount}</div>
    </div>
  </div>
)
```
Note that I kept the '$' outside of the js variable and left it so it would display
We are not limited to just variables we can also execute basic js expressions (like ternary operations and simple functions)
Also note that because `expsenseDate` is a date object and not a string or number react doesn't know how it is supposed to be displayed
For this reason we have to call `.toISOString()` on the date object which will return a string value that can be displayed in html by react

Now we no longer work with hardcoded text in our html code but instead the values that we show are dynamic
They can change by a function or determined by however we want to program to be
Now we need to figure out how we can make this ExpenseItem more reuseable and alter the data that is being shown




___
## 36. Passing Data via "Props"
How can we make this component reusable?
Technically it already is!
We can copy/paste it again in App.js if we want but we will be displaying the same data multple times

Technically our component is showing more than once but it is the same data
This is because the data is baked into the component 
We need a way for the component to be able to get outside input and have it manipulate that input to determine what should be shown
This allows us to put different data into the component each time it is called which of course returns different data to us even if the data is being processed the same way

For example in regular js:
```
function double(x) {
  return 2x;
}

double(2); // => 4
double(5); // => 10
```

In react we want to do the same
To do this react uses a concept called 'props'

Imagine in your app component you have a variable `goalItem='finish'`
Then imagine you want to display that variable within the component `<CourseGoalItem>` as a list item like below
```
<li>{goalItem}</li>
```

Unfortunately we don't have direct access to these variables between components as that would be a nightmare for security and variable naming

However we can use props which allows us to pass data from the parent component to the child component
To do this from our app component we can pass any values we want `<CourseGoalItem>` to use when we call it by adding these values as attributes like we would on an html element
For example:
```
...
const goalItem = 'finish';
...
return(
  <CourseGoalItem text={goalItem} />
)
```
This will give our component access to this 'text' variable via an object called props and it will have the value of `goalItem`
Within `<CourseGoalItem>` we would use:
```
<li>{props.text}</li>
```
In order to access the value that was passed into it

Now lets apply this to our project
Currently we are storing values for our `<ExpensItem>` within the ExpenseItem itself so the first thing we have to do is store those in the App component
So remove them from ExpenseItem.js
Now in App.js we will create an array which will hold multiple expense item objects which we will pass into our component via props
```
const expenses = [
  { title: 'Car Insurance', amount: 135.35, date: new Date(2021, 2, 28) },
  { title: 'Toilet Paper', amount: 94.12, date: new Date(2021, 2, 12) },
  { title: 'New TV', amount: 799.49, date: new Date(2021, 2, 12) },
  { title: 'New Desk (Wooden)', amount: 450, date: new Date(2021, 5, 12) },
]
```
Now we have an expenses array and we want to pass the data for each of these objects into different calls of the `<ExpenseItem>` component
When we call these components we can simply add these objects/values as attributes
The teacher passes in individual values for each value like this:
```
return (
  <div className="App">
    <h2>Hello There!</h2>
    <p>General Kenobi, you are a bold one!</p>
    <ExpenseItem 
      date={expenses[0].date}
      title={expenses[0].title} 
      amount={expenses[0].amount}
    />
    <ExpenseItem
      date={expenses[1].date}
      title={expenses[1].title}
      amount={expenses[1].amount}
    />
    <ExpenseItem
      date={expenses[2].date}
      title={expenses[2].title}
      amount={expenses[2].amount}
    />
    <ExpenseItem
      date={expenses[3].date}
      title={expenses[3].title}
      amount={expenses[3].amount}
    />
  </div>
);
```


Now we need to use these values inside of our ExpenseItem component 
Currently it is looking for these values as regular variables and not as props
First we have to let the component know that it will be accepting props by adding the props variable as ar argument when we define our component function
Technically you can name it whatever you want but typically this is named props to make it clear
```
const ExpenseItem = (props) => {
  ...
}
```

Now we need to call these values within our returned html
```
return (
  <div className="expense-item">
    <div>{props.date.toISOString()}</div>
    <div className="expense-item__description">
      <h2>{props.title}</h2>
      <div className="expense-item__price">${props.amount}</div>
    </div>
  </div>
)
```
(Don't forget to get rid of the variables we had in the ExpenseItem component from before)

This is how you share data between components and allow them to be reusable and configurable




___
## 37. Adding "normal" JavaScript Logic to Components
Now our ExpenseItem component is pretty much done
It looks how it is supposed to, and can dynamically display data that is chosen whenever we call it and are able to reuse it with different values

One of the last things we want to clean up is the date so it looks a little nicer
To do this we will use some js logic within our component to alter what the date looks like before we display it
Currently it is a long ugly string and we want it to look more like a calendar thing
in order to do this we will need to change our html code
Instead of returning the date in one line we want it in 3 lines stacked on top of each other
The top line will displayt he month as a title, the middle line displays the year and the bottom shows the number 
We will need to break our one div up into three
We want it to go from:
```
<div>{props.date.toISOString()}</div>
```
to this:
```
<div>
  <div>Month</div>
  <div>Year</div>
  <div>Day</div>
</div>
```

In order to do this we will need to extract the month, year, and day from the date so that we can access these individually
Luckily date objects have built in methods that makes this easier
One is called the `.toLocaleString()` method
This is a method available to all date objects and will output dates in more human readable formats
You get to pass in two arguments
The first is a language, the second is an options object to configure how the date is formatted (see documentation for specific uses: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleString)
The important option we are interested in is the `month: 'long'` option so we can just pass that one on its own within an object
```
<div>
  <div>{props.date.toLocaleString('en-US', { month: 'long' })}</div>
  <div>Year</div>
  <div>Day</div>
</div>
```

If we save we can see that this should work and display a month name instead of a number now
This is fine for testing and getting it working but it is best practice to extract this logic from our html and return only variables within our html when possible
```
import './ExpenseItem.css';

const ExpenseItem = (props) => {

  const month = props.date.toLocaleString('en-US', { month: 'long' })

  return (
    <div className="expense-item">
      <div>
        <div>{month}</div>
        <div>Year</div>
        <div>Day</div>
      </div>
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```

Now we can do something similar for the day and the year
```
import './ExpenseItem.css';

const ExpenseItem = (props) => {

  const year = props.date.getFullYear();
  const month = props.date.toLocaleString('en-US', { month: 'long' });
  const day = props.date.toLocaleString('en-US', { day: '2-digit'});

  return (
    <div className="expense-item">
      <div>
        <div>{month}</div>
        <div>{year}</div>
        <div>{day}</div>
      </div>
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```




___
## 38. Splitting Components Into Multiple Components
As you work you will notice that your components start to get bigger as you add more logic and jsx to them
That is why react uses components which allows you to split the application into smaller building blocks
Where each block is focused on one core task
This allows components to be small and manageable and build up and around them

In our ExpenseItem component we could say that it could be split up
The date/calendar item could be treated as a separate component since it is kind of big and has its own logic and can operate seperately from this ExpenseItem as a whole 
For example if we ever had a IncomeItem we might want to show a date that is consistent between the two items
Splitting something into a new component can also make it easier to style

We will split the ExpenseItem component into two components the `ExpenseItem` and `ExpenseDate`
create: src/components/ExpenseItem/ExpenseDate.jsx

Then move the logic and jsx for the date from ExpenseItem to ExpenseDate
```
// Expense Item
import './ExpenseItem.css';

const ExpenseItem = (props) => {


  return (
    <div className="expense-item">
      {/* ExpenseDate go here */}
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
    </div>
  )
}

export default ExpenseItem
```

Don't forget that Expense Date will need access to props
```
// Expense Date
const ExpenseDate = (props) => {

  const year = props.date.getFullYear();
  const month = props.date.toLocaleString('en-US', { month: 'long' });
  const day = props.date.toLocaleString('en-US', { day: '2-digit' });


  return (
    <div>
      <div>{month}</div>
      <div>{year}</div>
      <div>{day}</div>
    </div>
  )
}

export default ExpenseDate
```

Now in ExpenseItem we wan to use this component and pass the date into it
first import ExpenseDate into ExpenseItem
```
import ExpenseDate from './ExpenseDate';
```

Then we can call this component and pass in the date as a prop
```
return (
  <div className="expense-item">
    <ExpenseDate date={props.date}/>
    <div className="expense-item__description">
      <h2>{props.title}</h2>
      <div className="expense-item__price">${props.amount}</div>
    </div>
  </div>
)
```

This might be confusing since we are passing data through multiple levels of components 
It may help to visualize and think of the flow of data
```
App =>  propsToExpenseItem = {
          date: dateValue
          title: titleValue
          amount: amountValue
        }
ExpenseItem => propsToExpenseDate = {
  date: dateValue
}
```
ExpenseItem has access to that variable but doesn't need to do anything with it other than make sure that ExpenseDate can access it if it needs to (which it does)

We also want to add some new styling (found at: https://github.com/academind/react-complete-guide-code/blob/03-react-basics-working-with-components/extra-files/ExpenseDate.css)
create: src/component/ExpenseItem/ExpenseDate.css
```
.expense-date {
  display: flex;
  flex-direction: column;
  width: 5.5rem;
  height: 5.5rem;
  border: 1px solid #ececec;
  background-color: #2a2a2a;
  color: white;
  border-radius: 12px;
  align-items: center;
  justify-content: center;
}

.expense-date__month {
  font-size: 0.75rem;
  font-weight: bold;
}

.expense-date__year {
  font-size: 0.75rem;
}

.expense-date__day {
  font-size: 1.5rem;
  font-weight: bold;
}
```

Then we have to import this css file
```
import './ExpenseDate.css';
```
and add css classes to our returned html:
```
return (
  <div className="expense-date">
    <div className="expense-date__month">{month}</div>
    <div className="expense-date__year">{year}</div>
    <div className="expense-date__day">{day}</div>
  </div>
)
```




___
## Assignment 1: Time to Practice: React & Component Basics
Time to practice what you learned and write your own React code, including components, props & more!

Now our application is taking shape and we have learned a bunch of key concepts (like components and props)
Now to practice what we have learned
Right now in App.js we are rendering four ExpenseItem components
Instead of rendering these four items here we need to create a new component (Expenses) which will be called in App.js
This Expenses component will instead call each individual ExpenseItem component
The Expenses components should render each ExpenseItem inside of a div with an css class (see github link below for Expenses.css file)

In detail:

Create a new component that is responsible for displaying expenses

Add multiple ExpenseItem components in that component

Keep the expenses data in the App component and pass that data into the newly created component

You can use this .css file for some styling for your Expenses component: https://github.com/academind/react-complete-guide-code/blob/03-react-basics-working-with-components/extra-files/Expenses.css

Questions for this assignment
Please share your solution


### My Solution:
First I created files I needed for the component
create: src/components/Expenses/Expenses.jsx and src/components/Expenses/Expenses.css

I also moved the ExpenseItem folder into the Expenses folder

Then I added the provided css to Expenses.css

Next I added the basic skeleton (function call and export statement) to Expenses.jsx including passing in a prop

Then in App.jsx I removed my call to ExpenseItem and changed the import statement to point to Expenses.jsx instead of ExpenseItem.jsx

Then I added and Expenses component and passees in the expenses array as a prop called expenses

Now in the Expenses component I created a new array and performed a .map function which creates a new ExpenseItem component for each item in the expenses array and adds it to a new array
Then I rendered this array of ExpenseItem components within the return statement

Lastly I added a new key to the expenses array in App.js and added a hardcoded random number and set that as a key property within Expenses.jsx
```
// App.jsx
import Expenses from './components/Expenses/Expenses';

function App() {
  const expenses = [
    { id: '85540',title: 'Car Insurance', amount: 135.35, date: new Date(2021, 2, 28) },
    { id: '83918',title: 'Toilet Paper', amount: 94.12, date: new Date(2021, 3, 12) },
    { id: '92370',title: 'New TV', amount: 799.49, date: new Date(2021, 8, 8) },
    { id: '34495',title: 'New Desk (Wooden)', amount: 450, date: new Date(2021, 5, 15) },
  ]
  return (
    <div className="App">
      <h2>Hello There!</h2>
      <p>General Kenobi, you are a bold one!</p>
      <Expenses expenses={expenses}/>
    </div>
  );
}

export default App;
```
```
// Expenses.jsx
import './Expenses.css';
import ExpenseItem from './ExpenseItem/ExpenseItem';

const Expenses = (props) => {

  let expensesList = props.expenses.map((el) => {
    return (
      <ExpenseItem
        key={el.id}
        date={el.date}
        title={el.title}
        amount={el.amount}
      />
    );
  });
  
  return (
    <div className="expenses">
      {expensesList}
    </div>
  )
}

export default Expenses
```


### Teacher Solution
Now for the teacher solution
create: src/components/Expenses.jsx and src/components/Expenses.css

Add provided css and import in Expenses.jsx

Add Expenses basic skeleton (function call and export statement)

In the Expenses functoin we will return some code
We can simply copy/paste the four existing ExpenseItems and move them into Expense.jsx
However have to add all of this inside of a wrapping div
Now import the ExpenseItem to the Expenses component

Next we need to add props as an argument
We also need to pass the expenses array into the Expenses component from App.jsx
To do this import the expenses component into App.jsx (you don't need ExpenseItems anymore)
Call the Expences component and pass the expenses array (as items and rename within Expenses component when calling values on props) into it
```
// App.jsx
import Expenses from './components/Expenses';

function App() {
  const expenses = [
    {
      id: 'e1',
      title: 'Toilet Paper',
      amount: 94.12,
      date: new Date(2020, 7, 14),
    },
    { id: 'e2', title: 'New TV', amount: 799.49, date: new Date(2021, 2, 12) },
    {
      id: 'e3',
      title: 'Car Insurance',
      amount: 294.67,
      date: new Date(2021, 2, 28),
    },
    {
      id: 'e4',
      title: 'New Desk (Wooden)',
      amount: 450,
      date: new Date(2021, 5, 12),
    },
  ];

  return (
    <div>
      <h2>Let's get started!</h2>
      <Expenses items={expenses} />
    </div>
  );
}

export default App;
```
```
// Expenses.jsx
import ExpenseItem from './ExpenseItem';
import './Expenses.css';

function Expenses(props) {
  return (
    <div className="expenses">
      <ExpenseItem
        title={props.items[0].title}
        amount={props.items[0].amount}
        date={props.items[0].date}
      />
      <ExpenseItem
        title={props.items[1].title}
        amount={props.items[1].amount}
        date={props.items[1].date}
      />
      <ExpenseItem
        title={props.items[2].title}
        amount={props.items[2].amount}
        date={props.items[2].date}
      />
      <ExpenseItem
        title={props.items[3].title}
        amount={props.items[3].amount}
        date={props.items[3].date}
      />
    </div>
  );
}

export default Expenses;
```




___
## 39. The Concept of "Composition" ("children props")
Currently we have our Expenses component which is made up of muliple different smaller components (ExpenseItem -> ExpenseDate)
This is called composition

What if we wanted to create a component which serves as a shell around other content?
Right now our components are very specific but what if we wanted to create something that might get reused to have multiple different things in it?
For example we could create a component that acts as a container component and sets a style so that the content inside of it is displayed within a nice box

One way we could do this is create a component which we simply wrap around other components like a div that we style to give a 'card' look
To do this we will create a new component
create: src/components/Expenses/Card.jsx

Then we will create a css file that we will import into the component to give it styling
create: src/components/Expenses/Card.jsx

Then we can borrow some of the styling like the `border-radius` and `box-shadow` from expenses.css remove from there and add them to our new Card.css
```
.card{
  border-radius: 12px;
  box-shadow: 0 1px 8px rbga(0, 0, 0, 0.25);
}
```

We will also need to remove the `border-radius` and `box-shadow` from ExpenseItem.css `.expense-item`

Now be sure that within Card.jsx you have imported the css file, added the function and export statement, and then assigned the class to the div returned within the component
```
import './Card.css';

const Card = () => {
 return (
   <div className="card">

   </div>
 )
}

export default Card
```

What we want to do is use this component like a wrapping div so that wherever we call it will have these styles by default (we can also assign additional classes when we call it if we like)
How do we go about this?
Lets just try it
In ExpenseItem replace the wrapping div with the `.expense-item` class with our card component (don't forget to import it also leave the `.expense-item class attached)
```
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../Card';

const ExpenseItem = (props) => {


  return (
    <Card className="expense-item">
      <ExpenseDate date={props.date}/>
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
    </Card>
  )
}

export default ExpenseItem
```

If we save and run our application then we can see that none of our ExpenseItems are showing up
This is because you cannot do it like this out of the box.
When we defined the return statement for our Card component we never told it what to do with children elements so it doesn't bother to try to render them since our component was not told to
We have to specify where and how we want child components to be rendered within our Card component
In order to do this we will need to accept props within our card component
Then props will give us access to children components via `props.children`
Wherever `props.children` is called is where any child elements where he Card component was originally called will be rendered within the Card component
```
import './Card.css';

const Card = (props) => {
 return (
   <div className="card">
    {props.children}
   </div>
 )
}

export default Card
```

This also means that the `className` that we tried to pass in was also passed as a prop
In order for to get it to show we have to access `props.className` and assign it as a class within a div in our return statement
To do that we will build a string that hold the card class along with whatever classnames are passed in as a string
```
const Card = (props) => {
  const classes = 'card ' + props.className; 
  return (
    <div className={classes}>
      {props.children}
    </div>
 )
}
```

Now if we save we have a nice looking reusable wrapper component and have nice rounded edges on our ExpenseItems component
We can also use this in our Expenses component
Instead of using a div we can use the card component just like in ExpenseItem
Simply import it and call it just like before
```
import './Expenses.css';
import ExpenseItem from './ExpenseItem/ExpenseItem';
import Card from './Card';

const Expenses = (props) => {

  let expensesList = props.expenses.map((el) => {
    return (
      <ExpenseItem
        key={el.id}
        date={el.date}
        title={el.title}
        amount={el.amount}
      />
    );
  });
  
  return (
    <Card className="expenses">
      {expensesList}
    </Card>
  )
}

export default Expenses

```




___
## 40. A First Summary
This section has mainly covered components (the most important concept of react)
For that we had a look at react core syntax and jsx
Had a detailed look at building, using, and working with components
We also learned how to share data across components through props

With all of these components we are just splitting our code across multiple files and building blocks
We can reuse these building blocks instead of repeating that code multiple times
In the end what ends up on the screen are just default html/css/js elements

Ultimately every custom component that is built uses html elements or eventually uses a component that does

The application as we have built it so far has a downside in that it is static
We have an array in App.js that never changes our application is not dynamic and users cannot interact with it

The next course section will bring this to life and teach another concept called state
Before we get to that there are three things to take a closer look at

JSX - See what it really is under the hood and how it works
How to organize files
How to write our functions




___
## 41. A Closer Look At JSX
Before we mentioned that we can open our developer tools and see the js code that is responsible for everything happening on the page
This looks much different than the functions we wrote because react has transformed our jsx into valid js/html syntax

We could also write code intsead of jsx which is more readable than what we see with the developer tools when we inspect the page but not as readable as the jsx we are using
it is improtant to be aware of what is happening behind the scenes

One thing you may have wondered about is in package.json there is a list of dependencies most of which deal with behind the scenes transformations
There are two dependencies related to react called `react` and `react-dom`

If you look at index.js you can see that we are importing and using `react-dom` but we aren't using `react` anywhere
This works in modern react setups made with `create-react-app`
In other applications (older) you will see `react` imports even thought they are not used here
This is because in the past you needed to import react in every react component file (every file that uses jsx)
Now however we can omit this import because of modern react dark magic
When we write jsx it is transformed into methods that are called on the react object which is why we need to import react in the past

Let's take a look at a short piece of jsx code and what it would look like if we didn't have jsx available
Consider the return statement from App.jsx
```
return (
  <div>
    <h2>Let's get started!</h2>
    <Expenses items={expenses} />
  </div>
)
```

What react does is take this jsx, format it, and call it on a built in function to the React object called `.createElement()`
This method receives 3 arguments 
the first is an element such as div
The second argument sets any attributes for this element
The third argument is the content between the opening and closing tags
You can have as many of these 'third' arguments as you want separated by commas
If we want to have children elements in between the opening and closing tags (as compared to a string)
we can use the `React.createElement()` again to render this child element
```
React.createElement('elementtype', {properties}, 'content', 'content2...')
```

If we apply this to our return statement from above we know that we will start by calling `.createElement()` on our react object (imported)
Then for our first argument where we determine the element type we can say `'div'`
Our div doesn't have any properties so we can use an empty object
Then we need an h2 element so we will need to nest another `.createElement()` call on a react object
Next we will need another `.createElement()` call to create our Expenses element
Note that if we are using a custom component we do not use a string but instead just point directly at our imported component as a variable
Then we can pass the properties in as an object 
If there is no content between the opening and closing divs we can omit it
In the end the transformed version would lok like this:
```
return React.createElement(
  'div',
  {},
  React.createElement('h2', {}, "Let's get started!"),
  React.createElement(Expenses, {items: expenses})
);
```

You could write your entire react app like this but it is much more difficult to read and manage

To emphasize that react is being used we will add react import statements to our files that return .jsx
These files are: ExpenseDate.jsx, ExpenseItem.jsx, Card.jsx, Expenses.jsx, App.jsx, and index.js
```
import React from 'react';
```

Now that you know what jsx is transformed into it should be clear why you need a wrapping element around any children components




___
## 42. Organizing Component Files

Now lets discuss how we should organize our files
We have an extremely basic layout on our page and already are starting to get a lot of components built up
Eventually it would become really hard to find what you need
In order to avoid this it is best to organize your application so that it is easy to find any given component - especially since some components will get reused (like Card.jsx)

We are going to want to organize our components into subfolders
We have some genearl UI components which are not tied to any given feature (like card) as well as some feature specific components (like Expenses)

In order to better organize this we could create two new folders within components called UI and Expenses to separate these two categories (you may have already done some of this)
create: src/components/Expenses
create: src/componetns/UI

Move 'Card.css' and 'Card.jsx' into the UI folder
Be sure to change any import statements in other files that use card vscode may do this for you automatically

Move 'ExpenseDate.css', 'ExpenseDate.jsx', 'ExpenseItem.css', 'ExpenseItem.jsx', 'Expenses.css', and 'Expenses.jsx' into the Expenses folder
Adjust your imports so your app still works

I also added an ExpenseItem folder told hold the ExpenseItem and ExpenseDate components/css files but that is optional
The important thing is that it is organized in a way that makes sense to you and your team (if applicable)




___
## 43. An Alternative Function Syntax
There is an alternative syntax for writing functions
The teacher has been writing them like this:
```
function App() {
  const foo {
    foo: bar
  }

  return (
    <foo>
      <bar></bar>
    </foo>
  )
}
```

I have already been using this syntax so you may have noticed it in the notes but  you can instead use an arrow function sytax
To do this instead of calling fucntion simply call const, give a name, then assign a value of an arrow function to this constant
```
const App  = () => {
  const foo {
    foo: bar
  }
  return (
    <foo>
      <bar></bar>
    </foo>
  )
}
```

You would add any props or parameters into the () after the variable assignment
This is standard js and all functions will probably be this from now on since I prefer it

For more on js arrow functions: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions

Make sure your application still works after changing the function types and moving our files around




___
## Quiz 1: Learning Check: React Basics, Componets, Props, & JSX

```
Q1
Which Kind of code do you write when using React.js?
A: Definitive JSX Code
B: Imperative JavaScript Code
C: Declarative JavaScript Code
```
```
Q2
What is "JSX"?
A: It's a standard JavaScript syntax
B: It's a special, non-standard syntax which is enabled in React projects
C: It's a special string which you can pass to React functions
```
```
Q3
Why is React all about "Components"?
A: Every UI in the end is made up of multiple building blocks (= components), hence it makes sense to think about user interfaces as "combinations of components"
B: React projects are configured to only work with components, hence you have to use them when writing React code
C: Components offer better performance than "standard user interfaces" that don't use components
```
```
Q4
What does "declarative" mean?
A: "Declarative" is the same as "imperitive"
B: You define the individual steps that need to be taken to achieve a desired outcome (e.g. a target UI)
C: You define the desired outcome (e.g. a target UI) and let the library (React) figure out the steps
```
```
Q5
What is a "React Component"?
A: It's a JavaScript function which typically returns HTML (JSX) code that should be displayed
B: It's a replacement for standard HTML which is supported by modern browsers
C: It's a JavaScript function that must not return anything
```
```
Q6
How many custom React components must a React app have?
A: At least 2
B: At most 99
C: That's totally up to you
```
```
Q7
Which statement is correct?
A: With React, you build multiple sibling component trees that are then mounted into the same DOM node
B: With React, you build a component tree with one root component that's mounted into a DOM node
C: With React, you always mount every component into it's own DOM node
```
```
Q8
What does "component tree" mean?
A: It means that you have a root node which then has more components nested beneath it
B: It means that you must always return more than one component or HTML element per component function
C: It means that you can build multiple components
```
```
Q9
How do you pass data between components?
A: Via global JavaScript variables that are available to all files
B: Via "custom HTML attributes" (betteer known as props)
C: Via standard HTML attributes which you can use in non-React apps as well
```
```
Q10
How can you output dynamic data in React components (i.e. in the returned JSX code)?
A: You can use single curly braces (opening & closing) with any JS expresssion between them
B: React has a special syntax that allows you to output variables values (i.e. values stored in variables) and nothing else: Opening & closing curly braces
C: You can't
```

```
Answers:
Q1: C
With React.js, you define the "goal" (i.e. what should be shown on the screen) and let React figure out how to get there.

Q2: B
React projects like the ones we create via "create-react-app" support JSX syntax. It gets compiled to standard JS code behind the scenes.

Q3: A
"Components" are really just a way of thinking about user interfaces. React embraces that concept and gives you tools to build components that you can then combine.

Q4: C
You define the target "state" (UI) and React figures out which JS commands need to be executed to bring that result to life.

Q5: A
A component is just that: A JS function that typically returns some HTML (or, to be precise: JSX) code which will be shown on the screen when that component is used.

Q6: C
You can have as many React components as you want / need.

Q7: B
You build a component tree that has one root node.

Q8: A
You build a tree by nesting components into each other - just as you build a HTML tree when building a standard HTML document.

Q9: B
You build your own "HTML elements" in the end, hence you can also define your own attributes (called "props" in React's world)

Q10: A
You can't put block statements (e.g. if statements) between those curly braces but you can output any result of any JS expression by using this special feature.
```




___
## 44. Module Resources
You may want to compare your code to the teachers (e.g. to find + fix errors).

For that, you find multiple code snapshots for this module here in this Github repository: https://github.com/academind/react-complete-guide-code/tree/03-react-basics-working-with-components

Usage instructions can be found on the page that link is leading to.

Simply pick one of the snapshots in the /code folder - the subfolder names are chosen such that they are easy to match against lecture names in this course section.

You also find section slides (if available) in that Github repository.