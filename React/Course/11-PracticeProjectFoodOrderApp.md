# Section 11: Practice Project: Building a Food Order App
Section github: https://github.com/academind/react-complete-guide-code/tree/11-practice-food-order-app
___
## 131. Module Introduction
The last course sections involved more advanced (yet crucial) react concepts such as `useEffect`, `useContext`, and `useReducer`
Before we dive deeper this course section will be to practice what we learned by building a course project
This is a bigger application where all the key things we learned will come together and can be seen in the context of a bigger project
We will see all core react concepts in action

The application we will build is a food order app
At the top is a red header with a website title as well as a button/section to hold a link to the cart along with a number to signify how many items have been added to the cart so far
Then there is a background image overlayed by a small paragraph text section to tell you about the restaurant
Below that is a list of meals with a title, short description, and price
Each meal has a changeable "Amount" number that is initially set to '1' with a "+ Add" button below to add it to the cart
When clicking the cart a modal pops up showing the items that have been added along with the individual price, the number of the item ordered and a total price
To the right of each item in the modal are a set of "+" and "-" buttons that can be used to increase and decrease the amount of each item
On this modal is a "Close" and "Order" button 
The order button will only output to the console for now

This project may be fairly challenging but if you want to try it on your own go ahead
There is a list of css files that are used for styling available on github so you can focus on just getting the react done and understanding those concepts without being distracted by css

CSS pages: https://github.com/academind/react-complete-guide-code/tree/11-practice-food-order-app/extra-files




___
## 132. Starting Setup
To code along with the teacher you can either go ahead and create a new project or you can download his starter code from github
His starter project is just an empty react app so if you want to use `create-react-app` that should be fine too
Just to be completely sure we are starting from the same place I will copy paste his github starter code into a new project folder with `$cp -r 01-starter-code path/to/projects/folder/and/project/name`
Then just run `$npm install` and maybe `$npm audit fix --force`

Now we should be ready to run `$npm start` and code along with the teacher 
Right now all you should see from the application is a dark page with a black title heading

To get started we will look at what we need to build and see that we will need things such as a header, a list of meals, a modal, etc

For now we will create a new folder to hold the components we will build along with four subfolders
- UI
  - Place general UI elements in here
    Input component, card component, modal component will all go here
    This is for general UI components that are not tied to any specific feature but could be used in multiple places or even other projects
- Layout
  - Will add header component and related components
- Meals 
  - This will hold the list of meals as well as individual meal item components
- Cart
  - Holds all cart related components

This is just the structure the teacher went with but you could of course pick another structure and it could still be correct
The teacher just chose this because it is a good wya to split features as well as genearl UI and Layout components




___
## 133. Adding a Header Component
Now we are going to start building some of our components out and we will start with the header
The header will be stored in the 'Layout' folder
Create: src/Components/Layout/Header.jsx

Obviously this will also need styling
Create: src/Components/Layout/Header.module.jsx

You can copy/paste from the teachers notes the css
https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/Header.module.css
```
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 5rem;
  background-color: #8a2b06;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 10%;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
  z-index: 10;
}

.main-image {
  width: 100%;
  height: 25rem;
  z-index: 0;
  overflow: hidden;
}

.main-image img {
  width: 110%;
  height: 100%;
  object-fit: cover;
  transform: rotateZ(-5deg) translateY(-4rem) translateX(-1rem);
}
```

Now within our js file we are going to want the jsx structure for the header
The header will consist of two parts
The first part will be the block itself that makes up the header
The second part will be the image that is shown below the header
We could split this into two different components but that isn't necessary
To do this we will use `<React.Fragment>` as a wrapper so don't forget to import it
```
import React, { Fragment } from 'react'

const Header = (props) => {
  return (
    <Fragment>

    </Fragment>
  )
}

export default Header

```
Now we can add the two div sections within the fragment
The first will be the built in html `<header>` tag 
The second will be a div where we will put the image
```
import React, { Fragment } from 'react'

const Header = (props) => {
  return (
    <Fragment>
      <header></header>
      <div></div>
    </Fragment>
  )
}

export default Header
```

Now within our `<header>` we can add a title inside of an `<h1>` tag (say "React Meals")
Then we will also add a button to open the cart later
For now it will just have text that says "Cart"
```
return (
  <Fragment>
    <header>
      <h1>ReactMeals</h1>
      <button>Cart</button>
    </header>
    <div></div>
  </Fragment>
)
```

Now we can add the image to our div 
We haven't done this yet and the best practice for this is to store our images in an 'assets' folder (within 'src') and access them from there
The image that the teacher has us download can be found on github within extra files as 'meals.jpg'
Create: src/assets

Add the picture either by copying from github repo or downloading and moving it there manually
Alternatively if you really wanted you could use a different image, although you should use the same size
This image is 1024x411px

Now how can we add this image to the header?
We can actually import it similar to the way we import css
React has a special way of handling this to make sure that the image is linked whenever the code is translated to vanilla js since this is not a vanilla js feature
All we have to do is import it first we have to include the file type since it is not js or jsx
```
import mealsImage from '../../assets/meals.jpg';
```

Now we can use this imported image as a source within the `<img>` tag and apply some alt text 
```
return (
  <Fragment>
    <header>
      <h1>ReactMeals</h1>
      <button>Cart</button>
    </header>
    <div>
      <img src={mealsImage} alt="A table full of delicious food!" />
    </div>
  </Fragment>
)
```
If this image was not stored locally and instead stored on another server we could access it differently by using:
```
<img src="https://www.some-url.com/to-some-image.jpg" alt="A table full of delicious food!" />
```

Now we have the general structure for our header component finished although we haven't applied any styling

First we have to import our css styles
```
import classes from './Header.module.css';
```
Then we can apply them to the appropriate divs (`<header>` and `<div>` holding the `<img>` tag)
Note that because the `'main-image'` class has a dash we cannot use the `classes.className` syntax
Instead we need to use `classes['class-name']`

```
import React, { Fragment } from 'react'
import mealsImage from '../../assets/meals.jpg';
import classes from './Header.module.css';

const Header = (props) => {
  return (
    <Fragment>
      <header className={classes.header}>
        <h1>ReactMeals</h1>
        <button>Cart</button>
      </header>
      <div className={classes['main-image']}>
        <img src={mealsImage} alt="A table full of delicious food!" />
      </div>
    </Fragment>
  )
}

export default Header
```
Now our general header structure is finished and we can add it to our `<App>` component
First import the component
Then we will call the `<Header>` within a `<Fragment>` in app since we know we will be adding more siblings later
```
import { Fragment } from 'react';
import Header from './Components/Layout/Header.jsx';

function App() {
  return (
    <Fragment>
      <Header />
    </Fragment>
  );
}

export default App;
```

Now if you save you should be able to see the header along with an image directly below it

The only issue that the "Cart" button does not look nice like it should so we will handle that next




___
## 134. Adding the "Cart" Button Component
Now we will work on the button in the header
We could create all the jsx for this within the `<Header>` component but we will create a seperate component instead
We will call this `<HeaderCartButton>`
Create: src/Components/Layout/HeaderCartButton.jsx

Alternatively we could create the component and call it within the 'Header.jsx' file but to keep it lean we will just seperate the two

Again we will need some styling so get the css for the project and add it to your project: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/HeaderCartButton.module.css
```
.button {
  cursor: pointer;
  font: inherit;
  border: none;
  background-color: #4d1601;
  color: white;
  padding: 0.75rem 3rem;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border-radius: 25px;
  font-weight: bold;
}

.button:hover,
.button:active {
  background-color: #2c0d00;
}

.icon {
  width: 1.35rem;
  height: 1.35rem;
  margin-right: 0.5rem;
}

.badge {
  background-color: #b94517;
  padding: 0.25rem 1rem;
  border-radius: 25px;
  margin-left: 1rem;
  font-weight: bold;
}

.button:hover .badge,
.button:active .badge {
  background-color: #92320c;
}

.bump {
  animation: bump 300ms ease-out;
}

@keyframes bump {
  0% {
    transform: scale(1);
  }
  10% {
    transform: scale(0.9);
  }
  30% {
    transform: scale(1.1);
  }
  50% {
    transform: scale(1.15);
  }
  100% {
    transform: scale(1);
  }
}

```

Now that we have the styling we can start creating the component
Within our component we want to return a button (obviously) 
Inside of it we want to have an icon, some text, and a badge showing the current number of items in the cart
To do this we will add 3 `<span>` tags within the `<button>` tag
Each tag will hold one of the above three items
```
import React from 'react'

const HeaderCartButton = (props) => {
  return (
    <button>
      <span></span>
      <span></span>
      <span></span>
    </button>
  )
}

export default HeaderCartButton

```

For the icon the teacher has provided a finished icon that we can use (kind of like the image)
Instead of a jpg though this is a js file 
It simply returns an svg that will be the icon we are looking for
This could be stored in either the "Cart" folder or the "Layout"/"UI" folder depending on how you look at it
It is specific to the cart so it would make sense to store it there
The argument for having it in layout is that is the only place we will be using it but that may not be the case for a larger application

Either Copy the teachers 'CartIcon.js' file from the github repo to src/Components/Cart or create the following
Create: src/Components/Cart/CartIcon.js
```
const CartIcon = () => {
  return (
    <svg
      xmlns='http://www.w3.org/2000/svg'
      viewBox='0 0 20 20'
      fill='currentColor'
    >
      <path d='M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z' />
    </svg>
  );
};

export default CartIcon;
```
This will output the svg icon and we can just call it as we would any other component within our `<HeaderCartButton>`
First import
```
import CartIcon from '../Cart/CartIcon.js';
```
Then call it within the first set of `<span>` tags
```
return (
  <button>
    <span>
      <CartIcon />
    </span>
    <span></span>
    <span></span>
  </button>
)
```

In the second span we can just add the text "Your Cart"
Then in the third span we want to output the total amount of items in the cart
Right now we don't have the logic for counting this yet so we will just hardcode it with a number
```
return (
  <button>
    <span>
      <CartIcon />
    </span>
    <span>Your Cart</span>
    <span>3</span>
  </button>
)
```

Now we have to apply our styles from 'HeaderCartButton.module.css'
Import it:
```
import classes from './HeaderCartButton.module.css';
```

Then we will need to apply the `.button`, `.icon`, and `.badge` classes to the appropriate tags
```
import React from 'react'
import classes from './HeaderCartButton.module.css';
import CartIcon from '../Cart/CartIcon.js';

const HeaderCartButton = (props) => {
  return (
    <button className={classes.button}>
      <span className={classes.icon}>
        <CartIcon />
      </span>
      <span>Your Cart</span>
      <span className={classes.badge}>3</span>
    </button>
  )
}

export default HeaderCartButton

```

Now that our button is built we want to call this component instead of the default button we are currently calling in `<Header>`
First import it:
```
import HeaderCartButton from './HeaderCartButton.jsx';
```

Then call it in place of the button we are currently using
```
import React, { Fragment } from 'react'
import mealsImage from '../../assets/meals.jpg';
import classes from './Header.module.css';
import HeaderCartButton from './HeaderCartButton.jsx';

const Header = (props) => {
  return (
    <Fragment>
      <header className={classes.header}>
        <h1>ReactMeals</h1>
        <HeaderCartButton />
      </header>
      <div className={classes['main-image']}>
        <img src={mealsImage} alt="A table full of delicious food!" />
      </div>
    </Fragment>
  )
}

export default Header
```

Now we should have a much nicer cart button and although it isn't functoinal our header looks correct and we can move on to the next section