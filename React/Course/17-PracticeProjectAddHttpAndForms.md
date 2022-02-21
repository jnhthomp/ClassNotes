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