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




___
## 202. Providing Validation Feedback
Now we can add some validation feedback
The best way to do this is to add another bit of state
This state will track whether the name is valid or not and will be a boolean
We want to initialize this to false because it will be blank before a user starts typing which is invalid
If the entered name within the input BECOMES valid we will update this state to true
```js
const [enteredNameIsValid, setEnteredNameIsValid] = useState(false);
```

So in the `formSubmissionHandler` we can make sure that this state is being set to false if we hit the empty input check
But if we make it past that check we can set the value to true since it is not empty and is therefore valid
```js
const formSubmissionHandler = (event) => {
  event.preventDefault();

  // Validate input not empty
  if (enteredName.trim() === '' ) {
    setEnteredNameIsValid(false);
    return;
  }
  
  setEnteredNameIsValid(true);

  console.log(enteredName);
  
  const enteredValue = nameInputRef.current.value;
  console.log(enteredValue);

  // nameInputRef.current.value = '' => AVOID THIS NOT GOOD TO MANIPULATE THE DOM
  setEnteredName('');
};
```

Now that we are able to track this state we can conditionally output a message if this state is false within our form
We will check for the false value of `enteredNameIsValid` and if it is false show some text
```js
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
    {!enteredNameIsValid && <p>Name must not be empty</p>}
    <div className="form-actions">
      <button>Submit</button>
    </div>
  </form>
);
```

Now we get an error but it shows up before we start typing as soon as the page loads since we are initializing `enteredNameIsValid` to false
So we can actually initialize that to true and then the input will be validated when a the form is submitted
```js
const [enteredNameIsValid, setEnteredNameIsValid] = useState(true);
```

Now we don't see the error message on load but if we click submit it shows up

There is more validation we can add via css classes such as `.invalid`
We want to add this class
We can hold our classes in a variable (conditionally assigned to the variable) and pass that variable in as our classes
In the case that the input is valid we want to pass in just `'form-control'` but if it is invalid we want to pass in `'form-control invalid'`
We can do this with a ternary check
```js
const nameInputClasses = enteredNameIsValid ? 'form-control' : 'form-control invalid';
```
Then just pass this variable in instead of hard coding the class in our form
```js
return (
  <form onSubmit={formSubmissionHandler}>
    <div className={nameInputClasses}>
      <label htmlFor='name'>Your Name</label>
      <input 
        ref={nameInputRef} 
        type='text' 
        id='name' 
        onChange={nameInputChangeHandler} 
        value={enteredName}
      />
    </div>
    {!enteredNameIsValid && <p className='error-text'>Name must not be empty</p>}
    <div className="form-actions">
      <button>Submit</button>
    </div>
  </form>
);
```

Now when our page loads there is no error message but if you put an invalid name in you will see a paragraph that is styled AND the input will receive new styling
Then if you enter a valid name and submit it that errored styling goes away

This is some decent validation but there are some downsides




___
## 203. Handling the "was touched" State
One issue with our current code is that when we load the page we are setting `enteredNameIsValid` to true but it isn't really
We are only setting it to true so that the styling isn't changed on page load which is misleading and not a great practice
This could cause issues if someone added a feature that depended on that being true only when the input is true since that is what it implies

There is a better way to do this
We can initialize it to false since the initial value is false
Then we can create a new state called `enterdNameTouched`
This will be a boolean that will check if someone has selected the input field
Then we will only mark the field as invalid and show the message if the input is invalid AND the input field was touched 
This will allow us to set the validity state of our input in a way that is accurate and makes sense without showing an error before the user has had a chance to enter data
```js
const [enteredNameTouched, setEnteredNameTouched] = useState(false);
```

Now we will create a boolean called `nameInputIsInvalid` that is only true in the case that both `enteredNameIsValid` is fale AND `enteredNameTouched` is true
```js
const nameInputIsInvalid = !enteredNameIsValid && enteredNameTouched;
```
Instead of checking for `enteredNameIsValid` to show the paragraph and assign classes we can check for this value instead
```js
const nameInputClasses = !nameInputIsInvalid ? 'form-control' : 'form-control invalid';
```
```js
{nameInputIsInvalid && <p className='error-text'>Name must not be empty</p>}
``` 

Now we need to change the `enteredNameTouched` state
We can say that if the form is submitted that inputs are treated as touched (even if the user didn't select them) because the user is confirming that input

Before checking the validity we should set `enteredNameTouched` to true
```js
const formSubmissionHandler = (event) => {
  event.preventDefault();

  setEnteredNameTouched(true);
  ...
```
Now our code works as expected and is readable




___
## 204. React To Lost Focus
So far we have only validated when the form is submitted (or the user attempts to submit it)
This isn't bad and may even be what you want sometimes

But sometimes it is better to get more reactive for handling so users don't have to attempt a submission before finding out that what they entered was invalid

Currently we have three different states associated with the input that are used to validate or trigger error messages
1. `enteredName` to hold the value
2. `enteredNameIsValid` to say whether `enteredName` is a valid input
3. `enteredNameTouched` to say whether the input field had been submitted or not

Currently we have to submit the form as a whole in order for `enteredNameTouched` to trigger and switch states
So if we were to click inside the input, type something, delete it, and then click out we wouldn't see an error until after attempting to submit

We can fix this by changing the value of `enteredNameTouched` when the input box loses focus
Luckily there is an action we can use as a trigger called `onBlur`
We will assign a function to `onBlur` that will change the value of `enteredNameTouched` to true when triggered since that would mean a user had selected the input and then clicked away
Then the validation will run since `enteredNameTouched` will have been switched to true
```jsx
<input 
  ref={nameInputRef} 
  type='text' 
  id='name' 
  onChange={nameInputChangeHandler} 
  onBlur={nameInputBlurHandler} 
  value={enteredName}
/>
```

Then we can write the method to change the state value and trigger the validation that will be used to check the value/change styles if needed
```js
const nameInputBlur = (event) => { 
  setEnteredNameTouched(true);
  // Validate input not empty
  if (enteredName.trim() === '') {
    setEnteredNameIsValid(false);
    return;
  }
}
```
Note that there is some code duplication going on here, we will clean that up shortly

Now if we click in the input and then click out this handler method will be activated, it will say the input has been touched, then it will validate the input and if invalid show a message/apply styles




___
## 205. Refactoring & Deriving States
Now we have validation that runs when a user loses focus on the input
However one last bit of validation we could use to make this even more responsive is to help clean up the error messages and styling
Whenever the error is showing, if a user selects the input and begins typing their input now becomes valid since the length is greater than 0 and we have a very basic validation
That means we can check their keystroke and use that to validate that the input is NOW valid and we can remove the error

The easiest way to do this would be to just add the validation if statement to our `nameInputChangeHandler` which runs to update the current value of `setEnteredName` as the user types

But instead of checking for if the input IS an empty string we want to check that it IS NOT an empty string and if so we want to set `enteredNameIsValid` to true
The only difference is we want to use `event.target.value` to check 
This is because `setEnteredName` is an async function and we may end up checking an old version of state
This would mean the user would have to type multiple characters before the validation works
```js
const nameInputChangeHandler = (event) => {
  setEnteredName(event.target.value);

  // Validate input not empty
  if (event.target.value.trim() !== '') {
    setEnteredNameIsValid(true);
  }
};
```

Now we are setting this to true and the error will disappear as soon as the user enters a valid input

This is probably the best user experience we can provide because it gives the user a chance to enter data before showing an error, will show an error if a user has an invalid input and blurs or tries to submit and then will clear the error as soon as it is fixed

Our code is pretty ugly though since we have duplicated the validation multiple times and are dealing with multiple state instances
We have quite a bit of code for a single input and we don't want to multiply this if we had more fields to collect data from

The first thing we can get rid of is the input ref that we were using to demonstrate another way to collect input from the user but never really used
```js
// remove import 
import { useState, useRef } from 'react';
// remove assignment
const nameInputRef = useRef();
// remove fetching value
const enteredValue = nameInputRef.current.value;
console.log(enteredValue);
// remove from input
<input 
  ref={nameInputRef} //just this line
  type='text' 
  id='name' 
  onChange={nameInputChangeHandler} 
  onBlur={nameInputBlurHandler}
  value={enteredName}
/>
```

That wasn't the main thing though
The main thing we can clean up is the validation logic 
We have it all over the place and duplicate our code

All we need to check is: 
1. If the input is valid 
2. If the input was touched

If it was touched and is invalid we want to show an error, in all other instances we don't want to show an error

We actually don't need an `enteredNameIsValid` state
That is because it is always derived from checking the two other state values
We can just check the two other state values and set it manually each time the component reloads
This constant will always have the latest value because if one of those two values change it will trigger a rerender and therefore trigger this check/assignment again
So now `enteredNameIsValid` will be true if `enteredName` trimmed is not an empty string
```js
const enteredNameIsValid = (enteredName.trim() !== '')
```

Now we can get rid of any if statements that performed this same check and set `enteredNameIsValid`
Instead we will rely on this new value in combination with `nameInputIsInvalid` to determine whether to show the error or not
```js
const enteredNameIsValid = (enteredName.trim() !== '')
const nameInputIsInvalid = !enteredNameIsValid && enteredNameTouched;
```
The above will use the current state value of `enteredName` to determine if the input is valid
If it is not valid then `nameInputIsValid` will perform a check to see if `enteredNameTouched` is true
If so then `nameInputIsInvalid` will also be true in which case we will want to show an error
But whenever `enteredName` is given a value `enteredNameIsValid` becomes true which would make `nameInputIsInvalid` false which we want to trigger hiding the error

We still are able to check the same values and data and validity except now we have one less piece of state to manage

In the `formSubmissionHandler` we still want to check if the input is invalid but now that we have a variable we don't need to add the validation logic in the if statement, we can just check the `enteredNameIsValid` variable for false and if so execute a return to cancel the form submission
```js
const formSubmissionHandler = (event) => {
  event.preventDefault();
  setEnteredNameTouched(true);
  console.log(enteredName);

  if(!enteredNameIsValid){
    return;
  }
  // nameInputRef.current.value = '' => AVOID THIS NOT GOOD TO MANIPULATE THE DOM
  setEnteredName('');
};
```

Now our application will mostly work but if we submit a valid name we will get an error after the field is cleared
This actually makes since because in our submission we call `setEnteredName('')` which is specifically used to trigger `enteredNameIsValid` to show an error
We can fix this by also resetting `enteredNameTouched` when we submit
```js
const formSubmissionHandler = (event) => {
  event.preventDefault();
  setEnteredNameTouched(true);
  console.log(enteredName);

  if(!enteredNameIsValid){
    return;
  }
  // nameInputRef.current.value = '' => AVOID THIS NOT GOOD TO MANIPULATE THE DOM
  setEnteredNameTouched(false);
  setEnteredName('');
};
```




___
## 206. Managing the Overall Form Validity
Now we have some good validation and reactive error messages
But we only have one input and many times we would have more than one input
In that case we would need to check if the overall form is also valid
If the form had multiple inputs that may not be the case
If there are 4 inputs and 3 are valid and 1 is not then the entire form is invalid
We should take this into account in our logic

One way to do this is to add a new state to hold the form validity
```js
const [formIsValid, setFormIsValid] = useState(false);
```

We will want to update this validity whenever one of the form inputs changes
To do this we can use `useEffect` 
It will hold the form input validity checks (such as `enteredNameIsValid`) and whenever one of them changes the `useEffect` function will run
Inside our `useEffect` function we will check our inputs (all listed as dependencies) and if they are all valid then `formIsValid` is true
Since we only have one input there is only one validity check to check but if there were moreinputs we would have multiple different checks and more dependencies
```js
useEffect(() => {
  if(enteredNameIsValid){
    setFormIsValid(true);
  } else {
    setFormIsValid(false);
  }
}, [enteredNameIsValid]);
```

Now we can use this form validity to disable the button in our form if `formIsValid === false`
```js
<div className="form-actions">
  <button disabled={!formIsValid}>Submit</button>
</div>
```

Now the button should be disabled but it might be hard to tell
We can add a little css to make it more obvious
```css
button:disabled,
button:disabled:active,
button:disabled:hover {
  background: #ccc;
  color: #292929;
  border-color: #ccc;
  cursor: not-allowed;
}
```

However we don't even really need to use `useEffect` for this since there are no sideeffects to handle (if there were sideeffects due to form validity then we would need it)
So we can actually remove `useEffect` and instead of using state for `formIsValid` we can just use a regular variable and if statement
```js
let formIsValid = false;
if(enteredNameIsValid){
  formIsValid = true;
}
```