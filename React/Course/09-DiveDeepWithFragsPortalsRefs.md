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




___
## 103. React Fragments
Now that we have a custom wrapper component we are able to use a trick to fulfill the requirement by react and not have div soup
Because this is convenient and obvious this wrapper component is not a component that we need to build on our own
Instead it does come with react
It is called the `<React.Fragment>` component
You can always access this by simply calling it as done above or you can import it from react
Some projects will also allow you to use a blank element but it will depend on your project setup

Ways to call `<React.Fragment>`
```
return (
  <React.Fragment>
    <h2>Hello There!</h2>
    <p>General Kenobi! You are a bold one</p>
  </React.Fragment>
)
```
```
return (
  <>
    <h2>Hello There!</h2>
    <p>General Kenobi! You are a bold one</p>
  </>
)
```

This is the exact same as our wrapper and will render an empty wrapper which doesn't render anything to the dom

We can adjust our project to use the empty tags
```
  return (
    <>
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
    </>
  )
```

We can also do this in `<App>` 
```
return (
  <React.Fragment>
    <AddUser onAddUser={addUserHandler}/>
    <UsersList users={usersList}/>
  </React.Fragment>
);
```

If you wanted to you could also import Fragment and simply call it that way
```
import React, {useState, Fragment} from 'react';
...
...
  return (
    <Fragment>
      <AddUser onAddUser={addUserHandler}/>
      <UsersList users={usersList}/>
    </Fragment>
  );
```

Usually we will use this fragment instead of writing our own wrappers but it is important to understand how it works




___
## 104. Introducing React Portals
Fragments are used to clean up our code and reduce unnecessary html elements
React Portals are another feature that help us also keep our code clean

Consider the following
You have two jsx elements side by side wrapped in a fragment that is being returned
```
return (
  <React.Fragment>
    <MyModal />
    <MyInputForm />
  </React.Fragment>
);
```

Then the html that is actually rendered to the dom looks like this because these components are returning jsx of their own or could be returning more components
```
<section>
  <h2>Some other content...</h2>
  <div class="my-modal">
    <h2>A Modal Title!</h2>
  </div>
  <form>
    <label>Username</label>
    <input type "text" />
  </form>
</section>
```
What is wrong with this?
Well nothing but there is something in this code that is not ideal and that is the modal
The modal in the dom will work as long we apply the correct styling but semantically it is not ideal from a "clean html structure" perspective
It should not be nested because it is an overlay of the entire page
This would be similar for side-drawers or other dialogs

Since it is over the entire page logically it should be above everything else
Although it could technically work because of styling it isn't a good representation of how the page should be laid out
It is deeply structured in other html code when it is actually displayed on top of the rest of our page

It would be like creating a button by styling a div like a button and adding an event listener
yes this will work but it is not the correct way to do things

What we want to do is find a way to keep the structure on the left so that the modal is tied to the import form but to render it differently in the real dom and render the modal html content somewhere else other than where it would normally go to
We want the jsx code and structure to not change but we want to rendered dom to be different
We can accomplish this with react portals




___
## 15. Working with Portals
In our project we have an error modal
(you can add a react fragment here instead of a wrapping div too)

This is a good example of where we can use a portal
That is because this modal shouldn't be rendered where it is actually being rendered currently
Right now this modal is being rendered as a child of the root div as a sibling to the form and list
This isn't an issue in a project this size but in a larger project it may end up quite nested in the dom tree
You may actually want the ErrorModal and backdrop div to actuall show up as children in the `<body>` tag instead of as a child of the `<root>` tag within `<body>` 
With portals we can move it up a level

Not only could we move the backdrop div up to be a direct child of the body but we could also move the actual modal up to also be a direct child of the body

How do we use portals to do this?
Portals need two things
1. A place to port the portal too
2. Let the component know it should have portal to that place

How do we mark the place for a portal?
We can do this by going into the `'/public'` folder and go into `index.html`
There you should add a div with an id that you can use to identify it later
```
 <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="backdrop-root"></div>
    <div id="modal-root"></div>
    <div id="root"></div>
  </body>
```
Here we are using `overlay-root` instead of a `modal-root` because you could use it as a portal for other overlays such as zoomed in pictures, modals, sidedrawers etc
We will use that instead of `modal-root` 

Now back in our components we need to tell react that our backdrop div as well as our `<Card>` we are using for our modal should be portaled somewhere else

To do this and to make it simpler we will add a new component WITHIN our `ErrorModal.jsx` file called backdrop which will simply return the div we are currently using for backdrop
```
const Backdrop = (props) => {
  return <div className={styles.backdrop} onClick={props.closeModal} />;
}
```
Now we will do the same for a modal overlay component
```
const ModalOverlay = (props) => {
  return (
    <Card className={styles.modal}>
      <header className={styles.header}>
        <h2>{props.title}</h2>
      </header>
      <div className={styles.content}>
        <p>{props.message}</p>
      </div>
      <footer className={styles.actions}>
        <Button onClick={props.closeModal}>Okay</Button>
      </footer>
    </Card>
  );
}
```
Now we have basically split our component into two seperate parts, backdrop and overlay
This will make it easier to use portals with them

Now how do we call these and portal them?
We want to call a function within our jsx that is a part of the `react-dom` library
This is a different library than `react` but is included as a part of React already
Think of `react` having all the react features like state management built in
`react-dom` uses react to bring that logic and features to the dom
`react` doesn't actually care if you are using react to build a dom or a native react application
You could actually use `react-native` to build mobile apps (but that is a whole other course)
Basically `react-dom` is the translator for react to the browser
Since we are portalling to something in the dom we will need to access `react-dom` and therefore need to import it
```
// Note ReactDOM can be named however you want 
import ReactDOM from 'react-dom';
```

Now on ReactDom which we have imported we can call the `.creatPortal()` method
This method takes two arguments the first is the react component or jsx that should be rendered
The second is the id of the element that this component should be rendered to
To do that we will use `document.getElementByID()` and pass in the id of the div to target just like good old plain vanilla js
Don't forget to forward the `closeModal` function to the backdrop
```
const ErrorModal = (props) => {
  return (
    <React.Fragment>
      {ReactDOM.createPortal(<Backdrop closeModal={props.closeModal} />, document.getElementById('backdrop-root'))}
      
    </React.Fragment>
  ) 
}
```

One place you can see something very similar to this already in action is in `index.js`
There it uses `ReactDOM` and the `.render()` method to render our `<App>` component (and therefore our app)
And targets the `root` div with the same `.getElementById` method

Now if we go back and enter an invalid user the backdrop will appear (and is functional) but the modal will not since we haven't portalled that yet
You will also notice that the `backdrop-root` div is now being rendered as a child of the body instead of with the root div
We also could have targetted the body itself if we really wanted to and didn't want a wrapper div around the backdrop

Let's go back and add a portal for the error modal as well
Remember to forward the props it needs and pay attention to the naming
```
const ErrorModal = (props) => {
  return (
    <React.Fragment>
      {ReactDOM.createPortal(
        <Backdrop closeModal={props.closeModal} />, 
        document.getElementById('backdrop-root')
      )}
      {ReactDOM.createPortal(
        <ModalOverlay 
          title={props.title} 
          message={props.message} 
          closeModal={props.closeModal}
        />, 
        document.getElementById('overlay-root')
      )}
    </React.Fragment>
  ) 
}
```

Now if we save the modal should both render and be functional and it should be portalled to the `overlay-root` div in the dom
Now we can use the error modal and the `<AddUser>` component in the exact same way but now it will always show up in the correct place in the dom no matter where we call it or how nested it is within our React application