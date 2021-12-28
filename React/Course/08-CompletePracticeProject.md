# Section 8: Time to Practice: A Complete Practice Project
Section github: https://github.com/academind/react-complete-guide-code/tree/08-practice-project
___
## 89. Module Introduction
It is time to practice what we have learned
We have learned quite a bit about the core features that make up react
We now have enough knowledge to start buildling our own simple react projects
To practice these concepts we will use a dedicated project
It is relatively simple but will require you to use all of the core information we have learned

We are going to build a relatively simple (but not too simple) application
It is an application where you can add fictional users 
They will have a username and an age
These users will be added to a list and displayed
When attempting to enter an invalid user there are multiple forms of validation and a modal that gives information on why the validation failed
If you input a successful user then the form input fields are reset

While you can skip this module to move onto new concepts it is a good idea to do this module for the practice
The teacher also encourages us to try this on our own and see if we are successful
If you do then don't worry about the styling so much 
The main thing to worry about is that the functionality is there, components are working, and the logic behind the scenes is working

Short:
- Ability to add users via form
  - user has username
  - user has age
  - Form input is reset on successful submission
- Users are displayed as a list underneath add user form
- If attempting to add an invalid user there is a pop up
  - warns user username and age shouldn't be empty
  - has "okay" button to dismiss
  - Can also dismiss by clicking on the backdrop
  - entering a negative age gives a different error


## My Approach:
I am not going to go super deep into details on exactly how I did this as I will be uploading to github and the full version will be there
Also I will be working through the teacher solution as well and that should provide plenty of explanation

First we need to create a new react app before we do anything
MAKE SURE YOU ARE IN THE DIRECTORY YOU WANT YOUR PROJECT ROOT FOLDER TO BE
```

user/dev/reactProjects: $create-react-app practice-user-list
```
It is a good idea to make an initial commit now just in case we need to roll back our project to the beginning

Then we can start thinking about how to approach this
The obvious thing we will need is a state that will hold a list of users and maybe some dummy data to start
So within `<App>` (but outside of the component function) create a dummy array to hold some user objects 
Each user object should have a name, age, and id
```
const INITIAL_USER_VALUES = [
  { userName: 'LukeSkywalker', userAge: 19, userID: 'Red_Five'},
  { userName: 'HanSolo', userAge: 35, userID: 'Echo_Seven' },
  { userName: 'AnakinSkywalker', userAge: 19, userID: 'Black_Leader' },
  { userName: 'Obi-WanKenobi', userAge: 19, userID: 'Red_Leader' }
]
```

Now that we have some data we need a way to display that data
To do this we will create 2 components. This first will be a card component that simply accepts children and gives a white background with a rounded border
The second will be used to display each individual user object
First we will work on the card
crate a new component folder called ui and a jsx and css module for a `<Card>` component
create: src/Components/UI/Card/Card.jsx
create: src/Components/UI/Card/Card.module.css

Within Card we will just create a div that holds card styling
This styling will center the card on the page, add a border color, and add a background color
Then there will be another class that aligns text for children elements so we can put a heading
`<Card>` should look like
```
import React from 'react'
import styles from './Card.module.css';
const Card = props => {
  return (
    <div className={styles.card}>
      <div className={styles.children}>
        {props.children}
      </div>
    </div>
  );
};

export default Card;
```
Card.module.css
```
.card{
  /* Centering */
  margin: auto;
  padding: 10px;
  width: 50%;
  /* Coloring */
  border: 2px solid black;
  border-radius: 10px;

  background-color: white;
}

.children{
  text-align: center;
}
```
Then call `<Card>` within `<App>` and pass an h1 tag to test the title centering
```
return (
  <div>
    <h1>Practice-User-List</h1>
    <Card>
      <h1>Users</h1>
    </Card>
  </div>
);
```

Now that we are displaying a card we need a component to display individual user objects
It will need to accept an object as a prop and then display the data from that object
We can make one simply by creating a new component, allowing it access to props then calling those props within the return
```
import styles from './UserItem.module.css';

const UserItem = props => {
  return(
    <div className={styles.item}>
      {`${props.user.userName} (${props.user.userAge} years old)`}
    </div>
  );
}

export default UserItem
```
Styling simply adds a border and centers the div
```
.item {
  border: 1px solid grey;
  margin: auto;
  padding: 10px;
  width: 50%;

}
```

To test simply call this within `<App>` as a child of the card component and pass in an single object
```
return (
  <div>
    <h1 style={{textAlign: 'center'}}>Practice-User-List</h1>
    <Card>
      <h1>Users</h1>
      <UserItem user={userList[0]}/>
    </Card>
  </div>
);
```

Now we need to make this more dynamic by cycling through our state `userList` array, calling `<UserItem>` for each object, and displaying each instance by passing in a user object
We can accomplish this with `.map()` and save the array of jsx components generated to a variable that is displayed
Remember to pass in the `userID` as a key so react can identify each instance
```
const generatedUserItems = userList.map(el => {
  return (
    <UserItem user={el} key={el.userID} />
  )
});
```
Then we just display this variable as a child within the `<Card>` component
```
return (
  <div>
    <h1 style={{textAlign: 'center'}}>Practice-User-List</h1>
    <Card>
      <h1>Users</h1>
      {generatedUserItems}
    </Card>
  </div>
);
```

Now we are able to display the full list of our user objects it might be a good idea to make a commit

Next we need to be able to add more user objects
We will create a form that will have two inputs and a button to receive a username and age
This will be placed as a child in another `<Card>` component call to keep things tidy
This form will follow the following pattern for jsx
```
<form>
  <div to hold all form child elements>
    <div for name section>
      <div for name label />
      <div for name input />
    </div>
    <div for age section>
      <div for age label />
      <div for age input />
    </div>
    <button to submit />
  </div>
</form>
```
I will also create a button component that will go to the UI folder so I can place the same button in multiple places

Once we have the inputs and button setup
it should look like this:
Form:
```
import styles from './NewUserItem.module.css';
import Button from '../UI/Button/Button.jsx';

const NewUserItem = () => {

  return (
    <form onSubmit={formSubmitHandler}>
      <div className={styles.newUserItem__controls}>
        <div className={styles.newUserItem__control}>
          <label>Name:</label>
          <input type="text"/>
        </div>
        <div className={styles.newUserItem__control}>
          <label>Age:</label>
          <input type="number" />
        </div>
      </div>
      <Button type='submit'>Add User</Button>
    </form>
  );
};

export default NewUserItem;
```
Form css:
```
label {
  padding-right: 2px;
}
.newUserItem__controls {
  background-color: inherit;
  display: block;
}
.newUserItem__control {
  margin: auto;
  padding: 5px;
  display: inline;
}

```
Button:
```
import styles from './Button.module.css'

const Button = props => {
  return (
    <button type={props.type} className={styles.button} onClick={props.onClick}>
      {props.children}
    </button>
  )
}

export default Button;
```
Button css:
```
.button {
  text-align: center;
  background-color: purple;
  color: white;
}
```

Now that we have a skeleton for a form we will need to add the action
The first thing we will want to do is collect the input and add it to state with `onChange` methods
We will need to do this for both the name input and the age input

Of course in order to add to state we will also need a state to add it to so don't forget to initialize a new state within `<NewUserItem>`
```
const [userInput, setUserInput] = useState({
  enteredName: '',
  enteredAge: ''
})
```

Then just create handlers for name and age and use them as `onChange` methods for the appropriate inputs
I used `parseInt()` when passing in age so that the value would be saved as a number instead of a string
```
const nameChangeHandler = (event) => {
  setUserInput((prevState) => {
    return {...prevState, enteredName: event.target.value}
  });
}
```
```
const ageChangeHandler = (event) => {
  setUserInput((prevState) => {
    return {...prevState, enteredAge: parseInt(event.target.value)}
  })
}
```
Now we can add two way binding to our input fields by adding a value to the inputs and setting them equal to the corresponding state values
```
return (
  <form onSubmit={formSubmitHandler}>
    <div className={styles.newUserItem__controls}>
      <div className={styles.newUserItem__control}>
        <label>Name:</label>
        <input 
          type="text" 
          onChange={nameChangeHandler} 
          value={userInput.enteredName} 
        />
      </div>
      <div className={styles.newUserItem__control}>
        <label>Age:</label>
        <input 
          type="number" 
          onChange={ageChangeHandler} 
          value={userInput.enteredAge}
        />
      </div>
    </div>
    <Button type='submit'>Add User</Button>
  </form>
);
```

Now we just need to handle the submission of this data to the `<App>` state
To do this we will need a method within `<App>` that will update state and accept an object to do so
Then we will pass this method down from `<App>` to our `<NewUserItem>` component to make it available and call it from within there
Within `<App>` just accept the user object and use it to update state
Be sure to use the functional form so we have access to `prevState`
```
const addUserHandler = (user) => {
  console.log(user);
  setUserList((prevState) => {
    return ([user, ...prevState])
  })
}
```
Now we just pass this as a prop to our `<NewUserItem>` component
Within `<NewUserItem>` we can make a `formSubmitHandler()` to process the object we want to send to `<App>` so it is getting the correct user object
First we will we want to prevent the default submission so be sure to do that first
Then we will bundle the data from `userInput` to a new object with the correct field names as well as add a randomly generated id
Finally pass this object into the method in props that was passed down from `<App>` to update `<App>`
```
const formSubmitHandler = (event) => {
  event.preventDefault();
  const userData = {
    userName: userInput.enteredName,
    userAge: +userInput.enteredAge,
    userID: Math.random().toString()
  }
  props.addUser(userData);
}
```

The last touch before we start doing validation is clearing the form on submission
To do that we just can update state from within our `formSubmitHandler` and since we are using two way binding already it should update in the input fields
```
const formSubmitHandler = (event) => {
  event.preventDefault();
  const userData = {
    userName: userInput.enteredName,
    userAge: +userInput.enteredAge,
    userID: Math.random().toString()
  }
  props.addUser(userData);
  setUserInput({
    enteredName: '',
    enteredAge: ''
  });
}
```

At this point we have the base of the application completed
We can show a list of users as well as add more users to that list
Now would be a good point to make a new commit
Now we can move onto the validation and modal section of the application

First we need to run validation
This will be run within the `formSubmitHandler()`
Within there we will call a method that takes the current value of state (both user inputs)
Then it will perform a few checks
- Name value is not empty or spaces
- age is not negative

There needs to be a different response if either or both of these checks fail 

The first check will be if name is empty and age is negative
If this fails the method will return: `"Please enter a valid name and age"`

The second check will see if the name is empty
If this fails the method will return `"Please enter a valid name"`

The third check will see if the age is negative or empty
If this fails the method will return `"Please enter a valid age"`

If all three of these pass the method will return a simple boolean called true

Then within form submit handler we will check the value that was returned
If the value was true (the boolean) we will continue with the form submission as we do currently

If the value is anyting else (any of the above strings) that string will be passed to a new component that we will build and not be submitted to state
For now we will just `console.log` the message

First create the validation method and `console.log` the result
```
const validateUserInput = (userData) => {
  console.log(userData);
  if(userData.userName.trim()==='' && userData.userAge < 0){
    return "Please enter a valid name and age"
  }
  if(userData.userName.trim()===''){
    return "Please enter a valid name"
  }
  if(userData.userAge < 0){
    return "Please enter a valid age"
  }
  else{
    return true
  }
}
```
Now that we are able to collect a validation response we can do something with this response
First we will handle what to do if the response is true
In this case we want to forward the data to the `addUser` method passed from `<App>`
```
const formSubmitHandler = (event) => {
  event.preventDefault();
  const userData = {
    userName: userInput.enteredName,
    userAge: +userInput.enteredAge,
    userID: Math.random().toString()
  }
  let isValid=validateUserInput(userData);
  if(isValid === true){
    props.addUser(userData);
    setUserInput({
      enteredName: '',
      enteredAge: ''
    });
  }
}
```
Above I set the response for our validation to a variable then check if the variable value was true
Next I will set a condition that if it is not true (in this case it will be a string with a different value)
If so I will call a modal pop-up method (which will be passed from `<App>`) and pass in the string I reveived
This string will be the message that gets displayed within the modal

First we will just work on having the modal show at all
To do this we will create a new component called `<ErrorModal>`
This will have two main pieces to it
The first will be a div to be used backdrop which is simply dark with an opacity and has an `onClick` method available to it
The second will be the div that we can actually see and will serve as the modal
We hadn't done anything like this before and since I'm not great with css I did have to take a look at the teachers css notes although I was pretty sure we would be using z-index.
When complete the modal should look like this:
```
import Button from '../Button/Button';
import styles from './ErrorModal.module.css';

const ErrorModal = (props) => {
  return (
    <div className={styles.backdrop}>
      <div className={styles.modalBox}>
        <div className={styles.heading}>
          <h2>Invalid Input</h2>
        </div>
        <div className={styles.content}>
          {props.errorMessage}
        </div>
        <div className={styles.actions}>
          <Button>Okay</Button>
        </div>
      </div>
    </div>
  )
}

export default ErrorModal
```
Css used should look like this:
```
.backdrop {
  position: fixed;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.75);
  z-index: 10;
  width: 100%;
  height:100vh;
}

.heading {
  background-color: purple;
  height: 20%;
  color: white;
  border-top-left-radius: inherit;
  border-top-right-radius: inherit;
  padding: 1rem;
  margin-bottom: 10%;
}
.heading h2 {
  height: 100%;
  line-height: 100%;
  padding-left: 5%;
}
.modalBox {
  width: 50%;
  height: 50%;
  margin: auto;
  margin-top: 10%;
  opacity: 100;
  background-color: white;
  border-radius: 15px;
}

.content {
  margin-left: 20px;
  height: 20%;
}

.actions {
  height: 15%;
  display: flex;
  justify-content: flex-end;
}
.actions Button{
  width: 15%;
  height: 100%;
  margin-right: 10px;
  margin-left: auto;
}
```

Now that the modal exists and can accept a string of text to display we just have to work on making it display
We can simply add a state boolean that if true will show the modal and if false will not show it
To do this we will set a variable that will hold either a null value or the `<ErrorModal>` to be displayed
create state variable:
```
const [showModal, setShowModal] = useState(true) //will be false when complete
```
Variable for modal content and set based on state
```
let modalContent = null;
if(showModal){
  modalContent = (<ErrorModal errorMessage='Can I type here?' />)
}

if(!showModal){
  modalContent = null;
}
```
Call modal content within return statement
```
return (
  <div>
    {modalContent}
    <h1 style={{textAlign: 'center'}}>Practice-User-List</h1>
    <Card>
      <h1>New User</h1>
      <NewUserItem addUser={addUserHandler}/>
    </Card>
    <Card>
      <h1>Users</h1>
      {generatedUserItems}
    </Card>
  </div>
);
```
Now the last thing we have to do is trigger this modal to show whenever `<NewUserItem>` fails validation
We want to do this by looking at what the validation method returns 
If it returns anything other than `true` (not truthy or not null must be a value of true) then we want to trigger a method in `<App>` that will set `showModal` to true
If it is `true` then we want to trigger a method that will set `showModal` to false
This was a little tricky and I had to save the modal message to state 
Otherwise it would get overritten to its original value when state triggered a reload

```
const showModalHandler = (arg) => {
  if (arg === true){
    setShowModal(false)
  }
  else{
    setShowModal(true)
    setmodalMessage(arg)
  } 
}
```
Then I just called this method within the form submit handler and passed in the validation check
```
  const formSubmitHandler = (event) => {
    event.preventDefault();
    const userData = {
      userName: userInput.enteredName,
      userAge: +userInput.enteredAge,
      userID: Math.random().toString()
    }
    let isValid=validateUserInput(userData);
    if(isValid === true){
      props.addUser(userData);
      setUserInput({
        enteredName: '',
        enteredAge: ''
      });
    }
    props.modalHandler(isValid);
  }
```

Now the last thing to do is make the modal dismissable
To do that we simply need a method called `hideModalHandler` that we will pass into the modal itself
This will be used as an onClick event for the okay button and also on the backdrop
All it needs to do is set `showModal` to false

When complete the project should look like this:

App.jsx
```
import {useState} from 'react';
import './App.css';
import Card from './Components/UI/Card/Card.jsx';
import NewUserItem from './Components/NewUserItem/NewUserItem.jsx';
import UserItem from './Components/UserItem/UserItem.jsx';
import ErrorModal from './Components/UI/ErrorModal/ErrorModal';

const INITIAL_USER_VALUES = [
  { userName: 'LukeSkywalker', userAge: 19, userID: 'Red_Five'},
  { userName: 'HanSolo', userAge: 35, userID: 'Echo_Seven' },
  { userName: 'AnakinSkywalker', userAge: 19, userID: 'Black_Leader' },
  { userName: 'Obi-WanKenobi', userAge: 19, userID: 'Red_Leader' }
]

function App() {
  const [userList, setUserList] = useState(INITIAL_USER_VALUES);
  const [showModal, setShowModal] = useState(false)
  const [modalMessage, setmodalMessage] = useState(null)

  const generatedUserItems = userList.map(el => {
    return (
      <UserItem user={el} key={el.userID} />
    )
  });

  const addUserHandler = (user) => {
    console.log(typeof(user.userAge));
    setUserList((prevState) => {
      return ([user, ...prevState])
    })
  }

  const showModalHandler = (arg) => {
    if (arg === true){
      setShowModal(false)
    }
    else{
      setShowModal(true)
      setmodalMessage(arg)
    } 
  }

  const hideModalHandler = () => {
    setShowModal(false);
  }

  let modalContent = null;

  if(showModal){
    console.log(modalMessage)
    modalContent = (<ErrorModal errorMessage={modalMessage} hideModal={hideModalHandler}/>)
  }

  if(!showModal){
    modalContent = null;
  }

  return (
    <div>
      {modalContent}
      <h1 style={{textAlign: 'center'}}>Practice-User-List</h1>
      <Card>
        <h1>New User</h1>
        <NewUserItem addUser={addUserHandler} modalHandler={showModalHandler} />
      </Card>
      <Card>
        <h1>Users</h1>
        {generatedUserItems}
      </Card>
    </div>
  );
}

export default App;
```
App.css
```
.App {
  text-align: center;
}

.App-logo {
  height: 40vmin;
  pointer-events: none;
}

@media (prefers-reduced-motion: no-preference) {
  .App-logo {
    animation: App-logo-spin infinite 20s linear;
  }
}

.App-header {
  background-color: #282c34;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: calc(10px + 2vmin);
  color: white;
}

.App-link {
  color: #61dafb;
}

@keyframes App-logo-spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

```
Card.jsx
```
import React from 'react'
import styles from './Card.module.css';
const Card = props => {
  return (
    <div className={styles.card}>
      <div className={styles.children}>
        {props.children}
      </div>
    </div>
  );
};

export default Card;
```
Card.module.css
```
.card{
  /* Centering */
  margin: auto;
  padding: 10px;
  width: 50%;
  /* Coloring */
  border: 2px solid black;
  border-radius: 10px;

  background-color: white;
}

.children{
  text-align: center;
}
```
NewUserItem.jsx
```
import {useState} from 'react';
import styles from './NewUserItem.module.css';
import Button from '../UI/Button/Button.jsx';

const NewUserItem = (props) => {
  
  const [userInput, setUserInput] = useState({
    enteredName: '',
    enteredAge: ''
  })

  const validateUserInput = (userData) => {
    if(userData.userName.trim()==='' && userData.userAge < 1){
      return "Please enter a valid name and age"
    }
    if(userData.userName.trim()===''){
      return "Please enter a valid name"
    }
    if(userData.userAge < 1){
      return "Please enter a valid age"
    }
    else{
      return true
    }
  }

  const formSubmitHandler = (event) => {
    event.preventDefault();
    const userData = {
      userName: userInput.enteredName,
      userAge: +userInput.enteredAge,
      userID: Math.random().toString()
    }
    let isValid=validateUserInput(userData);
    if(isValid === true){
      props.addUser(userData);
      setUserInput({
        enteredName: '',
        enteredAge: ''
      });
    }
    props.modalHandler(isValid);
  }

  const nameChangeHandler = (event) => {
    setUserInput((prevState) => {
      return {...prevState, enteredName: event.target.value}
    });
  }

  const ageChangeHandler = (event) => {
    setUserInput((prevState) => {
      return {...prevState, enteredAge: parseInt(event.target.value)}
    })
  }

  return (
    <form onSubmit={formSubmitHandler}>
      <div className={styles.newUserItem__controls}>
        <div className={styles.newUserItem__control}>
          <label>Name:</label>
          <input 
            type="text" 
            onChange={nameChangeHandler} 
            value={userInput.enteredName} 
          />
        </div>
        <div className={styles.newUserItem__control}>
          <label>Age:</label>
          <input 
            type="number" 
            onChange={ageChangeHandler} 
            value={userInput.enteredAge}
          />
        </div>
      </div>
      <Button type='submit'>Add User</Button>
    </form>
  );
};

export default NewUserItem;
```
NewUserItem.module.css
```
label {
  padding-right: 2px;
}
.newUserItem__controls {
  background-color: inherit;
  display: block;
}
.newUserItem__control {
  margin: auto;
  padding: 5px;
  display: inline;
}

```
Button.jsx
```
import styles from './Button.module.css'

const Button = props => {
  return (
    <button type={props.type} className={styles.button} onClick={props.onClick}>
      {props.children}
    </button>
  )
}

export default Button;
```
Button.module.css
```
.button {
  text-align: center;
  background-color: purple;
  color: white;
}
```
UserItem.jsx
```
import styles from './UserItem.module.css';

const UserItem = props => {
  return(
    <div className={styles.item}>
      {`${props.user.userName} (${props.user.userAge} years old)`}
    </div>
  );
}

export default UserItem
```
UserItem.module.css
```.item {
  border: 1px solid grey;
  margin: auto;
  padding: 10px;
  width: 50%;

}
```
ErrorModal.jsx
```
import Button from '../Button/Button';
import styles from './ErrorModal.module.css';

const ErrorModal = (props) => {
  return (
    <div className={styles.backdrop} onClick={props.hideModal}>
      <div className={styles.modalBox}>
        <div className={styles.heading}>
          <h2>Invalid Input</h2>
        </div>
        <div className={styles.content}>
          {props.errorMessage}
        </div>
        <div className={styles.actions}>
          <Button onClick={props.hideModal}>Okay</Button>
        </div>
      </div>
    </div>
  )
}

export default ErrorModal

```
ErrorModal.module.css
```
.backdrop {
  position: fixed;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.75);
  z-index: 10;
  width: 100%;
  height:100vh;
}

.heading {
  background-color: purple;
  height: 20%;
  color: white;
  border-top-left-radius: inherit;
  border-top-right-radius: inherit;
  padding: 1rem;
  margin-bottom: 10%;
}
.heading h2 {
  height: 100%;
  line-height: 100%;
  padding-left: 5%;
}
.modalBox {
  width: 50%;
  height: 50%;
  margin: auto;
  margin-top: 10%;
  opacity: 100;
  background-color: white;
  border-radius: 15px;
}

.content {
  margin-left: 20px;
  height: 20%;
}

.actions {
  height: 15%;
  display: flex;
  justify-content: flex-end;
}
.actions Button{
  width: 15%;
  height: 100%;
  margin-right: 10px;
  margin-left: auto;
}
```

The github link for my version of this project can be found at: https://github.com/jnhthomp/practice-user-list




___
## 90. Adding A "User" Component
Above includes my approach and how to complete the project
It does meet all the goals and objectives but may not be the best way to do it
It might be a way that makes sense but I like to see multiple approaches so for the rest of the section we will cover how the teacher approached this project

He provides a starting code that can be found at: https://github.com/academind/react-complete-guide-code/tree/08-practice-project/code/01-starting-project

The easiest way to get started in this project is to:
1. clone the entire academind/react-complete-guide-code (all branches)
2. checkout the branch for section 8
3. Move into the code folder
4. Move into 01-starting-project folder
5. Copy paste all files in this folder to a new directory where you want the project to be
6. Run `$npm install` to install all dependencies
7. Run `$git init` to create a github directory with these files
(make sure you ahve a .gitignore file with `/node_modules` listed before making an initial commit)

Now that we have the app on our local machine we can start working on this section and building our application
Run `$npm start` to see changes to our application as we code

Within the application we will need a couple different components
- one to enter name and age
- one to handle the error modal
- one as a button to submit and confirm the error
- list of users that have been created

We will start by roughly planning these components
To do this first create a component folder as well as a UI folder within it
This will hold general UI components such as the button
The next folder Will be the Users folder (also within components)
this will hold user related components
Create: src/components/UI
Create: src/components/Users

Now within these files we can start adding files and building components
The first one we will work on is the `AddUser` component which will accept user input to create new users
Create src/component/Users/AddUser.jsx

Now we can add our component function to this `AddUser.jsx` file and make it a component 
(HINT: you can use a snippet in vscode to create this function automatically by typing "rafce" and then tab for autocomplete) 
```
import React from 'react'

const AddUser = (props) => {
  return (
    <div>
      
    </div>
  )
}

export default AddUser
```
We will use props so be sure those are included

Now what do we want in here?
We want to render something which allows the user to enter a name, age, and a button to confirm
We can use a form for this
Inside of this form we will want a label for username, and input for username, a label for age, an input for age, and a button
One new thing we can do is for accessibility add an id to the input and the property `htmlFor` to the label and set it to the input id
This will help bind the two for screenreaders as well as autocomplete
```
return (
  <form>
    <label htmlFor="username">Username</label>
    <input id="username" type="text" />
  </form>
)
```
Now we can add the other label and input as well as the button which will be type of submit so we can handle the submit through the form as we have done before
Since we are adding this button and setting it to type submit we can go ahead and add the `onSubmit` prop to the form tag as well and pass in a function to handle submission which we will write shortly
```
import React from 'react'

const AddUser = (props) => {
  return (
    <form onSubmit={addUserHandler}>
      <label htmlFor="username">Username</label>
      <input id="username" type="text" />
      <label htmlFor="age">Age (years)</label>
      <input id="age" type="number" />
      <button type="submit">Add User</button>
    </form>
  )
}

export default AddUser
```

Now what will our `addUserHandler` do?
It will get an event object since it is attached to the form and the first thing we should do is prevent the default submission action so the browser doesn't reload and try to submit our data somewhere
Remember this is stopped by using the `.preventDefault()` method that is available to our event object
```
const addUserHandler = (event) => {
  event.preventDefault();
}
```

Now that we have the skeleton for our `<AddUser>` component we can go to our `<App>` component and import it so we can use it

```
import React from 'react';
import AddUser from './Components/Users/AddUser.jsx';


function App() {
  return (
    <div>
      <AddUser></AddUser>
    </div>
  );
}

export default App;

```

Now we have a fairly ugly but working component
Just to make it a little nicer we will apply some small styling to our `index.css`
Within the html selector add a background color of `#1f1f1f`
```
html {
  font-family: sans-serif;
  background: #1f1f1f;
}
```




___
## 91. Adding a Re-usable "Card" Component
Now we will build the card component which we will have around our form
I also did a similar component but we will see how the teacher applies this

First he will just apply a `<Card>` component around the form within `<AddUser>` 
He hasn't written this component yet but will show up as soon as we make the component
This component will  be stored in the UI folder so we can go ahead and add the import now too so it will show up right away
```
import React from 'react'

const AddUser = (props) => {

  const addUserHandler = (event) => {
    event.preventDefault();
  }

  return (
    <Card>
      <form onSubmit={addUserHandler}>
        <label htmlFor="username">Username</label>
        <input id="username" type="text" />
        <label htmlFor="age">Age (years)</label>
        <input id="age" type="number" />
        <button type="submit">Add User</button>
      </form>
    </Card>
  )
}

export default AddUser

```

Now we can start writing the `<Card>` component
Create: src/Components/UI/Card.jsx
```
import React from 'react'

const Card = (props) => {
  return (
    <div>
      
    </div>
  )
}

export default Card

```

Now we have to htink about what we want this card component to do
We want to return a div and inside of that div we want to output the content that `<Card>` is wrapped around when we call it (children)
Remember that we can show any children by using `props.children`
```
return (
  <div>
    {props.children}
  </div>
)
```
Now we can assign a classname and write a css module to style this wrapping div and make it look like a card
For now I will use class name `.card`
Then create our css module
create: src/Components/UI/Card.module.css
and inside we will write css for the `.card` class
We will apply the following css
```
.card {
  background: white;
  box-shadow: 0 2px 8px rgba(0,0,0,0.26);
  border-radius: 10px;
}
```
Make sure you are importing the css as well as the card component within `<AddUser>`
```
import React from 'react'
import styles from './Card.module.css';

const Card = (props) => {
  return (
    <div className={styles.card}>
      {props.children}
    </div>
  )
}

export default Card
```
```
import React from 'react'
import Card from '../UI/Card.jsx';

const AddUser = (props) => {

  const addUserHandler = (event) => {
    event.preventDefault();
  }

  return (
    <Card>
      <form onSubmit={addUserHandler}>
        <label htmlFor="username">Username</label>
        <input id="username" type="text" />
        <label htmlFor="age">Age (years)</label>
        <input id="age" type="number" />
        <button type="submit">Add User</button>
      </form>
    </Card>
  )
}

export default AddUser
```

This is still not exactly correct so we will need to create a css module for `<AddUser>` 
create: src/Components/Users/AddUser.module.css

Then paste in the following:
```
.input {
  margin: 2rem auto;
  padding: 1rem;
  width: 90%;
  max-width: 40rem;
}

.input label {
  display: block;
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.input input {
  font: inherit;
  display: block;
  width: 100%;
  border: 1px solid #ccc;
  padding: 0.15rem;
  margin-bottom: 0.5rem;
}

.input input:focus {
  outline: none;
  border-color: #4f005f;
}
```
Import this module to `<AddUser>`
Then we just have to apply the input class name where we call `<Card>`
```
import React from 'react'
import Card from '../UI/Card.jsx';
import styles from './AddUser.module.css';

const AddUser = (props) => {

  const addUserHandler = (event) => {
    event.preventDefault();
  }

  return (
    <Card className={styles.input}>
      <form onSubmit={addUserHandler}>
        <label htmlFor="username">Username</label>
        <input id="username" type="text" />
        <label htmlFor="age">Age (years)</label>
        <input id="age" type="number" />
        <button type="submit">Add User</button>
      </form>
    </Card>
  )
}

export default AddUser
```

Now because `<Card>` is a custom component and not a preconfigured element it doesn't know what to do with `className` and uses it as a prop
So we will have to do something with that prop within our `<Card>` component
We also want the classes that are already being applied to the div though so we will need to apply both any classnames passed in as well as the classname we already have
We can do this using template literals
Inside we will just pass in both classes within and if no classname is passed in via props then only the default card css will be applied
```
import React from 'react'
import styles from './Card.module.css';

const Card = (props) => {
  return (
    <div className={`${styles.card} ${props.className}`}>
      {props.children}
    </div>
  )
}

export default Card
```

Now our input field should look much nicer




___
## 92. Adding a Re-usable "Button" Component
Now we need to make the button for our form too look nicer
If we were building a bigger application we would probably want to use a similar looking button in other palces so we will create it as a new custom component
This will go within the UI folder
Create: src/Components/UI/Button.jsx
Then fill it with an empty component function to get started except instead of a regular div we are going to want to return a button
```
import React from 'react'

const Button = (props) => {
  return (
    <button>
      
    </button>
  )
}

export default Button

```
Next we are going to create a css module and import a class to our button element
create:src/Components/UI/Button.jsx
Copy and paste the following:
```
.button {
  font: inherit;
  border: 1px solid #4f005f;
  background: #4f005f;
  color: white;
  padding: 0.25rem 1rem;
  cursor: pointer;
}

.button:hover,
.button:active {
  background: #741188;
  border-color: #741188;
}

.button:focus {
  outline: none;
}
```
Make sure you are importing this to the `<Button>` component and then
apply the `.button` classname to the button element
```
import React from 'react'
import styles from './Button.module.css';

const Button = (props) => {
  return (
    <button className={styles.button}></button>
  )
}

export default Button

```

Next we want to make sure we can set the type of button when we call our custom component since different buttons will be used for different things
For example in our form it will be a submit button but in our modal it may just be a regular button since it isn't submitting anything
To do this we will expect to receive the type via props
If someone forgets to pass in a type or doesn't want to we can set a default value of button with the or operator (`||`)
```
<button className={styles.button} type={props.type || 'button'}></button>
```

The button will need to be clickable and will therefore need to receive a function to execute when it is clicked
So we need to add an `onClick` handler to our button and it will expect a method to be pased via props
```
return (
  <button 
    className={styles.button} 
    type={props.type || 'button'}
    onClick={props.onClick}
  >
  </button>
)
```

Lastly we will want to be able to pass text into this button via children so make sure that is displayed between the two button tags
```
import React from 'react'
import styles from './Button.module.css';

const Button = (props) => {
  return (
    <button 
      className={styles.button} 
      type={props.type || 'button'}
      onClick={props.onClick}
    >
      {props.children}
    </button>
  )
}

export default Button

```
Now our button component should be ready to call within our `<AddUser>` component
Be sure you import the `<Button>` component and replace the existing button call with our custom component
```
import React from 'react'
import Card from '../UI/Card.jsx';
import Button from '../UI/Button.jsx';
import styles from './AddUser.module.css';

const AddUser = (props) => {

  const addUserHandler = (event) => {
    event.preventDefault();
  }

  return (
    <Card className={styles.input}>
      <form onSubmit={addUserHandler}>
        <label htmlFor="username">Username</label>
        <input id="username" type="text" />
        <label htmlFor="age">Age (years)</label>
        <input id="age" type="number" />
        <Button type="submit">Add User</Button>
      </form>
    </Card>
  )
}

export default AddUser

```

Now our button should look much nicer and work within our form without even needing to pass an `onClick` method in because it has a type of 'submit'
This means when it is clicked by default it passes the action to our form which does have a handler method attached for submission




___
## 93. Managing the User Input State
Now we want to continue and make sure that we can fetch user input so that way when we get to the next step we can render it as a list of users

We have our `<AddUser>` component which has handler for when the form is submitted
The goal is to collect 2 values (username and age) and use them
We can use state management to update the state with each keystroke and save what the user enters into a state
Then we can use the values within the state as the values to export when the form is submitted
To do this we will need to import `useState` to our `<AddUser>` component and also initialize state
We will use two seperate states one to store the username and one to store the age both will be initialized with '' empty values
```
import React, {useState} from 'react'
import Card from '../UI/Card.jsx';
import Button from '../UI/Button.jsx';
import styles from './AddUser.module.css';

const AddUser = (props) => {

  const [enteredUserName, setEnteredUserName] = useState('')
  const [enteredAge, setEnteredAge] = useState('')

  const addUserHandler = (event) => {
    event.preventDefault();
  }

  return (
    <Card className={styles.input}>
      <form onSubmit={addUserHandler}>
        <label htmlFor="username">Username</label>
        <input id="username" type="text" />
        <label htmlFor="age">Age (years)</label>
        <input id="age" type="number" />
        <Button type="submit">Add User</Button>
      </form>
    </Card>
  )
}

export default AddUser
```
Now that we have somewhere to store user inputs and a method to update that storage we have to create a method that will be called on each keystroke and use `setState` accordingly
We will create a new function called `usernameChangeHandler` which will receive the input from the username field
Then it will use that new value to overwrite whatever state was before
This method will be triggered by the `onChange` action attached to the username input field
Remember that `onChange` gives us access to the event object which we can pass into our handlers and use to access the input values
```
import React, {useState} from 'react'
import Card from '../UI/Card.jsx';
import Button from '../UI/Button.jsx';
import styles from './AddUser.module.css';

const AddUser = (props) => {

  const [enteredUserName, setEnteredUsername] = useState('')
  const [enteredAge, setEnteredAge] = useState('')

  const addUserHandler = (event) => {
    event.preventDefault();
  }

  const usernameChangeHandler = (event) => {
    setEnteredUsername(event.target.value);
  }
  
  const ageChangeHandler = (event) => {
    setEnteredAge(event.target.value);
  }

  return (
    <Card className={styles.input}>
      <form onSubmit={addUserHandler}>
        <label htmlFor="username">Username</label>
        <input id="username" type="text" onChange={usernameChangeHandler}/>
        <label htmlFor="age">Age (years)</label>
        <input id="age" type="number" onChange={ageChangeHandler}/>
        <Button type="submit">Add User</Button>
      </form>
    </Card>
  )
}

export default AddUser
```

Now we can `console.log` the values for each within our `addUserHandler` to ensure that our state and onChangeHandlers are working correctly
```
const addUserHandler = (event) => {
  event.preventDefault();
  console.log(enteredUserName, enteredAge);
}
```




___
## 94. Adding Validation & Resetting Logic
Now lets implement resetting and validation logic
Whenever someone submits input we want to be able to reset the the values to be blank
We will do this in the `addUserHandler`
All we have to do is use `setEnteredUsername` and `setEnteredAge` back to empty values
Be sure you don't reset these values before logging/submitting them
Then we can use two way binding to use these values within input so the input fields are cleared 
```
const addUserHandler = (event) => {
  event.preventDefault();
  console.log(enteredUsername, enteredAge);
  setEnteredUsername('');
  setEnteredAge('');
}
```
Then we can set the value of the inputs equal to the state values for username and age and they should clear whenever state is cleared on submission
```
return (
  <Card className={styles.input}>
    <form onSubmit={addUserHandler}>
      <label htmlFor="username">Username</label>
      <input 
        id="username" 
        type="text" 
        onChange={usernameChangeHandler} 
        value={enteredUsername}
      />
      <label htmlFor="age">Age (years)</label>
      <input 
        id="age" 
        type="number" 
        onChange={ageChangeHandler} 
        value={enteredAge}
      />
      <Button type="submit">Add User</Button>
    </form>
  </Card>
)
```
* Make sure that you have `username` typed consistently as I had a bad habit of being inconsistent with capitalizing the n or not. Make sure it is the same everywhere

Now we can work on validation
For the validation we want to make sure that everyting in `addUserHandler` only activates if the name and age are both valid

For that we can add an if check
First we want to check if `enteredUsername` or `enteredAge` is not empty by checking the length of both after trimming
In this case we just want to return and do nothing else for now
```
if(enteredUsername.trim().length === 0 || enteredAge.trim().length === 0){
  return;
}
```
Next we will check if age is smaller than one since that would also be invalid
```
if(+enteredAge < 1){
  return;
}
```
Note that anything entered in these inputs will always be retrieved as a string but here we are comparing it to a number
This should generally work in js but you can be safe by forcing a conversion of `enteredAge` to a number by adding a "+" in front of it

Now if we click add user without entering any data we will not get a log message since we are hitting our if and using return to exit the method

We will handle adding extras to our validation like messages later but the important thing is that we are only accepting valid user input which we will add to a list 




___
## 95. Adding a Users List Component
Now that we can accept valid input we need to display it
The first question is where do we want to output this list and then where do we want to manage this list of users?

First where do we want to output?
We receive user information within the `<AddUser>` component and we could technically use that information to render a list below the form and manage the list of users with state in `<AddUser>` 
We could do this and it would technically work but it isn't really the best way to do this
The idea of react is that we keep components small and focused where each component has it's own specific purpose and doesn't do too much outside of that
It would be better if we had one component to fetch user data (we do) and then have another component that is responsible for outputting that data so that the two tasks are split

To do this we will add a new component called `<UsersList>`
create: src/Components/Users/UsersList.jsx
Inside of this component we are going to want to return an unordered list where we go through a list of users and output a list item for every user
```
import React from 'react'

const UsersList = (props) => {
  return (
    <ul>
      
    </ul>
  )
}

export default UsersList

``` 
It would probably be best to receive the list of users (an array) via props
We will then cycle through this list of users and create an `<li>` element with the data needed for each one
To do this we can use a `.map()` function in between the `<ul>` tags
You can alternatively run `.map()`  and set the result to a variable array and call that array between the `<ul>` tags
```
return (
  <ul>
    {props.users.map(user=>(
      <li>
        {user.name} ({user.age} years old)
      </li>
    ))}
  </ul>
)
```
We are making a couple of assumptions when writing this
1. whenever we call `<UsersList>` we will be passing in a prop called users which will be an array of user objects
2. each user object will have a name property and value 
3. each user object will have an age property and value

We need to make sure these requirements are met later when we call this component and when we create our list of users within state

Now we can make sure that this list shows up neatly by importing and using the card component and calling it around the unordered list
```
import React from 'react'
import Card from '../UI/Card.jsx';

const UsersList = (props) => {

  return (
    <Card>
      <ul>
        {props.users.map(user=>(
          <li>
            {user.name} ({user.age} years old)
          </li>
        ))}
      </ul>
    </Card>
  )
}

export default UsersList

```
We will need to add some styling and to do that we will need to make a css module for `<UsersList>`
create: src/Components/Users/UsersList.module.css
Then copy/paste the following:
```
.users {
  margin: 2rem auto;
  width: 90%;
  max-width: 40rem;
}

.users ul {
  list-style: none;
  padding: 1rem;
}

.users li {
  border: 1px solid #ccc;
  margin: 0.5rem 0;
  padding: 0.5rem;
}
```
Be sure to import this css module to our component and then add the `.users` class to our `<Card>` component
Remember we set it up earlier so that it could accept a `className` as a prop
```
import React from 'react'
import styles from './UsersList.module.css';
import Card from '../UI/Card.jsx';

const UsersList = (props) => {

  return (
    <Card className={styles.users}>
      <ul>
        {props.users.map(user=>(
          <li>
            {user.name} ({user.age} years old)
          </li>
        ))}
      </ul>
    </Card>
  )
}

export default UsersList

```

Now our `<UsersList>` is ready but where should we add it?
We could of course add it within `<AddUser>` underneath our form but that doesn't really make sense
This is because it is called ADD users which is a very specific action it should be limited to performing that limited action
I think the best place for this is directly within the `<App>` component
This is also where we will  call `<AddUser>` so it makes sense to have `<UsersList>` as a sibling to that component
Be sure to import the component to `<App>` and then call it within the wrapping div below `<AddUser>`
```
import React from 'react';
import AddUser from './Components/Users/AddUser.jsx';
import UsersList from './Components/Users/UsersList.jsx';


function App() {
  return (
    <div>
      <AddUser />
      <UsersList />
    </div>
  );
}

export default App;

```
Note that doing this will cause an error because we are running `.map()` on a dataset that does not exist
The browser doesn't know how to process this so we will need some data to keep this error from happening
In order to fx this we will have to pass an array with user objects into `<UsersList>` as a prop called `users`
We can set the `users` prop when we call `<UsersList>` to an empty array and it should get rid of our error
There will not be a list of users but there won't be an error either and we will be able to see an empty card which we can fill with users




___
## 96. Managing a List of Users Via State
At this point we are able to feed a list of users to `<UsersList>` but so far we can only feed an empty array
We are also able to accept input from the user but we never add it to any list
It is time to combine these two to get the functionality we have been aiming for
When we add a user we will create a new user object which we will return to `<App>` so it can add this user object to an array that will be passed into `<UsersList>`

First we need to add state to our `<App>` components so it can hold, remember, and rerender based on the users array
We will initialize this state with an empty array
We will want to forward this state value to the `<UsersList>` component as the `users` prop
```
import React, {useState} from 'react';
import AddUser from './Components/Users/AddUser.jsx';
import UsersList from './Components/Users/UsersList.jsx';


function App() {

  const [usersList, setUsersList] = useState([]);
  
  return (
    <div>
      <AddUser />
      <UsersList users={usersList}/>
    </div>
  );
}

export default App;

```

Now we have an array to hold all of our users and a function that allows us to update that list
Now we need to forward the data from `<AddUser>` to app via props
To do this we will add a prop when we call `<AddUser>` that will access a method witin `<App>`
This method will accept an argument containing the values we need and use those values to update state in `<App>`
We will make a prop called `onAddUser` and pass in a function called `addUserHandler`
```
import React, {useState} from 'react';
import AddUser from './Components/Users/AddUser.jsx';
import UsersList from './Components/Users/UsersList.jsx';


function App() {

  const [usersList, setUsersList] = useState([]);

  const addUserHandler = () => {
    
  }
  

  return (
    <div>
      <AddUser onAddUser={addUserHandler}/>
      <UsersList users={usersList}/>
    </div>
  );
}

export default App;

```
Now inside of our addUserHandler we will expect two values
One will be the users name and the other will be the userse age
We will run `setUsersList` to update our list of users with these new values but since we want to keep the previous values in state we need to use the functional form
This will give us access to `prevState`
The function within `setUsersList` will return an array that uses the spread operator to fill this array with the previous array
Then we will append a new object to the end with a name field and age field and we will pass the appropriate arguments into each
```
const addUserHandler = (uName, uAge) => {
  setUsersList((prevUsersList) => {
    return [...prevUsersList, {name: uName, age: uAge}];
  })
}
```
Now we need to give `<AddUser>` access to this and pass in the validated user input and we should be able to add users to our `userList`  array and these values should be displayed by our `<UserList>` component
We just need to replace the `console.log` where we output the values we want to pass with the prop method we just wrote
```
const addUserHandler = (event) => {
  event.preventDefault();
  if(enteredUsername.trim().length === 0 || enteredAge.trim().length === 0){
    return;
  }
  if(+enteredAge < 1){
    return;
  }
  props.onAddUser(enteredUsername, enteredAge);
  setEnteredUsername('');
  setEnteredAge('');
}
```

We do have one slight issue in that we do not have unique keys for each list item we render in `<UsersList>`
This is easy to fix by simply adding a key prop to each list item
We can generate this whenever we save a user with `Math.random()`
```
 return [...prevUsersList, {name: uName, age: uAge, id: Math.random().toString()}];
```
Then just add this key to the list item each time one is generated
```
return (
  <Card className={styles.users}>
    <ul>
      {props.users.map(user=>(
        <li key={user.id}>
          {user.name} ({user.age} years old)
        </li>
      ))}
    </ul>
  </Card>
)
```

Now most of the app is done
We are able to input user data, it is validated, and then displayed
Next we just have to create the error modal and add the functionality for it




___
## 97. Adding the "ErrorModal" Component
Now we want to build an error modal
That is an overlay box and could be considered a ui element that we would want to use in other places of the app
So we will add this modal to the UI folder
create: src/Components/UI/ErrorModal.jsx
```
import React from 'react'

const ErrorModal = (props) => {
  return (
    <div>
      
    </div>
  )
}

export default ErrorModal

```

There are a couple different ways to do this but one thing we can do to make things easy is to reuse the `<Card>` component
So we will import that and call it as well
```
import React from 'react'
import Card from './Card.jsx';

const ErrorModal = (props) => {
  return (
      <Card></Card>
  )
}

export default ErrorModal

```

Inside of this card we will have a few different sections the first will be a header with an h2 tag to hold the title
The second will be a div with  p tag to hold any text or error messages
Then below that we will have a footer with a button
Luckily we already made one so we can import that and use it
```
import React from 'react'
import Card from './Card.jsx';
import Button from './Button.jsx';

const ErrorModal = (props) => {
  return (
    <Card>
      <header>
        <h2></h2>
      </header>
      <div>
        <p></p>
      </div>
      <footer>
        <Button>Okay</Button>
      </footer>
    </Card>
  ) 
}

export default ErrorModal

```
Between the h2 tags we will want a title and to keep the modal reusable we don't want to hardcode it
Instead we will assume we will receive some text to use as a title when we call the component via props

Then between the p tags we will want to add a configurable message just like the title that is passed via props
```
import React from 'react'
import Card from './Card.jsx';
import Button from './Button.jsx';

const ErrorModal = (props) => {
  return (
    <Card>
      <header>
        <h2>{props.title}</h2>
      </header>
      <div>
        <p>{props.message}</p>
      </div>
      <footer>
        <Button>Okay</Button>
      </footer>
    </Card>
  ) 
}

export default ErrorModal

```
Lastly we will need some styling
Create: src/Components/UI/ErrorModal.module.css
Copy/paste the following:
```
.backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  z-index: 10;
  background: rgba(0, 0, 0, 0.75);
}

.modal {
  position: fixed;
  top: 30vh;
  left: 10%;
  width: 80%;
  z-index: 100;
  overflow: hidden;
}

.header {
  background: #4f005f;
  padding: 1rem;
}

.header h2 {
  margin: 0;
  color: white;
}

.content {
  padding: 1rem;
}

.actions {
  padding: 1rem;
  display: flex;
  justify-content: flex-end;
}

@media (min-width: 768px) {
  .modal {
    left: calc(50% - 20rem);
    width: 40rem;
  }
}
```

Then we will want to import this to our modal and apply the approriate classes
```
import React from 'react'
import style from './ErrorModal.module.css';
import Card from './Card.jsx';
import Button from './Button.jsx';

const ErrorModal = (props) => {
  return (
    <Card className={style.modal}>
      <header className={style.header}>
        <h2>{props.title}</h2>
      </header>
      <div className={style.content}>
        <p>{props.message}</p>
      </div>
      <footer className={style.actions}>
        <Button>Okay</Button>
      </footer>
    </Card>
  ) 
}

export default ErrorModal

```

Now where do we render this?
You could argue that it should be inside of `<AddUser>` since it is an error within `<AddUser>` that will trigger this modal
You could also argue that it should be within `<App>` since it is an overlay and more of a general UI component
The teacher is going to put it in the `<AddUser>` component but either one is fine
I will follow what he did since I already did mine within `<App>` 

Since we want to add our modal to `<AddUser>` we will need to first import it
Then we can call it within our return statement
Remember when we call it our modal will be expecting some values such as title and message
We can hardcode these for now but will make them dynamic later 
Since the modal and Card should be siblings of each other we will need to wrap them both in an extra div
```
import React, {useState} from 'react'
import Card from '../UI/Card.jsx';
import Button from '../UI/Button.jsx';
import ErrorModal from '../UI/ErrorModal.jsx';
import styles from './AddUser.module.css';

const AddUser = (props) => {

  const [enteredUsername, setEnteredUsername] = useState('')
  const [enteredAge, setEnteredAge] = useState('')

  const addUserHandler = (event) => {
    event.preventDefault();
    if(enteredUsername.trim().length === 0 || enteredAge.trim().length === 0){
      return;
    }
    if(+enteredAge < 1){
      return;
    }
    props.onAddUser(enteredUsername, enteredAge);
    setEnteredUsername('');
    setEnteredAge('');
  }

  const usernameChangeHandler = (event) => {
    setEnteredUsername(event.target.value);
  }
  
  const ageChangeHandler = (event) => {
    setEnteredAge(event.target.value);
  }

  return (
    <div>
      <ErrorModal title="Hello there." message="General Kenobi, you are a bold one." />
      <Card className={styles.input}>
        <form onSubmit={addUserHandler}>
          <label htmlFor="username">Username</label>
          <input
            id="username"
            type="text"
            onChange={usernameChangeHandler}
            value={enteredUsername}
          />
          <label htmlFor="age">Age (years)</label>
          <input
            id="age"
            type="number"
            onChange={ageChangeHandler}
            value={enteredAge}
          />
          <Button type="submit">Add User</Button>
        </form>
      </Card>
    </div>
  )
}

export default AddUser
```

Now if we reload it doesn't look too bad
It isn't dynamic yet and we can't dismiss it and there is no backdrop

First let's add the backdrop
We will add an extra div next to our `<Card>` component call within our `<ErrorModal>` component
This means we will need to use a wrapping div to hold the two sibling elements
Then on the div that is a sibling to card we can add the `.backdrop` class from our css module
```
import React from 'react'
import styles from './ErrorModal.module.css';
import Card from './Card.jsx';
import Button from './Button.jsx';

const ErrorModal = (props) => {
  return (
    <div>
      <div className={styles.backdrop} />
      <Card className={styles.modal}>
        <header className={styles.header}>
          <h2>{props.title}</h2>
        </header>
        <div className={styles.content}>
          <p>{props.message}</p>
        </div>
        <footer className={styles.actions}>
          <Button>Okay</Button>
        </footer>
      </Card>
    </div>
  ) 
}

export default ErrorModal

```