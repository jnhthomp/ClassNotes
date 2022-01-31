# Section 16: Working With Forms and User Input
Section github: https://github.com/academind/react-complete-guide-code/tree/16-working-with-forms
___
## 197. Module Introduction
This section will cover forms and handling user input
This might sound easy but is absolutely vital for a site and can be more difficult than you might think
Especaially if you have to check that data and let the user know if it is invalid or not

We won't learn any new features but will apply features to build good forms

This section will cover:
- What is complex about forms?
- How to handle input values and validation
- Some tools to help simplify forms




___
## 198. Our Starting Setup
You can find the starting project for this section here: https://github.com/academind/react-complete-guide-code/tree/16-working-with-forms/code/01-starting-project

If you install and run this app you will see a simple input box where you can input astring and hit submit

The code itself is very simple with just the most basic form and input being rendered in the `<App>` component

This section will not dive into semantic html and how to use the html for forms OR how to style forms

In this course section we will focus on react and how react deals with forms




___
## 199. What's So Complex About Forms?
Forms may seem simple but they can be quite complex
This is because forms and inputs can assume many different states
One or more inputs could be invalid or all of them could be valid
The state could even be unknown since you might need to validate the users input on a backend server
(ex: checking if an email address already exists when signing up)
These two states apply to not only the entire form, but to all the inputs in the form

When a form or inputs are invalid you may want to output specific error messages on each input and make sure it cannot be submitted or saved
But if the inputs are valid you do want it submitted and saved

Part of the complexity is when do you validate?
You could do it when the form is submitted, when the input loses focus, or on every keystroke or each change to an input

If you validate when the form is submitted you give the user a chance to enter their data before showing a warning
The downside is the feedback might be a little delayed or too late

If you validate when an input loses focus you again give the user a chance to enter a valid value
This can be good for things inputs that are empty or haven't received a value yet
But what if they enter an invalid value and the page is reloaded then they don't refocus?
The error message wouldn't show up in this case since it is being triggered on lose focus and the invalid input is never focused but still has a value

If you validate on every keystroke you provide quick direct feedback on every single keystroke but you are showing errors before the user has a chance to enter valid values
However if you only validate on keystroke for inputs that were previously marked invalid that quick direct feedback may be good




___
## 200. Dealing With Form Submission & Getting User Input Values
Now for our input component we want to get user input and then validate it
We want to be sure to show an error message to the user if necessary and explore some of the methods of validating discussed in the previous lecture

First we need to fetch the value the user input
There are two main ways to do this
1. listen on every keystroke and store the value in a state variable
2. We use a ref to fetch the input when a user is done typing

We will show both for demonstration purposes (in reality we would only use one)
So for this in `<SimpleInput>` we will need to import `useState` and `useRef`
```js
import { useState, useRef } from 'react';
```

Then we will create a new state to hold the name value and create an updating function
We will call this updating function every time the value in `input` changes (`onChange` handler function)
```js
import { useState, useRef } from 'react';

const SimpleInput = (props) => {

  const [enteredName, setEnteredName] = useState('');

  const nameInputChangeHandler = (event) => {
    setEnteredName(event.target.value);
  };
  

  return (
    <form>
      <div className='form-control'>
        <label htmlFor='name'>Your Name</label>
        <input type='text' id='name' onChange={nameInputChangeHandler} />
      </div>
      <div className="form-actions">
        <button>Submit</button>
      </div>
    </form>
  );
};

export default SimpleInput;

```

Then we can create another function called `formSubmissionHandler` which will handle the submit button
Remember that we need to use `event.preventDefault()` because the default action of the browser when a form is submitted is to send an http request to the server serving the website
We don't want this since we don't have a server to handle this request so we need `event.preventDefault()`
If that http request were to be sent it would reload the page which we don't want

Now we just want to console log the name that was entered
Don't forget to link up this function as the `onSubmit` action in the form
```js
import { useState, useRef } from 'react';

const SimpleInput = (props) => {

  const [enteredName, setEnteredName] = useState('');

  const nameInputChangeHandler = (event) => {
    setEnteredName(event.target.value);
  };

  const formSubmissionHandler = (event) => {
    event.preventDefault();

    console.log(enteredName);
  };
  
  return (
    <form onSubmit={formSubmissionHandler}>
      <div className='form-control'>
        <label htmlFor='name'>Your Name</label>
        <input type='text' id='name' onChange={nameInputChangeHandler} />
      </div>
      <div className="form-actions">
        <button>Submit</button>
      </div>
    </form>
  );
};

export default SimpleInput;

```

Now if you run the app and type in a name you should be able to see it in the console when you submit (either enter key or button click)

The alternative approach is to set a ref on the input and read the value from the input as we need it
We can implement this by calling `useRef()` and setting the return equal to a variable name
Then we just use this variable name in our input
Now we are able to access the values in `<input>` whenever we want by accessing `nameInputRef.current.value` wherever we need the value
For example in `formSubmissionHandler` we can save that value and output it in the console
```js
import { useState, useRef } from 'react';

const SimpleInput = (props) => {

  const nameInputRef = useRef();
  const [enteredName, setEnteredName] = useState('');

  const nameInputChangeHandler = (event) => {
    setEnteredName(event.target.value);
  };

  const formSubmissionHandler = (event) => {
    event.preventDefault();
    
    console.log(enteredName);
    
    const enteredValue = nameInputRef.current.value;
    console.log(enteredValue);
  };
  
  return (
    <form onSubmit={formSubmissionHandler}>
      <div className='form-control'>
        <label htmlFor='name'>Your Name</label>
        <input ref={nameInputRef} type='text' id='name' onChange={nameInputChangeHandler} />
      </div>
      <div className="form-actions">
        <button>Submit</button>
      </div>
    </form>
  );
};

export default SimpleInput;

```
Doing this we should see two console logs on form submission, one for each approach we used

In reality we wouldn't need both of these but how do you decide which one to use?
It depends on what you want to do with the entered value
If you are only interested in it when the form is submitted then `useRef` might be better since you don't care about every keystroke
If you want to use the value after every keystroke for instant validation then state is better
Using state might be better if you wanted to reset the input as well
If you wanted you could set `enteredName` to an empty string and then use two way binding with the `value` prop to input
Like this:
```js
import { useState, useRef } from 'react';

const SimpleInput = (props) => {

  const nameInputRef = useRef();
  const [enteredName, setEnteredName] = useState('');

  const nameInputChangeHandler = (event) => {
    setEnteredName(event.target.value);
  };

  const formSubmissionHandler = (event) => {
    event.preventDefault();
    
    console.log(enteredName);
    
    const enteredValue = nameInputRef.current.value;
    console.log(enteredValue);

    setEnteredName('');
  };
  
  return (
    <form onSubmit={formSubmissionHandler}>
      <div className='form-control'>
        <label htmlFor='name'>Your Name</label>
        <input 
          ref={nameInputRef} 
          type='text' 
          id='name' 
          onChange={nameInputChangeHandler} 
          value={enteredName}
        />
      </div>
      <div className="form-actions">
        <button>Submit</button>
      </div>
    </form>
  );
};

export default SimpleInput;

```
You could technically call use ref like this to achieve something similar as `setEnteredName('')` is doing here:
```js
nameInputRef.current.value = '';
```
But if you remember this is not a best practice because we are directly manipulating the dom which we should not do
We should leave dom manipulation to react only




___
## 201. Adding Basic Validation
Now we want to add some validation to our input so we cannot submit the form when it is empty

An important note
In a real application you will want to do more than client side validation in the browser
You will also want to add validation to your server
Browser side validation is great from a user experience perspective but it can all be edited by the user
If someone were motivated enough they could dive into the source code and edit it to skip the validation or allow normally invalid inputs
This could allow them to submit invalid or even harmful inputs
To avoid this server side validation must also be setup
Remember browser validation is not a security feature, it is a convenience/ui feature
Here is some more information on the topic: https://academind.com/tutorials/hide-javascript-code

For now we want to log an error in the console if the user submits an empty input
We can do this with a simple if check by checking the state value in the submit handler
It may be good to call `.trim()` on this to remove whitespace in case a user enters just spaces or tabs they will be removed before checking
Now if we do hit this if statement we want to make sure that we do not continue in our `formSubmissionHanlder` so the form is not submitted so we will just return within the if block
```js
const formSubmissionHandler = (event) => {
  event.preventDefault();

  // Validate input not empty
  if (enteredName.trim() === '' ) {
    return;
  }
```

Now if you save and have an empty input there should not be a console log
But if you enter a valid name it should show up

But we aren't giving the user any feedback to let them know why their input isn't showing up or if it is showing up unless they know to open the console
To handle this we will introduce error feedback