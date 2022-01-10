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