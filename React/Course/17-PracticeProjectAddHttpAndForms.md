# Section 17: Practice Project: Adding Http & Forms To The Food Order App
Section github: https://github.com/academind/react-complete-guide-code/tree/17-practice-food-order-http-forms
___
## 214. Module Introduction
Now we will apply what we have learned in the last couple of sections to our existing project
We will add to our food order application that we started a few sections ago

In the food order app we will add a basic checkout form
This form will allow the user to enter their name and address so they can checkout
Then that form will be validated submitted to our firebase backend via http
We will also make our meals data retrieved from this firebase db as well instead of hardcoding them into the app

If you skipped previous sections make sure you are set up with firebase
Also be sure that you have a realtime database ready to connect to with the read and write rules set to true



___
## 215. Moving "Meals" to the Backend
Now we are going to start implementing the features mentioned

The first thing we will do is implement fetching the meals data from a backend
For this in the firebase console we can add a new node manually called meals
Then we can hit the plus again to add data and nest it

Remember the list of dummiy meals is currently stored in `<AvailableMeals>`
For example:
```
meals
|-m1
  |-name: "Sushi"
  |-description: "Finest fish and veggies"
  |-price: 22.99
|-m2
  ...
```

Now the meals are on the backend
Next we will want to retrieve these meals and use the result for our meals list




___
## 216. Fetching Meals Via Http
Now instead of using the `DUMMY_MEALS` array we want to fetch the data we just put into the backend
To do this we can use the fetch api and fetch them within `<AvailableMeals>`
We could use a custom http hook but we will just build it from scratch
If you want to use a custom hook or third party package that would also be ok

We want to fetch the meals data when the component is loaded
To do this we can utilize `useEffect` to trigger our data fetch when the component is loaded
```js
const AvailableMeals = () => {
  useEffect(() => {
    fetch(fetch('https://react-http-default-rtdb.firebaseio.com/meals.json'))
  }, [])
  ...
```
Now inside of fetch we want to send an http request to the `meals` node in firebase
The url for that will be listed on firebase but add on `meals.json` at the end or else you will receive any other nodes that are part of that realtime database as well which we don't want

Now we are sending a request to an api that should return a list of meals
We could configure this with a second argument but we don't need to here

We know that fetch returns a promise so we need to use `.then` to provide a function to trigger when the request is complete
alternatively we can use async/await
We do have to be careful doing this because the function we are passing in to `useEffect` cannot return a promise
Instead it MAY (but doesn't have to) return a cleanup function

In order to avoid this we can write a new async function inside of our `useEffect` function that we call within our `useEffect` function as well
This will prevent our `useEffect` function being async and returning a promise but allows us to use async/await inside of `useEffect
```js
const AvailableMeals = () => {
  useEffect(() => {
    const fetchMeals = async () => {
      await fetch('https://react-http-default-rtdb.firebaseio.com/meals.json')  
    }

    fetchMeals();
  }, [])
```

This is what we are looking for but remember that fetch will return something (hopefully our meals) so we need to save that response
This response will be in json format so we want to use the `.json()` to transform that into a js object
(this is also an async function so be sure to mark it with await)
```js
const AvailableMeals = () => {
  useEffect(() => {
    const fetchMeals = async () => {
      const response = await fetch('https://react-http-default-rtdb.firebaseio.com/meals.json')  
      const responseData = await response.json()
    }
    fetchMeals();
  }, [])
```

The response data we are getting from firebase will be an object where the ids are keys and the values are nested within those keys
So we will have `responseData` which is an object that has a key for each id that is a meal

`responseData.m1` would return an object with the name, description, and price of the first meal and so on

However we don't want `responseData` to be an object we want an array holding each of our objects without any nesting within the object (just like the orginal `DUMMY_MEALS` array)
Like this:
```js
const DUMMY_MEALS = [
  {
    id: 'm1',
    name: 'Sushi',
    description: 'Finest fish and veggies',
    price: 22.99,
  },
  {
    id: 'm2',
    name: 'Schnitzel',
    description: 'A german specialty!',
    price: 16.5,
  },
  {
    id: 'm3',
    name: 'Barbecue Burger',
    description: 'American, raw, meaty',
    price: 12.99,
  },
  {
    id: 'm4',
    name: 'Green Bowl',
    description: 'Healthy...and green...',
    price: 18.99,
  },
];
```

We can transform the object we are receiving from firebase to match this with a for loop on the object

First initialize an array
Then use a for loop to create a new object for each key in `responseData`
Then we will use `.push` to add that object to the array before moving onto the next key
```js
const AvailableMeals = () => {
  useEffect(() => {
    const fetchMeals = async () => {
      const response = await fetch('https://react-http-82bca-default-rtdb.firebaseio.com/meals.json')  
      const responseData = await response.json()

      const loadedMeals = [];

      for (const key in responseData) {
        loadedMeals.push({
          id: key,
          name: responseData[key].name,
          description: responseData[key].description,
          price: responseData[key].price
        })
      }

    }
    fetchMeals();
  }, [])
```
Now we are retrieving this fetched data we need to provide it to our component and render it
it is important to render it because initially this async function will not be complete when the page loads
By re-rendering the component after this function is complete the data will be available and can be rendered as different meals

To do this we will need to use state in order to mark that the fetch is complete and be updated so that the component can rerender
We can initialize this state to an empty array
Then after our for loop once `loadedMeals` is complete we can use the `loadedMeals` array as the new `meals` array
```js
const AvailableMeals = () => {

  const [meals, setMeals] = useState([]);

  useEffect(() => {
    const fetchMeals = async () => {
      const response = await fetch('https://react-http-default-rtdb.firebaseio.com/meals.json')  
      const responseData = await response.json()

      const loadedMeals = [];

      for (const key in responseData) {
        loadedMeals.push({
          id: key,
          name: responseData[key].name,
          description: responseData[key].description,
          price: responseData[key].price
        })
      }

      setMeals(loadedMeals);

    }
    fetchMeals();
  }, [])
```

lastly make sure you are using this `meals` state array to run `.map` on when creating `<MealItem>` components otherwise you will not be using the fetched data

Note that because we have an empty array in `useEffect` it will only run when the component is first loaded which is what we want
We don't want to refetch the list of meals every time state changes so this is perfect
```js
import { useState, useEffect } from 'react'
import classes from './AvailableMeals.module.css';
import Card from '../UI/Card.jsx';
import MealItem from './MealItem/MealItem.jsx';

// List of meals that are offered by the restaurant
// Ideally these would actually be stored on a server and we would request a list
//  but this is the basic shape the response might look like when we request a list of meals
// All meals must have a unique id, name, price, and description 
//  description is only used within <MealItem> but could technically be an empty string without messing up the rest of the application too much
//  Try to keep description < 30 chars if adding new meals
// Price should be stored as number so calculations are easier and are formatted when displayed to users
// const DUMMY_MEALS = [
//   {
//     id: 'm1',
//     name: 'Sushi',
//     description: 'Finest fish and veggies',
//     price: 22.99,
//   },
//   {
//     id: 'm2',
//     name: 'Schnitzel',
//     description: 'A german specialty!',
//     price: 16.5,
//   },
//   {
//     id: 'm3',
//     name: 'Barbecue Burger',
//     description: 'American, raw, meaty',
//     price: 12.99,
//   },
//   {
//     id: 'm4',
//     name: 'Green Bowl',
//     description: 'Healthy...and green...',
//     price: 18.99,
//   },
// ];

// Used to hold and display full list of available meals users can select and add
const AvailableMeals = () => {

  const [meals, setMeals] = useState([]);

  useEffect(() => {
    const fetchMeals = async () => {
      const response = await fetch('https://react-http-default-rtdb.firebaseio.com/meals.json')  
      const responseData = await response.json()

      const loadedMeals = [];

      for (const key in responseData) {
        loadedMeals.push({
          id: key,
          name: responseData[key].name,
          description: responseData[key].description,
          price: responseData[key].price
        })
      }

      setMeals(loadedMeals);

    }
    fetchMeals();
  }, [])
  

  // Create a <MealItem> for all meals within DUMMY_MEALS array to display individual information
  // Use meal.id as key since those should be unique and only 1 <MealItem> is generated per meal
  const mealsList = meals.map((meal) => {
    return (<MealItem 
              id={meal.id}
              key={meal.id}
              name={meal.name}
              description={meal.description}
              price={meal.price}
            />)
  })

  return (
    // Section to hold meals list and sepearte it from <MealsSummary sibling in dom>
    <section className={classes.meals}>
      {/* Card to hold and style overall list of meals */}
      <Card>
        <ul>
          {/* Full list of mapped <MealItem> components (1 for each meal in DUMMY_MEALS) */}
          {mealsList}
        </ul> 
      </Card>
    </section>
  )
}

export default AvailableMeals

```

Now if you save and reload you can see a brief instant where the food is not loaded before it appears




___
## 217. Handling the Loading State
Now that we are fetching data there is a time period where there is no data to show
It might be helpful to show a loading icon if the content hasn't loaded yet
That way if there is a delay or it takes a long time the user knows it is doing something

To do this we will manage more state
We could use `useReducer` but don't have to
I will because I like it better than `useState` but the teacher will be using `useState`
The logic should remain the same though

For the reducer approach we will need to create an initial state object that we will use
We need to add `meals` to this state with an empty array as well as an `isLoading` boolean which is initialized to false
This is because we may not want to start fetching as soon as the page loads all the time so we don't want a loading state when it is not loading
Instead we will set this `isLoading` to true whenever we start our fetch action
```js
const initialMealState = {
  meals: [],
  isLoading: false
}
``` 
Next we will need a reducer function
For now it will just return this initial state object
```js
const mealStateReducer = (state, action) => {
  return initialMealState;
}
```

Then we need our `useReducer` call itself which will receive this reducer function as an argument along with the initial state object
It will also return an array that will make available a state object we can access as well as a method to access our reducer function
```js
const [mealState, dispatch] = useReducer(mealStateReducer, initialMealState)
```

Now we will create our action to update the loading value and use it in our fetch method to start the loading
```js
const mealStateReducer = (state, action) => {
  if (action.type === 'UPDATE_LOADING') {
    return {...state, isLoading: action.value};
  }
  return initialMealState;
}
```
Then just call it in the fetch function and pass in a true value since we are starting the loading
We will also want to reset this value back to false once the loading is done
```js
useEffect(() => {
    const fetchMeals = async () => {
      dispatch({type: 'UPDATE_LOADING', value: true})

      const response = await fetch('https://react-http-default-rtdb.firebaseio.com/meals.json')  
      const responseData = await response.json()

      const loadedMeals = [];

      for (const key in responseData) {
        loadedMeals.push({
          id: key,
          name: responseData[key].name,
          description: responseData[key].description,
          price: responseData[key].price
        })
      }

      setMeals(loadedMeals);
      dispatch({type:'UPDATE_LOADING', value: false})

    }
    fetchMeals();
  }, [])
```

Above we are still use `setMeals` so we need to change that to a dispatch action and create one
```js
const mealStateReducer = (state, action) => {
  if (action.type === 'UPDATE_MEALS') {
    return {...state, meals: action.value};
  }
  
  if (action.type === 'UPDATE_LOADING') {
    return {...state, isLoading: action.value};
  }
  return initialMealState;
}
```

Then call that dispatch action
```js
useEffect(() => {
  const fetchMeals = async () => {
    dispatch({type: 'UPDATE_LOADING', value: true})

    const response = await fetch('https://react-http-default-rtdb.firebaseio.com/meals.json')  
    const responseData = await response.json()

    const loadedMeals = [];

    for (const key in responseData) {
      loadedMeals.push({
        id: key,
        name: responseData[key].name,
        description: responseData[key].description,
        price: responseData[key].price
      })
    }

    dispatch({type: 'UPDATE_MEALS', value: loadedMeals});
    dispatch({type: 'UPDATE_LOADING', value: false});

  }
  fetchMeals();
}, [])
```

Now we can remove the original `meals` `useState` call
Also make sure that you are accessing the `mealsState.meals` in our map function to create meal components
```js
const mealsList = mealState.meals.map((meal) => {
  return (<MealItem 
            id={meal.id}
            key={meal.id}
            name={meal.name}
            description={meal.description}
            price={meal.price}
          />)
})
```

Now we can handle what happens when `isLoading` is true
We want to check if `isLoading` is true before we even map our `mealsList` because if it is loading that means `mealsState` doesn't have values yet and it would be a waste of time and resources
If this `isLoading` check is true we will trigger the return of some jsx that way we don't hit this mapping at all 

For now we can just return a simple section holding a paragraph
```js
if(mealState.isLoading){
  return (
    <section>
      <p>Loading...</p>
    </section>
  )
}
```

Now if you save and reload there will be a brief flash of loading but it isn't styled
Let's go ahead and add a class to it and some quick styling so it is more apparent
```js
if(mealState.isLoading){
  return (
    <section className={classes.mealsLoading}>
      <p>Loading...</p>
    </section>
  )
}
```
For the css:
```css
.mealsLoading {
  text-align: center;
  color: white;
}
```

Now the loading text will be more visible for the brief period that it is showing




___
## 218. Handling Errors
Now lets try simulating an error and then being sure that we can handle it
To trigger an error we can introduce a typo into our `fetch('url')`
This will cause something other than the data we are looking for to be returned by firebase
Remove `.json` from the end of the firebase url
If you save and reload you will see an error where we failed to fetch that data
Users won't usually check the console so we should show this error on the screen
We will replace the loading text with the error message
So we will need to use a third state
We will call this `httpError` which can be initialized to `false`, `null`, or even `undefined`
It isn't a true false value, later we will have a message and then after that we will want it cleared again
I will use null since that seems like a good descriptor
```js
const initialMealState = {
  meals: [],
  isLoading: false,
  httpError: null
}
```
If you used a reducer that all you need to add for it to be initialized in state

Now when we fetch data and fail we want to set this error
First we have to check that the fetch did fail
We can do this by just checking `response.ok` if it is falsey (not ok) then we hit an error and didn't get the data we were trying to get
If that is the case we want to throw a new error were we say "something went wrong"
We could look into the response and find something more specific but this will do for now
If we throw this as a new error then the next lines won't execute
```js
const AvailableMeals = () => {
  const [mealState, dispatch] = useReducer(mealStateReducer, initialMealState)

  useEffect(() => {
    const fetchMeals = async () => {
      dispatch({type: 'UPDATE_LOADING', value: true});

      const response = await fetch('https://react-http-82bca-default-rtdb.firebaseio.com/meals');

      if (!response.ok) {
        throw new Error('Something went wrong');
      }

      const responseData = await response.json()

      const loadedMeals = [];

      for (const key in responseData) {
        loadedMeals.push({
          id: key,
          name: responseData[key].name,
          description: responseData[key].description,
          price: responseData[key].price
        })
      }

      dispatch({type: 'UPDATE_MEALS', value: loadedMeals});
      dispatch({type: 'UPDATE_LOADING', value: false});

    }
    fetchMeals();
  }, [])
  ...
```
The advantage to placing and then calling fetchMeals over doing this as an anonymous arrow function is that now our call to fetchMeals can now return an error
That means we can go to where we call `fetchMeals` and wrap it with `try` and write a `catch` statement as well
If we did this as an anonymous function we wouldn't be able to do this
```js
      dispatch({type: 'UPDATE_MEALS', value: loadedMeals});
      dispatch({type: 'UPDATE_LOADING', value: false});

    }

    try {
      fetchMeals();
    } catch {
      
    }
  }, [])
```

Now inside of the catch we need to handle what happens if there is an error
First we have to reset our loading state to false
Even though we didn't get the data we still aren't loading anymore
Then we need to set our `httpError` to the error that was caught
Remember with try/catch that catch can receive the error as an argument and error has a message property we can use
```js
try {
  fetchMeals();
} catch (error){
  dispatch({type: 'UPDATE_LOADING', value: false});
  dispatch({type: 'UPDATE_ERROR', value: error.message})
}
```

Now we have an error state we can use to check if we have an error or not
After we have checked if we are loading we can add an if statement to trigger if our state `httpError` is truthy (not null)
Then in there we can display text, just like for our loading if block, except output the error message held in state
```js
if(httpError){
  return (
    <section className={classes.mealsError}>
      <p>{httpError}</p>
    </section>
  )
}
```

Now we have to write that css class we just added
```css
.mealsError {
  text-align: center;
  color: red;
}
```

One issue we have before this works is that `fetchMeals` returns a promise and if you throw an error in a promise it breaks it
The way to fix that is to use the `await` keyword where we call `fetchMeals` but as discussed earlier we cannot do that
We can add `.catch()` to the end of our `fetchMeals()` call though instead of using try/catch
Then we just pass our catch logic into there as an arrow function
```js
fetchMeals().catch((error)=>{
  dispatch({type: 'UPDATE_LOADING', value: false});
  dispatch({type: 'UPDATE_ERROR', value: error.message})
});
```


Now if we save and reload we will see the error after a short load

Now we have an http request to fetch our meal data and can handle any errors it might throw




___
## 219. Adding A Checkout Form
Now that we are getting our menu items from firebase and we can add them to the cart lets work on a checkout process
We have an order button but it doesn't do anything
We want to make sure that when we click the order button we exand the modal and show a form
In this form the user will enter their address and name
Then we will confirm that input with them before we send it to the backend
The first step is to add the form and validation for it

We want to work in the `<Cart>` component
We will want to add a new component (the form) above the buttons in this cart component
So create a new component called `<Checkout>` and a css module for it
Create: src/Components/Cart/Checkout.jsx && src/Components/Cart/Checkout.module.css
Checkout.module.css
```css
.form {
  margin: 1rem 0;
  height: 17rem;
  overflow: auto;
}

.control {
  margin-bottom: 0.5rem;
}

.control label {
  font-weight: bold;
  margin-bottom: 0.25rem;
  display: block;
}

.control input {
  font: inherit;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 20rem;
  max-width: 100%;
}

.actions {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
}

.actions button {
  font: inherit;
  color: #5a1a01;
  cursor: pointer;
  background-color: transparent;
  border: none;
  border-radius: 25px;
  padding: 0.5rem 2rem; 
}

.actions button:hover,
.actions button:active {
  background-color: #ffe6dc;
}

.actions .submit {
  border: 1px solid #5a1a01;
  background-color: #5a1a01;
  color: white;
}

.actions .submit:hover,
.actions .submit:active {
  background-color: #7a2706;
}

.invalid label {
  color: #ca3e51;
}

.invalid input {
  border-color: #aa0b20;
  background-color: #ffeff1;
}
```

Now in the `<Checkout>` component we will want to create our functional component
```js
import classes from './Checkout.module.css';


const Checkout = () => {
  return (
    <div>Checkout</div>
  )
}

export default Checkout
```
Now we can start on the markup for the form
```js
import classes from './Checkout.module.css';


const Checkout = () => {
  return (
    <form>
      <div className={classes.control}>
        <label htmlFor="name">Your name</label>
        <input type="text" id="name" />
      </div>
      <div className={classes.control}>
        <label htmlFor="street">Street</label>
        <input type="text" id="street" />
      </div>
      <div className={classes.control}>
        <label htmlFor="postal">Postal Code</label>
        <input type="text" id="postal" />
      </div>
      <div className={classes.control}>
        <label htmlFor="city">City</label>
        <input type="text" id="city" />
      </div>
      <button>Confirm</button>
    </form>
  )
}

export default Checkout
```

Now we can add this to the cart by importing it and calling it below the total amount
For now we will make it always render but will change it later to show only when the order button is clicked
Cart.jsx
```js
return (
  // Modal UI component to display the cart inside of
  // <Modal> contains a backdrop and an area to accept children such as the content of this card component
  // Accepts `onHideCart` to close modal when backdrop is clicked
  <Modal onHideCart={props.onHideCart}>
    {/* Output cartItem <ul> with items rendered as <CartItem>; if empty then empty list rendered*/}
    <div>{cartItems}</div>
    {/* Total cart value and label */}
    <div className={classes.total}>
      {/* Label */}
      <span>Total Amount</span>
      {/* Formatted value */}
      <span>{totalAmount}</span>
    </div>
    <Checkout/>
    {/* Hold cart action buttons such as "Close" and "Order" */}
    <div className={classes.actions}>
      {/* Close Cart modal button */}
      <button className={classes['button--alt']} onClick={props.onHideCart}>Close</button>
      {/* Conditionally show "Order" button depending on if there are items in the cart
            hasItems will only be true if cart is not empty (set above)*/}
      {hasItems && <button className={classes.button}>Order</button>}
    </div>
  </Modal>
)
```

Now we will make sure this form will only show up when we click order
We will also want to hide the two close and order buttons and only show the confirm (and maybe a cancel button)

For the first part we want to attach the order button to an action to show the form
Currently the order button doesn't have a class attached to it
We can add an `onClick` listener to trigger a function to handle that order
```js
{hasItems && <button className={classes.button} onClick={orderHandler}>Order</button>}
```

In order to manage this we will need a state that gets changed in the `orderHandler` 
So import `useState` and call it to create a state to manage whether or not this form shows
```js
const [isCheckOut, setIsCheckOut] = useState(false);
```
We want this to be false initially so it hides the checkout but when the order button is clicked `orderHandler` will make this true
```js
  const orderHandler = () => {
    setIsCheckOut(true);
  }
```
Now we can check `isCheckout` to determine whether to show the checkout form
```js
return (
  // Modal UI component to display the cart inside of
  // <Modal> contains a backdrop and an area to accept children such as the content of this card component
  // Accepts `onHideCart` to close modal when backdrop is clicked
  <Modal onHideCart={props.onHideCart}>
    {/* Output cartItem <ul> with items rendered as <CartItem>; if empty then empty list rendered*/}
    <div>{cartItems}</div>
    {/* Total cart value and label */}
    <div className={classes.total}>
      {/* Label */}
      <span>Total Amount</span>
      {/* Formatted value */}
      <span>{totalAmount}</span>
    </div>
    {isCheckOut && <Checkout/>}
    ...
```
Now when we save initially there is no form but when we click order it appears

As a nice touch lets hide the order and cancel buttons if the checkout form is showing
To keep it clean we will take the div with the buttons out and use a constant instead
We can call it modal actions 
We can then set it so it shows the buttons we just removed when the form is hidden but has no content when the form is showing
```js
  ...
  const modalActions = (
    // Hold cart action buttons such as "Close" and "Order" 
    < div className = { classes.actions } >
      {/* Close Cart modal button */ }
      < button
          className = { classes['button--alt']}
          onClick = { props.onHideCart }> Close</ button>
      {/* Conditionally show "Order" button depending on if there are items in the cart
      hasItems will only be true if cart is not empty (set above)*/}
      {hasItemds &&
      <button
        className={classes.button}
        onClick={orderHandler}>Order</button>
      }
    </div >
  );

  return (
    // Modal UI component to display the cart inside of
    // <Modal> contains a backdrop and an area to accept children such as the content of this card component
    // Accepts `onHideCart` to close modal when backdrop is clicked
    <Modal onHideCart={props.onHideCart}>
      {/* Output cartItem <ul> with items rendered as <CartItem>; if empty then empty list rendered*/}
      <div>{cartItems}</div>
      {/* Total cart value and label */}
      <div className={classes.total}>
        {/* Label */}
        <span>Total Amount</span>
        {/* Formatted value */}
        <span>{totalAmount}</span>
      </div>
      {isCheckOut && <Checkout/>}
      {!isCheckout && modalActions}
    </Modal>
  )
}
```

Now the buttons hide whenever order is clicked

Next we can add a new button to the form
```js
<div className={classes.control}>
  <label htmlFor="city">City</label>
  <input type="text" id="city" />
</div>
<button type="button">Cancel</button>
<button>Confirm</button>
```
notice that we set a type of button to the cancel button so that it doesn't submit the form when clicked

If we click the cancel button we want to close the modal 
That means we want to do the same thing we did in the card button when it's closed button is clicked
This is trigger by the `props.onHideCart` function in `<Cart>`

So we are going to want to pass that prop into the `<Checkout>` component
```js
<button type="button" onClick={props.onCancel}>Cancel</button>
```
in `<Cart>`
```js
{isCheckout && <Checkout onCancel={props.onHideCart}/>}
```
We are passing props through multiple levels of components and could use context but we don't really need to right now

Now we can add an item to the cart, click order, then click cancel and the entire cart modal will close

Let's setup our confirm button
This will be trigger by the form `onSubmit` action and needs to use the event object it receives to prevent the default submission of the form
```js
const confirmHandler = (event) => {
    event.preventDefault();
  }

return (
  <form onSubmit={confirmHandler}>
    <div className={classes.control}>
    ...
```




___
## 220. Reading From Values
If you didn't add the styling previously go ahead and add it now (Checkout.module.css)
You will need this file along with updated css for Modal.module.css
There is also a Checkout.js file you can import as well, it doesn't have any different features than we have already developed, just some of the code is organized slightly differently such as wrapping buttons in a div and adding classes so the css works better
Checkout.modue.css ('.form {height: value}` changed from laste section)
```css
.form {
  margin: 1rem 0;
  height: 19rem;
  overflow: auto;
}

.control {
  margin-bottom: 0.5rem;
}

.control label {
  font-weight: bold;
  margin-bottom: 0.25rem;
  display: block;
}

.control input {
  font: inherit;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 20rem;
  max-width: 100%;
}

.actions {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
}

.actions button {
  font: inherit;
  color: #5a1a01;
  cursor: pointer;
  background-color: transparent;
  border: none;
  border-radius: 25px;
  padding: 0.5rem 2rem; 
}

.actions button:hover,
.actions button:active {
  background-color: #ffe6dc;
}

.actions .submit {
  border: 1px solid #5a1a01;
  background-color: #5a1a01;
  color: white;
}

.actions .submit:hover,
.actions .submit:active {
  background-color: #7a2706;
}

.invalid label {
  color: #ca3e51;
}

.invalid input {
  border-color: #aa0b20;
  background-color: #ffeff1;
}
```
Modal.module.css (`.modal {top: value}` changed) 
```js
.backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  z-index: 20;
  background-color: rgba(0, 0, 0, 0.75);
}

.modal {
  position: fixed;
  top: 15vh;
  left: 5%;
  width: 90%;
  background-color: white;
  padding: 1rem;
  border-radius: 14px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
  z-index: 30;
  animation: slide-down 300ms ease-out forwards;
}

@media (min-width: 768px) {
  .modal {
    width: 40rem;
    left: calc(50% - 20rem);
  }
}

@keyframes slide-down {
  from {
    opacity: 0;
    transform: translateY(-3rem);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
```
Checkout.js
```js
import classes from './Checkout.module.css';

const Checkout = (props) => {
  const confirmHandler = (event) => {
    event.preventDefault();
  };

  return (
    <form className={classes.form} onSubmit={confirmHandler}>
      <div className={classes.control}>
        <label htmlFor='name'>Your Name</label>
        <input type='text' id='name' />
      </div>
      <div className={classes.control}>
        <label htmlFor='street'>Street</label>
        <input type='text' id='street' />
      </div>
      <div className={classes.control}>
        <label htmlFor='postal'>Postal Code</label>
        <input type='text' id='postal' />
      </div>
      <div className={classes.control}>
        <label htmlFor='city'>City</label>
        <input type='text' id='city' />
      </div>
      <div className={classes.actions}>
        <button type='button' onClick={props.onCancel}>
          Cancel
        </button>
        <button className={classes.submit}>Confirm</button>
      </div>
    </form>
  );
};

export default Checkout;
```

Now that our files have these slight changes we have a scrollable form underneath the total amount that shows whenever the order button is clicked

Now if we add things to the cart and click order we should see our form

Now lets work on getting our data
We have two main options to do this we can either listen to every keystroke and update the a state with a new value on every key
Or we can use a ref and get the value once when the form is submitted
In the form section we covered multiple ways to handle this
We will keep it simple here
We won't get the values with every keystroke
Instead we will only get those values when the form is submitted

We can get a reference for each of our inputs by importing and calling `useRef` and assigning the return to a variable
Then we just have to assign that variable as the value to the associated inputs `ref` property
```js
const nameInputRef = useRef()
const streetInputRef = useRef()
const postalInputRef = useRef()
const cityInputRef = useRef()
```

Now add those refs to the form elements
```js
return (
  <form className={classes.form} onSubmit={confirmHandler}>
    <div className={classes.control}>
      <label htmlFor='name'>Your Name</label>
      <input type='text' id='name' ref={nameInputRef} />
    </div>
    <div className={classes.control}>
      <label htmlFor='street'>Street</label>
      <input type='text' id='street' ref={streetInputRef} />
    </div>
    <div className={classes.control}>
      <label htmlFor='postal'>Postal Code</label>
      <input type='text' id='postal' ref={postalInputRef} />
    </div>
    <div className={classes.control}>
      <label htmlFor='city'>City</label>
      <input type='text' id='city' ref={cityInputRef} />
    </div>
    <div className={classes.actions}>
      <button type='button' onClick={props.onCancel}>
        Cancel
      </button>
      <button className={classes.submit}>Confirm</button>
    </div>
  </form>
);
```
Now we have these refs and can allow the user to read these values when the form is submitted within our `confirmHandler`
```js
const confirmHandler = (event) => {
  event.preventDefault();

  const enteredName = nameInputRef.current.value;
  const enteredStreet = streetInputRef.current.value;
  const enteredPostal = postalInputRef.current.value;
  const enteredCity = cityInputRef.current.value;
}
```
Now we have collected the input from the user
We need to work on validating it




___
## 221. Adding Form Validation
We will use pretty simple validation
We will just make sure that the fields are not empty and that the postal code is exactly 5 digits long

We can use a couple of helper functions (outside of the component function) so that way we can re-use them
The first one is the `isEmpty` function which will accept an argument (the value to check)
Then it will make sure this value is not an empty string
```js
const isEmpty = (value) => value.trim() === '';
```
The second will just check that the length of the value is exactly 5 characters
```js
const isFiveChars = (value) => value.trim().length === 5;
```
Now we can use these to validate our entered values
```js
const enteredNameIsValid = !isEmpty(enteredName);
const enteredStreetIsValid = !isEmpty(enteredStreet);
const enteredCityIsValid = !isEmpty(enteredCity);
const enteredPostalIsValid = isFiveChars(enteredPostal);
```
Now we can check if the entire form is valid if all of these constants are true
We are doing this very explicity and step by step so it is easy to come back and change and readable
```js
const formIsValid = enteredNameIsValid && enteredStreetIsValid && enteredCityIsValid && enteredPostalIsValid;
```

Now that we can check the form validity we can use an if statement to break out and show an error if `formIsValid` is false
```js
if(!formIsValid) {
  //set an error and give feedback
  return;
}
```
We can add the details for this a little later for now we will work on updating the state just before that if check is hit
We want a state to hold the validity of each of our fields that way we can update/check this state for their validity when showing a user what went wrong
The teacher will use `useState` holding an object
I will use `useReducer` because I like it better
Create an initial state object, a reducer function, and a call to `useReducer` that accepts both of these as arguments and returns an array to access state and dispatch function
```js
const INITIAL_INPUTS_VALIDITY_STATE = {
  name: true,
  street: true,
  city: true,
  postal: true,
}

const inputsValidityReducer = (state, action) => {
  return INITIAL_INPUTS_VALIDITY_STATE;
}

const Checkout = (props) => {

  const [formInputsValidity, formDispatch] = useReducer(inputsValidityReducer, INITIAL_INPUTS_VALIDITY_STATE)

  ...
```
We will set these as true even though they technically aren't 
We could mess with a touched state like we did in the previous section but will not for the sake of keeping this simple for now

Now the goal is to update each field for different inputs when we submit the form
This will update the 'true' values with the actual validity
We can do 

Before we even check the form validity we can update these values (right after we check validity)
```js
formDispatch({type: 'VALIDATE_FORM', value: {
  enteredNameIsValid,
  enteredStreetIsValid,
  enteredCityIsValid,
  enteredPostalIsValid
}});
```

We will also need to write our dispatch action to handle this update
```js
const inputsValidityReducer = (state, action) => {

  if (action.type === 'VALIDATE_FORM'){
    return {
      ...state,
      name: action.value.enteredNameIsValid,
      street: action.value.enteredStreetIsValid,
      city: action.value.enteredCityIsValid,
      postal: action.value.enteredPostalIsValid
    };
  }

  return INITIAL_INPUTS_VALIDITY_STATE;
}
```

Now that we have these values set in state we can use these true/false values to show a message in the form if these state values are false
```js
return (
  <form className={classes.form} onSubmit={confirmHandler}>
    <div className={classes.control}>
      <label htmlFor='name'>Your Name</label>
      <input type='text' id='name' ref={nameInputRef} />
      {!formInputsValidity.name && <p>Please enter a valid name</p>}
    </div>
    <div className={classes.control}>
      <label htmlFor='street'>Street</label>
      <input type='text' id='street' ref={streetInputRef} />
      {!formInputsValidity.street && <p>Please enter a valid street</p>}
    </div>
    <div className={classes.control}>
      <label htmlFor='postal'>Postal Code</label>
      <input type='text' id='postal' ref={postalInputRef} />
      {!formInputsValidity.postal && <p>Please enter a valid postal code</p>}
    </div>
    <div className={classes.control}>
      <label htmlFor='city'>City</label>
      <input type='text' id='city' ref={cityInputRef} />
      {!formInputsValidity.city && <p>Please enter a valid city</p>}
    </div>
    <div className={classes.actions}>
      <button type='button' onClick={props.onCancel}>
        Cancel
      </button>
      <button className={classes.submit}>Confirm</button>
    </div>
  </form>
);
```

Now if we save and don't fill in a field the error message will show up beneath it
Fields with valid inputs will not have this message

We can also conditionally add the `.invalid` class from our updated css to the div if the form is invalid
To do this we can use a template literal and ternary expression
Remember we want to always show the `.control` class
```js
<div className={`${classes.control} ${formInputsValidity.name ? '' : classes.invalid}`}>
  <label htmlFor='name'>Your Name</label>
  <input type='text' id='name' ref={nameInputRef} />
  {!formInputsValidity.name && <p>Please enter a valid name</p>}
</div>
```

We could also do this as a constant that is passed in as well
```js
const nameControlClasses = `${classes.control} ${formInputsValidity.name ? '' : classes.invalid }`
const streetControlClasses = `${classes.control} ${formInputsValidity.street ? '' : classes.invalid}`
const postalControlClasses = `${classes.control} ${formInputsValidity.postal ? '' : classes.invalid}`
const cityControlClasses = `${classes.control} ${formInputsValidity.city ? '' : classes.invalid}`
```
```js
return (
  <form className={classes.form} onSubmit={confirmHandler}>
    <div className={nameControlClasses}>
      <label htmlFor='name'>Your Name</label>
      <input type='text' id='name' ref={nameInputRef} />
      {!formInputsValidity.name && <p>Please enter a valid name</p>}
    </div>
    <div className={streetControlClasses}>
      <label htmlFor='street'>Street</label>
      <input type='text' id='street' ref={streetInputRef} />
      {!formInputsValidity.street && <p>Please enter a valid street</p>}
    </div>
    <div className={postalControlClasses}>
      <label htmlFor='postal'>Postal Code</label>
      <input type='text' id='postal' ref={postalInputRef} />
      {!formInputsValidity.postal && <p>Please enter a valid postal code</p>}
    </div>
    <div className={cityControlClasses}>
      <label htmlFor='city'>City</label>
      <input type='text' id='city' ref={cityInputRef} />
      {!formInputsValidity.city && <p>Please enter a valid city</p>}
    </div>
    <div className={classes.actions}>
      <button type='button' onClick={props.onCancel}>
        Cancel
      </button>
      <button className={classes.submit}>Confirm</button>
    </div>
  </form>
);
```
This is a little cleaner
We do have some code duplication that could be cleaned up if we were to use a custom input component or hooks or something