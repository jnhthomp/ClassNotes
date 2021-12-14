# Section 4: React State & Working With Events
Section github: https://github.com/academind/react-complete-guide-code/tree/04-react-state-events
___
## 46. Module Introducion
Now that we have covered some of the basics of react we will dive a little deeper into some of the core functions of react
This section will make user interaction and handling user events possible like clicks and input
We will look at the concept of state in react apps
This will allow us to follow our declaritive approach and to make the page change to follow the values of our state object

We are going to look at handling user events such as clicks with event handlers
We will also look at how we can ensure that the content on the screen changes to match the state

We will learn how we can manipulate the state and transition from state a to state b

We will also take a closer look at components and how they use state




___
## 47. Listing to Events & Working With Event Handlers
Currently our demo application is pretty static
There is an output but all of those outputs are hardcoded and do not change

Now we will dive into how we will react to user events before we look at how these events can trigger a state change

To start simply we will react to clicks on a button
For this we will go to the expense item and add a button at the bottom of the card before the closing card tag
```
import React from 'react';
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../../UI/Card';

const ExpenseItem = (props) => {


  return (
    <Card className="expense-item">
      <ExpenseDate date={props.date}/>
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
      <button>Change Title</button>
    </Card>
  )
}

export default ExpenseItem
```

The styling isn't great but this is a temporary button

Now we want to do something when this button is clicked such as change the title of the ExpenseItem
We will pass the title in via props but we need to figure out how we can react to button clicks first
Luckily this is pretty simple
This is because we have access to native dom events that we can listen to such as clicks
If you search for 'html button elements' and look into the dom interface: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button -> https://developer.mozilla.org/en-US/docs/Web/API/HTMLButtonElement
You can see that the HTMLButtonElement -> HTMLElement -> Element -> Node -> EventTarget
So that means we can make the HTMLButtonElement that we just created the target of an event because it is just a more specific form of an event target that is predefined within html
We can also view which events are available to button by looking at element and seeing the listed events -> https://developer.mozilla.org/en-US/docs/Web/API/Element/click_event
Button has access to all the events that element has access to because it inherits from Element

This means instead of adding an event listener like we would in vanilla js like this:
```
document.getElementById('root').addEventListener()
```

In react we can add an event listener by adding a special prop to our button element
Because react exposes default events as props we can simply pass a method into our button in as an 'onClick' prop which is a react keyword
Then react will magically know to activate that function when the button is clicked
Here we can create an anonymous function and pass in a simple `console.log` just to make sure it is working
```
import React from 'react';
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../../UI/Card';

const ExpenseItem = (props) => {


  return (
    <Card className="expense-item">
      <ExpenseDate date={props.date}/>
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
      <button onClick={() => {console.log('clicked')}}>Change Title</button>
    </Card>
  )
}

export default ExpenseItem
```

This can work for small things like a console.log but can be difficult or not work for more complex functions 
Instead it is better to create a function outside of the return statement and assign it to a variable, then we can simply call that variable instead
```
import React from 'react';
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../../UI/Card';

const ExpenseItem = (props) => {

  const clickHandler = () => { console.log('clicked') };

  return (
    <Card className="expense-item">
      <ExpenseDate date={props.date}/>
      <div className="expense-item__description">
        <h2>{props.title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
      <button onClick={clickHandler}>Change Title</button>
    </Card>
  )
}

export default ExpenseItem

```
Notice that we only point at click handler and do not add `()`
This is because doing this would execute the method when the button is loaded
Ommitting the `()` will prevent the method from loading immediately and will only run the method when it is clicked

One last note is that whenever we name functions that is triggered by an event we add `Handler` at the end of the method name
This isn't required but can make identifying event handlers in your code much easier




___
## 48. How Component Functions Are Executed
Now that we are able to make something happen when the button is clicked (a console.log message) how do we update the page to display something different?
Remember in this case we want to change the title of the ExpenseItem where the button was clicked

One way we could do this is we could create a variable called `title` with a let and set it equal to the props.title is passed in when the component is called
Then we could use the title variable instead of props.title to output the title
```
import React from 'react';
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../../UI/Card';

const ExpenseItem = (props) => {

  let title = props.title;

  const clickHandler = () => { console.log('clicked') };

  return (
    <Card className="expense-item">
      <ExpenseDate date={props.date}/>
      <div className="expense-item__description">
        <h2>{title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
      <button onClick={clickHandler}>Change Title</button>
    </Card>
  )
}

export default ExpenseItem
```
If we do that then we see the same result as before except now we can try to update the value of that variable and see if the screen updates as well
Now in our `clickHandler` method we can try to update the title
```
const clickHandler = () => { title = 'updated' };
```

Except there is one problem.
React doesn't update the screen every time any given variable is changed
This is because doing this would require a huge amount of refreshes in large apps and most of the time there would be no real updates to the screen
Instead react will only automatically update the view to the user when certain variables are changed, certain methods are run, or components are created
These certain 'variables' that will update the view whenever they update is called the 'state' object
The 'state' is an object that holds a collection of variables for a component which can be accessed by the component to help render their veiw
When these values change react will make a virtual rerendering behind the scenes and if it is different than what the user is currently seeing it will update it accordingly
This helps from having unnecessary refreshes as well as other bonuses that we will cover later




___
## 49. Working With "State"
Now how do we use state so that we can ensure we are storing our variables correctly and ensure that our components update and rerender when certain values are changed

To do this we will first need to create a state object
In a functional component we can do this by adding a new import
We will adjust our React import statement to specifically include a function called `useState` as well
```
// ExpenseItem.jsx
import React, { useState } from 'react';
...
```

What does this function do?
It is provided by the react library and allows us to define values as state where changes to these values are reflected in the returned jsx after they have changed

How do we use this function?
Inside of our component function we need to call `useState()`
This is what is called a react hook, there are others as well which we will learn later which also follow the `use[Method]` pattern
All of these hooks can only be called inside of react component functions 
This means in this case we need to call it inside of the ExpenseItem function
They must also not be nested in any functions, they must be called directly in the component function (one exception to be discussed later)
`useState` will also require a default state value
with `useState` we are creating a special kind of variable where changes lead to the component function to be called again
In this case we want to add the value of `props.title` to our state so we will add that as an argument
`useState` will return two things as an array
  - The first is a variable so that we can use to access this value that we have saved
  - The seccond is a method that can be used to update this value
We can use a modern js feature called array destructuring to assign both of these returned items to variables
```
const [title, setTitle] = useState(props.title); 
```
Now when the component is called and useState is initially called it will take the value of props.title and assign it to a variable called `title`
This variable will be monitored for changes that are made by using the `setTitle` method which is returned by `useState` along with the state variable

Now we can remove the title variable that we used before as well as the value assignment in `clickHandler` (we don't have to change the call to `title` in our returned jsx)

Next we can assign a new value within our `clickHandler` by using the `setTitle` method that weas returned by `useState` and pass the new value in as an argument
```
import React, { useState } from 'react';
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../../UI/Card';

const ExpenseItem = (props) => {

  const [title, setTitle] = useState(props.title); 

  const clickHandler = () => { setTitle('Updated!')};

  return (
    <Card className="expense-item">
      <ExpenseDate date={props.date}/>
      <div className="expense-item__description">
        <h2>{title}</h2>
        <div className="expense-item__price">${props.amount}</div>
      </div>
      <button onClick={clickHandler}>Change Title</button>
    </Card>
  )
}

export default ExpenseItem
```

Now you can see when you press the buttons the title changes but why does this work?
This is because when you use the `setTitle` method React knows that the value was changed and knows it needs to re-evaluate if the content on the screen should change or not
In the background it will rerender the page virtually and compare it to what the user currently sees to determine if it should rerender for the user or not
If the state variable value had changed (which react knows because `setTitle` and monitoring of the `title` variable that was created when we called `useState`) and it would make the page look different it will update the page as needed for the user
If not then react continues as normal but it is important that the check is made




___
## 50. A Closer Look At The "useState" Hook
Now that we know the basics of state we can take a closer look and make some clarifications
One important thing from the last lesson is that `useState()` registers a state for the INSTANCE of a component in which it is called
For example since `<ExpenseItem>` is being used 4 times there are 4 seperate states that are being created
Each instance of `<ExpenseItem>` has it's own state that is completely seperate and unnaffected by any of the other instances of `<ExpenseItem>`
Each of these states are managed independently by react
If you were to change the values of the state for one of them (you could specifically target the state of just one instance instead of maing a change to all by perhaps using the value of the components unique key to set a value just for example) then that change would only be reflected in the single instance and not among every instance
This is good because then if we make changes to the state of one of our instances of a component it won't update every instance

You can see instances in action by adding a `console.log()` to our `<ExpenseItem>`
Just underneath where we set state we can use (line 7):
```
import...
...
const ExpenseItem = (props) => {
  const [title, setTitle] = useState(props.title);
  const clickHandler = () => {setTitle('Updated!')};

  console.log('ExpenseItem Evaluated by react');
  
  return(
    ...
  );
}
```

If we run our page we can see that upon loading there are 4 console logs because there are 4 instances of the `<ExpenseItem>` component
However if we update the title on just one we can see that we only get one additional console log
This is because React will only update components that need updating and since only one instance of `<ExpenseItem>` had a value update in state it was the only one who re-ran the `console.log` function

One other thing that might be weird is that we used const when we used array destructuring to assign values to the variable `title` and function `setTitle` that are returned by `useState()`
This is strange because we do update the value of title (which is why we use `setTitle()`)
What happens when we run `setTitle()` however is that the entire component is reoaded and re-ran
This means that the previous value for title (and the array holding it) actually don't exist at all anymore
Instead whenever this new component is ran new `title` value will be carried over to the updated version of the component and be assigned where we previously assigned title
So the value of `title` is never actually changed instead the variable is wiped from existance and replaced with a new variable of the same name with a different value
What about `props.title`?
Why does it not get re-assigned to state when the component is reran?
This is because react tracks `useState` and when components are ran
It is smart enough to only use the `props.title` arguement that is passed in on the first time the instance is rendered
When it rerenders react tracks this and knows it is not a new instance and ignores the `props.title` argument

State in a nutshell
1. Always register state with the `useState()` function
2. `useState()` will always return 2 items
  a. a value to hold the variable to be registered in state
    - use this to access/display the value but do not try to update directly
  b. a function used to update the value
    - always use this to update the value of a state variable




___
## 51. State Can Be Updated In Many Ways!

Thus far, we update our state upon user events (e.g. upon a click).

That's very common but not required for state updates! You can update states for whatever reason you may have.

Later in the course, we'll see Http requests that complete (where we then want to update the state based on the Http response we got back) but you could also be updating state because a timer (set with setTimeout()) expired for example.




___
## 52. Adding Form Inputs
Now that we can change state, pass props between components, and listen to events we can do more to make this more like a real website and dynamic
The first way we can do this is by making it so we can add real expenses by gathering user input

The very first thing that we will need to do is find a way to collect input from the user
To do this we can use a new component and even create a new category of components
So far our expense components have been about outputting and showing expenses and not for inputting information
Our new component will focus on making new expenses and collecting user input and won't have much in common with our previous components
We can go ahead and create a new folder and file called `NewExpense`

create: src/components/NewExpense/NewExpense.jsx
Also create: src/components/NewExpense/NewExpense.css
Go to the lesson github and copy/paste the appropriate css or take from here
```
#NewExpense.css
.new-expense {
  background-color: #a892ee;
  padding: 1rem;
  margin: 2rem auto;
  width: 50rem;
  max-width: 95%;
  border-radius: 12px;
  text-align: center;
  box-shadow: 0 1px 8px rgba(0, 0, 0, 0.25);
}

.new-expense button {
  font: inherit;
  cursor: pointer;
  padding: 1rem 2rem;
  border: 1px solid #40005d;
  background-color: #40005d;
  color: white;
  border-radius: 12px;
  margin-right: 1rem;
}

.new-expense button:hover,
.new-expense button:active {
  background-color: #510674;
  border-color: #510674;
}

.new-expense button.alternative {
  color: #220131;
  border-color: transparent;
  background-color: transparent;
}

.new-expense button.alternative:hover,
.new-expense button.alternative:active {
  background-color: #ddb3f8;
}
```

Now we can create our component within this new .jsx file
```
import './NewExpense.css'

const NewExpense = () => {
  return(
    //jsx to be returned
  );
}

export default NewExpense
```

This `<NewExpense>` component will be the "window" or card or area that will hold the form used to collect user input
However it is possible that we will want to use the form elsewhere
Say for example we later want to and income instead of expenses.
You could use the same form but repurpose it instead of having to make a new form
So will keep the actual form logic seperate then call the form into our `<NewExpense>` component so we will need to create yet another component

create: src/components/NewExpense/ExpenseForm.jsx
*Note: This is a temporary location for this file. If we do decide to reuse it we will bring the form out of the expense section and give it a new folder for better organisation but this is clear enough for now

We will also have styling on our form
create: src/components/NewExpense/ExpenseForm.css
Get css from github or here
```
.new-expense__controls {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  margin-bottom: 1rem;
  text-align: left;
}

.new-expense__control label {
  font-weight: bold;
  margin-bottom: 0.5rem;
  display: block;
}

.new-expense__control input {
  font: inherit;
  padding: 0.5rem;
  border-radius: 6px;
  border: 1px solid #ccc;
  width: 20rem;
  max-width: 100%;
}

.new-expense__actions {
  text-align: right;
}
```

Now inside of `<ExpenseForm>` we can start creating our form using jsx
To get input from the user we will create a form using html
For more info: https://www.w3schools.com/html/html_forms.asp
We can use the info from this page to get started and consider what kind of information we want to collect from the user
The three main things we want are: an expense name, an expense cost (a number), and a date

So we will need 3 input fields and for styling/organisation we will put each of these fields inside of a div
We will also have a div to hold all of our fields within the form but that div will be inside of the `<form>` element tags

```
import './ExpenseForm.css';

const ExpenseForm = () => {
  return (
    <form>
      <div className="new-expense__controls"> // All form controls are inside this
        <div className="new-expense__control"> //--
          <label>Title</label>                 //  |-Title controls
          <input type="text"/>                 //  |
        </div>                                 //--
        <div className="new-expense__control">          //--
          <label>Amount</label>                         //  |-Amount controls
          <input type="number" min="0.01" step="0.01"/> //  |
        </div>                                          //--
        <div className="new-expense__control">                    //--
          <label>Date</label>                                     //  |-Date controls
          <input type="date" min="2019-01-01" max="2022-12-31"/>  //  |
        </div>                                                    //--
      </div>
    </form>
  );
};

export default ExpenseForm;
```

Now that we have a way to collect inputs we need within the component we need an action to confirm them and submit them
We need a button that a user can click after they have input their information that will submit and save the data
We can add this to the bottom of our form (still within our styling div)
```
<button type="submit">Add Expense</button>
```
When we are done with the basic layout and styling of our expense form we can use it in our `<NewExpense>` component
First we have to import it and then call it within our return statement
Don't forget to assign the `new-expense` class on the surrounding divs
```
import './NewExpense.css';
import ExpenseForm from './ExpenseForm.jsx';

const NewExpense = () => {
  return (
    <div className="new-expense">
      <ExpenseForm />
    </div>
  );
};

export default NewExpense;
```

Next in our App we have to render our `<NewExpense>` component since we are not calling it anywhere
Again we have to import it and then call it somewhere
```
import React from 'react';
import Expenses from './components/Expenses/Expenses';
import NewExpense from './components/NewExpense/NewExpense'; // Import NewExpense

const App = () => {
  const expenses = [
    { id: '85540',title: 'Car Insurance', amount: 135.35, date: new Date(2021, 2, 28) },
    { id: '83918',title: 'Toilet Paper', amount: 94.12, date: new Date(2021, 3, 12) },
    { id: '92370',title: 'New TV', amount: 799.49, date: new Date(2021, 8, 8) },
    { id: '34495',title: 'New Desk (Wooden)', amount: 450, date: new Date(2021, 5, 15) },
  ]
  return (
    <div className="App">
      <NewExpense /> //Call and display NewExpense
      <Expenses expenses={expenses}/>
    </div>
  );
}

export default App;

```

Now we should ahve a prety good looking NewExpense card above our expenses with inputs available for us to input data anda submit button (doesn't do anyting yet because there is `onClick` attached)




___
## 53. Listening to User Input
Now that we have fields were a user can input data we have to actually collect and store that data for it to be saved or used

Let's start with something a little more simple by listening for user input within `<ExpenseForm>` and simply outputting those inputs to the console

For example in our text box we could use an `onChange` event to run a method every time any of our input fields have a changed value
We could use other methods like `onClick` or `onKeystroke` or something but this will make our method applicable to all of our inputs
One way we could use this is that we could have this method update a variable and then pass that updated variable to a `console.log` so we can see how collecting user input works
For now all we want to do is set an `onChange` event listener in our title input box
Then we will direct it to a `titleChangeHandler` function (remember this goes above the return statement)
`titleChangedHandler` will simply run `console.log('Title Changed!)`

Our expense form should then look like this: 
```
import './ExpenseForm.css';

const ExpenseForm = () => {
  const titleChangeHandler = () => {
    console.log("Title Changed!");
  }
  return (
    <form>
      <div className="new-expense__controls">
        <div className="new-expense__control">
          <label>Title</label>
          <input type="text" onChange={titleChangeHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Amount</label>
          <input type="number" min="0.01" step="0.01"/>
        </div>
        <div className="new-expense__control">
          <label>Date</label>
          <input type="date" min="2019-01-01" max="2022-12-31"/>
        </div>
        <button type="submit">Add Expense</button>
      </div>
    </form>
  );
};

export default ExpenseForm;
```

When we run this in our browser and pull up the console we can see that every time we type into the title input bar we get a message that the title was changed

This is cool but what we actually want is to access the values inside of the input field
So how do we do that?
To understand how it works it is helpful to remember how we add event listeners in vanilla js
Remember we would use something like:
```
document.getElementById(id).addEventListener('click', (event) => {functionhere});
```
When we do this we get access to the `event` object which describes the contents of that event

Remember in react this is actually being done behind the scenes so we still have access to that event object
We can see what kind of data that object has to offer by passing it into our function and logging it in the console like so:
```
const titleChangeHandler = (event) => {
    console.log(event);
}
```

If we do this we get an object that actually has a bunch of different properties and values we can look at and data about the event
The part of this object we are most concerned with is:
```
event={
  target:{
    value: "test"
  }
}
```

Now we know that if we want those values instead of exporting the console.log of the entire event we can simply do the console.log of `event.target.value`
```
const titleChangeHandler = (event) => {
  console.log(event.target.value);
}
```



___
## 54. Working With Multiple States
Now that we have the input value from the user what do we want to do with it?
We want to store it somewhere so that when the form is submitted we can use the value

We will do a similar thing with the other 2 values in the form and combine all three into a single object containing all the needed information for a particular expense

One way of storing this value and making sure that the function would survive should it need to be re-executed is to store these values in state like we did in `<App>`

To do this we will again have to import `useState()` from react within `<ExpenseForm>`
```
import {useState} from 'react';
```

Then we can call state at the beginning of the component function and create a variable (and method to update it) for the title
Don't forget that the argument passed into `useState` should be the initial value and we do not want one so we can use an empty string
Then we will use array destructuring to store the variable and function that `useState` returns
```
[enteredTitle, setEnteredTitle]=useState('')
```

Now instead of outputting the entered value into the console we want to use the new `setEnteredTitle` method to update the `enteredTitle` value
```
  const titleChangeHandler = (event) => {
    setEnteredTitle(event.target.value);
  }
```
When finished `<ExpenseForm>` should look like this:
```
import {useState} from 'react';
import './ExpenseForm.css';

const ExpenseForm = () => {

  const [enteredTitle, setEnteredTitle] = useState('');

  const titleChangeHandler = (event) => {
    setEnteredTitle(event.target.value);
  }
  
  return (
    <form>
      <div className="new-expense__controls">
        <div className="new-expense__control">
          <label>Title</label>
          <input type="text" onChange={titleChangeHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Amount</label>
          <input type="number" min="0.01" step="0.01"/>
        </div>
        <div className="new-expense__control">
          <label>Date</label>
          <input type="date" min="2019-01-01" max="2022-12-31"/>
        </div>
        <button type="submit">Add Expense</button>
      </div>
    </form>
  );
};

export default ExpenseForm;
```
What is different about this time is that we won't be using this value to update anything on the form instead we just want to store it for now and ensure that the value is not lost

Now lets continue updating the component so that the amount and date are also stored in state
Here is how I did it following the same pattern we did before
Added a `useState` for each along with an event handler function to store the value in that is called in the `onChange` property
I also added an `onClick` to the form that will console log what the current state values are just so I can easily check that it is working
```
import {useState} from 'react';
import './ExpenseForm.css';

const ExpenseForm = () => {

  const [enteredTitle, setEnteredTitle] = useState('');
  const [enteredAmount, setEnteredAmount] = useState('');
  const [enteredDate, setEnteredDate] = useState('');

  const titleChangeHandler = (event) => {
    console.log(event.target.value)
    setEnteredTitle(event.target.value);
  }
  const amountChangedHandler = (event) => {
    console.log(event.target.value)
    setEnteredAmount(event.target.value);
  }
  const dateChangedHandler = (event) => {
    console.log(event.target.value)
    setEnteredDate(event.target.value);
  }

  const outputState = () => {
    console.log(`Title=${enteredTitle}\n amount=${enteredAmount}\n date=${enteredDate}`);
  }

  return (
    <form onClick={outputState}>
      <div className="new-expense__controls">
        <div className="new-expense__control">
          <label>Title</label>
          <input type="text" onChange={titleChangeHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Amount</label>
          <input type="number" min="0.01" step="0.01" onChange={amountChangedHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Date</label>
          <input type="date" min="2019-01-01" max="2022-12-31" onChange={dateChangedHandler}/>
        </div>
        <button type="submit">Add Expense</button>
      </div>
    </form>
  );
};

export default ExpenseForm;
```

One thing about doing it this way is that this uses multiple states since we are calling the `useState` method multiple times
if we update any of these states it will be done independently of each other




___
## Using One State Instead (And What's Better)
Notice that in our last lecture we added handers and multiple 'state slices' by using `useState` more than once
This is totally ok however there is another way to do this
Since the three variables within state that we are saving are all so closely related one might argue that they should actually be one item instead of 3
We can do this by passing in an object whenver we call `useState` instead of passing in an empty string (for a single variable)
If we pass in the entire object we will receive a variable that has access to this objects properties as well as a method to change the value of that object (or its properties!)

Lets start by removing our 3 previous state calls (comment them out for notes)
and replacing those with a single state call and pass in an object with the variables we will need
Don't forget to use array destructuring to capture the object variable and update method that is returned
```
const [userInput, setUserInput] =  useState({
    enteredTitle: '',
    enteredAmount: '',
    enteredDate: ''
  });

```

Then instead of calling the old 'set' methods inside of our handlers we need to update them
We simply need to call our new `setUserInput` method instead and pass in an object with an updated value
We will need to make sure our other values aren't lost though when we update our state
To do this we can use the spread operator and copy the values from our `userInput` object that we created before we update the title/amount/date
```
const titleChangeHandler = (event) => {
  console.log(event.target.value);
  setUserInput({
    ...userInput,
    enteredTitle: event.target.value
  })
}
```

Now our `<ExpenseForm>` component should look like:
```
import {useState} from 'react';
import './ExpenseForm.css';

const ExpenseForm = () => {

  // const [enteredTitle, setEnteredTitle] = useState('');
  // const [enteredAmount, setEnteredAmount] = useState('');
  // const [enteredDate, setEnteredDate] = useState('');
const [userInput, setUserInput] =  useState({
    enteredTitle: '',
    enteredAmount: '',
    enteredDate: ''
  });

  const titleChangeHandler = (event) => {
    console.log(event.target.value);
    setUserInput({
      ...userInput,
      enteredTitle: event.target.value
    });
  }
  const amountChangedHandler = (event) => {
    console.log(event.target.value)
    setUserInput({
      ...userInput,
      enteredAmount: event.target.value
    });
  }
  const dateChangedHandler = (event) => {
    console.log(event.target.value)
    setUserInput({
      ...userInput,
      enteredDate: event.target.value
    });
  }

  const outputState = () => {
    console.log(`Title=${enteredTitle}\n amount=${enteredAmount}\n date=${enteredDate}`);
  }

  return (
    <form onClick={outputState}>
      <div className="new-expense__controls">
        <div className="new-expense__control">
          <label>Title</label>
          <input type="text" onChange={titleChangeHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Amount</label>
          <input type="number" min="0.01" step="0.01" onChange={amountChangedHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Date</label>
          <input type="date" min="2019-01-01" max="2022-12-31" onChange={dateChangedHandler}/>
        </div>
        <button type="submit">Add Expense</button>
      </div>
    </form>
  );
};

export default ExpenseForm;
```

However there are still some issues with how we update the state here and it isn't completely correct so we will fix that next




___
## 56. Updating State That Depends On the Previous State
In our last lesson we combined our three state calls into one but learned we were updating state in a not entirely correct way
While it would technically work there are niche cases were it could fail and there are better practices?
Whenever you update state and you depend on the previous state you shoulddo it by calling the `setUserInput` function as we did before but we want to pass in another function (an anonymous arrow function) 
Within that function we are granted access to an argument that we can pass called `prevState`
we can use this within our anonymous arrow function to return the new state
```
setUserInput((prevState) => {
  return {...prevState, enteredTitle: event.target.value};
});
```
So what is different?
When we use `...userInput` to fill in the value of the object
`userInput` here is a snapshot of the previous state 
However updates to state are scheduled and don't necessarily happen instantly
Theoretically if we were to update the state many times quickly we could be relying on an outdated snapshot of our state
Doing it this way ensures that we always use the previous version of state and react will make sure of it

Now our handlers should look like this:
```
const titleChangeHandler = (event) => {
  console.log(event.target.value);
  setUserInput((prevState) => {
    return {...prevState, enteredTitle: event.target.value};
  });
}
```

The teacher reverts his project to a multistate approach but I am going to keep this as one state. If you want to go back that is fine




___
## 57. Handling Form Submission
Now that we are able to retrieve and store input from users we need to 'submit' this data
Normally this might also be going to a webserver or database or maybe even creating a cookie to store this data but for now we will simply log the object to the console

We could do this by adding a click listener to our button but this is not the best way to do it because there is a default behavior built into browsers and forms on webpages called submit
If a button with type submit is pressed inside of a form the overall form element will emit an event we can listen to called `onSubmit`
So instead of an event listener on the button we want it on the form as a whole
```
...
return (
  <form onSubmit={submitHandler}>
  ...
)
```

Then like we do with any other event listener we should create a handler method that should take place when this is executed called `submitHandler`

One thing to note is that whenever a form is submited it is a default browser behavior to send that data to the webserver that is hosting the page if not specified otherwise

We need to specify what we want to happen with this data or we won't be able to see it before it is gone
Luckily javascript allows you to disable this behavior by using the event object
On this object we can call `preventDefault()` method
Then we can simply add a console log that outputs our variables or object as we wanted

You can also just `console.log` the whole object if you want
If you used the multistate approach this is probably a good idea
If you used the single state approach you already have an object but it may not be a bad idea to create a new object to have updated variable names
```
  const submitHandler = (event) => {
    event.preventDefault()
    
    const expenseData = {
      title: userInput.enteredTitle,
      amount: userInput.enteredAmount,
      date: new Date(userInput.enteredDate) //creates a date object which we can do more with
    };

    console.log(expenseData);
  }
```

When finished our component should look like this:
```
import {useState} from 'react';
import './ExpenseForm.css';

const ExpenseForm = () => {

  // ##MultiState
  // const [enteredTitle, setEnteredTitle] = useState('');
  // const [enteredAmount, setEnteredAmount] = useState('');
  // const [enteredDate, setEnteredDate] = useState('');
const [userInput, setUserInput] =  useState({
    enteredTitle: '',
    enteredAmount: '',
    enteredDate: ''
  });

  // ##MultiState (repeat for each handler)
  // const titleChangeHandler = (event) => {
  //   console.log(event.target.value)
  //   setEnteredTitle(event.target.value);
  // }
  const titleChangeHandler = (event) => {
    console.log(event.target.value);
    setUserInput((prevState) => {
      return {...prevState, enteredTitle: event.target.value};
    });
  }
  const amountChangedHandler = (event) => {
    console.log(event.target.value)
    setUserInput((prevState) => {
      return { ...prevState, enteredAmount: event.target.value };
    });
  }
  const dateChangedHandler = (event) => {
    console.log(event.target.value)
    setUserInput((prevState) => {
      return { ...prevState, enteredDate: event.target.value };
    });
  }

  const submitHandler = (event) => {
    event.preventDefault()

    const expenseData = {
      title: userInput.enteredTitle,
      amount: userInput.enteredAmount,
      date: new Date(userInput.enteredDate)
    };
    
    console.log(expenseData);
  }

  return (
    <form onSubmit={submitHandler}>
      <div className="new-expense__controls">
        <div className="new-expense__control">
          <label>Title</label>
          <input type="text" onChange={titleChangeHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Amount</label>
          <input type="number" min="0.01" step="0.01" onChange={amountChangedHandler}/>
        </div>
        <div className="new-expense__control">
          <label>Date</label>
          <input type="date" min="2019-01-01" max="2022-12-31" onChange={dateChangedHandler}/>
        </div>
        <button type="submit">Add Expense</button>
      </div>
    </form>
  );
};

export default ExpenseForm;
```




___
## 58. Adding Two-Way Binding
Now that we can collect the user input we want to clear the inputs after the user submits otherwise they will be filled with old data
By using state we have an advantage called two way binding
This means that we can not only just listen for changes but we can also pass a new value back in to reset or change the input
All we have to do is add the `value` attribute to our input and set it equal to our `userInput.enteredTitle` value (obviously changed for different inputs)
```
<input type="text" value={userInput.enteredTitle} onChange={titleChangeHandler}/>
```
Doing this not only does our state change when we change the input but our input will change when we change the state (hence two way binding)
This may sound like it would create a loop but it doesn't
The advantage is that within our `submitHandler` we can call `setUserInput` and set our title (and other properties) back to an empty string with two way binding
By doing this we are overriding the values in the state AFTER the user submits them which in turn changes what the input displays
```
setUserInput({
  enteredTitle: '',
  enteredAmount: '',
  enteredDate: ''
})
```

After doing this all our inputs should clear after clicking submit (don't forget to add two way binding to other inputs like we did for title)




___
## 59. Child-to-Parent Component Communication (Bottom Up)
Now that we have our data from the user we need to do something with it
If you think about the flow of our app and how the data will flow the form is kind of a dead end in that once we get the data from the form we don't push it further forward into a new and "deeper" component
Instead we want it to go back to the parent components (all the way to `<App>` to be specific) so the data can be used to create a new expense entry 
Previously we have only passed data into child components so how do we go about passing data from a child component to a parent component?
Well in a way we have but just haven't noticed see for example our `<input>` that we are using to collect title
Within that we are using `onChange` to trigger an event but behind the scenes `onChange` is just a prop that we are passing our `titleChangeHandler` function into which is triggered by react in default ways (on a click)
We can actually add our own default event props and add functions as values
This will let us pass values from a parent component to a child component
This works by passing a variable from `<App>` to `<NewExpense>` to `ExpenseForm` then in `ExpenseForm` we update the value of that variable and `<App>` should be able to access that new value

First lets start by passing our `expenseData` from `<ExpenseForm>` to `<NewExpense>`
Within `<NewExpense>` we will have to add a new prop whenever we call `<ExpenseForm>` (called `onSaveExpenseData`)
```
<ExpenseForm onSaveExpenseData={saveExpenseHandler}/>
```
Then we will have to define a function to pass into this prop
The function will accept the `enteredExpenseData` that we save in `ExpenseForm` as an argument
Within that funciton we will simply create a new object (`expenseData`) and use the spread operator(`...`) to fill in the values of `enteredExpenseData which were passed in
Then the last thing we want to do is add an id so we can identify each expense
For now we can simply use Math.random.toString()
Note that this isn't a perfect id system because you could technically get the same id even though it is unlikely but will work for now
```
const NewExpense = () => {
  const saveExpenseHandler = (enteredExpenseData) => {
    const expenseData = {
      ...enteredExpenseData,
      id: Math.random().toString()
    };
  };
  ...
```
Now we just have to call `onSaveExpenseData` within `<ExpenseForm>` when we save and pass in the entered data as an argument
Don't forget that you have to include props in your expense form to access this function
```
const submitHandler = (event) => {
  event.preventDefault()

  const expenseData = {
    title: userInput.enteredTitle,
    amount: userInput.enteredAmount,
    date: new Date(userInput.enteredDate)
  };
  
  props.onSaveExpenseData(expenseData);

  setUserInput({
    enteredTitle: '',
    enteredAmount: '',
    enteredDate: ''
  })
}
```

Now that we have passed the input data from `<ExpenseForm>` to `<NewExpense>` we have to continue to pass it up to `<App>`
We can do this by following the exact same pattern

First in `<App>` we need to make sure that we have a prop and method ready to receive this data
So when we call `<NewExpense>` we need to add our prop and function there
```
<NewExpense onAddExpense={addExpenseHandler} />
```
Then we need a handler to accept the expense object
For now we will just output it as a console instead of adding it to our expenses list
```
const addExpenseHandler = (expense) => {
  console.log('In App.js');
  console.log(expense);
}
```

Then in `<NewExpense>` we need to prepare it to accept props and run the `onAddExpense` function (which is really our `addExpenseHandler`) and pass in the expense data object that we were previously outputting
```
const NewExpense = (props) => {
  const saveExpenseHandler = (enteredExpenseData) => {
    const expenseData = {
      ...enteredExpenseData,
      id: Math.random().toString()
    };
    props.onAddExpense(expenseData);
  };
...
```




___
## 60. Lifting the State Up
Last lecture we learned how to pass data from child components to parent components
This is closely related to another concept which we have used without realizing called 'lifting state up'
What does this mean?
Consider a tree like below (pretty much what we have)
```
       |--<Expenses>
<App>--|
       |--<NewExpense>--<ExpesenseForm>
```

In this tree `<NewExpense>` generates data (or state) since we are fetching user input here
it is common to fetch data from a component but we may not need it in that component
Instead we need to access it in `<Expenses>`
It will be slightly transformed and packed into an object but it is the same data
We want to hand that data over as easily as possible but we can't pass it directly from `<NewExpense>` to `<Expenses>` since they are not directly connected
Instead we have to first pass them through `<App>` since that is where they are connected
We cannot communicate between two sibling (child) components we can only communicate from parent to child and from child to parent
That is why we have to pass data through `<App>` first because it is the closest component that has direct access to both components

We are already lifting the state and doing this by utilizing props and calling functions from a parent component to pass data from a child to that parent such as from `<ExpenseForm>`
Passing data is what is important here and what makes this considered 'lifting state'

