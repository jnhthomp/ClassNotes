# Section 9: Diving Deeper: Working With Fragments, Portals, & "Refs"
Section github: https://github.com/academind/react-complete-guide-code/tree/09-fragments-portals-refs
___
## 100. Module Introduction
In this module we will cover fragments, portals, and refs
These are more tools to add to our React toolbox to help us solve problems
In this module we will go through each of these features, learn which problems they solve and why we need them

We will look at limitations we have with jsx code and how fragments can help us overcome those limitations

We will learn how we can derive a cleaner dom and better code structure with the help of portals

We will work with refs and learn what they are and why we need them




___
## 101. JSX Limitations & Workarounds
In react we work with JSX 
To demonstrate some of the limitations we will use the project we used from the last section
If you skipped that you can find it in the github link above

Remember that JSX is the html-ish code that is returned by our component
We can do a lot of things with this but it does have it's limitations
One such limitation we have run into is that we can only return a single root div
This meaning any siblings must be wrapped in a parent div

Valid:
```
return (
  <div>
    <h2>Hello There!</h2>
    <p>General Kenobi! You are a bold one</p>
  </div>
)
```

Invalid:
```
return (
  <h2>Hello There!</h2>
  <p>General Kenobi! You are a bold one</p>
)
```

This is also true when storing jsx in variables which we have done to dynamically change our jsx returns

Valid:
```
 let keelHim = (
  <div>
    <h2>Hello There!</h2>
    <p>General Kenobi! You are a bold one</p>
  </div>
)
```

Invalid:
```
let keelHim = (
    <h2>Hello There!</h2>
    <p>General Kenobi! You are a bold one</p>
)
```

The reason for this is fairly straightforward
Since react is transforming our return and each set of tags into vanilla js the js that is returned must be valid
Without a wrapper div you are returning multiple elements and a function in js can only 

This would not be valid js but would be what is returned by react with sibling components not wrapped

Invalid JS transformation:
```
return (
  React.createElement('h2', {}, 'Hello There!')
  React.createElement('p', {}, 'General Kenobi! You are a bold one')
);
```

This is a natural limitation of js that requires us to have only 1 single root element
There are ways to work around this though 
One solution that we already use is of course wrapping the sibling elements with a div
This would be like returning 3 numbers by putting them in an array
Keep in mind this doesn't have to be a div it could be any element

There is an alternative we don't have to use a div
Instead we could wrap our jsx into an array and return that array
(don't forget to seperate by commas)

Valid:
```
return (
  [
  <h2>Hello There!</h2>,
  <p>General Kenobi! You are a bold one</p>
  ]
)
```

A real world example from our previous project
What we did (wrapping in div)
```
return (
  <div>
    {error && <ErrorModal title={error.title} message={error.message} closeModal={errorHandler}/>}
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
```

What we could have done:
```
return (
  [
    error && <ErrorModal title={error.title} message={error.message} closeModal={errorHandler}/>,
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
  ]
)
```

This is valid because react can work with this but there is a catch
Remember that when we render arrays of react elements react expects a key and we do not have key assigned to these elements
This is the case for both dynamic elements such as when we run `.map()` to create elements as well as static hardcoded elements
Of course we could add a key and hardcode keys 
```
return (
  [
    error && <ErrorModal title={error.title} message={error.message} closeModal={errorHandler} key="error-modal"/>,
    <Card className={styles.input} key="add-user-card">
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
  ]
)
```
This would work and would be perfectly fine but typically this is not used
This is because it is cumbersome and it is easier to just wrap our elements in a div or another wrapping element

However this does sometimes lead to other problems
One is called "`<div>` soup"
It is when you get a bunch of nested divs and it makes it difficult to find exactly where  things are in the dom
```
<div>
  <div>
    <div>
      <div>
        <h2>👌Good soup</h2>
      </div>
    </div>
  </div>
</div>
```
It can be confusing and add a lot of divs that have no semantic meaning or structure but are only there because of the react/jsx return requirement

You may be fine with this but it could break other things
Imagine you were using nested css selectors and and someone updated a component and now your styles don't apply anymore until you are able to work your way through the div soup

Even if it doesn't break your styling it is still not a good practice because you are rendering too many html elements 
The browser has to render all of these elements and react has to check them so it may make your application run slow




___
## 102. Creating a Wrapper Component
Now we will explore a solution
What if we used a trick?
In the project from the previous section we will create a new folder called helpers
Create: src/Components/Helpers/Wrapper.js

Inside we will write our functional component as normal but we won't be returning any jsx
Instead we will only return `props.children`
This keeps our components free of wrapping divs and allows us to have siblings that when rendered do not have wrapping divs around them
Note that because we aren't returning any jsx we don't need to import react (we don't need to anyway) and our file can be .js instead of .jsx
```
const Wrapper = (props) => {
  return props.children;
}

export default Wrapper
```

Now we can import the `<Wrapper>` component to `<AddUser>` and not need the unnecessary wrapping div and instead use this new component
```
return (
  <Wrapper>
    {error && <ErrorModal title={error.title} message={error.message} closeModal={errorHandler}/>}
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
  </Wrapper>
)
```

If we compare the actual html that is rendered to the dom you can see that there is no longer a wrapping div around the `<Card>` component in the dom

Even though wrapper is an empty component it is enough to fulfill the requirement jsx has of making sure that all returns only return a single root component
It is an element that is not rendered in anyway to the dom but the requirement for jsx is not about what is rendered to the dom just that it receives a single root element as a return statement
That root element does not have to be rendered or do anything
The root element also only returns one thing which is it's children

This is a technical requirement of js that we are working around and still only returning a single thing in each of our components