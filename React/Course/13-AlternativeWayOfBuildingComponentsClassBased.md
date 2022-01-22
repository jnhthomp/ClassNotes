# Section 13: An Alternative Way of Building Components: Class-based Components
Section github: https://github.com/academind/react-complete-guide-code/tree/13-class-based-cmp
___
## 163. Module Introduction
In this section we are going to learn how to builld components in an alternative way
So far we have built components as functions
However in react you can also define components as classes

One important note: This is 100% optional and in most modern react projects you will probably not use this
You can skip this section but know that you will see a lot of class based components in older projects
This is because class based components used to be required but there has recently been a shift to functional components

This section will cover:
- What class based components are and why they exist
- How to work with class based components
- Error boundaries (require class based components but we will not build a lot of these)

This section holds a lot of information about reacts past, how to build class, based components, why they exist, and how they work




___
## 164. What & Why
Class based components are an alternative to functional components
So far our components have looked like this:
```
function Product(props) {
  return <h2>Hello there!</h2>
}
```
Or if you used arrow function components:
```
const Product = (props) => {
  return <h2>Hello there!</h2>
}
```
These are equivalent and are both functional components because they are both ways of expressing a function

Just as functional components are regular js functions that return jsx
Class based components are regular js CLASSES that return jsx
These are defined like this:
```
class Product extends Component {
  render() {
    return <h2>Hello there!</h2>
  }
}
```

Here we are defining a component by creating a class
Classes are not a react feature they are a feature of js
They provide a render method that provides the jsx we want to return

Remember functional components are the default and modern way of building components but it is important to know about class based components
There is really no reason to use class based components other than personal preference and error boundaries which are not common

You can build anything that can be built with functional components with class based components, you just may need a slightly different approach

But why do they exist?
Class based components exist because they used to be required and used to be the only way to manage state and side effects
In React 16.8 "React Hooks" were introduced which allowed state to be managed by functional components
This brought features to functional componets that before could only be used in class based components

An important notes is that class based components cannot use these hooks that were introduced to help functional components
This is really important and why we generally have to take a different approach when using class based components




___
## 165. Adding a First Class-based Component
To help understand class based components there is a starting project here: https://github.com/academind/react-complete-guide-code/tree/13-class-based-cmp/code/01-starting-project
Copy, npm install, and git init this to your project folder

Then use `$npm start` to see the app
This is simply an app that has a list of users that shows/hides the list when a button is clicked

This only uses three components a `<Users>`, `<User>`, and `<App>` components

`<Users>` has some dummy data and a state to determine whether the users list should show
If it should show it takes the dummy data and maps each user to a `<User>` component

See `<Users>`
```
import { useState } from 'react';
import User from './User';

import classes from './Users.module.css';

const DUMMY_USERS = [
  { id: 'u1', name: 'Max' },
  { id: 'u2', name: 'Manuel' },
  { id: 'u3', name: 'Julie' },
];

const Users = () => {
  const [showUsers, setShowUsers] = useState(true);

  const toggleUsersHandler = () => {
    setShowUsers((curState) => !curState);
  };

  const usersList = (
    <ul>
      {DUMMY_USERS.map((user) => (
        <User key={user.id} name={user.name} />
      ))}
    </ul>
  );

  return (
    <div className={classes.users}>
      <button onClick={toggleUsersHandler}>
        {showUsers ? 'Hide' : 'Show'} Users
      </button>
      {showUsers && usersList}
    </div>
  );
};

export default Users;

```

The `<User>` component simply outputs the data passed in when mapping each user via props

Nothing fancy going on here

To get started learning about classes lets convert the `<User>` component to a class based component since it is simply and simply receives props and doesn't manage any state

To do this we start with the class keyword and use the template from the previous lesson
Remember this is just like you would use a class in js because this is a js feature, not a react feature

So start with the 'class' keyword, then the name of your class followed by curly braces
```
class User {

}
```

Now we can start adding methods to this class
We can theoretically add as many methods as we want and we can name them how we want
The first we will want to add though is a very specific method called `render()` which will be used to output the content of this component

`render()` is expected by react and will call it from the component to determine what should be rendered to the screen
`render()` is basically equivalent to the `return` statement used in functional components
Within  `render()` we will want to return the result we are looking for
```
class User{ 
  render(){
    return <li className={classes.user}>{props.name}</li>;
  }
}
```
There is something missing though and that is props
For functional components we receive these automatically we just have to let the component know we are expecting them by passing them in as an argument to the function
It is a little different for class based componets

Instead we need to do something else, not just for props but to make the component work in general
We need to import 'Component' from react (just like we did with hooks)
```
import { Component } from 'react';
```

Then we need to EXTEND our user class to this components class
This is a built in js concept to allow classes to inherit from other classes
```
class User extends Component{ 
  render(){
    return <li className={classes.user}>{props.name}</li>;
  }
}
```

This `Component` class we imported provides functionality to make our class work as a component and gives us access to a few important properties
One of these is the 'props' property
We can access this with `this.props`
This only works because we extended the component class
This adds the prop property which can only be accessed via the `this` keyword
```
return <li className={classes.user}>{this.props.name}</li>;
```

Now we have a class based equivelant to the functional component which can be removed or commented out
```
import { Component } from 'react';
import classes from './User.module.css';

class User extends Component{ 
  render(){
    return <li className={classes.user}>{this.props.name}</li>;
  }
}

// const User = (props) => {
//   return <li className={classes.user}>{props.name}</li>;
// };

export default User;
```

Looking at these you can see that the functional component is a little leaner which is one reason they are more popular
We still have to export 'User'
If we save it will act just like before

Notice that `<Users>` is still a functional component calling a class based component 
This is completely ok in react as class based and functional components can work together and for the most part interchangebly

It is more ideal to use one or the other (function or class based)
However sometimes in older projects you will update class based components to become functional over time and slowly migrate to functional

If you are starting a new project it is better to use one or the other, whichever you prefer