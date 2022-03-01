# Section 19: Advanced Redux
Section github: https://github.com/academind/react-complete-guide-code/tree/18-diving-into-redux
___
## 250. Module Introduction
Last section we covered the basics of redux
This section we will dive a little deeper and explore some of the advanced concepts including:
1. Handling async tasks with redux
2. Where to put our code
3. Look at the redux devtools and how to use them




___
## 251. Redux & Side Effects (and Asynchronous Code)
Let's start with looking at async code and side effects in general (even with synchronous code) with regards to redux

Our reducer functions MUST be pure, side-effect free, synchronous functions
We have to be able to enter an input and receive an output without any async or side effects
The same input should always produce the same output without any side effects 

That does bring up an important question
What if we dispatch an action that does involve a side effect? (such as an http request)
Where should we put that code?
The reducer function is clearly not an option

There are two possible places we can put them
We can put them directly in the component (like with `useEffect` like we have before)
Then we only dispatch the action once that side effect is complete
OR
We write our own action creator functions and do not use the automatically generated ones that redux toolkit gives us
For these action creators redux does have a solution that allows us to perform side effects and run async tasks without changing the reducer function so it stays side effect free

We will look at both options in this section and so there will be a new project that we will start
See this github repo: https://github.com/academind/react-complete-guide-code/tree/19-advanced-redux/code/01-starting-project

We are going to build a basic react redux application and explore async code with redux




___
## 252. Refresher/Practice: Part 1/2
The starting project from the previous lesson can be found here
This is what we will use to explore these new concepts
In case you missed it: 
https://github.com/academind/react-complete-guide-code/tree/19-advanced-redux/code/01-starting-project

Get the project, npm install, git init etc...
Then we have to add redux to this project because it has not been included yet
Currently the app does nothing and only shows a dummy data

When the app is complete the following features will be added
1. When we click cart then toggle a cart list of items
2. When we click add to cart then the item is added to the cart 
  - If it is already a part of the cart we just increase the existing quantity of the item
3. In the cart with the buttons we want to control the quantity
  - If the quantity is 1 and we click minus we remove the item entirely

First we will need to setup redux with react-redux and redux toolkit
Be sure there is no dev server running then run:
```bash
$ npm install @reduxjs/toolkit react-redux
```
You could use just redux and react redux but this makes working with redux either

Once both are installed we can start setting up the redux logic

Within src create a store folder and index.js file which will setup the redux store
We will also want to manage a few slices
1. To hold the cart item data
2. To hold information on whether the cart should be shown or not
So we will create a slice file for each of those as well

create: src/store/index.js
create: src/store/ui-slice.js
create: src/store/cart-slice.js

These could be in one file but this keeps in maintainable and manageable
Now lets get started with the ui slice

We will need to import createSlice from the redux toolkit in order to create a slice
```js
import { createSlice } from "@reduxjs/toolkit";
```

Remember that when we call this function it accepts an object with a few required properties
1. name
2. initial state
3. reducers

The name is pretty straightforward and can be anything we want
For initial state we only need an object with a single key that is a boolean that tracks whether the cart should show or not
We only need one reducer function that toggles the value of our single state value in this slice to the opposite of the current boolean value
Remember that we can only mutate the existing state because of redux toolkit since it manages state behind the scenes and will ensure that state is not mutated even though it looks like we are
Then we can store this slice in a constant and export it as the default as well as the actions object on this slice
```js
import { createSlice } from "@reduxjs/toolkit";

const uiSlice = createSlice({
  name: 'ui',
  initialState: { cartIsVisible: false},
  reducers: {
    toggle(state) {
      state.cartIsVisible = !state.cartIsVisible;
    }
  }
});

export const uiActions = uiSlice.actions
export default uiSlice.reducer;
```
These two exports allows us to import the actions in the file that we need it while importing the reducer in the store/index.js

Now in store/index.js we need to configure our store and receive the state from this slice
To do this we use the `configureStore` method imported from redux toolkit

This method receives an object as an argument and that object should have a single key holding reducer functions within an object
in here we import our uiSlice reducer
This configure store method will return the store object that will hold our redux state which we will want to export
```js
import { configureStore } from "@reduxjs/toolkit";
import uiSliceReducer from './ui-slice';

const store = configureStore({
  reducer: {
    ui: uiSliceReducer;
  }
});

export default store;
```

Now that the store is exported we need to provide it to the application which we can do within index.js (where we render our root application component, not store/index.js)

Here we can import the provider from `react-redux`
Then wrap our app component with it and provide it our store as the store property
```js
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import store from './store/index'

import './index.css';
import App from './App';

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>, 
  document.getElementById('root')
);
```

Now we can utilize our redux store inside of different components

In the main header we have the cart button which when clicked should show the cart area
To do that we need to go to the `<CartButton>` and dispatch the toggle action from store/ui-slice.js

First add an onClick listener and point at a new handler
Write this handler to dispatch the logic for toggling a cart
To do this we will need to import `useDispatch`, call it and capture the returned dispatch function
Then we call this dispatch function and pass in `uiActions.toggle` from `ui-slice` since it is exported in that file as `uiActions`
```js
import { useDispatch } from 'react-redux';
import { uiActions } from '../../store/ui-slice';
import classes from './CartButton.module.css';

const CartButton = (props) => {

  const dispatch = useDispatch();

  const toggleCartHandler = () => { 
    dispatch(uiActions.toggle());
  }

  return (
    <button className={classes.button} onClick={toggleCartHandler}>
      <span>My Cart</span>
      <span className={classes.badge}>1</span>
    </button>
  );
};

export default CartButton;
```

Now we are triggering a state change whenever the button is clicked
However we aren't taking advantage of this state change
We want to render the cart conditionally based on the value of `cartIsVisible` from our `uiSlice` (accessed via `store`)

To do this we should go to the `<App>` component because that is where the cart is rendered
We will need to extract data from redux using `useSelector`

Import it then call it and to use it we need to pass a function that will receive state (from redux) then returns the data we want to use
In this case it is the `cartIsVisible` using the key that we defined in the store reducer
Then we can save the returned value and use it to conditionally show or hide the cart
```js
import { useSelector } from 'react-redux';

import Cart from './components/Cart/Cart';
import Layout from './components/Layout/Layout';
import Products from './components/Shop/Products';

function App() {

  const showCart = useSelector((state) => state.ui.cartIsVisible)

  return (
    <Layout>
      {showCart && <Cart />}
      <Products />
    </Layout>
  );
}

export default App;
```

Now if we save we should be able to hide and show the cart in our app by clicking the cart button

Now we want to manage the cart items so lets work on that
For this we will use the cart-slice.js file and repeat the setup only slightly different
Again we will import `createSlice` call it and pass in the setup object with name, initialStae, and reducers object
For initialState we will want an object with items that is an array (empty to start), and a total quantity of items in the cart (sums up quantity of each item)
```js
import { createSlice } from "@reduxjs/toolkit";

createSlice({
  name: 'cart',
  initialState: {
    items: [],
    totalQuantity: 0,
  },
  reducers:{

  }
})
```

For the reducers we will want to be able to add an item, and a remove item from cart action
These actions will receive state as an argument by default but probably need to receive an action argument so we know what items are being added and the items details

For adding an item we will need to extract the item from the actions payload
We will make action.payload an object holding data about the item when we get there
We want to see if the item already exists in the items array before pushing it to the array 
We can use `.find()` to search our current items array and return true if the array has an item with an id matching the id of the item being added
```js
addItemToCart(state, action){
  const newItem  = action.payload;
  const existingItem = state.items.find(item => item.id === newItem.id)
},
```
If it does not exist we want to add it to the array
We will create the item to be added to the array here instead of using the payload directly
Then if there are changes to the item in the future it shouldn't cause any issues
```js
addItemToCart(state, action){
  const newItem  = action.payload;
  const existingItem = state.items.find(item => item.id === newItem.id)
  if(!existingItem){
    state.items.push({
      itemId: newItem.id,
      name: newitem.title,
      price: newItem.price,
      quantity: 1,
      total: newItem.price,
    });
  }
},
```

Remember we couldn't do this if we weren't using redux toolkit since it makes sure it will not update state in a mutable way

Now we are pushing a new item to the products array if it does not exist in the items array already

Now we have to work on the else case, or if the item does exist in the array already

In that case we want to edit the existing item in the array
Again something we cannot do with plain redux but is ok with the redux toolkit
```js
addItemToCart(state, action) {
  const newItem = action.payload;
  const existingItem = state.items.find(item => item.id === newItem.id)
  if (!existingItem) {
    state.items.push({
      itemId: newItem.id,
      name: newitem.title,
      price: newItem.price,
      quantity: 1,
      totalPrice: newItem.price,
    });
  } else {
    existingItem.quantity++;
    existingItem.totalPrice = existingItem.totalPrice + existingItem.price
  }
},
```




___
## 253. Refresher/Practice: Part 2/2
Now we will work on the removal action
It will receive state as normal as well as an action object
This object will simply hold the id of the item being removed which we can assign to an id
```js
removeItemFromCart(state, action){
  const id = action.payload;
}
```

Now we want to check our list of items to see how many of that item are currently in the array and retrieve its listing
```js
const existingItem = state.items.find((item) => item.id === id);
```

If there is only 1 of that item in the list we want to do something different than if there is more than 1 
Let's start with the case that there is only 1 
In that case we want to remove it from the array
We can do this easily by using filter and updating the array with the new array by filtering out the item we want to remove
```js
if(existingItem.quantity === 1){
  state.items = state.items.filter((item)=> item.id !== id)
}
```
For the else statement we just want to reduce the quantity and the total price
```js
removeItemFromCart(state, action){
  const id = action.payload;
  const existingItem = state.items.find((item) => item.id === id);
  if(existingItem.quantity === 1){
    state.items = state.items.filter((item)=> item.id !== id)
  } else {
    existingItem.quantity--;
    existingItem.totalPrice = existingItem.totalPrice - existingItem.price;
  }
}
```

Now we can update these items to remove items from the array while keeping the other items (hopefully)

Now that our slice is written we will store it in another constant so that it can be exported as well as the actions
```js
import { createSlice } from "@reduxjs/toolkit";

const cartSlice = createSlice({
  name: 'cart',
  initialState: {
    items: [],
    totalQuantity: 0,
    totalAmount: 0
  },
  reducers:{
    addItemToCart(state, action) {
      const newItem = action.payload;
      const existingItem = state.items.find(item => item.id === newItem.id)
      if (!existingItem) {
        state.items.push({
          itemId: newItem.id,
          name: newitem.title,
          price: newItem.price,
          quantity: 1,
          totalPrice: newItem.price,
        });
      } else {
        existingItem.quantity++;
        existingItem.totalPrice = existingItem.totalPrice + existingItem.price
      }
    },
    removeItemFromCart(state, action){
      const id = action.payload;
      const existingItem = state.items.find((item) => item.id === id);
      if(existingItem.quantity === 1){
        state.items = state.items.filter((item)=> item.id !== id)
      } else {
        existingItem.quantity--;
        existingItem.totalPrice = existingItem.totalPrice - existingItem.price;
      }
    }
  }
})

export const cartActions = cartSlice.actions;
export default cartSlice.reducer;
```

Now we need to merge this slice into our overall redux store within store/index.js
First import it then add it to the reducer map
```js
import { configureStore } from "@reduxjs/toolkit";
import uiSliceReducer from './ui-slice';
import cartSliceReducer from './cart-slice';

const store = configureStore({
  reducer: {
    ui: uiSliceReducer,
    cart: cartSliceReducer
  }
});

export default store;
```
Now we should be able to access this slice
In order to do this we will need some real products 
We could manage our products with redux as well but since we don't do anything with them we will just add a `DUMMY_PRODUCTS` array to `<Products>`
Each item in the array will need several keys which we have specified in the cart-slice reducer
These include: 
- id
- title
- price

We will also need to add a description since that is used in the product listing
```js
const DUMMY_PRODUCTS = [
  { id: 'EP1tPM',
    title: 'The Phantom Menace',
    description: 'A long time ago in a galaxy far, far away... ',
    price: 66 
  },
  ...
]
```

Now we want to use the dummy data to dynamically render the items
```js
const Products = (props) => {
  return (
    <section className={classes.products}>
      <h2>Buy your favorite products</h2>
      <ul>
        {DUMMY_PRODUCTS.map((product) => (
          <ProductItem
            key={product.id}
            title={product.title}
            price={product.price}
            description={product.description}
          />
        ))}
      </ul>
    </section>
  );
};
```

Next we want to wire the add item to cart button within `<ProductItem>` to the `addItemToCart` action in our `cart-slice`

To do this we need to add a handler to `<ProductItem>` to handle this click event
In this handler event we want to dispatch these actions
So we will have to import `useDispatch` and the actions from the `cart-slice`
Remember when we call `addItemToCart` we will have to pass in an object with the needed values of id, title, and price
Here title and price are already passed via props but not id so we will need to include that when we call this component as well
```js
<ProductItem
  key={product.id}
  id={product.id}
  title={product.title}
  price={product.price}
  description={product.description}
/>
```
```js
import { useDispatch } from 'react-redux';
import { cartActions } from '../../store/cart-slice';

import Card from '../UI/Card';
import classes from './ProductItem.module.css';

const ProductItem = (props) => {

  const dispatch = useDispatch();

  const { title, price, description, id } = props;

  const addToCartHandler = () => {
    dispatch(cartActions.addItemToCart({
      id: id,
      title: title,
      price: price,
    }));
  } 

  return (
    <li className={classes.item}>
      <Card>
        <header>
          <h3>{title}</h3>
          <div className={classes.price}>${price.toFixed(2)}</div>
        </header>
        <p>{description}</p>
        <div className={classes.actions}>
          <button onClick={addToCartHandler}>Add to Cart</button>
        </div>
      </Card>
    </li>
  );
};

export default ProductItem;
```

Now we need to show the proper items in our cart and the badge
We will start with the badge
For this we go to the `<CartButton>` component
Here we are dispatching actions but we also need to get the data from `cart-slice` to get the total quantity

Sidenote we forgot to update the total quantity in both of our cart handler actions
We will just want to always add/subtract 1 from the total quantity
```js
const cartSlice = createSlice({
  name: 'cart',
  initialState: {
    items: [],
    totalQuantity: 0,
    totalAmount: 0
  },
  reducers:{
    addItemToCart(state, action) {
      const newItem = action.payload;
      const existingItem = state.items.find(item => item.id === newItem.id)
      state.totalQuantity++;
      if (!existingItem) {
        state.items.push({
          itemId: newItem.id,
          name: newItem.title,
          price: newItem.price,
          quantity: 1,
          totalPrice: newItem.price,
        });
      } else {
        existingItem.quantity++;
        existingItem.totalPrice = existingItem.totalPrice + existingItem.price
      }
    },
    removeItemFromCart(state, action){
      const id = action.payload;
      const existingItem = state.items.find((item) => item.id === id);
      state.totalQuantity--;
      if(existingItem.quantity === 1){
        state.items = state.items.filter((item)=> item.id !== id)
      } else {
        existingItem.quantity--;
        existingItem.totalPrice = existingItem.totalPrice - existingItem.price;
      }
    }
  }
})
```

Now we can import and call `useSelector` to get the slice of state showing the `totalQuantity`
Then we can output that in the badge
```js
import { useDispatch, useSelector } from 'react-redux';
import { uiActions } from '../../store/ui-slice';
import classes from './CartButton.module.css';

const CartButton = (props) => {

  const dispatch = useDispatch();
  const cartQuantity = useSelector((state) => state.cart.totalQuantity);

  const toggleCartHandler = () => { 
    dispatch(uiActions.toggle());
  }

  return (
    <button className={classes.button} onClick={toggleCartHandler}>
      <span>My Cart</span>
      <span className={classes.badge}>{cartQuantity}</span>
    </button>
  );
};

export default CartButton;

```

Now if we save and check our app then the badge on the cart every time we add an item to the cart

Now we want to make sure we render the cart correctly and show the correct data
This is in `<Cart>`
Here we need to get access to the items array that is in our store state
```js
import { useSelector } from 'react-redux';

import Card from '../UI/Card';
import classes from './Cart.module.css';
import CartItem from './CartItem';

const Cart = (props) => {
  const cartItems = useSelector((state) => state.cart.items);
  return (
    <Card className={classes.cart}>
      <h2>Your Shopping Cart</h2>
      <ul>
        {cartItems.map((item) => (
          <CartItem
            key={item.id}
            item={{ title: item.name, quantity: item.quantity, price: item.price, total: item.totalPrice}}
          />
        ))}
      </ul>
    </Card>
  );
};

export default Cart;
```

However but this isn't working quite like we want it to
This is because of a typo in our cart-slice
We are checking for an existing `item.id` but then save the new ids as `item.itemId`
We just need to fix how we save it
```js
addItemToCart(state, action) {
  const newItem = action.payload;
  const existingItem = state.items.find(item => item.id === newItem.id)
  state.totalQuantity++;
  if (!existingItem) {
    state.items.push({
      id: newItem.id,
      name: newItem.title,
      price: newItem.price,
      quantity: 1,
      totalPrice: newItem.price,
    });
  } else {
    existingItem.quantity++;
    existingItem.totalPrice = existingItem.totalPrice + existingItem.price
  }
},
```

Now if we save our cart listing will be correct and group items together

Now let's make sure the minus and plus buttons in the cart items work
For that we need to `<CartItem>` and then import our `cartActions` and `useDispatch` so we can use our actions 
Then we will have to write event handlers for each and make sure that when we call our mehods we pass in the needed data
Make sure you are passing id down from `<Cart>` and accept it in the props here 
```js
<ul>
  {cartItems.map((item) => (
    <CartItem
      key={item.id}
      item={{ id: item.id, title: item.name, quantity: item.quantity, price: item.price, total: item.totalPrice}}
    />
  ))}
</ul>
```
```js
import { useDispatch } from 'react-redux';
import { cartActions } from '../../store/cart-slice';

import classes from './CartItem.module.css';

const CartItem = (props) => {

  const dispatch = useDispatch();

  const { id, title, quantity, total, price } = props.item;

  const removeItemFromCartHandler = () => {
    dispatch(cartActions.removeItemFromCart(id));
  }

  const addItemToCartHandler = () => {
    dispatch(cartActions.addItemToCart({
      id: id,
      title: title,
      price: price
    }));
  }

  return (
    <li className={classes.item}>
      <header>
        <h3>{title}</h3>
        <div className={classes.price}>
          ${total.toFixed(2)}{' '}
          <span className={classes.itemprice}>(${price.toFixed(2)}/item)</span>
        </div>
      </header>
      <div className={classes.details}>
        <div className={classes.quantity}>
          x <span>{quantity}</span>
        </div>
        <div className={classes.actions}>
          <button onClick={removeItemFromCartHandler}>-</button>
          <button onClick={addItemToCartHandler}>+</button>
        </div>
      </div>
    </li>
  );
};

export default CartItem;

```

Now we can add items to our cart and remove them and have all the features we were looking for




___
## 254. Redux & Async Code
Now that we have repeated the core redux basics again lets see how we can connect redux with side effects and asynchronous code
We will add a backend or a server where we can send the card
We want to make it so that whenever you add items to the cart it is saved to a server so that if we reload if we fetch from that server we can fill the cart based on what contents were in there before
For that we will use firebase like we have before

In firebase we will use the same project we have created earlier and it's realtime databse
He gets rid of all the data in this database but I kind of don't want to so I made a new application in firebase

Now we have a backend
We have a couple of different kind of requests we want to make to this backend
We want to post to it and update it whenever we add or remove cards
We also want to fetch from the backend so when we reload we get the cart data

How do we integrate these requests with our application using redux?
Keep in mind reducers must be pure, side-effect free, and synchronous
We cannot send http requests inside of our reducers because it will not work

Instead we have two main options where we can put it
We can execute it in the components and "ignore" redux
Or we can create something called an action creator
We have only used these indirectly and allow us to run async code or code with side effects
We will use both options for the demo




___
## 255. Frontend Code Vs Backend Code
We will first practice running async code from direclty inside of the component
We will start with adding items to the cart from the `<ProductItem>`component
There is a handler in there that is currently being used to dispatch our action but we could also make a POST request using `fetch`
This does pose one issue
If we just send the product data to firebase then we are only storing the product data but firebase doesn't have any logic
We wouldn't be running any extra code and would be added to the database
Our logic that would update our cart wouldn't happen
If you were using firebase for a real project you could add this logic and would be possible
Or if you were building your own backend you could of course do something with the incoming data
But since this course doesn't cover that we won't take that route
This means that the code that we write on the front end will depend on our backend code
If we had a backend api that did a lot of work and didn't just store data but transformed it then our frontend could do less work
It could just send the data to the backend, the backend would take care of it, then the frontend would receive some sort of response which the frontend would use
This would let us slim down our reducer and just take our backend response and store it
Obviously we cannot do that here because this is a front end course and our backend only stores the data it receives
We can't just receive the data in redux we have to also transform it like we are currently




___
## 256. Where To Put Our Logic
So if the backend is not doing that work and we have to do it here and we cannot send our request in the reducer function where do we put our logic?

We cannot send our http request in the reducer but we can do it in the component
One approach we could take is to copy our reducer functionality into our `addToCartHandler`, copy the current state, run our logic on the state and submit the result
This is what that would look like: https://github.com/academind/react-complete-guide-code/tree/19-advanced-redux/code/zz-suboptimal-example-code

However we won't do this because there are some problems
The first of which being we are repeating a lot of code this way
If we were to do this everywhere in the application where we need to update the cart it would get messy
There is still another problem we are doing data transformation in our components instead of in our reducers
Our redux reducers wouldn't really be doing anything other than getting data and storing it
This isn't necessarily bad but isn't the main idea of redux

When it comes to where to put our code we often have to make one of three choices
1. Fat Reducers
2. Fat Components
3. Fat Actions

When doing this we have to differentiate between synchronous side effect free code and code that is async or has side effects

With the suboptimal approach linked above there is a lot of code that is in the component that is synchronous and side effect free so it probably should go in the reducer if possible

For code with side effects or code that is async you should prefer to put it within the component or an action creator but NEVER inside a reducer

So the code above is not the best option
We want to organize our code so the data transformation is in the reducer but the async portion of it is in the component




___
## 257. Using useEffect With Redux
One possible better solution is pretty obvious when you see it
Instead of using the previous approach we can stick to what we were doing originally 
That is, dispatching the `addItemToCart` action and passing the object to our reducer
Then after that we can sync our new state to the server and just update the server with the new state we have after we have updated the state

This way redux will update the store and we send this updated store to our server as the new data to hold
We don't do this inside of the reducer function, we could do it in the `<ProductItem>` 
OR we could do it inside of a completely different component such as `<App>` 
This way if there are other components that update the cart this database update is still triggered

Inside of `<App>` we will get our slice for the cart data with `useSelector` 
```js
const cartData = useSelector((state) => state.cart)
```

Now we can use `useEffect`to watch for changes in `cartData` and run our cart update api call within there
```js
import { useEffect } from 'react';
import { useSelector } from 'react-redux';

import Cart from './components/Cart/Cart';
import Layout from './components/Layout/Layout';
import Products from './components/Shop/Products';

function App() {

  const showCart = useSelector((state) => state.ui.cartIsVisible)
  const cartData = useSelector((state) => state.cart)

  useEffect(() => {
  
  }, [])
  

  return (
    <Layout>
      {showCart && <Cart />}
      <Products />
    </Layout>
  );
}

export default App;

```

Inside of `useEffect` we will want to send an http request to our firebase database and create a `cart.json` node
Then we will send a PUT request
This is new to us and similar to a post request except instead of posting new data alongside other data it will update that node directly
PUT will override the existing cart with whatever data we attach
Then we just set the body to be the cart data (transform it to json first)
Since cart data will be in the `useEffect` function we should list it as a dependency
```js
useEffect(() => {
  fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
    method: 'PUT',
    body: JSON.stringify(cartData)
  })
}, [cartData])
```
Now whenever our store data changes, `useSelector` will notify this component and cause it to reload
This will update `cartData` to have the most recent version of `store.cart`
If it is different than before then our PUT request will update our database with the new cart

Now our database should update when adding or removing items from the cart




___
## 258. A Problem with useEffect()
We face one problem when using useEffect the way we currently do it: It will execute when our app starts.

Why is this an issue?

It's a problem because this will send the initial (i.e. empty) cart to our backend and overwrite any data stored there.

We'll fix this over the next lectures, I just wanted to point it out here!




___
## 259. Handling Http States & Feedback with Redux
Currently we are sending an http request and am not doing anything with the response or handling any potential errors

We will clean it up so that this is taken care of
To do this he has added a new component which should go in the ui folder
Find the files for it here: https://github.com/academind/react-complete-guide-code/tree/19-advanced-redux/extra-files

This component just displays a title and message and displays different css classes based on a status prop that is passed
It is a little bar at the top that says "sending request" or tells if the request was successful or had an error

Now to use this in our fetch function we need to use async await since this is an async function and we will have to handle different promise resolutions
Remember that we can't use the `await` keyword with the function passed into `useEffect` but we can write an async function inside of that function
```js
useEffect(() => {
  const sendCartData = async () => {
    const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
      method: 'PUT',
      body: JSON.stringify(cartData)
    });
  }
}, [cartData])
```

Now we want to handle this response first we will check if the `response.ok` value which we expect to receive is falsey, if it is then we will throw an errror
Otherwise we will transform our response into a javascript object with `.json()` (also needs await keyword)
```js
useEffect(() => {
  const sendCartData = async () => {
    const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
      method: 'PUT',
      body: JSON.stringify(cartData)
    });

    if (!response.ok) {
      throw new Error('Sending Cart Data Failed');
    }

    const responseData = await response.json();
     
  }
}, [cartData])
```
Now we want to trigger a notification that is show if this is successful, we also want this notification to show when we start sending
To do this we could set up a local state to manage this but because we are practicing redux we will do it with redux

We already have a ui slice and can add more to it
We can manage this notification within there
To do that we need to add a notification key to our initial state and set it to null
This is so that initially we don't have a notification
```js
const uiSlice = createSlice({
  name: 'ui',
  initialState: { cartIsVisible: false, notification: null },
  reducers: {
    toggle(state) {
      state.cartIsVisible = !state.cartIsVisible;
    }
  }
});
```

Then we can create a reducer called `showNotification`
This will trigger at different points of our submission/loading process so we will need to accept an action to determine which kind of loading status we want to be in
Here we will set the notification value to an object with a status key that we receive from the payload
```js
const uiSlice = createSlice({
  name: 'ui',
  initialState: { cartIsVisible: false, notification: null },
  reducers: {
    toggle(state) {
      state.cartIsVisible = !state.cartIsVisible;
    },
    showNotification(state, action){
      state.notification = {
        status: action.payload.status,
        title: action.payload.title,
        message: action.payload.message
      }
    }
  }
});
```
Now we can call this show notification and pass in the data we want to update the `store.notification` object in redux
Then we can check the value of this wherever we need to call/show a notification and pass these values in from the redux state when doing so

We want to show this notification for three different types of events
1. When we start submitting the data
2. when we have successfully submitted the data
3. When we hit an error submitting data


So within `<App>` we need to import `useDispatch` so we can use the dispatch functions as well as our `uiActions` so we can select which actions to execute
When we call our dispatch function to execute the `showNotification` action we need to be sure to pass an argument with an object with the appropriate values
```js
import { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { uiActions } from './store/ui-slice';

import Cart from './components/Cart/Cart';
import Layout from './components/Layout/Layout';
import Products from './components/Shop/Products';

function App() {
  const dispatch = useDispatch();
  const showCart = useSelector((state) => state.ui.cartIsVisible)
  const cartData = useSelector((state) => state.cart)

  useEffect(() => {
    const sendCartData = async () => {
      dispatch(uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      }))
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
        method: 'PUT',
        body: JSON.stringify(cartData)
      });

      if (!response.ok) {
        throw new Error('Sending Cart Data Failed');
      }

      const responseData = await response.json();
      
      
    }

  }, [cartData])
  ...
```
Now we should be able to set the initial notification
We also want to set a notification whenever we receive a successful response
We don't care what the response says as long we don't hit the if statement checking the `response.ok` value we want to update to a positive notification
```js
useEffect(() => {
  const sendCartData = async () => {
    dispatch(uiActions.showNotification({
      status: 'pending',
      title: 'Sending...',
      message: 'Sending cart data!'
    }))
    const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
      method: 'PUT',
      body: JSON.stringify(cartData)
    });

    if (!response.ok) {
      throw new Error('Sending Cart Data Failed');
    }

    const responseData = await response.json();
    dispatch(uiActions.showNotification({
      status: 'success',
      title: 'Success!',
      message: 'Sent cart data successfully!'
    }))
    
    
  }

}, [cartData])
```

Now whenever we throw an error lets update the notification
We can do this by calling this sendCartData method we have defined within `useEffect` then adding `.catch()` to catch the error from our if block
We should also add our dispatch function to the dependency array even though it will never change, just for the sake of completeness
```js
useEffect(() => {
  const sendCartData = async () => {
    dispatch(uiActions.showNotification({
      status: 'pending',
      title: 'Sending...',
      message: 'Sending cart data!'
    }))
    const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
      method: 'PUT',
      body: JSON.stringify(cartData)
    });

    if (!response.ok) {
      throw new Error('Sending Cart Data Failed');
    }

    const responseData = await response.json();
    dispatch(uiActions.showNotification({
      status: 'success',
      title: 'Success!',
      message: 'Sent cart data successfully!'
    }));
  }

  sendCartData().catch(error => {
    dispatch(uiActions.showNotification({
      status: 'error',
      title: 'Error!',
      message: 'Sending cart data failed!'
    }));
  })

}, [cartData, dispatch])
```

Now we need to just use the new notification ui state
Within app we want to read the value of this state and conditionally render the notification component if it is not null and provide the component data
We will want to render this side by side with layout so we will need to use a fragment to hold these elements as well
```js
import { useEffect, Fragment } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { uiActions } from './store/ui-slice';

import Cart from './components/Cart/Cart';
import Notification from './components/UI/Notification';
import Layout from './components/Layout/Layout';
import Products from './components/Shop/Products';

function App() {
  const dispatch = useDispatch();
  const showCart = useSelector((state) => state.ui.cartIsVisible)
  const cartData = useSelector((state) => state.cart)
  const notification = useSelector((state) => state.ui.notification)

  useEffect(() => {
    const sendCartData = async () => {
      dispatch(uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      }))
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
        method: 'PUT',
        body: JSON.stringify(cartData)
      });

      if (!response.ok) {
        throw new Error('Sending Cart Data Failed');
      }

      const responseData = await response.json();
      dispatch(uiActions.showNotification({
        status: 'success',
        title: 'Success!',
        message: 'Sent cart data successfully!'
      }));
    }

    sendCartData().catch(error => {
      dispatch(uiActions.showNotification({
        status: 'error',
        title: 'Error!',
        message: 'Sending cart data failed!'
      }));
    })

  }, [cartData, dispatch])
  

  return (
    <Fragment>
      {notification && <Notification status={notification.status} title={notification.title} message={notification.message}/>}
      <Layout>
        {showCart && <Cart />}
        <Products />
      </Layout>
    </Fragment>
    
  );
}

export default App;

```

Now if we save we will see a notification up top as well as a brief loading notification when adding or removing from the cart

The only problem is that this shows immediately as soon as the page loads because we are sending the card state at the beginning
We don't want this because if we do our cart on the backend will be overwritten with an empty cart every time we reload

We want to make sure that we don't send the cart when our `useEffect` runs for the first time

To do this we could add a variable outside of our function 
It will be initialized only when the file is loaded for the first time
We can use this value to check if it is the first time loading the page and if it is we will skip sending the cart data
Then we just have to flip it after hitting that check to be false
```js
import { useEffect, Fragment } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { uiActions } from './store/ui-slice';

import Cart from './components/Cart/Cart';
import Notification from './components/UI/Notification';
import Layout from './components/Layout/Layout';
import Products from './components/Shop/Products';

let isInitial = true;

function App() {
  const dispatch = useDispatch();
  const showCart = useSelector((state) => state.ui.cartIsVisible)
  const cartData = useSelector((state) => state.cart)
  const notification = useSelector((state) => state.ui.notification)

  useEffect(() => {
    const sendCartData = async () => {
      dispatch(uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      }))
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
        method: 'PUT',
        body: JSON.stringify(cartData)
      });

      if (!response.ok) {
        throw new Error('Sending Cart Data Failed');
      }

      const responseData = await response.json();
      dispatch(uiActions.showNotification({
        status: 'success',
        title: 'Success!',
        message: 'Sent cart data successfully!'
      }));
    }

    if(isInitial){
      isInitial = false;
      return;
    }

    sendCartData().catch(error => {
      dispatch(uiActions.showNotification({
        status: 'error',
        title: 'Error!',
        message: 'Sending cart data failed!'
      }));
    })

  }, [cartData, dispatch])
  

  return (
    <Fragment>
      {notification && <Notification status={notification.status} title={notification.title} message={notification.message}/>}
      <Layout>
        {showCart && <Cart />}
        <Products />
      </Layout>
    </Fragment>
    
  );
}

export default App;

```

Now if we reload we don't see the notification until we add items to the cart

Lets test the error state by breaking the url
If you remove `'.json' from the end of the fetch url and try to add something to the cart you should get an error




___
## 260. Using an Action Creator Thunk
Before we fetch data we will see the alternative approach
Currently we are putting our side effect logic inside of the component
The other approach is to use an action creator 
We have actually used this already but we didn't realize it
When we call `uiActions.showNotification` and pass in the object that is an action creator
We get action creators automatically from redux toolkit and we call them to create action objects
We can also write our own action creator to make a "thunk"

What is a thunk?
A thunk is a function that delays an action until after another action has finished
We could write an action creator as a thunk this would make it so that it doesn't immediately return the action object but instead returns another function which will EVENTUALLY return the action
This allows us to run other code before returning the actual action object that we want to create

Let's see how to implement this
We will move hte code for sending the cart data out of the component and into an action creator
We will do this within 'cart-slice'
To make a new action creator we can go to the end of our file (or outside of the slice) and write a new function
Normally we would return an object like this which would be the action object
```js
const sendCartData = (cartData) => { 
  return { type: '', payload:{}}
}
```
Redux toolkit will create these actions for us whenever we dispatch actions automatically so we don't usually have to do this
However instead of returning an object we can return a function instead 
Then that function can run and do whatever it needs to do (even async tasks) and it will return the action object when it is complete
This function will receive dispatch as an argument so it can dispatch the object that it has created using an action 
The important part is before we call dispatch we want to construct the object using the function
```js
const sendCartData = (cartData) => { 
  return (dispatch) => {
    // do async stuff and construct object
    dispatch()
  }
}
```
It is ok to do this because we are not yet running the async code in a reducer because dispatch has not been hit yet
For example we can go to the `<App>` component and grab the first dispatch action before we start submitting the data and use it as the dispatch call in our new `sendCartData`
```js
const sendCartData = (cartData) => { 
  return (dispatch) => {
    // do async stuff and construct object
    dispatch(uiActions.showNotification({ // NOTE: IMPORT uiActions
      status: 'pending',
      title: 'Sending...',
      message: 'Sending cart data!'
    }))
  }
}
```

Now we can dispatch this action from inside this `sendCartData`

Next we want to grab all the code for handling the submission and response
Note that we CAN make this returned function an async function
```js
const sendCartData = (cartData) => { 
  return (dispatch) => {
    // do async stuff and construct object
    dispatch(
      uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      })
    );
    
    const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
      method: 'PUT',
      body: JSON.stringify(cartData)
    });

    if (!response.ok) {
      throw new Error('Sending Cart Data Failed');
    }
  }
}
```

Then we just need the final dispatch action 
```js
const sendCartData = (cartData) => { 
  return async (dispatch) => {
    // do async stuff and construct object
    dispatch(
      uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      })
    );

    const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
      method: 'PUT',
      body: JSON.stringify(cartData)
    });

    if (!response.ok) {
      throw new Error('Sending Cart Data Failed');
    }

    dispatch(
      uiActions.showNotification({
        status: 'success',
        title: 'Success!',
        message: 'Sent cart data successfully!'
      })
    );
  }
}
```

We do have to be able to handle the response and any erros it might throw though so we will add the fetch/response actions to an async method
Then we can call this method and wrap it in try/catch to handle errors
If it succeeds we will run the dispatch action with the success object
If it fails we will do the dispatch with the error
```js
const sendCartData = (cartData) => { 
  return async (dispatch) => {
    // do async stuff and construct object
    dispatch(
      uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      })
    );

    const sendRequest = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
        method: 'PUT',
        body: JSON.stringify(cartData)
      });

      if (!response.ok) {
        throw new Error('Sending Cart Data Failed');
      }
    }

    try {
      await sendRequest();
      dispatch(
        uiActions.showNotification({
          status: 'success',
          title: 'Success!',
          message: 'Sent cart data successfully!'
        })
      );
    } catch (error) {
      dispatch(uiActions.showNotification({
        status: 'error',
        title: 'Error!',
        message: 'Sending cart data failed!'
      }));
    }
  }
}
```

So what are we doing?
We are making a function that when called will immediately returns an async function
In that function we dispatch a notification action, create a new function which is called and it will dispatch an action if it succeeds or fails

So how do we call this function and where?
To start we will clean up the `<App>` component since we just moved all of the functionality
We will keep the `useEffect` call but it will only do the check of `isInitial` and set it to false if it is
```js
 useEffect(() => {
    if(isInitial){
      isInitial = false;
      return;
    }
  }, [cartData, dispatch])
```

Now we will do something different we will want to use this `sendCartData` as an action creator
We do this by still calling dispatch but instead of passing an object we pass this function in
Be sure to export it within cart-slice first
```js
export const sendCartData = (cartData) => { 
  ...
```

Then import and call it within `<App>` (we no longer need `uiActions`)
```js
import { useEffect, Fragment } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { sendCartData } from './store/cart-slice';
```

```js
useEffect(() => {
  if(isInitial){
    isInitial = false;
    return;
  }

  dispatch(sendCartData(cartData))

}, [cartData, dispatch])
```

This looks weird because we haven't done this before and have only passed in action objects
The cool thing is that redux is prepared to receive a function as an action object instead
In the case that this happens redux will execute that function and expect you to dispatch within that executed function

Now when we dispatch redux will execute the function we passed and perform any async actions we need

If we save and reload we should have the same functionality and firebase should be receiving updates

Remember doing it the way we did before is perfectly fine and we can keep this logic in our components
This is just another way to do it and allows us to split our code
Either option is completely fine though




___
## 261. Getting Started with Fetching Data
Now that we know about thunks and action creator thunks we will build another one that fetches the cart data when the application loads
Currently if we reload all of our state is lost but the database still has data from the old cart
But when we add an item that old cart is completely overridden
We want to load the old cart when the page loads so that we dont lose our cart data

To do that we will create another action creator (although you could do this within the component if you felt like)
We would do this within 'cart-slice' but because the file is getting a little big we will create a new store file called cart-actions (name up to you though)
Then we will copy the `sendCartData` function and put it in this actions file
(Make sure you fix your import in `<App>`)
`<App>`
```js
import { useEffect, Fragment } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { sendCartData } from './store/cart-actions';
```
cart-slice.js
```js
import { createSlice } from "@reduxjs/toolkit";

const cartSlice = createSlice({
  name: 'cart',
  initialState: {
    items: [],
    totalQuantity: 0,
    totalAmount: 0
  },
  reducers:{
    addItemToCart(state, action) {
      const newItem = action.payload;
      const existingItem = state.items.find(item => item.id === newItem.id)
      state.totalQuantity++;
      if (!existingItem) {
        state.items.push({
          id: newItem.id,
          name: newItem.title,
          price: newItem.price,
          quantity: 1,
          totalPrice: newItem.price,
        });
      } else {
        existingItem.quantity++;
        existingItem.totalPrice = existingItem.totalPrice + existingItem.price
      }
    },
    removeItemFromCart(state, action){
      const id = action.payload;
      const existingItem = state.items.find((item) => item.id === id);
      state.totalQuantity--;
      if(existingItem.quantity === 1){
        state.items = state.items.filter((item)=> item.id !== id)
      } else {
        existingItem.quantity--;
        existingItem.totalPrice = existingItem.totalPrice - existingItem.price;
      }
    }
  }
})

export const cartActions = cartSlice.actions;
export default cartSlice.reducer;
```
cart-actions.js
```js
import { uiActions } from "./ui-slice";

export const sendCartData = (cartData) => {
  return async (dispatch) => {
    // do async stuff and construct object
    dispatch(
      uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      })
    );

    const sendRequest = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
        method: 'PUT',
        body: JSON.stringify(cartData)
      });

      if (!response.ok) {
        throw new Error('Sending Cart Data Failed');
      }
    }

    try {
      await sendRequest();
      dispatch(
        uiActions.showNotification({
          status: 'success',
          title: 'Success!',
          message: 'Sent cart data successfully!'
        })
      );
    } catch (error) {
      dispatch(uiActions.showNotification({
        status: 'error',
        title: 'Error!',
        message: 'Sending cart data failed!'
      }));
    }
  }
}
```

Now we can add our other action creator that we want to create within this cart-actions file as well
This will also immediately return a function that receives dispatch as an argument just like our other action creator
```js
export const fetchCartData = () => {
  return (dispatch) => { 
    // fetch cart data
    // update state with fetched cart data
  } 
}
```

Now we can create a fetch data function inside of this since we know we will need to handle errors and will need to wrap this function with try/catch
We will just need to make a standard get request to the same url we have been using
```js
export const fetchCartData = () => {
  return (dispatch) => { 
    // fetch cart data
    const fetchData = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json');
    }
    // update state with fetched cart data
  } 
```

Now we are interested in the data so we will need to transform it from json to a js object after we check to see if the response is not ok and throw an error if not
If we do have the data we just want to return it since this is a nested function
```js
export const fetchCartData = () => {
  return (dispatch) => { 
    // fetch cart data
    const fetchData = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json');

      if(!response.ok){
        throw new Error('Could not fetch cart data!');
      }
      const data = await response.json();
      return data;
    }

    // update state with fetched cart data
  } 
}
```

Now we can set up our try/catch to call `fetchData` and catch any errors thrown if response is not ok
In that case we can show a notification with the appropriate error message
We also need to capture the returned data and specify that `fetchData` will be async so we will need to use the await keyword as well as async on the overall function
```js
export const fetchCartData = () => {
  return async (dispatch) => { 
    // fetch cart data
    const fetchData = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json');

      if(!response.ok){
        throw new Error('Could not fetch cart data!');
      }
      const data = await response.json();
      return data;
    }

    try {
      const cartData = await fetchData();
    } catch (error) {
      dispatch(uiActions.showNotification({
        status: 'error',
        title: 'Error!',
        message: 'Fetching cart data failed!'
      }));
    }
    // update state with fetched cart data
  } 
}
```

Lasly we want to use this cartData to set our cart state

The cart we are fetching will be in the format we are sending it to firebase
So it will be an object with an items array of objects and a total quantity key
This is exactly what we need in our front end so we are getting correctly formatted data automatically
This is convenient because we wrote it that way

Because of this we can use the `replaceCart` reducer to replace the empty cart we have when the page first loads with the cart retrieved from firebase
If you don't have this it would look like this:
```js
reducers:{
  replaceCart(state, action) {
    state.items = action.payload.items || []; // Note must include || [] or will cause a crash due to trying to read a null value within the app
    state.totalQuantity = action.payload.totalQuantity || 0; // note must include || 0 or will cause a crash
  },
  ...
```
```js
export const fetchCartData = () => {
  return async (dispatch) => { 
    // fetch cart data
    const fetchData = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json');

      if(!response.ok){
        throw new Error('Could not fetch cart data!');
      }
      const data = await response.json();
      return data;
    }

    try {
      const cartData = await fetchData();
      dispatch(cartActions.replaceCart(cartData))
    } catch (error) {
      dispatch(uiActions.showNotification({
        status: 'error',
        title: 'Error!',
        message: 'Fetching cart data failed!'
      }));
    }
    // update state with fetched cart data
  } 
}
```

Now we just need to call `fetchCartData` somewhere in our application to fetch the data from our database
`<App>` is probably the best place for this

We already have a `useEffect` call and we want to call `fetchCartData` when the application loads 
We could do that inside of the `isInitial` check but it is better and cleaner code to make a second `useEffect` call with an empty dependency array so that it will only run once
```js
import { useEffect, Fragment } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { sendCartData, fetchCartData } from './store/cart-actions';

import Cart from './components/Cart/Cart';
import Notification from './components/UI/Notification';
import Layout from './components/Layout/Layout';
import Products from './components/Shop/Products';

let isInitial = true;

function App() {
  const dispatch = useDispatch();
  const showCart = useSelector((state) => state.ui.cartIsVisible)
  const cartData = useSelector((state) => state.cart)
  const notification = useSelector((state) => state.ui.notification)

  useEffect(() => { 
    dispatch(fetchCartData());
  }, []);

  useEffect(() => {
    if(isInitial){
      isInitial = false;
      return;
    }

    dispatch(sendCartData(cartData))

  }, [cartData, dispatch])
  

  return (
    <Fragment>
      {notification && <Notification status={notification.status} title={notification.title} message={notification.message}/>}
      <Layout>
        {showCart && <Cart />}
        <Products />
      </Layout>
    </Fragment>
    
  );
}

export default App;
```

Now if we save and reload we can add items to the cart and then reload and they will still be there since we are fetching them from firebase

We do have one error and that we get the "Sent cart data successfully" notification even though we shouldn't be
This is because in `<App>` we have a `useEffect` call that executes whenever the cart data changes
Then when the page loads cart is very briefly initially set as empty but the the fetch request happens and updates the cart
This causes an update to the cart which triggers that second `useEffect` call that sends cart data
So as soon as we are retrieving the data we are sending the data right back immediately afterwords
We will prevent this in the next lesson




___
## 262. Finalizing the Fetching Logic
Now we have some fixes we need to apply to our fetching logic
Currently we are resending the card as soon as the application loads
One solution is to go to our cart slice and add a `changed` property which is set to false initially
Then we don't change that value if we replace the cart but we do if we add or remove from the cart
Then within our `useEffect` function we can check if this value is true and only then should we dispatch the `sendCartData` action creator
```js
import { createSlice } from "@reduxjs/toolkit";

const cartSlice = createSlice({
  name: 'cart',
  initialState: {
    items: [],
    totalQuantity: 0,
    changed: false
  },
  reducers:{
    replaceCart(state, action) {
      state.items = action.payload.items || [];
      state.totalQuantity = action.payload.totalQuantity || 0;
    },
    addItemToCart(state, action) {
      const newItem = action.payload;
      const existingItem = state.items.find(item => item.id === newItem.id)
      state.totalQuantity++;
      state.changed = true;
      if (!existingItem) {
        state.items.push({
          id: newItem.id,
          name: newItem.title,
          price: newItem.price,
          quantity: 1,
          totalPrice: newItem.price,
        });
      } else {
        existingItem.quantity++;
        existingItem.totalPrice = existingItem.totalPrice + existingItem.price
      }
    },
    removeItemFromCart(state, action){
      const id = action.payload;
      const existingItem = state.items.find((item) => item.id === id);
      state.totalQuantity--;
      state.changed = true;
      if(existingItem.quantity === 1){
        state.items = state.items.filter((item)=> item.id !== id)
      } else {
        existingItem.quantity--;
        existingItem.totalPrice = existingItem.totalPrice - existingItem.price;
      }
    }
  }
})

export const cartActions = cartSlice.actions;
export default cartSlice.reducer;
```

Now if we reload we are not sending the cart data when the page is loaded
This property will be saved to firebase which we can avoid by going to our `sendRequst` and creating a new object that doesn't include that changed property
```js
export const sendCartData = (cartData) => {
  return async (dispatch) => {
    // do async stuff and construct object
    dispatch(
      uiActions.showNotification({
        status: 'pending',
        title: 'Sending...',
        message: 'Sending cart data!'
      })
    );

    const sendRequest = async () => {
      const response = await fetch('https://redux-http-default-rtdb.firebaseio.com/cart.json', {
        method: 'PUT',
        body: JSON.stringify({items: cartData.items, totalQuantity: cartData.totalQuantity})
      });
      ...
```

Now it syncs to firebase and doesn't include this unnecessary value in the db

At this point max points out a bug that you may have if you did the `replaceCart` reducer function incorrectly
If there is no items in the items array there is no items key in firebase anymore
This makes items not an empty array but is instead undefined
To solve this make sure that when you are replacing cart you  have an or case to use an empty array in case `cartData.items` is undefined
```js
replaceCart(state, action) {
  state.items = action.payload.items || [];
  state.totalQuantity = action.payload.totalQuantity || 0;
},
```
Now items will never be undefined and will be an empty array if it is 
We should be able to add items, remove them, and sync our cart with the backend with several different approaches




___
## 263. Exploring the Redux Dev Tools
Now we have explored a lot of how to deal with redux and handling async function or functions with side effects
There is one more topic to cover this module and that is redux dev tools
These are extra tools we can use which makes debugging redux state easier

In large applications it can be difficult to find errors without diving into different components
You can find info here: https://github.com/reduxjs/redux-devtools
I just downloaded the chrome extension

When using redux without redux toolkit you need some extra code but since we are using toolkit it should work right away (reload your app if it isn't showing)
If you click the icon or go to the devtools and select the redux menu you will see some options
In this panel we can get insights to our redux store and actions
On the left we can see actiions that are dispatched
If we add something to the cart we can see `addItemToCart` being dispatched and `showNotification`
If you click each action you can see the data for the action and payload for the action
This makes it easy to see the impact of our actions

We can even time travel by picking an action and clicking 'jump' which will take us to the moment that action was executed
This can help give much deeper insights into our redux store and understand what is happening