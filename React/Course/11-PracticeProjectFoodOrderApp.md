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




___
## 135.Adding a "Meals" Component
Next we will start working on the meals component
To do this we will add a 'Meals.jsx' file to our 'Meals' folder
Create: src/Components/Meals/Meals.jsx

This will be the main component we use to hold our list of meals that users can add to the cart
We will also add the little text paragraph blurb above the menu although it could be its own component

We will go ahead and create files for two other components right now as well just so we can fill them in when we are ready
Create: src/Components/Meals/MealsSummary.jsx
Create: src/Components/Meals/AvailableMeals.jsx

The `<MealsSummary>` component will be responsible for holding the paragraph of text above the meals
While the `<AvailableMeals>` will hold the list of meals that users can choose from

First we will start with `<MealsSummary>` to get started download or copy/paste the css file from github or here: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/MealsSummary.module.css
```
.summary {
  text-align: center;
  max-width: 45rem;
  width: 90%;
  margin: auto;
  margin-top: -10rem;
  position: relative;
  background-color: #383838;
  color: white;
  border-radius: 14px;
  padding: 1rem;
  box-shadow: 0 1px 18px 10px rgba(0, 0, 0, 0.25);
}

.summary h2 {
  font-size: 2rem;
  margin-top: 0;
}

```

Then we will create our component and import the css module
This will be a really simple component with hardcoded text/content and doesn't need to accept any props
We will just return a section with a child h2 tag and a few paragraph tags to hold the text
Don't forget to apply the classes
You can use the following text/layout and since this component is so simple you can fetch it from the github as well: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/MealsSummary.js
```
import classes from './MealsSummary.module.css';

const MealsSummary = () => {
  return (
    <section className={classes.summary}>
      <h2>Delicious Food, Delivered To You</h2>
      <p>
        Choose your favorite meal from our broad selection of available meals
        and enjoy a delicious lunch or dinner at home.
      </p>
      <p>
        All our meals are cooked with high-quality ingredients, just-in-time and
        of course by experienced chefs!
      </p>
    </section>
  );
};

export default MealsSummary;
```

Now we can get started on the `<AvailableMeals>` component
This will hold our list of meals that users can use to add meals to the cart
To start we will create our functional component without any props because we won't need to pass anything in
Instead we will use some fake data in a seperate js file
While this isn't praticularly realistic we will learn how to fetch data from a database in a few sections which would be realistic and still not require us to use any props so we are simulating that as best we can right now
```
import React from 'react'

const AvailableMeals = () => {
  return (
    <div>
      
    </div>
  )
}

export default AvailableMeals
```
Speaking of the fake data, that is also in the extra files go ahead and copy that data into 'AvailableMeals.jsx' outside of the component function
https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/dummy-meals.js
```
import React from 'react'

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

const AvailableMeals = () => {
  return (
    <div>
      
    </div>
  )
}

export default AvailableMeals

```

Now that we have our data we want to render it as jsx
To do this we will need to transfer the array of js objects to an array of jsx elements
We can do this with `.map()` and format/translate the data however we need
Before we map each of the items we want to list we can create the containers
We will use a section tag to hold our unordered list tags that will hold each of the items we render with `.map()`
```
const AvailableMeals = () => {
  return (
    <section>
      <ul>
        
      </ul>
    </section>
  )
}
```

To keep our return statement lean we will create a helper constant (called `mealsList`) that we will use to hold our jsx array
We will set that equal to what `.map()` will return on our `DUMMY_MEALS` data
Then we will output `mealsList` within our jsx return
```
const AvailableMeals = () => {

  const mealsList = DUMMY_MEALS.map((meal) => {
    
  })

  return (
    <section>
      <ul>
        {mealsList}
      </ul>
    </section>
  )
}
```

Now how do we want our data transformed?
For now we will just create a new list item and output the current meals name
Later we will make a new component that will accept this data as props and output this in a stylized way
```
const mealsList = DUMMY_MEALS.map((meal) => {
  <li>{meal.name}</li>
})
```
Now to finish this we can add the styling
Again the css is in github: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/AvailableMeals.module.css
```
.meals {
  max-width: 60rem;
  width: 90%;
  margin: 2rem auto;
  animation: meals-appear 1s ease-out forwards;
}

.meals ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

@keyframes meals-appear {
  from {
    opacity: 0;
    transform: translateY(3rem);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

```
All we have to do is import the module and apply the `.meals` class to our section
```
import React from 'react'
import classes from './AvailableMeals.module.css';

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

const AvailableMeals = () => {

  const mealsList = DUMMY_MEALS.map((meal) => {
    return <li>{meal.name}</li>
  })

  return (
    <section className={classes.meals}>
      <ul>
        {mealsList}
      </ul>
    </section>
  )
}

export default AvailableMeals

```

Now we can create our component within 'Meals.jsx' and call both `<MealsSummary>` and `<AvailableMeals>` holding them both with a fragment
```
import React, { Fragment } from 'react'
import MealsSummary from './MealsSummary.jsx';
import AvailableMeals from './AvailableMeals.jsx';

const Meals = () => {
  return (
    <Fragment>
      <MealsSummary />
      <AvailableMeals />
    </Fragment>
  )
}

export default Meals

```

Finally within `<App>` we can import and display the `<Meals>` component below the header but will place it inside of a `<main>` tag which is a default html tag
```
import { Fragment } from 'react';
import Header from './Components/Layout/Header.jsx';
import Meals from './Components/Meals/Meals.jsx';

function App() {
  return (
    <Fragment>
      <Header />
      <main>
        <Meals />
      </main>
    </Fragment>
  );
}

export default App;

```

Next we will work on wrapping the `<ul>` within `<AvailableMeals>` in a card to make that look nicer and creating a component to display each individual `mealItem` with better styling and more data




___
## 136. Adding Individual Meal Items & Displaying Them
Now instead of just calling these meal items and displaying the names we want to show them a little nicer

First we will start by adding the card component around our `<ul>` tags to make that look nicer
First we can download and the css from github
'Card.module.css': https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/Card.module.css
```
.card {
  padding: 1rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
  border-radius: 14px;
  background-color: white;
}
```

Now we can create the component we will apply this styling to
Create: src/Components/UI/Card.jsx

This component will be very simple and just receive props
Then it will display a div with the `.card` class and display the children inside
(don't forget to import css classes)
```
import React from 'react';
import classes from './Card.module.css';

const Card = (props) => {
  return (
    <div className={classes.card}>
      {props.children}
    </div>
  )
}

export default Card

```

Now we can just call this component within `<AvailableMeals>` around our `<ul>` tags
(don't forget to import the component)
```
return (
  <section className={classes.meals}>
    <Card>
      <ul>
        {mealsList}
      </ul> 
    </Card>
  </section>
)
```

Now if we save the application will already look much nicer

Next we can work on creating the component to hold the individual meal items
In order to keep our components organized we will add this to a new subfolder within 'Meals' called 'MealItem'
Create: src/Components/Meals/MealItem/MealItem.jsx

Go ahead and download the appropriate css
https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/MealItem.module.css
```
.meal {
  display: flex;
  justify-content: space-between;
  margin: 1rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #ccc;
}

.meal h3 {
  margin: 0 0 0.25rem 0;
}

.description {
  font-style: italic;
}

.price {
  margin-top: 0.25rem;
  font-weight: bold;
  color: #ad5502;
  font-size: 1.25rem;
}
```

Now within 'MealItem.jsx' we can add our functional component boilerplate code
```
import React from 'react'

const MealItem = () => {
  return (
    <div>
      
    </div>
  )
}

export default MealItem
```

Now what do we want this component to do?
Well we know it will receive props and then display those props inside of a list item
There will be two sections within each `<li>` tag which we will seperate with two different divs
The first div will hold details about the meal such as the name, description, and price
These details will be shown by accessing props
The second div we will work on later and will hold a form to set the number of that meal to by along with a button to add that meal to the cart
```
import React from 'react'

const MealItem = (props) => {
  return (
    <li>
      <div>
        <h3>{props.name}</h3>
        <div>{props.description}</div>
      </div>
      <div></div>
    </li>
  )
}

export default MealItem

```

Now we will display the price below the description except we won't get that data from props
Doing that would mean that we would either have to format it before hand or format it direcly inside of our div
Instead we will create a variable to hold the formatted price and use a template literal to format it from props
Remember tempate literals are made by using backticks as quotes and you can inject js inside '${}'
We will use a method called `toFixed()` where we can specify the number of decimals so it is always 2 decimals
```
const MealItem = (props) => {

  const price = `$${props.price.toFixed(2)}`;

  return (
    <li>
      <div>
        <h3>{props.name}</h3>
        <div>{props.description}</div>
        <div>{price}</div>
      </div>
      <div></div>
    </li>
  )
}
```

Before we move on we can apply our styling by importing the css module and applying the appropriate classes
```
import React from 'react'
import classes from './MealItem.module.css';

const MealItem = (props) => {

  const price = `$${props.price.toFixed(2)}`;

  return (
    <li className={classes.meal}>
      <div>
        <h3>{props.name}</h3>
        <div className={classes.description}>{props.description}</div>
        <div className={classes.price}>{price}</div>
      </div>
      <div></div>
    </li>
  )
}

export default MealItem
```

Although our component isn't completely done we can now add this to our `<AvailableMeals>` component to get it to show up
Import and call it instead of a single list item (being sure to pass in props for name, description, and price)
Don't foget to include a key prop so that react can render our components as an array correctly
```
const mealsList = DUMMY_MEALS.map((meal) => {
  return (<MealItem 
            key={meal.id}
            name={meal.name}
            description={meal.description}
            price={meal.price}
          />)
})
```




___
## 137. Adding a Form
Now we will work on adding a form so that we can specify the number of each meal someone wants and they can have a button to add that to the cart

First go ahead and get the 'MealItemForm.module.css' file from github: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/MealItemForm.module.css
```
.form {
  text-align: right;
}

.form button {
  font: inherit;
  cursor: pointer;
  background-color: #8a2b06;
  border: 1px solid #8a2b06;
  color: white;
  padding: 0.25rem 2rem;
  border-radius: 20px;
  font-weight: bold;
}

.form button:hover,
.form button:active {
  background-color: #641e03;
  border-color: #641e03;
}
```

Now we can create the form component
We will do this in a new component file and simply call this new component within `<MealItem>`
Create: src/Components/Meals/MealItem/MealItemForm.jsx

Now within this file we will want to create a component function that will return a form
We can also go ahead and import the css classes we will use and apply that to the form
```
import React from 'react'
import classes from './MealItemForm.module.css';

const MealItemForm = () => {
  return (
    <form className={classes.form}>
      
    </form>
  )
}

export default MealItemForm
```

Now we can start adding to our form
We will want this form to have an input and a button
For the button we will add text saying '+ Add' to make it obvious what it does
On `<input>` we will simply leave it blank for now as we will create a reusable ui component
```
return (
  <form className={classes.form}>
    <input />
    <button>+ Add</button>
  </form>
)
```

Now we can go ahead and call this form within our `<MealItem>` component
```
import React from 'react'
import classes from './MealItem.module.css';
import MealItemForm from './MealItemForm.jsx';

const MealItem = (props) => {

  const price = `$${props.price.toFixed(2)}`;

  return (
    <li className={classes.meal}>
      <div>
        <h3>{props.name}</h3>
        <div className={classes.description}>{props.description}</div>
        <div className={classes.price}>{price}</div>
      </div>
      <div>
        <MealItemForm />
      </div>
    </li>
  )
}

export default MealItem
```

If we save this it isn't entirely correct but is a start

To get the correct final look we need to extract the `<input>` and add it to a reusable prestyled component so we can call it if we need it elsewhere

For this we will add a new input component inside of our 'UI' folder
Create: src/Components/UI/Input.jsx

Also of course import the css we will use from github
https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/Input.module.css
```
.input {
  display: flex;
  align-items: center;
  margin-bottom: 0.5rem;
}

.input label {
  font-weight: bold;
  margin-right: 1rem;
}

.input input {
  width: 3rem;
  border-radius: 5px;
  border: 1px solid #ccc;
  font: inherit;
  padding-left: 0.5rem;
}

```

Then import these classes to our new `<Input>` component
The component itself should return a div containing both the label and actual input itself
The `.input` class should be applied to the surrounding div
To keep the input component configurable we will pass in the label via props and call it inside of the label tag
Remember that labels in react use the `htmlFor` attribute
Here we pass in the id of the input this is a label for
To do this we will pass in an input object via props when we call this which will contain configuration data for the input
In this case we will access this through `props.input.id`
Then we have to add this same value as the `id` attribute on the input
```
return (
  <div className={classes.input}>
    <label htmlFor={props.input.id}>{props.label}</label>
    <input id={props.input.id} />
  </div>
)
```

Now one more trick the teacher uses is object destructuring to allow us to define props later within the `input` object we said we would pass to this component
To do that we use the spread operator and pass the object into the input
```
<input id={props.input.id} {...props.input} />
```

This allows us to create our `input` object with key value pairs that will be used as props
For example when we define the `input` object we could add a key/value like:
```
const input = {
  id: 123
  type: text
}
```
This allows us to make our component more configurable from outside of the input
We could also remove the explicit `props.input.id` id prop in our input tag as long as we remember to assign one when we call `<Input>`

Now we can add this new component to the `<MealItemForm>` instead of the regular default input
```
import React from 'react'
import classes from './MealItemForm.module.css';
import Input from '../../UI/Input.jsx';

const MealItemForm = () => {
  return (
    <form className={classes.form}>
      <Input />
      <button>+ Add</button>
    </form>
  )
}

export default MealItemForm
```
Now we can't forget to add our props to the `<Input>` call
The first one is easy and will be the label and just set to "Amount"
The second one will an object called "input" it will of course hold an id (for now also amount even though this is an issue), as well as a type
A few more props we can add are `min`, `max`, `step`, and `defaultValue`
These are all default html attributes for an `<input>` tag
```
return (
  <form className={classes.form}>
    <Input label="Amount" input={{
      id: 'amount',
      type: 'number',
      min: '1',
      max: '5',
      step: '1',
      defaultValue: '1'
    
    }} />
    <button>+ Add</button>
  </form>
)
```
You may notice the issue here already
Our `<Input>` componentis being rendered within `<MealItemForm>` 
In turn `<MealItemForm>` is being rendered within `<MealItem>` which is being called within a `.map()` function
This means in the end there will be multiple `<Input>` components being called at once
This wouldn't normally be an issue except we are passing the same hardcoded id into all of these `<Input>` components
This means when there is more than one of them rendered React will not be able to tell them all apart since the have the same id
This is an issue but we will fix it in the next lesson as the teacher didn't catch it right away




___
## 138. Fixing Form Input IDs
With the current implementation of MealItemForm, every MealItem `<Input />` receives the same id, as I do the following in the code I show in the previous lecture:
```
<Input
    label='Amount'
    input={{
        id: 'amount',
        type: 'number',
        min: '1',
        max: '5',
        step: '1',
        defaultValue: '1',
    }}
/>
```
This works but it has two major disadvantages which are not immediately obvious (and hence unfortunately slipped through during the recordings):

Clicking on ANY label will always select the same, first input element - even if that's not the one belonging to the actual MeatItem

Screenreaders won't be able to connect labels + inputs correctly (since all labels point at the same input)

Everything shown in the videos works as shown and fixing this is optional, but since fixing this is easy, you might want to consider making the below adjustments:

One possible workaround is to accept an id prop on the MealItemForm component and use that to create a unique id per `<Input />`:
```
<Input
    label='Amount'
    input={{
        id: 'amount_' + props.id, // this changed!
        type: 'number',
        min: '1',
        max: '5',
        step: '1',
        defaultValue: '1',
    }}
/>
```
We just have to make sure that the id props is passed correctly to `<MealItemForm />` when that component is being used (i.e. inside of the MealItem component):

`<MealItemForm id={props.id} />`
Last but not least, for that to work, we should also pass id as a prop to MealItem, hence inside of the AvailableMeals component, we should create `<MealItem />` elements like this:
```
<MealItem
    id={meal.id} // this is new!
    key={meal.id}
    name={meal.name}
    description={meal.description}
    price={meal.price}
/>
```
Again, this is all 100% optional when it comes to the general functionality of this demo app - everything works as shown in the videos without these changes as well. But for proper accessibility, you should consider making these adjustments.

I did also update all the code snapshots to reflect these changes.




___
## 139. Working on the "Shopping Cart" Component
Now we will work on our shopping cart
Of course the first thing to do is add a file to hold our component in the `<Cart>` folder
Create: src/Components/Cart/Cart.jsx

This component will render each cart item, display the total amount, and give us buttons to leave the cart and order
Ordering won't really submit an order but will output to the console
In a real application instead of outputting to the console we might instead have our application send the order to a database or server so it would be slightly different but not too far off

To get started get the css for this component
https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/Cart.module.css
```
.cart-items {
  list-style: none;
  margin: 0;
  padding: 0;
  max-height: 20rem;
  overflow: auto;
}

.total {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
  font-size: 1.5rem;
  margin: 1rem 0;
}

.actions {
  text-align: right;
}

.actions button {
  font: inherit;
  cursor: pointer;
  background-color: transparent;
  border: 1px solid #8a2b06;
  padding: 0.5rem 2rem;
  border-radius: 25px;
  margin-left: 1rem;
}

.actions button:hover,
.actions button:active {
  background-color: #5a1a01;
  border-color: #5a1a01;
  color: white;
}

.actions .button--alt {
  color: #8a2b06;
}

.actions .button {
  background-color: #8a2b06;
  color: white;
}
```

Now in our Cart.jsx file we can import this and get started with the outline for our functional component
```
import React from 'react';
import classes from './Cart.module.jsx';

const Cart = () => {
  return (
    <div>
      
    </div>
  )
}

export default Cart
```
We will want to render this modal in a portal but first we will define the general cart markup

We will want to return a div (like we already are) and then inside of there render each of our cart items
Below that we will want another div with the total amount and below that another div with our actions (close and order)
Roughly this is what it would look like except we don't have the components/data we need yet
```
import React from 'react';
import classes from './Cart.module.jsx';

const Cart = () => {
  return (
    <div>
      <div>cartitems</div>
      <div>totalamount</div>
      <div>actions</div>
    </div>
  )
}

export default Cart

```

Now thinking about our `cartitems` we know that there will be more than 1 item in the cart and the best way to handle that would be an array
So we will run `.map()` on our `cartitems` to return jsx for each item in the cart
We will do this outside of the return statement since it is a little cleaner and save the resulting jsx array to a variable that we will call in the return
Currently we don't have any cart items or data so for now we will create  a dummy array of cart items
Once we have a way to pass this data to cart (either with context or props whatever we decide later) we can replace the array with the real data
Our `.map()` function will return `<li>` items simply outputting the name of the item for now and `cartItems` will hold each of these in `<ul>` tags
```
import React from 'react';
import classes from './Cart.module.jsx';

const Cart = () => {

  const cartItems =(
    <ul className={classes['cart-items']}>
      {
        [{id: 'c1', name: 'Sushi', amount: 2, price: 12.99}].map((item) => {
          return (<li>{item.name}</li>)
        })
      }
    </ul>
  );

  return (
    <div>
      <div>{cartItems}</div>
      <div>totalamount</div>
      <div>actions</div>
    </div>
  )
}

export default Cart

```
Just to clear up what is happing above
We are making a constant that we will display within our cart
This constant is an unordered list that also contains individual list items
This unordered list is assigned a class of 'cart-items'
Each list item is generated by taking an array of objects which will be a list of meals that have been added to the cart
We will run `.map()` on this array and for each meal create a list item that for now just outputs the name of the meal
Then those list items are added to the unorderd list and the entire unordered list will be rendered in our return statement
Later we will replace each `<li>` call within map with a custom component

Now in the next div will be used to display the total cost
First we can apply the `.total` class from our css module
Then we will want to output two spans 
The first will just have text that says "Total Amount" 
The next will just have a hardcoded number to represent the total although we will update it later to be dynamic
```
return (
  <div>
    <div>{cartItems}</div>
    <div className={classes.total}>
      <span>Total Amount</span>
      <span>$35.62</span>
    </div>
    <div>actions</div>
  </div>
)
```

Now our last div will be used for actions
As such we can apply the `.actions` class to the wrapping div
Inside of this div we will want to create two buttons
The first will be the close button which will have a class of `.button--alt` so we will need to use the `classes['button--alt']` syntax
The next button will be the order button and will receive a classname of `.button`
```
import React from 'react';
import classes from './Cart.module.jsx';

const Cart = () => {

  const cartItems =(
    <ul className={classes['cart-items']}>
      {
        [{id: 'c1', name: 'Sushi', amount: 2, price: 12.99}].map((item) => {
          return (<li>{item.name}</li>)
        })
      }
    </ul>
  );

  return (
    <div>
      <div>{cartItems}</div>
      <div className={classes.total}>
        <span>Total Amount</span>
        <span>$35.62</span>
      </div>
      <div className={classes.actions}>
        <button className={classes['button--alt']}>Close</button>
        <button className={classes.button}>Order</button>
      </div>
    </div>
  )
}

export default Cart

```

Later we will update our component to hide the order button when `cartItems` is empty but since we only have dummy data and our cart always has an item in it we will work on that later

Now we have the cart outline complete but it is sitting inside of a div
We do not want this instead we want it in a modal so that is what we will do next




___
## 140. Adding a Modal via a React Portal
Now we will add our modal that we will use to wrap our `<Cart>` component
Download the css and add it to the UI folder
https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/Modal.module.css
```
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
  top: 20vh;
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

Then create the modal component file and import the css
Create: src/Components/UI/Modal.jsx

We will use a special markup because we want to use react portal for both the backdrop (thing behind the overlay to block interaction) as well as the modal overlay with the react portal
This will allow us to call the modal wherever we want but render the elements in a specific place in the dom tree
Remember portals allow us to call a component from within another component (say header) but have it rendered as a root level element within our html (or wherever we want it)

First to render a portal we need to go to our 'public/index.html' file and create a div with an id that we can target with this modal later so we can render it in a specific place
```
...
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="overlays"></div>
    <div id="root"></div>
  </body>
...
```
Now we will target this when portalling our modal and backdrop

Back in the modal file we can get started on our outline
```
import React from 'react';
import classes from './Modal.module.css';

const Modal = () => {
  return (
    <div>
      
    </div>
  )
}

export default Modal
```

We will want to create the backdrop and overlay within here and use the portal to render them
To do this we will create two more components but since they will only be used in the modal component and are both very small we will define them within 'Modal.jsx'
Putting them in seperate files is also ok but not necessary
Both of these will receive props (since they will show children components)
```
import React from 'react';
import classes from './Modal.module.css';

const Backdrop = (props) => {
  return (
    <div>
      
    </div>
  )
}

export const ModalOverlay = (props) => {
  return (
    <div>
      
    </div>
  )
}

const Modal = () => {
  return (
    <div>
      
    </div>
  )
}

export default Modal

```

For the `<Backdrop>` component we can assign the `.backdrop` class from our css file
```
const Backdrop = (props) => {
  return (
    <div className={classes.backdrop} />
  )
}
```

Then for the `<ModalOverlay>` we will assign the `.modal` class
Then we will also have a child div that has the `.content` class and outputs any children
```
export const ModalOverlay = (props) => {
  return (
    <div className={classes.modal}>
      <div className={classes.content}>{props.children}</div>      
    </div>
  )
}
```

Now within our `<Modal>` function we can return both of these components side by side
To do this we can use `<Fragment>` (remember to import)
Inside of our fragment we can set up our portal

Remember to use portal we have to access ReactDOM (which needs imported)
Then we can call the `ReactDOM.createPortal()` method once it is imported
Then we pass in two arguments, the first is what we want to display
In this case the backdrop for one portal and the overlay for the other, followed by where to display it 
The div with id root, which we target with `document.getElementById()`

Start with importing
```
import React, { Fragment } from 'react';
import ReactDOM from 'react-dom'; //import ReactDOM
import classes from './Modal.module.css';
```
Then we can call `ReactDOM.createPortal()` and pass in the two component calls we already have along with targetting where we want to render it
To make things a little cleaner instead of calling `document.getElementById()` twice and targetting the element we can create a variable that we pass in instead
```
const portalElement = document.getElementById('overlays');
```
Then we can just pass `portalElement` as the second argument
Now if we ever change where we want to render this portal we only have to make the change in one place
```
import React, { Fragment } from 'react';
import ReactDOM from 'react-dom';
import classes from './Modal.module.css';

const Backdrop = (props) => {
  return (
    <div className={classes.backdrop} />
  )
}

export const ModalOverlay = (props) => {
  return (
    <div className={classes.modal}>
      <div className={classes.content}>{props.children}</div>      
    </div>
  )
}

const portalElement = document.getElementById('overlays');

const Modal = (props) => {
  return (
    <Fragment>
      {ReactDOM.createPortal(<Backdrop />, portalElement)}
      {ReactDOM.createPortal(<ModalOverlay>{props.children}</ModalOverlay>, portalElement)}
    </Fragment>
  )
}

export default Modal
```

Now back in our `<Cart>` component we can replace our wrapping div with the Modal we created
```
import React from 'react';
import classes from './Cart.module.jsx';
import Modal from '../UI/Modal.jsx';

const Cart = () => {

  const cartItems =(
    <ul className={classes['cart-items']}>
      {
        [{id: 'c1', name: 'Sushi', amount: 2, price: 12.99}].map((item) => {
          return (<li>{item.name}</li>)
        })
      }
    </ul>
  );

  return (
    <Modal>
      <div>{cartItems}</div>
      <div className={classes.total}>
        <span>Total Amount</span>
        <span>$35.62</span>
      </div>
      <div className={classes.actions}>
        <button className={classes['button--alt']}>Close</button>
        <button className={classes.button}>Order</button>
      </div>
    </Modal>
  )
}

export default Cart

```

Now we have to call the `<Cart>` component in order to see it
We will call this within `<App>`
Since we are using a portal it doesn't matter too much where we put it within `<App>` other than organization 
```
import { Fragment } from 'react';
import Header from './Components/Layout/Header.jsx';
import Meals from './Components/Meals/Meals.jsx';
import Cart from './Components/Cart/Cart.jsx';

function App() {
  return (
    <Fragment>
      <Cart />
      <Header />
      <main>
        <Meals />
      </main>
    </Fragment>
  );
}

export default App;

```
One small bug you might get is that the `<li>` tags in our cart are not receive a unique `key` prop
You can fix that by assigning `item.id` to a `key` prop within the `<li>` tag inside `<Cart>`/`cartItems`
```
const cartItems =(
  <ul className={classes['cart-items']}>
    {
      [{id: 'c1', name: 'Sushi', amount: 2, price: 12.99}].map((item) => {
        return (<li key={item.id}>{item.name}</li>)
      })
    }
  </ul>
);
```

Now we have our modal displaying although we cannot currently make it disappear




___
## 141. Managing Cart & Modal State
Now we need to ensure that the cart modal only shows up when the "Your Cart" button is clicked and can be removed by clicking the backdrop or "Close" button?

We will need to manage a state that determines whether the modal shows and methods to toggle that state

To do this we will add `useState()` to our `<App>` component 
Then we will call `useState` to create a boolean state for if the cart is shown or not (called `cartIsShown`)
```
import { Fragment, useState } from 'react';
import Header from './Components/Layout/Header.jsx';
import Meals from './Components/Meals/Meals.jsx';
import Cart from './Components/Cart/Cart.jsx';

function App() {
  const [cartIsShown, setCartIsShown] = useState(false);

...
```

Now we will create a couple of functions that will change the state from `true` to `false` and vice versa
These will be called to open and close the cart
```
function App() {
  const [cartIsShown, setCartIsShown] = useState(false);

  const showCartHandler = () => {
    setCartIsShown(true);
  }

  const hideCartHandler = () => {
    setCartIsShown(false);
  }

  ...
```

Now we just need to use this `cartIsShown` state to determine if we show `<Cart>` and ensure that those two functions can be called in the `<Cart>` component itself

First to use the `cartIsShown` state
We want to render the `<Cart>` based on if `cartIsShown` is true
To do this we can use the `&& ` operator
```
return (
  <Fragment>
    {cartIsShown && <Cart />}
    <Header />
    <main>
      <Meals />
    </main>
  </Fragment>
);
```
Now `<Cart>` will be rendered if `cartIsShown` is true and not be rendered if `cartIsShown` is false

If you save and reload you will see the cart hidden since `cartIsShown` is initialized to false but you can change that to see it again

Now we want to make sure that the `showCartHandler` is called when the cart button is clicked
This button is located in the header
So we need to have access to this function within `<Header>` and will need to pass it down through props
```
return (
  <Fragment>
    {cartIsShown && <Cart />}
    <Header onShowCart={showCartHandler} />
    <main>
      <Meals />
    </main>
  </Fragment>
);
```

Now inside of the header we will want to execute this function when the `<HeaderCartButton>` is clicked
This is another custom component so we will have to pass it in there as well
```
const Header = (props) => {
  return (
    <Fragment>
      <header className={classes.header}>
        <h1>ReactMeals</h1>
        <HeaderCartButton onClick={props.onShowCart} />
      </header>
      <div className={classes['main-image']}>
        <img src={mealsImage} alt="A table full of delicious food!" />
      </div>
    </Fragment>
  )
}
```

Now in the `<HeaderCartButton>` we will need to execute this function by calling it as the `onClick` method
```
const Header = (props) => {
  return (
    <Fragment>
      <header className={classes.header}>
        <h1>ReactMeals</h1>
        <HeaderCartButton onClick={props.onShowCart} />
      </header>
      <div className={classes['main-image']}>
        <img src={mealsImage} alt="A table full of delicious food!" />
      </div>
    </Fragment>
  )
}
```

This could be replaced with context to make this a little easier but we won't do that here since we are only passing this through two levels of props

Now if we save we can get the modal to open by clicking the cart

Next we need to be able to close the cart and will need to pass a prop to handle this action into the `<Cart>` component when we call it within `<App>`
```
return (
  <Fragment>
    {cartIsShown && <Cart onHideCart={hideCartHandler} />}
    <Header onShowCart={showCartHandler} />
    <main>
      <Meals />
    </main>
  </Fragment>
);
```

Now we need to attach this method to our close button within the `<Cart>` component
We will also need to pass it down into the `<Modal>` so this method can be activated when the backdrop is clicked as well
```
return (
    <Modal onHideCart={props.onHideCart}>
      <div>{cartItems}</div>
      <div className={classes.total}>
        <span>Total Amount</span>
        <span>$35.62</span>
      </div>
      <div className={classes.actions}>
        <button className={classes['button--alt']} onClick={props.onHideCart}>Close</button>
        <button className={classes.button}>Order</button>
      </div>
    </Modal>
  )
```

From the modal we will have to pass it into the backdrop and then set the `onClick` action to activate
```
const Backdrop = (props) => {
  return (
    <div className={classes.backdrop} onClick={props.onClose} />
  )
}

export const ModalOverlay = (props) => {
  return (
    <div className={classes.modal}>
      <div className={classes.content}>{props.children}</div>      
    </div>
  )
}

const portalElement = document.getElementById('overlays');

const Modal = (props) => {
  return (
    <Fragment>
      {ReactDOM.createPortal(<Backdrop onClose={props.onHideCart} />, portalElement)}
      {ReactDOM.createPortal(<ModalOverlay>{props.children}</ModalOverlay>, portalElement)}
    </Fragment>
  )
}

export default Modal
```

Now when we can close the cart by clicking either the backdrop or the "Close" button
We could use context here to close the backdrop but if we were to do that then we would only be able to ever have the backdrop close the cart and could not use the backdrop for other modals
Here we can change what method is passed into the modal in the first place to determine what content has the state toggled
This is why using props instead of context might be a better choice here
It allows us to keep our modal reuseable by not using context

Now we can open and close the cart and have implemented the cart with dummy data
Next we want to be able to add cart items and make some refinements to the cart




___
## 142. Adding a Cart Context
Now we will make sure that data and items can be added to the cart
To do this we will use context so we can manage and access it in different places within the application

In `<MealItems>` we need to update the cart and then in `<Cart>` we will need to output it
We will also need to manage it within the cart so we can increase or remove items in the cart

First we have to setup our cart context
To do this the first step is to create a 'store' folder (name is tehcnically up to you though) within 'src' so we can add a 'cart-context.js'

Create: src/store/cart-context.js
In here we need to import react so we can call `React.createContext()`

Remember we call `React.createContext()` and then provide it with a default context as an argument 
In this case we will use an object to hold the meal data
The values in this object will be an array of `items` (meals added to the cart), a `totalAmount` value to display the price and two methods
The first method will be called `addItem` and accept an item as an argument and then have a function to add it
The second will be called `removeItem` and accept an item as an argument and remove it

Then we have to set the `.createContext` call equal to a constant so we can store the return and export it so we can access it elsewhere
```
import React from 'react';

const CartContext = React.createContext({
  items: [],
  totalAmount: 0,
  addItem: (item) => {},
  removeItem: (item) => {}
});

export default CartContext
```

Now we will need to manage the context within a component with `useState` or `useReducer`
This will be done within a provider 
We could do this within the same file but instead we will create a new component to do this
This will allow us to wrap the `<CartProvider>` component around components that need access to this context without having to define certain things everytime we need to access this context
create: src/store/CartProvider.jsx

Now within here we will import the context we just created and then call the provider component available within `CartContext`
Then we can simply pass `props.children` within this provider to give any children components of `<CartProvider>` acces to the cart context

We can also add methods to manage the cart context (state) within this component so other components have access to those as well
```
import React from 'react';
import CartContext from './cart-context.js';

const CartProvider = (props) => {
  return (
    <CartContext.Provider>
      {props.children}
    </CartContext.Provider>
  )
}

export default CartProvider

```

Now we will add data to this provider so that it can manage the context
This will match the context but will be the actual data that is used and updated over time the 'cart-context.js' file is just to initialize and set initial values for that context along with some vscode autocomplete
This time instead of having empty functions for `addItem` and `removeItem` we can define handlers within the `<CartProvider>` component and pass those methods into `addItem` and `removeItem`
We don't have to actually write these just yet but we can get them ready

lastly we pass the `cartContext` as the `value` prop when calling `<CartContext.Provider>` (otherwise it would use the default CartContext values)
```
import React from 'react';
import CartContext from './cart-context.js';

const CartProvider = (props) => {

  const addItemToCartHandler = (item) => {}
  const removeItemFromCartHandler = (item) => {}

  const cartContext = {
    items: [],
    totalAmount: 0,
    addItem: addItemToCartHandler,
    removeItem: removeItemFromCartHandler
  }

  return (
    <CartContext.Provider value={cartContext}>
      {props.children}
    </CartContext.Provider>
  )
}

export default CartProvider
```

We will make this dynamic soon but first we will use the use this provider component to wrap any components that need access to the context
In our app this is all components within `<App>`
The `<Cart>` will need access so it can render the items and edit them later
The `<Header>` will need access to show the total number of items in the cart
And `<Meals>` will need access so it can add and remove items from the cart

So instead of wrapping all of these components in a fragment we can wrap them in our provideer component instead
```
import { useState } from 'react';
import Header from './Components/Layout/Header.jsx';
import Meals from './Components/Meals/Meals.jsx';
import Cart from './Components/Cart/Cart.jsx';
import CartProvider from './store/CartProvider.jsx';

function App() {
  const [cartIsShown, setCartIsShown] = useState(false);

  const showCartHandler = () => {
    setCartIsShown(true);
  }

  const hideCartHandler = () => {
    setCartIsShown(false);
  }
  
  

  return (
    <CartProvider>
      {cartIsShown && <Cart onHideCart={hideCartHandler} />}
      <Header onShowCart={showCartHandler} />
      <main>
        <Meals />
      </main>
    </CartProvider>
  );
}

export default App;

```

We could have added the cart state within `<App>` since we are placing it pretty high anyway but this allows us to keep the `<App>` component clean 




___
## 143. Using the Context
Now we will use/consume the context within the header so we can update the badge count
To do this we will use the `useContext()` react hook within the `<HeaderCartButton>`

We will need to import both the react hook and the `CartContext`
Note we are NOT importing the provider we are importing the 'cart-context.js' file
```
import React, { useContext } from 'react';
import CartContext from '../../store/cart-context.js';
import classes from './HeaderCartButton.module.css';
import CartIcon from '../Cart/CartIcon.js';

```

Then we can call `useContext` and pass the `CartConext` in as an argument and store the return in `cartCtx` variable
```
const cartCtx = useContext(CartContext);
```

Now we can use cartCtx to access values within 'cart-context' which will be updated by `<CartProvider>` in the parent

We can use this value to output the number of items
To do this we can just create a variable to store this value and access `cartCtx.items` 
You might think that you could get the number we need by simply using `.length` on the `cartCtx.items` since that is an array
That might work if we just added a new item to the array every time but we don't want to organize it like that
Instead if we add multiple instances we want it to only be listed in the array once but have an amount that is updated within the item object itself

So the proper way to access this would be to access `cartCtx.items` but use the `reduce()` method
This is a built in method that allows us to transform an array of data into a single value
It takes two arguments
The first is a function that is called for you
The second is a starting value (in our case this value will be 0)
```
const numberOfCartItems = cartCtx.items.reduce(() => { }, 0);
```

Now the function that is the first argument has access to two arguments 
The first is the current number or count and the second is the item that is being looked at
Current item will be updated and remembered as the reduce function works through the array
Since we have an initial value of 0 that will be the value of `carNumber` when processing the first item
Within our function we simply want to increment the current number + the value of `item.amount` which is a value in the item object that tells us how much of this meal has been added to the cart
Then we can simply output `numberOfCartItems` instead of the hardcoded number
```
import React, { useContext } from 'react';
import CartContext from '../../store/cart-context.js';
import classes from './HeaderCartButton.module.css';
import CartIcon from '../Cart/CartIcon.js';

const HeaderCartButton = (props) => {

  const cartCtx = useContext(CartContext);

  const numberOfCartItems = cartCtx.items.reduce((curNumber, item) => {
    return curNumber + item.amount;
  }, 0);

  return (
    <button className={classes.button} onClick={props.onClick}>
      <span className={classes.icon}>
        <CartIcon />
      </span>
      <span>Your Cart</span>
      <span className={classes.badge}>{numberOfCartItems}</span>
    </button>
  )
}

export default HeaderCartButton

```

Now if we save we will see 0 on our cart button although that can be changed by chaing the initial value in our reduce function




___
## 144. Adding a Cart Reducer
Now we want to be able to handle adding and storing items in our `cartContext` right now that is always empty

For our `addItemToCartHandler` we will receive an item object
Then we want to check if that item is already listed in the `cartContext.items` array 
If it is we will want to increment the amount for that item
But if it is not then we want to add it to the array

We will want to manage this as state within our `<CartProvider>` component
This will allow this component and the context and any components affected by the context are re-evaluated when the cart data is changed

We have the option of using `useState` or `useReducer` but the second is probably a better option
This is because this state will be fairly complex and it will be easier to make changes to it with `useReducer`

First we have to import it within `<CartProvider>`
```
import React,{ useReducer } from 'react';
```
Remember to use `useReducer` we pass in at least two arguments and receive two variables back
The first argument to pass in is the reducer function which will hold functions for the actions we can take
We will write this first

OUTSIDE of the `CartProvider` component function (but still within 'CartProvider.jsx') we will create the `cartReducer` function
This function can receive two arguments 
The first is state which is a snapshot of the state most up to date state and provided by react
The second is the action which will be used to determine which action within the function should be taken

```
const cartReducer = (state, action) => {
  
}
```

Within our reducer function we must return a new state snapshot
For this we will create a new object outside of our component function and our reducer function called `defaultCartState` which will hold an object with no items (empty array) and a total amount of 0
```
const defaultCartState = {
  items: [],
  totalAmount: 0
}
```

Then back in our reducer function this will be the default return

```
import React,{ useReducer } from 'react';
import CartContext from './cart-context.js';

const defaultCartState = {
  items: [],
  totalAmount: 0
}

const cartReducer = (state, action) => {
  return defaultCartState;
}

const CartProvider = (props) => {

  const addItemToCartHandler = (item) => {}
  const removeItemFromCartHandler = (item) => {}

  const cartContext = {
    items: [],
    totalAmount: 0,
    addItem: addItemToCartHandler,
    removeItem: removeItemFromCartHandler
  }

  return (
    <CartContext.Provider value={cartContext}>
      {props.children}
    </CartContext.Provider>
  )
}

export default CartProvider

```

Now in our `<CartProvider>` component function we can call `useReducer` 
Again for the first argument we will call the function we just wrote
Then the second argument will be the initial state which will again be the `defaultCartState` we defined above
We don't have to use the third argument, that is an init function which can be ran on the initial state value we provide if we want to set it more programmatically
Lastly `useReducer` returns an array with two elements which we can assign to constants with array destructuring
The first item in the array is the state itself which we will call `cartState`
The second is a function we can use to call our `cartReducer` by passing in an action 
We will name this second item dispatchCartAction
```
const [cartState, dispatchCartAction] = useReducer(cartReducer, defaultCartState)
```
Now inside of our `cartContext`  we can use our state values to keep the contex up to date
Instead of returning an empty array we can return `cartState.items` 
and instead of a hardcoded total amount we can return `cartState.totalAmount`
Since both of these values are defined in `defaultCartState` which is used to initialize `cartState`
```
const cartContext = {
  items: cartState.items,
  totalAmount: cartState.totalAmount,
  addItem: addItemToCartHandler,
  removeItem: removeItemFromCartHandler
}
```

Now we can start dispatching actions
The first we will do is adding items to the cart
To do this we call `dispatchCartAction` (which is returned by `useReducer`)
When we do this we can pass in an 'action'
This will be an object with key `type` and a value of a text
We can name this whatever we want 
Then we will create an if statement in our `cartReducer` function that will match this text with the action we want to perform
For now we will name this action 'ADD' in all caps as that is convention
We will also need to forward the item itself that we plan on adding within this object so our `cartReducer` has access to it
```
const addItemToCartHandler = (item) => {
  dispatchCartAction({type: 'ADD', item: item});
}
```

Now within `cartReducer` we will write the logic for adding a cart item
First we need an if check to check for the action type text that we passed in
This will allow us to pass in different actions with different names all within a single function
```
const cartReducer = (state, action) => {
  if(action.type === 'ADD'){
    
  }
  return defaultCartState;
}
```

For our logic we want to first check if the item exists within the items array and if so update that items amount
We will also want to update the `totalAmount` to include the new price for all cart items

First we will just add an item to the array
To do this we can create a new array called `updatedItems`
We will set this equal to our current `state.items` (which is accessed by the `state` variable as an argument available to `cartReducer`)
Then we will call the `.concat()` function on `state.items`
This is a default js function that adds a new item to an array but does not edit the existing array
Instead it returns a new array 
This is better because we don't want to update state by mutating it
Instead we want to update state by replacing it entirely
concat does this instead of editing an array
We want to add `action.item` as the thing we want to concatenate to our old array
We expect to have all the data we need on the item itself but we haven't taken care of this yet
```
if(action.type === 'ADD'){
  const updatedItems = state.items.concat(action.item);
}
```
We also want to increase the total amount for our updated items
This will be the old total amount on the old state item plus the price that will be held on `action.item.price` (but doesn't exist yet) 
We will also have to multiply the new price by the amount we are adding which will be on `action.item.amount` (which again we haven't defined)
```
const cartReducer = (state, action) => {
  if(action.type === 'ADD'){
    const updatedItems = state.items.concat(action.item);
    const updatedTotal = state.totalAmount + (action.item.price * action.item.amount)
  }
  return defaultCartState;
}
```

Now we can return our new state, we aren't checking if an item is already part of the array, we will fix that later once we have an array to work with
For now we will just return an object with our updated items and total amount values which will update the state to this new object
```
const cartReducer = (state, action) => {
  if(action.type === 'ADD'){
    const updatedItems = state.items.concat(action.item);
    const updatedTotal = state.totalAmount + (action.item.price * action.item.amount)
    
    return {
      items: updatedItems,
      totalAmount: updatedTotal
    }
  }
  return defaultCartState;
}
```

Now we have the basic reducer outline done, we just have to make sure that `addItemToCartHandler` gets called somewhere and that it receives a valid item object to do that with




___
## 145. Working with Refs & Forward Refs
Now we need to make sure that our `addItemHandler` is being called
So we need to go to where we want to call `addItem` from context and pass in an item
We will want to do this in `<MealItemForm>` since the form submission is what will add items to the cart

The first thing we need to do is create a `submitHandler` within here that we will pass into the forms `onSubmit` property (then we can set button type to submit)
Don't forget that because this will be coming from the form's `onSubmit` prop it will have access to the event object
We should also prevent the browser default of reloading the page with `event.preventDefault`
Then we want to extract the entered amount
We will use refs for this 
Alternatively we could use two way binding but that would require us to manage state
Our situation is a little different than the normal usage of `useRef` because we have a custom component we want to add the ref to
Normally we could just import `useRef`, call it (setting the return to a variable name), apply the ref prop to the element we want to ref and set it equal to the variable we created
However because we have a custom element it is a little different because custom elements don't have access to the ref prop

We can get it started the same way though
First import `useRef`
```
import React, { useRef } from 'react'
```
Then call it and assign the return to `amountInputRef`
This should be o;utside of the submit handler as it's own function call within `<MealItemForm>` otherwise a ref wouldn't be assigned until the submit handler is activated and that is not what we want
```
const MealItemForm = (props) => {

  const amountInputRef = useRef()

  ...
```

Normally we would do the following but this will not work by itself because we are using a custom component
However we still want to add it to our input
```
<Input 
  ref={amountInputRef}
  label="Amount" 
  input={{
    id: 'amount_' + props.id,
    type: 'number',
    min: '1',
    max: '5',
    step: '1',
    defaultValue: '1'
  }} 
/>
```

Now we have to do a little bit of work to our `<Input>` component so it can accept this ref since it is a custom component
To do this we need to import React within `<Input>` 
Then we will wrap our entire component function inside of the `React.forwardRef()`
```
import React from 'react';
import classes from './Input.module.css';


const Input = React.forwardRef((props) => {
  return (
    <div className={classes.input}>
      <label htmlFor={props.input.id}>{props.label}</label>
      <input {...props.input} />
    </div>
  )
})

export default Input
```
Now our component is an argument of forward ref

This gives us access to `ref` as an argument along side `props`
We can then use this `ref` argument to forward the ref to our `input` element
```
const Input = React.forwardRef((props, ref) => {
  return (
    <div className={classes.input}>
      <label htmlFor={props.input.id}>{props.label}</label>
      <input ref={ref} {...props.input} />
    </div>
  )
})
```

This will refer to the ref that is passed into our `<Input>` component in the `<MealItemForm>` component (`amountInputRef`)

Now we can access the input through refs within `<MealItemForm>` 
This allows us to read the entered value within the `submitHandler` by accessing `amountInputRef.current.value`
Remember that getting the value this way ALWAYS returns a string
Since we expect this to be a number we should convert it first
We can do this by using `+amountInputRef.currentValue` and setting that equal to a variable 
To make things more clear I will set the initial fetch of that current value string to a variable before converting
```
const submitHandler = (event) => {
  event.preventDefault();
  const enteredAmount = amountInputRef.current.value;
  const enteredAmountNumber = +enteredAmount;
}
```

Now we can validate the entered amount before doing anything with this data
We want to make sure that there was something entered (and account for whitespace so someone doesn't enter just spaces)]
We also want to make sure that the number of items entered is valid (at least one but less than 5 items)
We can do these checks with an if statement on the `enteredAmountNumber`
```
  const submitHandler = (event) => {
    event.preventDefault();
    
    const enteredAmount = amountInputRef.current.value;
    const enteredAmountNumber = +enteredAmount;
    
    if (enteredAmountNumber.trim().length === 0 || 
        enteredAmountNumber < 1 || 
        enteredAmountNumber > 5) {
      return;
    }
  }
```
This if statement will remove whitespace and check length if it is equal to 0 the method will exit
Then it will check the value and if it is less than one or more than 5 it will return and the method will exit

We also want to output an error message below our input and button
To do this we will use state and will be a simple state
It will simply be a ref that displays a small amount of text at the bottom of the form if the state is false
```
const [amountIsValid, setAmountIsValid] = useState(true)
```

Now in our if statement within `submitHandler` we will set this state to false if any of the conditions are met
```
  const submitHandler = (event) => {
    event.preventDefault();

    const enteredAmount = amountInputRef.current.value;
    const enteredAmountNumber = +enteredAmount;
    
    if (
      enteredAmount.trim().length === 0 || 
      enteredAmountNumber < 1 || 
      enteredAmountNumber > 5
    ) {
      setAmountIsValid(false);
      return;
    }
  };

```

Now we can just use the `&&` operator to conditionally show text below our button if `amountIsValid` is false
```
  return (
    <form className={classes.form}>
      <Input 
        ref={amountInputRef}
        label="Amount" 
        input={{
          id: 'amount_' + props.id,
          type: 'number',
          min: '1',
          max: '5',
          step: '1',
          defaultValue: '1'
        }} 
      />
      <button>+ Add</button>
      {!amountIsValid && <p>Please Enter a Valid Amount (1-5)</p>}
    </form>
  )
```

Now our form submission will only complete if we have a valid input
In this case we want to execute the context method `addItem` 
However we won't do this here, we will call a function we expect to get from `props` called `onAddToCart` and we will forward the `enteredAmountNumber`
This is because the form does not have access to what the item is, only how many of an item we want
When we forward this number to our `<MealItem>` component through props it will know the item to add and will now have the number of items as well
We will bundle that data within `<MealItem>` to call the `addItem` function from context
First go ahead and call that function which we expect to pass through props and pass in the `enteredAmountNumber`
```
  const submitHandler = (event) => {
    event.preventDefault();

    const enteredAmount = amountInputRef.current.value;
    const enteredAmountNumber = +enteredAmount;
    
    if (
      enteredAmount.trim().length === 0 || 
      enteredAmountNumber < 1 || 
      enteredAmountNumber > 5
    ) {
      setAmountIsValid(false);
      return;
    }

    props.onAddToCart(enteredAmountNumber);
  };

```
Now we can go to our `<MealItem>` component and prepare this function to pass via props
This function should accept an amount since that is what we are passing within the form
Then we can pass it via props
```
const MealItem = (props) => {

  const price = `$${props.price.toFixed(2)}`;

  const addToCartHandler = (amount) => {
    
  }

  return (
    <li className={classes.meal}>
      <div>
        <h3>{props.name}</h3>
        <div className={classes.description}>{props.description}</div>
        <div className={classes.price}>{price}</div>
      </div>
      <div>
        <MealItemForm id={props.id} onAddToCart={addToCartHandler} />
      </div>
    </li>
  )
}
```

Now inside of this handler we want to reach out to our context
To do this we need to import `useContext` AND the context file that we want to access
```
import React, { useContext } from 'react';
import cartContext from '../../../store/cart-context.js';
import classes from './MealItem.module.css';
import MealItemForm from './MealItemForm.jsx';
```

Then we access this context by calling `useContext` and passing in `cartContext` as an argument and capturing the return in a variable to access the context
```
const MealItem = (props) => {

  const cartCtx= useContext(cartContext);

  ...
```

Now we can call `cartCtx.addItem` within `addToCartHandler` since we have access to context and the methods within context
When we call this `addItem` we will be adding an item object to our `cartState`
Remember this is where we needed to define things like the id, name, price, and amount before adding it to the state and list of items
Note that for price we are using `props.price` because we want it as a number and not the formatted version within `<MealItem>`
```
const addToCartHandler = (amount) => {
  cartCtx.addItem({
    id: props.id,
    name: props.name,
    amount: amount,
    price: props.price
  })
}
```

Now when we trigger the addToCartHandler whenever the submit button is pressed in `<MealItemForm>` (which is actually in `<Input>`)
It will forward the item to be added to our context and that item will be available for us to access
The cart isn't done yet since opening the modal doesn't show any of the items we have added but we can see that items are successfully being added to the context because the badge will increment as we add items




___
## 146. Outputting Cart Items
Now to output cart items we will need to work within the `<Cart>` component
Here we will need to import context (both the react hook and our context we created)
```
import React, { useContext } from 'react';
import CartContext from '../../store/cart-context.js';
```

Then call `useContext` and pass in our context as an argument within our `<Cart>` component function
```
const cartCtx = useContext(CartContext);
```

Now instead of a dummy array of cart items we can access `cartCtx.items` which is where we are storing an array of objects which will be our cart
```
const cartItems =(
  <ul className={classes['cart-items']}>
    {cartCtx.items.map((item) => {
        return (<li key={item.id}>{item.name}</li>)
      })
    }
  </ul>
);
```
Now that we are going through this each item we have access to the data for each item as well as the total amount
First we can access the total amount fairly easily
To do this we will create a `totalAmount` constant to retrieve this value from context and also format it to 2 decimal places with `toFixed(2)`
We will also put this in a template literal so we can add a dollar sign so it displays the price as it should
```
const totalAmoung = `$${cartCtx.totalAmount.toFixed(2)}`;
```

Now we can call this amount to be output in our returned jsx for the `<Cart>` component
```
import React, { useContext } from 'react';
import CartContext from '../../store/cart-context.js';
import classes from './Cart.module.css';
import Modal from '../UI/Modal.jsx';

const Cart = (props) => {

  const cartCtx = useContext(CartContext);

  const totalAmount = `$${cartCtx.totalAmount.toFixed(2)}`;

  const cartItems =(
    <ul className={classes['cart-items']}>
      {cartCtx.items.map((item) => {
          return (<li key={item.id}>{item.name}</li>)
        })
      }
    </ul>
  );

  return (
    <Modal onHideCart={props.onHideCart}>
      <div>{cartItems}</div>
      <div className={classes.total}>
        <span>Total Amount</span>
        <span>{totalAmount}</span>
      </div>
      <div className={classes.actions}>
        <button className={classes['button--alt']} onClick={props.onHideCart}>Close</button>
        <button className={classes.button}>Order</button>
      </div>
    </Modal>
  )
}

export default Cart
```

Now our cart should update with the real total amount as we add items

Next we want to make sure the order button only shows up if we have items in the cart
To do this we will create another variable to hold whether or not the cart has items called `hasItems`
We will simply check if `cartCtx.items` has a length of more than 0
In that case we want to display the order button
This keeps us from having to manage a different state just to show the order button or not and we can just reference our context
This works because this `cartCtx.items` is referencinga state value so when that state is reevaluated this module will be updated accordingly since it is a state value
```
const hasItems = cartCtx.items.length > 0;
```

This will evaluate the right side to true or false and set `hasItems` to whatever is evaluated

Now we can use this in our return to determine if `hasItems` is true and only render the order button if it is
```
return (
  <Modal onHideCart={props.onHideCart}>
    <div>{cartItems}</div>
    <div className={classes.total}>
      <span>Total Amount</span>
      <span>{totalAmount}</span>
    </div>
    <div className={classes.actions}>
      <button className={classes['button--alt']} onClick={props.onHideCart}>Close</button>
      {hasItems && <button className={classes.button}>Order</button>}
    </div>
  </Modal>
)
```

Now if we look at the cart with no items in it there will not be an order button but as soon as we add one it is available again

Next we want to work on how the individual `<li>` elements look
To do this the teacher has provided some files we can use
CartItem.js and CartItem.module.css are in extra file in github

CartItem.js: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/CartItem.js
```
import classes from './CartItem.module.css';

const CartItem = (props) => {
  const price = `$${props.price.toFixed(2)}`;

  return (
    <li className={classes['cart-item']}>
      <div>
        <h2>{props.name}</h2>
        <div className={classes.summary}>
          <span className={classes.price}>{price}</span>
          <span className={classes.amount}>x {props.amount}</span>
        </div>
      </div>
      <div className={classes.actions}>
        <button onClick={props.onRemove}>−</button>
        <button onClick={props.onAdd}>+</button>
      </div>
    </li>
  );
};

export default CartItem;

```


CartItem.module.css: https://github.com/academind/react-complete-guide-code/blob/11-practice-food-order-app/extra-files/CartItem.module.css
```
.cart-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 2px solid #8a2b06;
  padding: 1rem 0;
  margin: 1rem 0;
}

.cart-item h2 {
  margin: 0 0 0.5rem 0;
  color: #363636;
}

.summary {
  width: 10rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.price {
  font-weight: bold;
  color: #8a2b06;
}

.amount {
  font-weight: bold;
  border: 1px solid #ccc;
  padding: 0.25rem 0.75rem;
  border-radius: 6px;
  color: #363636;
}

.actions {
  display: flex;
  flex-direction: column;
}

@media (min-width: 768px) {
  .actions {
    flex-direction: row;
  }
}

.cart-item button {
  font: inherit;
  font-weight: bold;
  font-size: 1.25rem;
  color: #8a2b06;
  border: 1px solid #8a2b06;
  width: 3rem;
  text-align: center;
  border-radius: 6px;
  background-color: transparent;
  cursor: pointer;
  margin-left: 1rem;
  margin: 0.25rem;
}

.cart-item button:hover,
.cart-item button:active {
  background-color: #8a2b06;
  color: white;
}
```

This is simply a `<CartItem>` component that accepts the following props
`price`, `name`, `amount`, `onRemove` action, `onAdd` action

We can call this component within `<Cart>`
Then instead of rendering the `<li>` element we will render the `<CartItem>`
We will need to pass the appropriate props from above in as well
```
const cartItems =(
  <ul className={classes['cart-items']}>
    {cartCtx.items.map((item) => {
        return (
          <CartItem 
            key={item.id}
            price={item.price}
            name={item.name}
            amount={item.amount}
            onRemove={}
            onAdd={}
          />
        )
      })
    }
  </ul>
);
```

I didn't fill in `onRemove` or `onAdd` yet since we don't have those functions yet so we can go ahead and write some empty ones for now

For `onRemove` we will create `cartItemRemoveHandler`
This will need the id of the item to remove
For `onAdd` we will create `cartItemAddHanlder`
This will need the item object that we want to add to the cart
```
  const cartItemRemoveHandler = (id) => {
    
  }

  const cartItemAddHandler = (item) => {
    
  }
```

Now these two functions can be what we pass into our `onRemove` and `onAdd` props
```
const cartItems =(
  <ul className={classes['cart-items']}>
    {cartCtx.items.map((item) => {
        return (
          <CartItem 
            key={item.id}
            price={item.price}
            name={item.name}
            amount={item.amount}
            onRemove={cartItemRemoveHandler}
            onAdd={cartItemAddHandler}
          />
        )
      })
    }
  </ul>
);
```
On both of these we are going to call `.bind()`
We do this because we need to pass parameters into cartItemRemover from within `<CartItem>` directly
If we were to do so like this (shortened for example)
```
<CartItem 
  onRemove={cartItemRemoveHandler()}
/>
```
We would execute the function immediately
If we use `.bind` we can specify that there will be arguments by doing
(we aren't using this keyword which is why first arg is null)
```
<CartItem 
  onRemove={cartItemRemoveHandler.bind(null, item)}
/>
```

Now we can pass the item to this function directly from within `<Cart>` without having to have to pass those values down to `<CartItem>` as props and accessing them in there
Now when we call this method within `<CartItem>` it will automatically use the arguments specified in `<Cart>` everytime and BIND the specific instance of that value to that function call
```
<CartItem 
  onRemove={() => cartItemRemoveHandler(item)}
/>
```
Here we pass in an anonymous function so it isn't executed right away and we say that we expect arguments 
Either should work but I will go with `.bind()` to stick with what the teacher is doing
```
const cartItems =(
  <ul className={classes['cart-items']}>
    {cartCtx.items.map((item) => {
        return (
          <CartItem 
            key={item.id}
            price={item.price}
            name={item.name}
            amount={item.amount}
            onRemove={cartItemRemoveHandler.bind(null, item.id)}
            onAdd={cartItemAddHandler.bind(null, item)}
          />
        )
      })
    }
  </ul>
);
```

Now our cart should look pretty solid when adding items to it but just as a quick change to make it slightly nicer within `Cart.module.css` we will add the following to `.cart-items` class (should already be added but check for `max-height` and `overflow` set to auto as scroll will leave a scroll bar even when cart is empty)
```
.cart-items {
  list-style: none;
  margin: 0;
  padding: 0;
  max-height: 20rem;
  overflow: auto;
}
```

Now our cart looks fairly good although the add button and subtract button don't work and the same meals are added multiple times instead of aggregating and increasing `item.amount`




___
## 147. Working on a More Complex Reducer Logic
We want to udpate our reducer to no longer add new items to our cart items array when adding new items
Instead we want to check if the item exists already and if so update an 'amount' property and use that to calculate/display the cart

However we don't want to change how we calculate the `totalAmount`/`updatedTotal`
So we will move that to the top of the function so it is out of the way and begin working below
To determine if our items are in the cart already we will create variable called `existingCartItemIndex` which we will use to determine if/where the item is already in the cart (found in `state.items`)
We will call `.findIndex()` on our `state.items` 
This is a built in js function that accepts an anonymous function and returns whether the item we want is in the given array
To use this we use:
```
const existingCartItemIndex = state.items.findIndex((item) => {item.id === action.item.id})
```
What this does is is goes through `state.items` and will see if the item of the current id matches the id of the item we are passing through the action in this dispatch function
If it does that INDEX (location in the array) will be returned to `existingCartItemIndex`

Now that we have the index of that item we can get the existing cart item by pulling it directly from our `state.items` and passing in the index we just received
```
const existingCartItem = state.items[existingCartItemIndex];
```
This will only work if we have that item
Otherwise `existingCartItemIndex` would be null
If it is in the array we now have `existingCartItem` holding the item from the state array
Now we can initiate an `updatedItem` variable as well as `updatedItems` with `let`
```
let updatedItem;
let updatedItems;
```
Note that this crashes with a variable name we already have but we will fix this shortly

Now we will use an if statement to check if `existingCartItem` exists 
If so that means we were successful in finding an matching item and retrieving it from the state array
```
if(existingCartItem){

}
```
Inside of this if statemnent we will want to use `updatedCartItem` and copy the existing values with the spread operator
Then we will also update the amount by increasing it by the `action.item.amount` value
```
let updatedItem;
let updatedItems;
if(existingCartItem){
  updatedItem = {
    ...existingCartItem,
    amount: existingCartItem.amoung + action.item.amount
  }
}
```
Now inside of this if statement we stil have to update the array as a whole by using the `updatedItems` var we initiated
We will use this to copy the current `state.items` array
Then we will use the `existingCartItemIndex` we found earlier to target one of the items in the array and set it equal to our new `updatedItem`
```
let updatedItem;
let updatedItems;
if(existingCartItem){
  updatedItem = {
    ...existingCartItem,
    amount: existingCartItem.amoung + action.item.amount
  }
  
  updatedItems = [...state.items]
  updatedItems[existingCartItemIndex] = updatedItem
}
```
We also have to deal with what happens if there is no `existingCartItem`
In that case we just want to add the `action.item` to the end of our `updatedItems` array just like we did before
We can also move `updatedItem` into the if block since we didn't need to access it outside of the if statement
```
} else {
  updatedItems = state.items.concat(action.item);
}
```
At this point our reducer `'ADD'` action should look like this
```
const cartReducer = (state, action) => {
  if(action.type === 'ADD'){
    const updatedTotal = state.totalAmount + (action.item.price * action.item.amount)
    
    const existingCartItemIndex = state.items.findIndex((item) => item.id === action.item.id);
    console.log(existingCartItemIndex);
    const existingCartItem = state.items[existingCartItemIndex];

    let updatedItems;
    if(existingCartItem){
      const updatedItem = {
        ...existingCartItem,
        amount: existingCartItem.amount + action.item.amount
      }
      
      updatedItems = [...state.items]
      updatedItems[existingCartItemIndex] = updatedItem
    } else {
      updatedItems = state.items.concat(action.item);
    }

    return {
      items: updatedItems,
      totalAmount: updatedTotal
    }
  }
  return defaultCartState;
}
```

Now if we reload we can add a meal item and if we continue to add this item (or add multiple) there will still only be one listing but with an amount that is being used to calculate the cost




___
## 148. Making Items Removeable
Now we want to put the final touches on our cart
We want to make sure that we are able to add and remove items from there
Currently we are only able to add items from the main screen

We already ahve the logic for adding items so we can handle that
Right now within `<Cart>` where we call `<CartItem>` we are passing in functions for `onAdd` and `onRemove` that are hooked to the '+' and '-' buttons on the item but the functions we have defined for them are empty

So in our `cartItemAddHandler` we need to forward the item just like we do in meal item
The only difference is we already have the item available and we want to specify that the amount for that item is 1 and isn't being held as a different value
In `<MealItem>` we did this by accessing our `CartContext.addItem` function and passing in an item object
We will do the exact same thing here
```
const cartItemAddHandler = (item) => {
  cartCtx.addItem({...item, amount: 1})
}
```

Now when we click the plus button is should activate our function and pass in an the appropriate item with the amount locked to 1 
This will increment the number of that item in the cart by 1


We already have the `cartItemRemoveHandler` again as an empty function just like `cartItemAddHandler` was but we cannot just call `cartCtx.removeItem` as we haven't written a reducer function to handle that action yet

So in our `<CartProvider>` we will see where we call `removeItem` within `cartContext`
```
const cartContext = {
  items: cartState.items,
  totalAmount: cartState.totalAmount,
  addItem: addItemToCartHandler,
  removeItem: removeItemFromCartHandler
}
```

We are calling `removeItemfromCartHandler` which we have already defined here in `<CartProvider>` but is again empty
One note is that you might have this set to receive an item if you followed my notes but we actually only care about the id so we don't have to pass in the full item and sort the id out
```
const removeItemFromCartHandler = (id) => {}
```

Now within here we need to call our dispatch action, pass in the id that we will  use within the action so we can access it
```
const removeItemFromCartHandler = (id) => {
  dispatchCartAction({type: 'REMOVE', id: id})
}
```

Now we need to write a function in our reducer to handle this `'REMOVE'` action
First thing to do is to add an `if` statement to check for this action
```
  if(action.type === 'REMOVE'){
    
  }
```

For our logic, we generally will want to reduce the `item.amount` value for the item with a matching id by 1 
So if we had 2 sushi we want to decrease that to 1 sushi after clicking
But if we had 1 sushi we would want to decrease that to 0 sushi and then remove sushi from the array
We will have to check for the amount in our reducer to determine the appropriate action but first we will focus on finding the item in the cart
To do this we will do something similar to what we did in the `'ADD'` action where we retrieved the index
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  
}
```
This will be slightly different that `'ADD'` because we are passing in the id and not the item so we are only checking `action.id` and not `action.item.id`
Now that we have a way to find the index of the item we can target theitem itself within our array
This is just like we did in `'ADD'`
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  const existingItem = state.items[existingCartItemIndex];
}
```

Now we can update the total appropriately by taking the total amount from state and subtracting the price of the item we just targetted
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  const existingItem = state.items[existingCartItemIndex];
  const updatedTotal = state.totalAmoung - existingItem.price;
}
```

Now we can create our updated items variable and define our if statement for our two actions
Remember if the amount of the item is 1 we want to remove it entirely otherwise we will decrease the value of the amount
We can just check if the amount is 1 and if so set our remove and then use an else statement to decrease the amount in general
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  const existingItem = state.items[existingCartItemIndex];
  const updatedTotal = state.totalAmount - existingItem.price;

  let updatedItems;
  if(existingItem.amount === 1){
    
  } else {

  }
}
```
Now in this case if we do hit our if we want to remove the existing item from the array
We can do this with `.filter()`
Remember this is a built in method that returns a built in array that accepts a function as an argument
This function will receive each item in the array and will keep the item if the condition on the item returns true and remove it if it returns false
So if we want to keep all items except for the one that matches our id
We use a not equal comparison for this since we want to return true if the id does not match  
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  const existingItem = state.items[existingCartItemIndex];
  const updatedTotal = state.totalAmount - existingItem.price;

  let updatedItems;
  if(existingItem.amount === 1){
    updatedItems = state.items.filter((item) => {
      item.id !== action.id
    })
  } else {

  }
}
```

Now all items will return true except for the item is to be removed

Now we can work on our `else` statement for if the amount is greater than 1
In this case we don't want to remove the item from the array we just want to updated the amount
To do this we can create a copy of the existing item with an updated amount of -1 to the current amount'
Then we will set `updatedItems` to be a copy of the current state items
FFinally we can target the current item and replace it with the one we just created
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  const existingItem = state.items[existingCartItemIndex];
  const updatedTotal = state.totalAmount - existingItem.price;

  let updatedItems;
  if(existingItem.amount === 1){
    updatedItems = state.items.filter((item) => {
      item.id !== action.id
    })
  } else {
    const updatedItem = {...existingItem, amount: existingItem.amount - 1};
    updatedItems = [...state.items];
    updatedItems[existingCartItemIndex] = updatedItem;
  }
}
```

Lastly we have to return the updated state which includes the `updatedItems` list
```
if(action.type === 'REMOVE'){
  const existingCartItemIndex = state.items.findIndex((item) => {
    item.id === action.id
  });
  const existingItem = state.items[existingCartItemIndex];
  const updatedTotal = state.totalAmount - existingItem.price;

  let updatedItems;
  if(existingItem.amount === 1){
    updatedItems = state.items.filter((item) => {
      item.id !== action.id
    })
  } else {
    const updatedItem = {...existingItem, amount: existingItem.amount - 1};
    updatedItems = [...state.items];
    updatedItems[existingCartItemIndex] = updatedItem;
  }

  return {
    items: updatedItems,
    totalAmount: updatedTotal
  }
}
```

Now the logic for removing from the cart is set we just need to connect it to our actions

To do this within `<Cart>` we need to make sure we are accessing our context method `removeItem` and pass in the id of the item to remove
```
const cartItemRemoveHandler = (id) => {
  cartCtx.removeItem(id);
}
```

For reference this is what the completed reducer function should look like with both `'ADD'` and `'REMOVE'`
```
const cartReducer = (state, action) => {
  if(action.type === 'ADD'){
    const updatedTotal = state.totalAmount + (action.item.price * action.item.amount)
    
    const existingCartItemIndex = state.items.findIndex((item) => item.id === action.item.id);
    const existingCartItem = state.items[existingCartItemIndex];

    let updatedItems;
    if(existingCartItem){
      const updatedItem = {
        ...existingCartItem,
        amount: existingCartItem.amount + action.item.amount
      }
      
      updatedItems = [...state.items]
      updatedItems[existingCartItemIndex] = updatedItem
    } else {
      updatedItems = state.items.concat(action.item);
    }

    return {
      items: updatedItems,
      totalAmount: updatedTotal
    }
  }
  
  if(action.type === 'REMOVE'){
    const existingCartItemIndex = state.items.findIndex((item) => item.id === action.id);
    const existingItem = state.items[existingCartItemIndex];
    const updatedTotal = state.totalAmount - existingItem.price;

    let updatedItems;
    if(existingItem.amount === 1){
      updatedItems = state.items.filter((item) => item.id !== action.id)
    } else {
      
      const updatedItem = {...existingItem, amount: existingItem.amount - 1};
      updatedItems = [...state.items];
      updatedItems[existingCartItemIndex] = updatedItem;
    }

    return {
      items: updatedItems,
      totalAmount: updatedTotal
    }
  }

  return defaultCartState;
}
```

Now we should be able to add and remove items from the cart




___
## 149. Using the useEffect Hook
Now for the final touch in our app we will come back to the cart button in the header
It is functional of course but we want to play an animation when an item is added or removed from the cart
To do this the teacher provided an animation in the css file 'HeaderCartButton.module.css`
You can see it there defined by the `.bump` class
```
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

We need to apply this class to our button whenever an item is added or removed from the cart and then remove it after the animation is played
The easiest way to do this is with `useEffect` within `<HeaderCartButton>`

First we will create a variable to hold our classes inside using a template literal
For now instead of toggling the class on and off we will simply hardcode the class in so we can see how it works
After creating the template literal be sure to pass this in instead of just the singular `classes.button`
```

const btnClassses = `${classes.button} ${classes.bump}`

return (
  <button className={btnClassses} onClick={props.onClick}>
    <span className={classes.icon}>
      <CartIcon />
    </span>
    <span>Your Cart</span>
    <span className={classes.badge}>{numberOfCartItems}</span>
  </button>
)
```

Now if you save and reload you will see the `.bump` animation when the page loads
Instead of doing this on page load we want to apply this class whenever `cartCtx.items` changes
We want this to play not only if the array is different but also if the value of the objects within the array are different (specifically when `cartCtx.items[x].amount` changes regardless of which item it is)

Now that we have `btnClasses` which we want to make changes to we can call `useEffect` (don't forget to import)
Remember when we call `useEffect` we will be passing in an effect function as well as an array of dependencies
We can also add a cleanup function as the return of our first function but we don't need that right now
```
useEffect(() => {
  
}, [])
```
Within our function we want to change the value of `btn.classes` to include `.bump` 
Then we want to run a timer and when the timer is complete remove the class
In order to do this we will need to use state so that this component will re-render and be re-evaluated so `useEffect` can run

This state will control whether the button should be animated and since we don't want it to be animating by default it should be set to false
```
const HeaderCartButton = (props) => {
  const [btnIsHighlighted, setBtnIsHighlighted] = useState(false);
...
```

Then within `useEffect` we will set our state to be true
```
useEffect(() => {
  setBtnIsHighlighted(true);
}, [])
```
Now instead of always including `classes.bump` within `btnClasses` we will only do so if `btnIsHighlighted` is true
```
const btnClassses = `${classes.button} ${btnIsHighlighted ? classes.bump: ''}`
```
Now the entire component will re-execute and `btnClasses` will update with the correct values whenever `btnIsHighlighted` changes values

However we don't want to always change this state
We only want to do it if the items change and the lenght is greater than 0
So we can use an if statement within `useEffect` to cancel the animation if that is the case
```
useEffect(() => {
  if (cartCtx.items.length === 0) {
    return;
  }
  setBtnIsHighlighted(true);
}, [])
```

Now our `useEffect` will not activate if we don't have items in the cart

Next is to add our dependencies so that `useEffect` only runs when specific values change
If we pass in `cartCtx` as a whole then our component will be re-evaluated everytime `cartCtx` as a whole is changed which is not what we want
Instead we will use object destructuring to pull out the items from our cart and refer to that instead
This will also let us refer to this in `numberOfCartItems` instead of `cartCtx.items` as well

```
import React, { useState, useContext, useEffect } from 'react';
import CartContext from '../../store/cart-context.js';
import classes from './HeaderCartButton.module.css';
import CartIcon from '../Cart/CartIcon.js';

const HeaderCartButton = (props) => {

  const [btnIsHighlighted, setBtnIsHighlighted] = useState(false);

  const cartCtx = useContext(CartContext);

  const { items } = cartCtx;

  const numberOfCartItems = items.reduce((curNumber, item) => {
    return curNumber + item.amount;
  }, 0);

  const btnClassses = `${classes.button} ${btnIsHighlighted ? classes.bump: ''}`

  useEffect(() => {
    if (items.length === 0) {
      return;
    }
    setBtnIsHighlighted(true);
  }, [items])

  return (
    <button className={btnClassses} onClick={props.onClick}>
      <span className={classes.icon}>
        <CartIcon />
      </span>
      <span>Your Cart</span>
      <span className={classes.badge}>{numberOfCartItems}</span>
    </button>
  )
}

export default HeaderCartButton
```

Now if we save and reload the cart button won't bump on reload but will bump when you add something
But it will only do it the first time
This is because we are never removing the bump class becasuse we never set our state to false
If we set a timer within `useEffect` we can make it revert the value of state after a given amount of time which will cause the component to re-render and `btnClasses` will no longer have `classes.bump` applied
Since the duration of the animation is 300ms then that will be how long we will set the timer for
```
useEffect(() => {
  if (items.length === 0) {
    return;
  }
  setBtnIsHighlighted(true);

  setTimeout(() => {
    setBtnIsHighlighted(false);
  }, 300);

}, [items])
```

Lastly we want to apply a cleanup function to remove the timer 
Remember a cleanup function is defined by returning a function within the function we are passing into `useEffect`
```
useEffect(() => {
  effect
  return () => {
    cleanup
  }
}, [input])
```
We need this cleanup function to remove the timer in case the animation is played multiple times quickly
This will ensure that all the timers are cleared properly and `useEffect` doesn't continue playing queued animations well after 300ms are up

To do this for our timeer we simply need to give it a name by setting it equal to a const variable
Then in our return statement for that function we will pass another function which contains `clearTimeout` and pass the timer we just named into it
```
useEffect(() => {
  if (items.length === 0) {
    return;
  }
  setBtnIsHighlighted(true);

  const timer = setTimeout(() => {
    setBtnIsHighlighted(false);
  }, 300);

  return () => {
    clearTimeout(timer);
  }

}, [items])
```

Now our button animation should work correctly and the application is complete




___
## 150. Module Resources
You may want to compare your code to mine (e.g. to find + fix errors).

For that, you find multiple code snapshots for this module here in this Github repository: https://github.com/academind/react-complete-guide-code/tree/11-practice-food-order-app

Usage instructions can be found on the page that link is leading to.

Simply pick one of the snapshots in the /code folder - the subfolder names are chosen such that they are easy to match against lecture names in this course section.

You also find section slides (if available) in that Github repository.

<h3><center>---Section 11 Complete---</center></h3>