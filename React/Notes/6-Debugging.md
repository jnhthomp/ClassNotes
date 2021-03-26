# Section 6: Debugging React Apps
____
##  77. Module Introduction
This module will cover how to help find/correct mistakes or errors in your application
This module will cover
- Debugging
- Reading and understanding error messages
- How create an error free react application

____
## 78. Understanding Error Messages
In the project we have worked on so far we can add an error in our name changed handler
Where we assign the updated person to get ``` event.target.value ```
Instead lets say we accidentally tried ``` event.input.value ```

When we load the page like this we can see that React will let us know what the issue is (cannot read property value undefined) and where the line is

Sometimes error messages are not as helpful but they should still give you a helpful line number




____
## 79. Finding Logical Errors by Using Dev Tools & Sourcemaps

let's say we made the following error 
```
return pl.userId === id;
```
Even though userId is not defined in our app we will not get an error because it will return undefined and it is valid to compare undefined to id
However if we try to type nothing will work since we broke 2 way binding and we won't get any error messages

So how would we find this error?
In chrome Dev Tools you can use the sources tab to find your code structure and view your source files
This is possible due to source maps.
These are translation files that allow chrome to go into your code and debug it even though that code has been compiled and optimized
This means you can debug the code you wrote even if it is not the code in the browser
Now we can go to the function that handles the functionality that is not working and place a break point by clicking on the line number

Now if you try to type the the code will pause when it gets to that line
We can then step into each line to see what is happening
When we get to the line with our p object we can see what properties it has
We can also see that userId is not listed but id is listed
If we hover over ``` p.userId ``` we can see that it has a value of undefined which we are comparing to an existing id




____
## 80. Working With The React Developer Tools
Now sometimes you might want to know the current state of your react app
There is an extension called 'React developer tools'
Googling will show you the appin the chrome web store and the github repo for it
Once added restart chrome and you should see two new things in the Dev Tools
  - Components
  - Profiler

If you click components you should see a representation of the react components rendered on the screen
If you select it you can see the props that component receives and the state that it manages
You can also see which component renders a given component
You are also able to log a component to the console so that you can dive into it in the console
You can inspect the assiciated dom element html 
You can inspect the source code where you can place breakpoints
There are also some settings you can apply 

You can even go in and change the value of state properties or props being passed into the component




____
## 81. Using Error Boundaries (React 16+)
Sometimes you have code that usually works but you cannot gaurantee will always work (could be caused by a server timeout or something)
In these cases you want to show a nice screen or a custom error message to the user
Lets say that when we render a person class we have a chance of getting an error
In order to force the app to behave this way we can do something like this:

```
const person = (props) => {
  const rnd = Math.random();

  if(rnd > 0.7) {
    throw new Error('Something went wrong');
  }
  return(
    ...
  )
```
This will give us a 30% chance of hitting an error whenever the Person element is called

In the case that an error is hit then it will show the text we asked it to on the screen

In order to explore this more and how we would implement it in a real app we will create a new component called ``` ErrorBoundary ``` 

- Create folder/file ``` ErrorBoundary/ErrorBoundary.jsx ```
- Import react and component
- Create a class component that extends component
- Add ``` render() ``` method with a ``` return ``` statement that will return a ```<h1>``` tag with the message "Something went wrong"
- add a state with ``` hasError: false ``` and ``` errorMessage: '' ```
  ```
  import React, { Component } from 'react';

  class ErrorBoundary extends Component {
    
    state = {
      hasError: false,
      errorMessage: ''
    }

    render(){
      return <h1>Something went wrong</h1>;
    }
  }
  ```

Next we will add a method called ``` componentDidCatch ```
It will accept 2 arguments ``` error ``` and ``` info ```
We will use these to help render helpful nicer looking error messages
Inside this method we want to update the state with our error message
```
componentDidCatch = (error, info) => {
  this.setState({hasError: true, errorMessage: error});
}
```

Now in our render method there are 2 outcomes we have to plan for
One where there is an error (and hasError is true)
and one where there is not an error (and hasError is false)
In the case that there is an error we want to render the "Something went wrong" message
To do this we can use an if statement to check if ``` this.state.hasError``` is true
if so then return our current return statement
```
render(){
  if(this.state.hasError) {
    return <h1>Something went wrong</h1>;
  }
}
```

Then to be more helpful we can return something more relevant than something went wrong
We can return the ``` errorMessage ``` from state instead
```
return <h1>{this.state.errorMessage}</h1>;
```

Now we can handle our else
In the case that hasError is false we want to return ``` this.props.children ``` this will return the child components that this component is wrapped around if there are no errors
```
} else {
  return this.props.children;
}
```

Don't forget to export
```
export default ErrorBoundary; 
```

When complete it should look like this:
```
import React, { Component } from 'react';

class ErrorBoundary extends Component {

  state = {
    hasError: false,
    errorMessage: ''
  }

  componentDidCatch = (error, info) => {
    this.setState({hasError: true, errorMessage: error});
  }

  render(){
    if(this.state.hasError) {
      return <h1>{this.state.errorMessage}</h1>;
    } else {
      return this.props.children;
    }
  }
}

export default ErrorBoundary; 
```

Now we can use this in our App.jsx
Be sure to import ErrorBoundary into App.jsx
```
import ErrorBoundary from './ErrorBoundary/ErrorBoundary';
```

Now where we return our person we can wrap our ``` Person ``` element in our ``` ErrorBoundary ```
One other small change we need to make is to move the ``` key ``` attribute from the ``` Person ``` element to the ``` ErrorBoundary ``` element
This is because the key attribute always has to be on the outermost element when calling duplicate elements
```
if (this.state.showPersons) {
  persons = (
    <div>
      {this.state.persons.map((person, index) => {
        return <ErrorBoundary key={person.id}><Person 
          click={() => this.deletePersonHandler(index)}
          changed={(event) => this.nameChangedHandler(event, person.id)}             
          name={person.name} 
          age={person.age} /> </ErrorBoundary>
      })}
    </div>
  );     
  btnClass.push(classes.Red);
}
```

Now if we load our page and click the button until we get an error we will see the same page
However, this is just for development mode
If we were to bundle our app and build it then we would see whatever is in the return statement for our ``` ErrorBoundary ``` component

Be careful not to clutter your code with error boundaries and only add them where it makes sense
Only on code that has potential to fail when called like a server call
If normal code fails that probably means you messed up coding it
This allows us put error messages only on components that are messing up without disrupting the rest of the page




____
## 82. Wrap Up
In this section we covered error messages and how read them so they are helpful
We learned how to debug logical errors with source maps and chrome dev tools
We learned how to use React dev tools
We also learned about ErrorBoundaries




____
## 83. Useful resources and Links
- Error Boundaries: 
  - https://reactjs.org/docs/error-boundaries.html
- Chrome Devtool Debugging: 
  - https://developers.google.com/web/tools/chrome-devtools/javascript/