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


