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