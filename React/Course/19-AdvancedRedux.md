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