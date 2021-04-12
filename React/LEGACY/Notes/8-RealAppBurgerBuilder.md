# Section 8: A Real App: Burger Builder (Basic Version)
___
## 117. About React Hooks
As mentioned before, we'll build the course project without React Hooks for now 
(React Hooks are a new feature, introduced with React 16.8, I'll introduce them in-depth later).

Towards the end of the course, we'll have an entire module where we convert it to use React Hooks though 
(after having yet another Hooks deep-dive module of course).




___
## 118. Module Introduction
This module will help bring together a lot of the lessons learned from our demo project
This will be a real react application so we can see all of these concepts come together
This module will help cover how to plan an application like this and how to build our component tree
We will build a burger application where the user can dynamically build a burger, add ingredients, and place an order for the burger they created



___
## Planning an App in React - Core Steps

Now how do we plan our react app?
There are 3 basic steps to consider
You can break them up into more but these are the three basic steps
1. Component tree/component structure
    - Usually using a design it is important to break it up into app components
    - it is normal for the result that we have planned to be a little different than the initially planned component tree
    - It is important to get a good idea of what components should go into their own components
2. Application state (Data)
    - In our burger application we will need to keep track of the ingredients of that our added
    - This will help determine what to render
3. Components vs containers
    - You need to first know the component structure and state before planning this
    - This is where you decide which compnents should be stateless and which components need to manage their own state




___
## 120. Planning Our App - Layout and Component Tree
*If using vscode then there is a great draw.io extension that can help you draw/wireframe/plan*
*simply create a file ending with extension '.drawio' and open it in vscode after installing*

Now lets start planning our component tree
First to do that we need to define what our application is and what it should be able to do

Our page should probably have a navigation bar
To the far right will be a button for orders
in the middle a button to go to the burger builder
to the far left the burger builder logo 

What goes on the starting page? (The builder page)
There should be an area in the middle where the burger is being built
Then on the bottom there should be a box with controls that allows the user to add ingredients
Below that there should probably be a checkout button to buy the burger
Above the controls and below the burger we should display the cost of the burger

Now with our layout planned we can begin breaking it into sections and components

When building our component tree we need to start with our App component
Inside of our app component we will have a base layout which will include the header and the part below the header
The layout component will be used to
The layout component probably has a couple of components such as navigation and content
The navigation portion does need to be able to handle 2 scenarios:
1. Mobile view and in a sidedrawer
2. Desktop view and in a toolbar
This will help us create a responsive application if we cater to both mobile and desktop devices
So below our layout we might have a toolbar, side drawer, backdrop, whatever we want to display (burger builder or checkout or whatever)
To display the content we will use props.children to dynamically pass a page into our layout component

Now what will we display in the toolbar?
We can write our html in here but it might contain some components of its own
One for example could be the drawer toggle button
Another is we might put the logo in its own component
Lastly we could add the navigation items to be their own component because then we could reuse it in both the toolbar and the sidedrawer

Now what about the side drawer?
We will want to show the logo again

Backdrop will be used to just hold some html and won't have any nested children

That just leaves us with `{props.children}`
This will be used to pass "different pages" into our apps
Each of these pages will just be their own components
For now we will only have one page though and that will be the actual burger builder page

So what will the burger builder page look like?
Well we will need to have access to 3 things
1. The build controls (where we add ingredients)
2. The checkout modal
3. The actual preview of the burger

Now we can start thinking about the build controls and what it will contain
We know that it will probably contain a list of individual 'build control' components
Each of these components will operate an individual ingredient that the user can add

What about the burger preview?
This should hold some ingredient components (a list of ingredients that is dynamically managed with build controls)
Each ingredient is probably a div that displays an image or an ingredient representation with css

Now we can handle our checkout modal
What is that exactly?
It will just be a modal that can wrap itself around a child  so that we can make modal preview windows as needed
So modal will only need `{props.children}`
Then we could reuse it for all kinds of things like errors or order summaries

This list isn't necessarily all encompassing but it does give us a good idea of what we need to build


- App
  - Layout
    - Toolbar
      - Drawer toggle 
      - Logo
      - Navigation items
    - Side Drawer
      - Logo
      - Navigation items
    - Backdrop
    - `{props.children}`
      - Different pages
        - Burger Builder
          - Burger Preview
            - ingredient
            - ingredient
            - ingredient (etc...)
          - Build Controls
            - ingredient control
            - ingredient control (etc...)
            - order button
          - Checkout modal
            - `{props.children}`




___
## 121. Planning the State
Now that we have an idea for the layout of our components we can start planning how the data will flow in our app (our state)

This will be really important because it will help us identify what will be a component and what will need to be a container

We need to think about what kind of data our application will need and where it will need it
One thing it will need is ingedients
This will likely be a js object which will hold a list of ingredients and a value representing how many of that ingredient should be included

Another thing we need to know is whether the user is currently checking out or not (did they click on purchase/checkout or not)
This will help control whether or not we show the modal to checkout for example

The only other thing we might need as of right now is a total price to help keep track of the running cost of each ingredient

- State
  - Ingedients
    - `{meat: 1, cheese: 2, ...etc}`
  - Purchased
    - `purchased: true //or false`
  - Total price
    - `totalPrice: 16.74`

Our state is actually pretty simple which is great

Where do we manage it?
You might think the App component at the top would be the best place but that actually isn't the best

The best place to do this is in the burger builder
This is because all of the values within our state are only involved in our burger builder page
We don't need the state in app because the toolbar and sidedrawer don't need access to that data
If we wanted to keep track of past burgers then we may want to put those in the App component but currently our state only refers to the current burger being built

So now we know that the burger builder page component should be a stateful component and have access to the properties we have described so far
Everything else can be stateless (at least for now)
The app component by default is set to be stateful but we can change that or leave that, there is no real impact either way

Now that we have done all of our planning we should be ready to get started building our project




___
## 122. MUST READ: Enable CSS Modules
MUST READ (at least the first few paragraphs ... ;-))

In the next lecture, we'll use a styling solution named "CSS modules". 
We already had a look at that in the "Styling" section earlier in the course.

In the next lecture, we'll enable CSS modules and depending on the project setup you're using, the exact steps shown there might not work for you.

At least if you're not using the starting project you also find attached to the next lecture. 
If you DO use that, you should be able to continue without issues 
(and you can skip the rest of this text lecture here).

***

In more recent project versions created by CRA, support for CSS modules is already built-in and you can use that feature without ejecting, please see: https://facebook.github.io/create-react-app/docs/adding-a-css-modules-stylesheet

I also showed this built-in support in the "Styling" section earlier in the course.

If you use this approach, you DON'T need to eject. 
But please don't skip the next videos though, I do explain what CSS modules are and why + how we use them there!

***

Optional:

If you still want to eject and manually adjust the Webpack config 
(as we do it in the new videos - which you don't need to do if you follow the approach described in the link above),
 you should take the below comments into account in case your webpack config (after ejecting) doesn't look the same as it does in my videos:

After ejecting, we edit a Webpack config file that's made available by ejecting. 
This file might look slightly different for you.

In the video, I'll look for an entry that starts like this (in the webpack.config.js file):

```
{
  test: /\.css$/,
  ...
}
```
and I then edit this entry.

This entry now looks slightly different. 
You'll have to find the following part in your webpack.config.js file:
```
{
  test: cssRegex,
  exclude: cssModuleRegex,
  ...
}
```
and then edit that entry.

Finally, it should look like this:
```
{
  test: cssRegex,
  exclude: cssModuleRegex,
  use: getStyleLoaders({
      importLoaders: 1,
      modules: true,
      localIdentName: '[name]__[local]__[hash:base64:5]'
  }),
}
```
You can ignore me editing the webpack.config.prod.js file - 
with the latest version of create-react-app, ejecting only gives you ONE webpack config file
(which you edit as described above).




___
## 123. Setting Up the Project
Now with the planning done lets get started building the project
To get started lets go ahead and use `create-react-app`
One note is that the teacher is using a slightly different version
To use the exact same version as the teacher use:
```
$create-react-app burger-builder --scripts-version 1.1.5
```

Otherwise if you want to use the latest version of react (and avoid ejecting for css modules) then you can use the following:
```
// I will be using this version instead of the teacher version 
// This is so I don't have to eject and worry about having dependencies that have gone out of date
$create-react-app burger-builder
```

If you used the command with `--scripts-version 1.1.5` attached then you will need to eject the project and prepare it manually (see previous lesson)

If you used the default command you simply name your css with the following naming pattern (where 'filename' is the name of your css file)
```
filename.module.css
```

Then do a named import from the file and the classes within will be available under than name
```
import styles from './path/to/filename.module.css';
// styles.classname is now available
```

Now for some cleanup work we can: 
- delete logo.svg 
- remove the import for logo.svg in app.js 
- remove content from app.js return div 
- remove classname from app.js return div
- remove app.css import from app.js
- delete app.css file
- import opensense font with the following in our index.html (right above `<title>` tag)
  ```
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
  ```
- update index.css font family to use this new font in the body
  ` font-family: 'Open Sans', sans-serif;`
- update `<title>` tag in index.html

Now our app should be ready to start building!




___
## 124. Creating a Layout Component

Now with our app read to run use `$npm run start` to make sure it is working properly
If everything is working properly we can move on
(you may want to add something to app.js and rename to app.jsx)

Now we can start building out our components
The first one that we will need is the layout component which is important because it will help define where each of our components will sit on the page

Inside of this component we will be able to organize the toolbar and burger builder content
Later in this course we will pass other pages into this component other than the burger builder

We could just use App.js into a layout component and that would be fine but in order to keep our code as clean and modular as possible we will put it into its own component

We can start by making a couple of folders (inside src)
- components
- containers

Components will be used to hold our stateless components ('dumb')
Containers will be used to hold our statefull components ('smart')

We can also go ahead and add the assets folder

Now we can create our layout.jsx file
Layout will get its own folder inside of our components folder
This is because layout doesn't need to manage state so it is a component and not a container
Now in our layout.jsx we can begin creating our component
remember to import react
```
import React from 'react';
```

Add an export
```
export default layout;
```

Then we can add our function that will be our component and define our layout
```
const layout = () => (

)
```

Since we used () instead of {} we can simply define our return statement directly inside (aka put the html layout we want to use directly inside)

Now we need to think about what we actually want this component to return
We pretty much want two different areas
One area will be to hold our Toolbar/SideDrawer/Backdrop (used when SideDrawer is out)
The other area will hold our main content
We can actually use the html main tag to do this since it was made for just this kind of thing
We won't call that content in here though we will instead call that content in App.js
It will be received by layout and displayed dynamically inside
This way we can pass alternate pages into this component in the future as needed
To access this we will need access to props.children
```
const layout = (props) => (
  <div>Toolbar, SideDrawer, Backdrop</div>
  <main>
    {props.children}
  </main>
);
```

Now we still have an error because we did not include a wrapping div but there are a couple of ways to fix this
One way would be to return an array of jsx elements instead and give each item a key
The other way is to create an aux higher order component like we did in the last course
This will wrap something and immediately output but will fulfill the requirement of having a wrapping element
Lets go ahead and do it this way because then we can reuse this in the future

So lets make the hoc folder and aux.js file
Note that this one is .js because we don't actually return any jsx, we don't even need to import react
We only need to create a function that returns the children inside of it and export it
```
const aux = (props) => props.children;

export default aux;
```

Now back in our layout.jsx we can import this aux file and use it to wrap our two divs
```
import React from 'react';
import Aux from '../../hoc/Aux';

const layout = (props) => (
  <Aux>
    <div>Toolbar, SideDrawer, Backdrop</div>
    <main>
      {props.children}
    </main>
  </Aux>
);

export default layout;
```

Now we should be able to call the layout component we just created in App.js
First import it
```
import Layout from './components/Layout/Layout';
```

Then we can call it with opening and closing tags 
We are using opening and closing tags because we should be able to wrap other components/elements inside and have them display on the screen
```
function App() {
  return (
    <div>
      <Layout>
        <div>Hello there!</div>
      </Layout>
    </div>
  );
}
```

Now when we run the app make sure that the "Toolbar" list appears along with the div we passed in within App.js
Another check to make is that the correct font has been loaded




___
## 125. Starting Implementation of the Burger Builder Container
Now we can get to the fun part of implementing the main burger builder section of our website

As we decided in our design phase this should be a container because we will need to manage the state for the burger we are building

In our containers folder we can create a new folder called BurgerBuilder as well as a BurgerBuilder.jsx file with the class based BurgerBuilder component
Don't forget imports and exports
Another thing to remember to add is the `render()` method that returns jsx code
For now we only want to render two things in that return statement (which we can wrap with the Aux component)
These two divs will be the Burger visualization itself as well as the BuildControls
```
import React, { Component } from 'react';

class BurgerBuilder extends Component {
  render(){
    return(
      <Aux>
        <div>Burger</div>
        <div>BuildControls</div>
      </Aux>
    );
  }
}

export default BurgerBuilder;
```

Now we can import this class to our App.jsx file and replace our placeholder div that was outputting text
```
import React from 'react';
import Layout from './components/Layout/Layout';
import BurgerBuilder from './containers/BurgerBuilder/BurgerBuilder';

function App() {
  return (
    <div>
      <Layout>
        <BurgerBuilder />
      </Layout>
    </div>
  );
}

export default App;
```

Now when we reload our page we should see the "Toolbar", "Burger", and "Build controls"

A small improvement that we can make is to get the basic placement a little better and space things out a little
For example we could add a little bit of whitespace between the toolbar and the `<BurgerBuilder>` element
To fix this we can add a css class to our `<main>` div in our Layout component
Here we can simply add a margin-top to separate them out
For this we will need to add a new css file (within the Layout folder)
If you used react scripts 2.0+ (Didn't include the script version the teacher is using)
This file should be named Layout.module.css otherwise just name it Layout.css
In this file we can define a class name `.Content` with a `margin-top: 16px;`
```
.Content {
  margin-top: 16px;
}
```
Now import into Layout.jsx (following what you named it)
```
import classes from './Layout.module.css';
```

and attach `classes.Content` to our main div
```
const layout = (props) => (
  <Aux>
    <div>Toolbar, SideDrawer, Backdrop</div>
    <main className={classes.Content}>
      {props.children}
    </main>
  </Aux>
);
```




___
## 126. Adding a Dynamic Ingredient Component
Now we have started implementing the burger builder but there is a lot missing
Now let's continue and add the burger related components and ingredients
To do this we will create a new subfolder in our components folder called 'Burger'
This is where we will store everything burger related
This will make it easier to manage our components especially in really big apps
Inside of this Burger folder we will need a few subcomponents
One we will need is the burger.jsx file
This will be the burger that we are rendering to the screen
This won't do the trick alone we will also need ingredients
We will be able to combine all of these ingredients into a burger
So lets create a 'BurgerIngredients' subfolder along with a BurgerIngredient.jsx file
This is actually the file that we want to start working with since it is what will be used to render something

There is a prepared css file that is attached to the lesson that will help us render burger ingredients with css only (we don't have to import any assets)
```
.BreadBottom {
    height: 13%;
    width: 80%;
    background: linear-gradient(#F08E4A, #e27b36);
    border-radius: 0 0 30px 30px;
    box-shadow: inset -15px 0 #c15711;
    margin: 2% auto;
}

.BreadTop {
    height: 20%;
    width: 80%;
    background: linear-gradient(#bc581e, #e27b36);
    border-radius: 50% 50% 0 0;
    box-shadow: inset -15px 0 #c15711;
    margin: 2% auto;
    position: relative;
}

.Seeds1 {
    width: 10%;
    height: 15%;
    position: absolute;
    background-color: white;
    left: 30%;
    top: 50%;
    border-radius: 40%;
    transform: rotate(-20deg);
    box-shadow: inset -2px -3px #c9c9c9;
}

.Seeds1:after {
    content: "";
    width: 100%;
    height: 100%;
    position: absolute;
    background-color: white;
    left: -170%;
    top: -260%;
    border-radius: 40%;
    transform: rotate(60deg);
    box-shadow: inset -1px 2px #c9c9c9;
  }
  
.Seeds1:before {
    content: "";
    width: 100%;
    height: 100%;
    position: absolute;
    background-color: white;
    left: 180%;
    top: -50%;
    border-radius: 40%;
    transform: rotate(60deg);
    box-shadow: inset -1px -3px #c9c9c9;
  }

  .Seeds2 {
    width: 10%;
    height: 15%;
    position: absolute;
    background-color: white;
    left: 64%;
    top: 50%;
    border-radius: 40%;
    transform: rotate(10deg);
    box-shadow: inset -3px 0 #c9c9c9;
  }
  
  .Seeds2:before {
    content: "";
    width: 100%;
    height: 100%;
    position: absolute;
    background-color: white;
    left: 150%;
    top: -130%;
    border-radius: 40%;
    transform: rotate(90deg);
    box-shadow: inset 1px 3px #c9c9c9;
  }
  

.Meat {
    width: 80%;
    height: 8%;
    background: linear-gradient(#7f3608, #702e05);
    margin: 2% auto;
    border-radius: 15px;
}

.Cheese {
    width: 90%;
    height: 4.5%;
    margin: 2% auto;
    background: linear-gradient(#f4d004, #d6bb22);
    border-radius: 20px;
}

.Salad {
    width: 85%;
    height: 7%;
    margin: 2% auto;
    background: linear-gradient(#228c1d, #91ce50);
    border-radius: 20px;
}

.Bacon {
    width: 80%;
    height: 3%;
    background: linear-gradient(#bf3813, #c45e38);
    margin: 2% auto;
}

```

We can put this css into its own file within the BurgerIngredient folder (BurgerIngredient.module.css if using current install scripts)

Now we can import these ingredients to the burger ingredient component as well as write the component function and export statement
```
import React from 'react';
import classes from './BurgerIngredient.module.css';

const burgerIngredient = (props) => {
  
};

export default burgerIngredient;

```

Now in our function what do we want to do?
We will need some logic before rending our jsx code
That is because there are different ingredients this component can render and we will be getting the information on those ingredients via props

First we will let the ingredient variable be null just in case something invalid gets passed in somehow then we will look at our `props.type` that will be passed in within a switch statement
Within there we can make a case for each different ingredient type that we can expect and apply the correct css rules
We will have to make a different case for each different css class
When the case does match we will set our ingredient variable to have the associated class of the type that was passed in 
```
const burgerIngredient = (props) => {
  let ingredient = null;

  switch (props.type) {
    case ('bread-bottom'):
      ingredient = <div className={classes.BreadBottom} />;
      break;
  }
};
```
For the `.BreadTop` class we have to do it a little differently because it also contains seeds
So we have to add more than one div to the 'bread-top' case
Inside the bread top we will need 2 divs which will both represent the seeds
```
case ('bread-top'):
  ingredient = (
    <div className={classes.BreadTop}>
      <div className={classes.Seeds1} />
      <div className={classes.Seeds2} />
    </div>
  );
  break;
```

The rest of the cases are pretty straightforward other than our statement should default to a null ingredient if no match is found
Then when complete we can return our ingredient variable we just assigned
when finished should look like:
```
const burgerIngredient = (props) => {
  let ingredient = null;

  switch (props.type) {
    case ('bread-bottom'):
      ingredient = <div className={classes.BreadBottom} />;
      break;
    case ('bread-top'):
      ingredient = (
        <div className={classes.BreadTop}>
          <div className={classes.Seeds1} />
          <div className={classes.Seeds2} />
        </div>
      );
      break;
    case ('meat'):
      ingredient = <div className={classes.Meat} />;
      break;
    case ('cheese'):
      ingredient = <div className={classes.Cheese} />;
      break;
    case ('salad'):
      ingredient = <div className={classes.Salad} />;
      break;
    case ('bacon'):
      ingredient = <div className={classes.Bacon} />;
      break;
    default:
      ingredient = null;
  }

  return ingredient;
};
```

Note if you wanted to implement this differently (there are other ways feel free to) 
One such way could be to name the classes in such a way that the prop passed in is applied as the classname with a special exception made for `bread-top` but would need a way to handle invalid ingredients




___
## 127. Adding PropType Validation
Now we can PropType Validation which is used to validate the data types of our react properties

(See section 7 for more details)
To install this we use the following in the terminal to install
```
$npm install --save prop-types
```

Then we can import it to our burger ingredients component
```
import PropTypes from 'prop-types';
```

Next we just have to call it to verify the props that are passed in by using a js object
`.isRequired` is a special tag we can add on to verify that it was included and throw an error if prop.type is forgotten
```
burgerIngredient.PropTypes = {
  type: PropTypes.string.isRequired
};
```

At this point the teacher makes BurgerIngerdient a class based compnent which is unnecessary.
Since this component won't be managing state and PropTypes is still available to functional components I'm going to leave it as is




___
## 128. Starting the Burger Component
Now that we have the ingredients prepared we can start to build the burger
We will be working in Burger.jsx
This file is empty currently so first get it set up with the import, export, and function (will need props)
```
import React from 'react';

const burger = (props) => {
  return ();
}

export default burger;
```

Now what jsx do we want to export?
We know that it will use the burger ingredient component we have 
We also know that we will need an area to display the burger 
So we can start with simply a div that we can use as the display area
We will need to add a Burger.module.css file alongside Burger.jsx to style this div
Inside that css we can use the following: (feel free to adjust)
```
.Burger {
  width: 100%;
  margin: auto;
  height: 250px;
  overflow: scroll; /*Scroll within the window if the burger is too big*/
  text-align: center;
  font-weight: bold;
  font-size: 1.2rem; /*Set font size to be 1.2* what user selected as their default*/
}
```
We also set some media queries so that our page is responsive (adjust these later once we actually have content)
```
/*Mobile layouts*/
@media (min-width: 500) and (min-height: 400px) {
  .Burger {
    width: 350px;
    height: 300px;
  }
}

/*Smaller mobile*/
@media (min-width: 500px) and (min-height: 401px) {
  .Burger {
    width: 450px;
    height: 400px;
  }
}

/*Portrait mobile*/
@media (min-width: 1000px) and (min-height: 700px) {
  .Burger {
    width: 700px;
    height: 600px;
  }
}
```

Now we have to import the css file we just made and assign the class to our div
```
import React from 'react';
import classes from './Burger.Module.css';

const burger = (props) => {
  return (
    <div className={classes.Burger}>
      
    </div>
  );
}
```

Now we can start using our BurgerIngredient component here in the Burger component
First we have to import it
```
import BurgerIngredient from './BurgerIngredient/BurgerIngredient';
```

Now it is as simple as calling our `BurgerIngredient` component, being sure to pass a valid type in when we do
We can call each ingedient individually for now 
```
return (
  <div className={classes.Burger}>
    <BurgerIngredient type="bread-top"/>
    <BurgerIngredient type="cheese"/>
    <BurgerIngredient type="meat"/>
    <BurgerIngredient type="bread-bottom"/>
  </div>
);
```

Now if we render our burger component we should see a burger!
Go to BurgerBuilder.jsx, make sure Burger.jsx is imported, and pass it in instead of the Burger placeholder text
```
class BurgerBuilder extends Component {
  render(){
    return (
      <Aux>
        <Burger />
        <div>BuildControls</div>
      </Aux>
    );
  }
}
```

If you save and reload there should be a burger image on the screen that matches whatever was hardcoded in Burger.jsx!




___
## 129. Outputting Burger Ingredients Dynamically
Now that we are able to render a burger lets add some rules and a state so we can handle the burger rendering more dynamically

We already planned what will be inside of this state earlier
We know we will need an ingredients object with key value pairs
The keys in these pairs will be the name of the ingedient and the value will be the amount of that ingredient
For now let's initialize every ingedient with 1 to make things easier later
```
state = {
  ingredients: {
    meat:   1,
    cheese: 1,
    salad:  1,
    bacon:  1
  }
}
```

Now that we have a list of ingedients we are going to want to pass this ingredients object to our Burger component
We can say something like:
```
<Burger ingredients={this.state.ingredients} />
```

But burger doesn't know what to do with that information so we have to fix Burger.jsx to handle it
Now in Burger.jsx we are receivng an ingedients object but because it is an object we can't use `.map()` like we have in similar situations in the past
Instead we have to convert it from an object to an array first
To do that we can create a new constant name transformedIngredients
Here we can use the `Object.` object 
This has a method called keys which is able to extract the keys of an object that we pass in
This returns an array of keys
So it takes this:
```
ingredients: {
  meat:   1,
  cheese: 1,
  salad:  1,
  bacon:  1
}
```
and turns it into this:
```
["meat", "cheese", "salad", "bacon"]
```

by doing this:
```
const transformedIngedients = Object.keys(props.ingredients)
```

Now we can chain a `.map()` function to this to create our calls to Burger 
`.map()` will be performing a method on each ingedient key in our array
For each key
```

```

Takes array with `["meat", "cheese", "salad", "bacon"]`
On meat creates a new array with as many open spots as the value of props.ingedients.meat 
So if meat had a value of 3 then we would have created an empty array with 3 blank spaces
Then on this empty array we will perform another map method (still inside of the first)
This doesn't care about the element since the element is empty but does want the index to create a key
Then inside this map function we will return a BurgerIngedient component
This component must have a key since it will be returned in an array 
Then we can pass the 'igKey' or string value of the ingedient in here
Since there were three meats then there will be 3 burger ingredients type meat that are created and added to an array together
Then that array will be added to another array where the process will restart with cheese

In short a state that looks like this:
```
ingredients: {
  meat:   3,
  cheese: 3,
  salad:  1,
  bacon:  2
}
```
Will return an array like this:
```
[
  [<BurgerIngedient key="meat1" type"meat">, 
   <BurgerIngedient key="meat2" type"meat">, 
   <BurgerIngedient key="meat3" type"meat">
  ], 
  [<BurgerIngedient key="cheese1" type"cheese">, 
   <BurgerIngedient key="cheese2" type"cheese">, 
   <BurgerIngedient key="cheese3" type"cheese">
  ], 
  [<BurgerIngedient key="salad1" type"salad">
  ], 
  [<BurgerIngedient key="bacon1" type"bacon">, 
   <BurgerIngedient key="bacon1" type"bacon">
  ]
]
```

This is the method that will make this translation from object to array of components named after the key repeated by the value
```
const transformedIngedients = Object.keys(props.ingredients).map((igKey) => {
  return [...Array(props.ingredients[igKey])].map((el, i) => {
    return <BurgerIngredient key={igKey + i} type={igKey} />>;
  });
});
```

Notice that if the keys in your BurgerBuilder.state.ingredients do not match the cases we are looking for in BurgerIngredients then it will fail so always match those when adding or changing new ingedients

Now all we have to do is pass in our array of jsx instead of our hardcoded ingedients 
But put this in between `bread-top` and `bread-bottom` since all burgers will have bread
```
return (
  <div className={classes.Burger}>
    <BurgerIngredient type="bread-top"/>
    {transformedIngedients}
    <BurgerIngredient type="bread-bottom"/>
  </div>
);
```




___
## 130. Calculating the Ingredient Sum Dynamically

Now our burger looks great if we have ingedients but lets show a little message in the event our burger has no ingredients
We need to check if our transformed array is empty or not
Right now when we get transformed ingredients from our `.map()` chain we are getting an array filled with arrays
So if we were to run something like `transformedIngedients.length` we would get 4 even if there are 0 ingedients because there are 4 empty arrays which still count as an entry in transformedIngredients
So we can chain another method called `.reduce()` where we are creating `transformedIngredients`
This method will pull out our inner arrays and create 1 single array while combining them all into one big array
It will take this:
```
[[1,2,3][4,5,6][7,8,9]]
```
and turn it into this:
```
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```
This is a built in method and will receive  function as an argument
This function will receive 2 arguments the previous value, and the current value 
The last argument for this function will be the initial value which will be an empty array
```
nestedArray.reduce((arr, el) => { //nestedArray will be our transformed ingredients chain

}, [])
```
Then inside of this anonymous function we will return a value which will get added to the initial value (the empty array)
We just want to return the current element being concatenated with the previous which will make a chain of elements that will be added to the initially empty array
This makes the previous value always just an accumulation of all the values elements in the array before it
```
.reduce((arr, el) => {
  return arr.concat(el);
}, []);
```

Now our entire transformedIngedients should look like this:
```
const transformedIngredients = Object.keys(props.ingredients).map((igKey) => {
    return [...Array(props.ingredients[igKey])].map((el, i) => {
      return <BurgerIngredient key={igKey + i} type={igKey} />;
    });
  }).reduce((arr, el) => {
    return arr.concat(el);
  }, []);
```

Now if transformed ingedients is empty (no ingredients were passed into it we will simply have an empty array)
Now if we were to use `transformedIngredients.length` on our empty array we would get 0 instead of 4 (even if those were empty)

Now we can do an if statement to check the length of transformedIngredients and if it is 0 then we will output a short paragraph (make sure you switch your variable type to a let or it won't let you overwrite it from an array to a string!)
```
if (transformedIngredients.length < 1) {
  transformedIngredients = <p>Please start adding ingredients</p>
}
```




___
## 131. Adding the Build Control Component
Now we are ready to start adding the controls so users can add and change the number of burger ingedients dynamically
For that we will need to start creating the `BuildControls` component
This component will have its own subfolder (called `BuildControls`) inside the burger component and be called `BuildControls.jsx`

In this new file we can add our component (import, function that returns jsx, export yada yada yada)
```
import React from 'react'

const buildControls = (props) => (
  
);

export default buildControls;
```

Now what do we want to return?
Well first we want a div that we can use to set a style and adjust the size of easily
This will allow us to easily control the size of our control panel
To do this we will also need a `BuildControls.module.css` along with a class to set size
```
.BuildControls {
  width: 100%;
  background-color: #CF8F2E;
  display: flex;
  flex-flow: column;
  align-items: center;
  box-shadow: 0 2px 1px #ccc;
  margin: auto;
  padding: 10px 0;
}
```

Then we can add this css file to our `BuildControls` module
```
import React from 'react';
import classes from './BuildControls.module.css';

const buildControls = (props) => (
  <div className={classes.BuildControls}>
    
  </div>
);

export default buildControls;
```

Now if we think about what our BuildControls module will have inside of it we will need multiple different sections within here
Each section will need to:
- display an ingredient name
- show the current value of that ingredient
- Have a button for increasing ingredient value
- Have  abutton for decreasing ingredient value

So we can go ahead and make another component called BuildControl
This will be a singular section of the over BuildControl and will handle single ingredients
We can create a new folder/file called `BuildControls/BuildControl/BuildControl.jsx` also create a `BuildControl.module.css` in this same folder which we will use later

Now what do we put in this component?
We know we will need at least 4 things so we can use a wrapping div to hold them all together
We will use a wrapping div instead of the `Aux` component because we may want to add a class to this later
Inside of this wrapping div we can add each of the items listed above
First we can add an ingedient label with `props.label` which we will have to pass into this button (context maybe to avoid chaining the BuildControls?)
Then we will need 2 buttons
One of these buttons will receive a function that increases the count of the current ingredient
The other will receive a function to do the opposite
For now we will use placeholders and pass that functionality in later
```
const buildControl = (props) => (
  <div>
    <div>{props.label}</div>
    <button>Less</button>
    <button>More</button>
  </div>
);
```

Now to make sure everything looks good we can add a little css before making these functional
Below is some suggestion but feel free to do whatever you want or make changes
These were all provided by the instructor
```
.BuildControl {
  display: fex;
  justify-content: space-between;
  align-items: center;
  margin: 5px 0;
}

.BuildControl button {
  display: block;
  font: inherit;
  padding: 5px;
  margin: 0 5px;
  width: 80px;
  border: 1px solid #AA6817;
  cursor: pointer;
  outline: none;
}

.BuildControl button:disabled {
  background-color: #AC9980;
  border: 1px solid #7E7365;
  color: #ccc;
  cursor: default;
}

.BuildControl button:hover:disabled {
  background-color: #AC9980;
  color: #ccc;
  cursor: not-allowed;
}

.Label {
  padding: 10px;
  font-weight: bold;
  width: 80px;
}

.BuildControl .Less {  
  background-color: #D39952;
  color: white;
}

.BuildControl .More {
  background-color: #8F5E1E;
  color: white;
}

.BuildControl .Less:hover, .BuildControl .Less:active {  
  background-color: #DAA972;
  color: white;
}

.BuildControl .More:hover,.BuildControl .More:active {
  background-color: #99703F;
  color: white;
}
```

Now back in our BuildControl component we can apply these css styles to our divs
```
const buildControl = (props) => (
  <div className={classes.BuildControl}>
    <div className={classes.Label}>{props.label}</div>
    <button className={classes.Less}>Less</button>
    <button className={classes.More}>More</button>
  </div>
);
```




___
## 132. Outputting Multiple Build Controls
Now that we have a build control component created we need to add the functionality to create a couple different BuildControl components with different values
We will need to add this functionality to BuildControls so that it can generate the appropriate buttons as needed
So in order to handle this we want to create an array within `BuildControls`
This array will hold several objects, each object will be an ingedient which we will have controls for
Each object will have 2 keys: `label` & `type`
These 2 keys will basically match each other except type will be lowercase
Note that it is probably a good idea to put these in the same order as your state so they match visually
```
import React from 'react';
import classes from './BuildControls.module.css';

const controls = [
  { label: 'Bacon', type: 'bacon'},
  { label: 'Salad', type: 'salad'},
  { label: 'Cheese', type: 'cheese'},
  { label: 'Meat', type: 'meat'}
]

const buildControls = (props) => (
  <div className={classes.BuildControls}>

  </div>
);

export default buildControls;
```

Now we can start thinking about how we want to display content between our divs in `buildControls`
We know that between these 2 divs we need to loop through the `controls` array and generate a `BuildControl` element for each item within the array
To start we will need to access that `BuildControl` component so we can import it
Now in our function we can add our loop to add these elements in the BuildControls div
To start we will want to call `.map()` on our controls array
With our `.map()` function we will want to loop through the controls array and each time generate a new `<BuildControl>` element
This element will need to be assigned a key (we can use label since that will be unique still)
We also need to pass in the label as a prop since that is displayed
```
const buildControls = (props) => (
  <div className={classes.BuildControls}>
    {controls.map((ctrl) => (
      <BuildControls key={ctrl.label} label={ctrl.label}></BuildControls>
    ))}
  </div>
);
```

Now we can add our `<BuildControls>` to the `BurgerBuilder` container and see if our compnents display

```
import React, { Component } from 'react';
import Aux from '../../hoc/Aux';

import Burger from '../../components/Burger/Burger';
import BuildControls from '../../components/Burger/BuildControls/BuildControls';

class BurgerBuilder extends Component {

  state = {
    // Current burger ingedients
    ingredients: {
      bacon:  0,
      salad:  0,
      cheese: 0,
      meat:   0
    }
  }

  render(){
    return (
      <Aux>
        <Burger ingredients={this.state.ingredients} />
        <BuildControls />
      </Aux>
    );
  }
}

export default BurgerBuilder;
```

Now there should be an area below the burger with buttons and a list of ingredients




___
##  133. Connecting State to BuildControls
Now we need to add our state.ingredients to the BuildControls so that the user is able to dynamically change the values in state and trigger the burger to update

To do this we will need to add a couple of methods to our `BurgerBuilder.jsx` that allow us to update our state
One method will allow users to add ingredients
The other will allow users to remove ingredients
These will be handlers since they will be attached to onClick methods

Let's start with the `addIngredientHandler`
This method will receive a type argument which it will use to help determine which ingredient we will be adding to
First we need to know what the old ingedient count is and save it to a constant
Then we will calculate the updated count which will be the old count + 1
Next we need to create a new js object that is a copy of the current state
Remember we have to create a new object since the state has to be updated in an immutable way
Then we can update our copied version of the state.ingedients with the new values
One thing before making our updates and finishing is that we also want to start keeping track of price now
So add `totalPrice: 4` to the state (direct child of state sister to ingedient)
Since we want different prices for different ingredients we will need to store this object of ingedients and prices
We will store it outside of the BurgerBuilder class so that it can be a global constant (so name it in all caps as well)
```
const INGREDIENT_PRICES = {
  bacon: 1.5,
  salad: 0.5,
  cheese: 0.25,
  meat: 1.5
}
```
Now back in our addIngredientHandler we can search this object to get the price we need to add to totalPrice 


Finally we can push our updated copies of the state.ingredients and state.totaPrice to the state
```
import React, { Component } from 'react';
import Aux from '../../hoc/Aux';

import Burger from '../../components/Burger/Burger';
import BuildControls from '../../components/Burger/BuildControls/BuildControls';

// Hardcoded list of ingredient prices must have entry for every state.ingredient key
const INGREDIENT_PRICES = {
  bacon: 1.5,
  salad: 0.5,
  cheese: 0.25,
  meat: 1.5
}

class BurgerBuilder extends Component {

  state = {
    // Current burger ingedients
    ingredients: {
      bacon:  0,
      salad:  0,
      cheese: 0,
      meat:   0
    },
    totalPrice: 4
  }

  addIngedientHandler = (type) => {
    const oldCount = this.state.ingredients[type];
    const updatedCount = oldCount + 1;
    const updatedIngredients = {
      ...this.state.ingredients
    }
    updatedIngredients[type] = updatedCount;
    const priceAddition = INGREDIENT_PRICES[type];
    const oldPrice = this.state.totalPrice;
    const newPrice = oldPrice + priceAddition;
    this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
  }

  render(){
    return (
      <Aux>
        <Burger ingredients={this.state.ingredients} />
        <BuildControls />
      </Aux>
    );
  }
}

export default BurgerBuilder;
```

Now we should be able to hook this handler up to our button in our controls
To do that we can pass in as a property to the build controls
```
<BuildControls 
  ingredientAdded={this.addIngredientHandler}
/>
```

Now inside of `<BuildControls>` we need to pass it to the individual buildControl we are calling
However this would mean we also need to pass type into our method as well
We can actually save ourself this and instead add the reference to the method where the type that is being used to build the current BuildControl is passed into this function
Then the method would be available and we wouldn't have to worry about the type chaning on accident
This is because the type for our addition button is determined before the component is even rendered
```
<BuildControl 
  key={ctrl.label} 
  label={ctrl.label}
  added={() => props.ingredientAdded(ctrl.type)}
/>
```

Now the last thing we need to do is add the `added` property to our button so the defined function will execute when it is clicked
To do that we can simply go into our BuildControl.jsx and add it to our More button: (may have accidentally been a div before, change it)
```
const buildControl = (props) => (
  <div className={classes.BuildControl}>
    <div className={classes.Label}>{props.label}</div>
    <button className={classes.Less}>Less</button> //change this one too
    <button className={classes.More} onClick={props.added}>More</button>
  </div>
);
```
Now if you save the add button should work and dynamically add ingredients to our burger

Now we have to do something similar with the minus button




___
## 134. Removing Ingredients Safely
Now that we are able to add ingredients we have to also add the ability to remove them
We can add the `removeIngredientsHandler` to our BurgerBuilder

It should be pretty similar to the `addIngredientHandler` so for now we can copy/paste it and make some minor changes
One change is to subtract to get our updated count instead of add
Then we should updated our `priceAddition` to be a `priceDeduction` and subtract it to get `newPrice` instead of add
```
removeIngredientHandler = (type) => {
  const oldCount = this.state.ingredients[type];
  const updatedCount = oldCount - 1;
  const updatedIngredients = {
    ...this.state.ingredients
  }
  updatedIngredients[type] = updatedCount;
  const priceDeduction = INGREDIENT_PRICES[type];
  const oldPrice = this.state.totalPrice;
  const newPrice = oldPrice - priceDeduction;
  this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
}
```

Now we should be set to pass this function into our button
To do this we will first have to pass it into our `<BuildControls>` component
```
<BuildControls 
  ingredientAdded={this.addIngredientHandler}
  ingredientRemoved={this.removeIngredientHandler}
/>
```

Then we pass this method to our individual `<BuildControl>` as a prop
```
<BuildControl 
  key={ctrl.label} 
  label={ctrl.label}
  added={() => props.ingredientAdded(ctrl.type)}
  removed={() => props.ingredientRemoved(ctrl.type)}
/>
```

Now in our `<BuildControl>` we can call this method on our button click
```
<button className={classes.Less} onClick={props.removed}>Less</button>
```

Now if we save everything and reload the page we should see that we have the ability to now remove ingredients that have been added to the burger

However there is one big issue still
The issue is that if there is no ingredient of a given type and then you try to remove and ingredient our entire page crashes
This is because we are then setting that ingredient value to -1
Then we try to make an array that has a length of -1 but that makes absolutely no sense and is ridiculous to even consider

So what we have to do is keep our method from running if the ingredient we are removing is 0 (or less)
This is easy enough to do do within our `removeIngredientHandler` with a simple if statement
```
removeIngredientHandler = (type) => {
  const oldCount = this.state.ingredients[type];
  if (oldCount <= 0) {
    return;
  }
  const updatedCount = oldCount - 1;
  const updatedIngredients = {
    ...this.state.ingredients
  }
  updatedIngredients[type] = updatedCount;
  const priceDeduction = INGREDIENT_PRICES[type];
  const oldPrice = this.state.totalPrice;
  const newPrice = oldPrice - priceDeduction;
  this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
}
```
Now we will break out of our function if we don't have an ingredient to remove

What would be really cool is if we could disable the button entirely when there are no ingredients to remove
We need to add some logic to our render method
We will create a copy of our state in there that will be used to check for the values of each of our ingredients when they are rendered
If they are below a specific value then we will try to target the 'less' button for that ingredient and disable it

First to add our variable that will check for these values in our render method
```
render(){
  const disabledInfo ={
    ...this.state.ingredients
  }
  
  return (
    <Aux>
      <Burger ingredients={this.state.ingredients} />
      <BuildControls 
        ingredientAdded={this.addIngredientHandler}
        ingredientRemoved={this.removeIngredientHandler}
      />
    </Aux>
  );
}
```

Now we want to loop through this object and check if the value is 0 or less
To do that we can use a for loop
Inside of this for loop we will want to convert each ingredient from a number to instead be true or false based on if the value is greater than 0 or not
This is as simple as setting our current value for this equal to a boolean check using the current value and 0
```
render(){
  const disabledInfo ={
    ...this.state.ingredients
  }

  for (let key in disabledInfo) {
    disabledInfo[key] = disabledInfo[key] <= 0
  }
...
```
Now we should have an object called `disabledInfo` that will hold true or false values for each ingredient
```
const disabledInfo = {
  ...this.state.ingredients
}
// =>
// disabledInfo = {
// bacon:  0,
//  salad:  0,
//  cheese: 0,
//  meat:   0
// }
// =>
// diabledInfo = {
//   bacon:  false,
//   salad:  false,
//   cheese: false,
//   meat:   false
// }
```

Now we can pass this object into our buildControls component
```
<BuildControls 
  ingredientAdded={this.addIngredientHandler}
  ingredientRemoved={this.removeIngredientHandler}
  disabled = {disabledInfo}
/>
```

Then in our `<BuildControls>` component we can use this
Instead of calling the whole object though we can just get the value for the ingredient that matches the current build control we are working on with `ctrl.type`
```
<BuildControl 
  key={ctrl.label} 
  label={ctrl.label}
  added={() => props.ingredientAdded(ctrl.type)}
  removed={() => props.ingredientRemoved(ctrl.type)}
  disabled={props.disabled[ctrl.type]}
/>
```
Now lastly on our button we can set the disabled property on our button (which is a default property)
We can simply pass in the true or false value that was passed into `<BuildConrol>` as a prop
```
<button 
  className={classes.Less} 
  onClick={props.removed} 
  disabled={props.disabled}>Less</button>
```
Now when saving we shouldn't be able to remove ingredients from our burger on page load since the initial values are set to 0




___
## 135. Displalying and Updating the Burger Price
Now that we can fully add and remove ingredients we want to update the price and display it on our page
We want to add the price directly above our build control (so it shows without having to scorll the burger if the burger gets too big)

To do that in our build controls we will also output the burger price before we map each of the controls
This is easy enough we can simply do the following and have price passed in as a prop:
```
<p>Current Price: {props.price}</p>
```
Since price is calculated in the Burger Builder container we can simply pass it into our build controls from there
```
<BuildControls 
  ingredientAdded={this.addIngredientHandler}
  ingredientRemoved={this.removeIngredientHandler}
  disabled = {disabledInfo}
  price={this.state.totalPrice}
/>
```

Now when we add ingredients our price will adjust live

We can make a couple of adjustments to make this a littler better
One thing we can add is the `<strong>` tag which will bold the number
Then we will want to add a dollar sign
Next we can call a method called toFixed which will have a set number of decimals show for the number (in this case 2)
```
<p>Current Price: <strong>${props.price.toFixed(2)}</strong></p>
```




___
## 136. Adding the Order Button
Now we will work on the modal which allows us to display an order summary
This will be shown once we click a checkout button (we also need to add)

First let's add the checkout button
We will want to add the button to the bottom of our controls so we will work in `<BuildControls>`
This is simple enough with a button tag and some text below where we call each of our `<BuildControl>` elements
```
<button>Order Now</button>
```

Now to make this look a little nicer we will use some css to put in BuilControls.module.css
```
.OrderButton {
    background-color: #DAD735;
    outline: none;
    cursor: pointer;
    border: 1px solid #966909;
    color: #966909;
    font-family: inherit;
    font-size: 1.2em;
    padding: 15px 30px;
    box-shadow: 2px 2px 2px #966909;
}

.OrderButton:hover, .OrderButton:active {
    background-color: #A0DB41;
    border: 1px solid #966909;
    color: #966909;
}

.OrderButton:disabled {
    background-color: #C7C6C6;
    cursor: not-allowed;
    border: 1px solid #ccc;
    color: #888888;
}

.OrderButton:not(:disabled) {
    animation: enable 0.3s linear;
}

/*Animates button when active*/
@keyframes enable {
    0% {
        transform: scale(1);
    }
    60% {
        transform: scale(1.1);
    }
    100% {
        transform: scale(1);
    }
}
```

Now we have to add this class to our button
```
<button className={classes.OrderButton}>Order Now</button>
```

Another thing we want to do is not allow people to place an order for an empty burger
So, if all of the ingredients are at 0 (or all less than 1) then we want to disable the order button
Then when we add an ingredient the button should become active

To do this we can add a new property to our state called `purchasable`
This would be a boolean value that will be true if there is at least 1 ingredient and false if there are 0 ingredients in state.ingredients
We will then pass this value into our `<BuildControls>`
So first to update our state with the new value
```
class BurgerBuilder extends Component {

  state = {
    // Current burger ingedients
    ingredients: {
      bacon:  0,
      salad:  0,
      cheese: 0,
      meat:   0
    },
    totalPrice: 4,
    purchasable: false

  }
...
```

Now we can create a new method that will update the value of our new property when an ingredient is added or all ingredients are set to 0
We can simply call this method at the end of our `addIngredientHandler` and `removeIngredientHandler`
Then it will perform its check on the new values within state and update the `purchasable` property accordingly
Within the `updatePurchasableState` method we will make a copy of the state so not modify an immutable state
Then we want to turn our object into an array of values
Next we can check that array of values to see if all values are 0 or not

In the lecture he uses `Object.keys(ingredients)` to get an array of keys then maps that array of keys to a new array by cycling through each key and getting the associated value for that key from the original object and outputting that value to an array
Then reducing that array to a single sum by adding each individual value
If you are curious it looked like this
```
const ingredients = {
  ...this.state.ingredients
};
const sum = Objects.keys(ingredients).map((igkey) => {
  return ingredients[igkey];
}).reduce((sum, el) => {
  return sum + el;
}, 0);
```

However this video was probably made before `Object.values()` was made available
This allows us to return an array of values (essentially skipping the mapping step)
Example:
```
const obj = {
  a: 1,
  b: 2,
  c: 3
}
console.log(Object.values(obj)); //=>[1, 2, 3]
```
Then we can simply call the same reduce method on this array
For the reduce method it accepts two arguments 
The first argument is a function (which will accept two arguments itself `sum` and `el`)
The second argument is the initial value we want to add our array to (in this case we want to get to sum of the array not including any other values so we will start at 0)
For the function we are passing the `sum` is a running total with its intial value set to our second argument from before (remember: 0)'
The `el` argument is the current element that is being reduced
All we have to do is add the current element to our runnign total and the final result returned will be the sum
```
const sum = Object.values(ingredients).reduce((sum, el) => {
  return sum + el;
}, 0);
```

Now that we have a sum we can update `state.purchasable` with the boolean answer of whether or not `sum > 0`
```
setState({purchasable: sum > 0});
```

```
updatePurchasableState = () => {
  const ingredients = {...this.state.ingredients};
  const sum = Object.values(ingredients).reduce((sum, el) => {
    return sum + el;
  }, 0);
  this.setState({purchasable: sum > 0});
}
```

Now we need to pass the true/false value of `purchasable` to our `<BuildControls>` component
```
<BuildControls 
  ingredientAdded={this.addIngredientHandler}
  ingredientRemoved={this.removeIngredientHandler}
  disabled = {disabledInfo}
  price={this.state.totalPrice}
  purchasable={this.state.purchasable}
/>
```

Don't forget to call our method at the end of `addIngredientHandler` and `removeIngredientHandler`
```
addIngredientHandler = (type) => {
  const oldCount = this.state.ingredients[type];
  const updatedCount = oldCount + 1;
  const updatedIngredients = {
    ...this.state.ingredients
  };
  updatedIngredients[type] = updatedCount;
  const priceAddition = INGREDIENT_PRICES[type];
  const oldPrice = this.state.totalPrice;
  const newPrice = oldPrice + priceAddition;
  this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
  this.updatePurchasableState();
}

removeIngredientHandler = (type) => {
  const oldCount = this.state.ingredients[type];
  if (oldCount <= 0) {
    return;
  }
  const updatedCount = oldCount - 1;
  const updatedIngredients = {
    ...this.state.ingredients
  }
  updatedIngredients[type] = updatedCount;
  const priceDeduction = INGREDIENT_PRICES[type];
  const oldPrice = this.state.totalPrice;
  const newPrice = oldPrice - priceDeduction;
  this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
  this.updatePurchasableState();
}
```

Then we can simply add a `disabled` attribute to our button that is true or false based on the value of purchasable
Be careful since if a burger IS purchasable the value will be true but we want the button to be ENABLED if disabled is true when purchasable is true then our button will not show up when we need it
The opposite is also true where the button will be enabled only if there are no ingredients
We need to convert our purchasable value to the opposite when we call it to the `disabled` property
```
<button 
  className={classes.OrderButton}
  disabled={!props.purchasable}>Order Now</button>
```

Now when we load our page we have our button disabled but it seems to be a couple changes behind
This is because the state that our new method is checking may be outdated
This is easy enough to fix by passing in our updated version of state that we create
within the `addIngredientHandler` and `removeIngredientHandler`
We will just have to update our method to handle having a state object passed in instead of checking the value of `this.state.ingredients`

```
updatePurchasableState = (updatedIngredients) => {
  const sum = Object.values(updatedIngredients).reduce((sum, el) => {
    return sum + el;
  }, 0);
  this.setState({purchasable: sum > 0});
}

addIngredientHandler = (type) => {
  const oldCount = this.state.ingredients[type];
  const updatedCount = oldCount + 1;
  const updatedIngredients = {
    ...this.state.ingredients
  };
  updatedIngredients[type] = updatedCount;
  const priceAddition = INGREDIENT_PRICES[type];
  const oldPrice = this.state.totalPrice;
  const newPrice = oldPrice + priceAddition;
  this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
  this.updatePurchasableState(updatedIngredients);
}

removeIngredientHandler = (type) => {
  const oldCount = this.state.ingredients[type];
  if (oldCount <= 0) {
    return;
  }
  const updatedCount = oldCount - 1;
  const updatedIngredients = {
    ...this.state.ingredients
  }
  updatedIngredients[type] = updatedCount;
  const priceDeduction = INGREDIENT_PRICES[type];
  const oldPrice = this.state.totalPrice;
  const newPrice = oldPrice - priceDeduction;
  this.setState({ingredients: updatedIngredients, totalPrice: newPrice});
  this.updatePurchasableState(updatedIngredients);
}
```

Now our button will work as expected!

Next we want to create a modal to display the order summary when we click the button




___
## 137. Creating the Order Summar Modal
Now that we have the order now button we want to be able to open a modal with the order summary
To do that we will need a modal, a backdrop, and an order summary to show
The idea for the modal is to have a wrapping element that will have its own styling and accept content
Then we can pass the order summary into it to display

First we will need to create a modal component in a new folder in the components folder (create UI subfolder)
src/components/UI/Modal/Modal.jsx

We will also need a backdrop and since we might use it for other things such as a navigation sidebar
src/components/UI/Backdrop/Backdrop.jsx

Now what do we need for a modal?
We know that it won't need to manage state so it can be a functional component
It does receive props and return jsx
We know that one thing it willr return is a wrapping div with styling
Inside of that wrapping div we will render any child elements
```
import React from 'react'

const Modal = () => (
  <div>
    {props.children}
  </div>
)


export default Modal
```

Now for our css we need to add a Modal/Modal.module.css file and add the following css:
```
.Modal {
    position: fixed;
    z-index: 500;
    background-color: white;
    width: 70%;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px black;
    padding: 16px;
    left: 15%;
    top: 30%;
    box-sizing: border-box;
    transition: all 0.3s ease-out;
}

@media (min-width: 600px) {
    .Modal {
        width: 500px;
        left: calc(50% - 250px);
    }
}
```

Now we have our Modal class that is in a fixed position and puts it in front of everything else on the page
Now we can import this css and apply it to our div
```
import React from 'react';
import classes from './Modal.module.css';

const Modal = () => (
  <div className={classes.Modal}>
    {props.children}
  </div>
)


export default Modal

```

Now that we have our modal created we have to add it
Where do we add it to?
The best place is probably to add it to `<BurgerBuilder>`
We will need to import it 
Then we can simply render it at the top of our list (for now just self closing)
Now if we save we can see it show up in the middle of the page but there is no content because we did not pass any children into it
What we will want to do is pass the elements/components needed into this modal in order to display an order summary that lists the price and ingredients
Then we will create a toggle to only show this modal when the checkout button is clicked
Otherwise it will be hidden

We can start with creating the order summary which we can do by putting it in its own component
create:  components/Burger/OrderSummary/OrderSummary.jsx
Inside here we have to consider what we want the order summary to look like

Order summary will need:
- Title saying "your order"
- short text 
- list of all items in order
- price
- question "Continue to checkout?"
- buttons

We don't have a reason for a wrapping div so we can import our aux component and use that
```
import React from 'react'
import Aux from '../../../hoc/Aux';

export const orderSummary = (props) => {
  return (
    <Aux>
      
    </Aux>
  )
}

export default orderSummary;
```

Now we can start adding the content
First we can use an `<h3>` tag to say "Your Order"
Then below that  a `<p>` tag to say "A delicious burger with the following ingredients:"
After that we will start an unordered list of ingredients which we need to dynamically generate

To do that we will need to generate this list outside of our return statement and pass it in
We can create a new const called ingredientSummary which will accept an ingredients object through props and map them into a list of items
This is similar to something we have done before when creating our `<BurgerControls>` by creating each individual control component
What we will end up doing is getting an array of key names using `Objects.keys` and passing in our ingredients object
Then on that array we will perform a map which will create a new array by cycling through each key in the array
Inside of the map function we will create our list item and fill it with the key that was passed in and the value for that key within the props.ingredients object itself
Lastly we will apply a span on the `igKey` with a `text-transform: capitalize` inline css to better titlize our list
```
const ingredientSummary = Object.keys(props.ingredients).map((igKey) => {
  return (
    <li>
      <span style={{textTransform: 'capitalize'}}>
        {igKey}
      </span>: {props.ingredients[igKey]}
    </li>
  )
});
```

Now we just need to call this variable within our `<ul>` tags
```
<ul>
  {/* list of burger ingredients  */}
  {ingredientSummary}
</ul>
```

After our list we want a `<p>` at the end where we ask "Continue to checkout?"
```
import React from 'react'
import Aux from '../../../hoc/Aux';

export const orderSummary = (props) => {
  const ingredientSummary = Object.keys(props.ingredients).map((igKey) => {
    return (
      <li>
        <span style={{textTransform: 'capitalize'}}>
          {igKey}
        </span>: {props.ingredients[igKey]}
      </li>
    )
  });
  return (
    <Aux>
      <h3>Your Order</h3>
      <p>A delicious burger with the following ingredients:</p>
      <ul>
        {/* list of burger ingredients  */}
        {ingredientSummary}
      </ul>
      <p>Continue to checkout?</p>
    </Aux>
  )
}

export default orderSummary;
```

Now with this built out we can use it in our BurgerBuilder modal
First import it then call it as a child within the modal component
Don't forget to pass in an ingredients prop
```
<Modal>
  <OrderSummary ingredients={{...this.state.ingredients}}/>
</Modal>
```

Now if we save we will see that the order summary shows correctly
It will even update in the modal if we click the buttons to adjust our count
Although we do get an error in the console
This is because we didn't add keys when generating our `<li>` items
To fix that we can simply add a key to our items using the `igKey` as a key
```
<li key={igKey}>
  <span style={{textTransform: 'capitalize'}}>
    {igKey}
  </span>: {props.ingredients[igKey]}
</li>
```

Changing that should get rid of the error and have everything working properly




___
## 138 Showing & Hiding the Modal (with Animation!)
Now we want to only display the modal if we click the order now button
In order to do that we will add a property to our state called `purchasing`
This will be a boolean that will determine whether or not the order summary is to be displayed
When false (which it will initialize to) the order summary will not display and when true it will display
```
state = {
  // Current burger ingedients 
  // order of keys here determines order in image and build controls
  ingredients: {
    bacon:  0,
    salad:  0,
    cheese: 0,
    meat:   0
  },
  totalPrice: 4, // price accumulates/reduces as ingredients are added/removed
  purchasable: false, // false while all ingredient values are set to 0 - when any are increased this becomes true
  purchasing: false // boolean to determine whether or not to show the order summary modal - begins as false
}
```

Now we need to create a method called `purchaseHandler()`
This will simply change the state of purchasing to true
```
purchaseHandler() {
  this.setState({purchasing: true});
}
```

Then we have to pass this method to our order now button within build controls
```
<button 
  className={classes.OrderButton}
  disabled={!props.purchasable}
  onClick={props.ordered}>Order Now</button>
```

Don't forget to pass this method into `<BuildControls>` props
```
<BuildControls 
  ingredientAdded={this.addIngredientHandler} // method passed to add ingredient button
  ingredientRemoved={this.removeIngredientHandler} //method passed to less ingredient button
  disabled = {disabledInfo} // list of ingredients w/ boolean values to disable the less button or not
  price={this.state.totalPrice} // current price of burger to be displayed 
  purchasable={this.state.purchasable} // whether burger is valid for purchase (if not valid then checkout button will be disabled)
  ordered={this.purchaseHandler}
/>
```

Now in order for animation to display we are going to add the `show` property to our modal and bind it to `this.state.purchasing`
Then the modal should only be visible if purchasing is true
Now inside of our modal we can set our transform property with inline styling
We will use a ternary expression to determine how to translateY and the opacity of the modal
```
<div 
  className={classes.Modal}
  style={{
    transform: props.show ? 'translateY(0)' : 'translateY(-100vh)',
    opacity: props.show ? '1' : 0
  }}
>
```

If we save then we will encounter an error because we didn't use the ES7 syntax for our `purchaseHandler()` method to ensure that the 'this' keyword pointed to the correct place
We simply have to change that syntax to be correct
```
  purchaseHandler = () => {
    this.setState({purchasing: true});
  }
```

Now on save the error shouldn't pop up anymore and the modal displays correctly




___
## 139. Implementing the Backdrop Component
Now we wills start implementing the backdrop component
It will receive the same show prop that our modal did and if it is true then it will display a div and if not it will display null
Then we can attach a class and styling to the div that will be rendered when show is true
```
import React from 'react';

const backdrop = () => (
    props.show ? <div></div> : null
  );


export default backdrop
```

Now we can create a class and add css styling for our backdrop
```
.Backdrop {
  /* Take up the whole page */
  width: 100%;
  height: 100%;
  /* don't move when scroleld */
  position: fixed;
  /* Position above page contents but below modal */
  z-index: 100;
  /* place at top left of page (will take up whole page) */
  left: 0;
  top: 0;
  background-color: rgba(0, 0, 0, 0.5);
}
```

Now we can apply this class in the component
```
import React from 'react';
import classes from './Backdrop.module.css';

const backdrop = () => (
    props.show ? <div className={classes.Backdrop}></div> : null
  );


export default backdrop
```

Now where do we add the backdrop?
There are a couple of places that make sense
- One place to put it could be the app component since it isn't part of the core page component
- Put it in layout since it is use to arrange our items on the page
- You could put it in the modal since it is closely connected to the modal

We will put it in the modal since that is what the teacher is doing and that is what makes sense to me
We will have the modal and the backdrop appearing 'side by side' (even though the modal will be positioned on top of the backdrop)
In order to achieve this we will need to import our Aux component to our modal along with our backdrop component

```
import React from 'react';
import classes from './Modal.module.css';
import Aux from '../../../hoc/Aux';
import Backdrop from '../Backdrop/Backdrop';

const Modal = (props) => (
  // Wrapping component that gets a class which simply puts this component and its children to the front of the page
  <Aux>
    <Backdrop show={props.show} />
    <div 
      className={classes.Modal} 
      style={{ 
        transform: props.show ? 'translateY(0)' : 'translateY(-100vh)', 
        opacity: props.show ? '1' : 0
        }}>
        {props.children}
    </div>
  </Aux>
);


export default Modal
```

Now when we save and click the "Order Now" button we should see a backdrop with our modal

We want to make sure that we can click this backdrop too in order to dismiss the order modal
To do that we can attach an `onClick` listener to our div in Backdrop.js
```
const backdrop = (props) => (
  props.show ? <div className={classes.Backdrop} onClick={props.clicked}></div> : null
);
```

Now we have to provide a clicked prop when we call the backdrop component
```
<Backdrop show={props.show} clicked={props.modalClosed} />
```

Next we have to pass a method into our modal as a `modalClosed` prop which will hide our modal by switching `this.state.purchasing` to false
```
<Modal show={this.state.purchasing} modalClosed={this.purchaseCancelHandler}>
  <OrderSummary ingredients={{...this.state.ingredients}}/>
</Modal>
```

Now we have to write the `purchaseCancelHandler()` to set `this.state.purchasing` to false
```
purchaseCancelHandler = () => {
  this.setState({purchasing: false});
}
```

Now when we click the backdrop when the modal is up the modal goes away!




___
## 140. Adding a Custom Button Component
Now in our order summary we want 2 buttons 
One will say "CANCEL"
The other will say "CONTINUE"
Easy enough...
```
export const orderSummary = (props) => {
  const ingredientSummary = Object.keys(props.ingredients).map((igKey) => {
    return (
      <li key={igKey}>
        <span style={{textTransform: 'capitalize'}}>
          {igKey}
        </span>: {props.ingredients[igKey]}
      </li>
    )
  });
  return (
    <Aux>
      <h3>Your Order</h3>
      <p>A delicious burger with the following ingredients:</p>
      <ul>
        {/* list of burger ingredients  */}
        {ingredientSummary}
      </ul>
      <p>Continue to checkout?</p>
      <button>CANCEL</button>
      <button>CONTINUE</button>
    </Aux>
  )
}
```
We will make cancel do the same thing as our backdrop and the other will do nothing for now since we don't have a server to submit the order to (we will add this later)
These buttons won't be styled the way we want them so we will want to style them
Now that we think about it we may want to use buttons like cancel and continue multiple times throughout our application
It would probably be better to create some cancel and continue buttons as separate components so we can just call them when needed and not have to worry about restyling and keeping styles consistent

We will by adding a button subfolder to our UI folder with a button.js file
create: src/components/UI/Button/Butt.jsx
In this component we will simply return our button and inside of the button we will render `{props.children}`
This is so we can pass text/content into the button
We will also need to add an `onClick` listener that will allow us to execute a function that is passed into the button (since that function will change depending on where we use the button and what we use it for)
```
import React from 'react'

const button = (props) => (
  <button 
    onClick={props.click}>{props.children}</button>  
)


export default button

```

We also know that we will want to select styling when we call our button
This way we can decide if the button will look like a cancel button or a normal button when we call it
We will need to create a new css style sheet for this (within the same folder) create: Button.module.css
Add the following css:
```
.Button {
    background-color: transparent;
    border: none;
    color: white;
    outline: none;
    cursor: pointer;
    font: inherit;
    padding: 10px;
    margin: 10px;
    font-weight: bold;
}

.Button:first-of-type {
    margin-left: 0;
    padding-left: 0;
}

.Success {
    color: #5C9210;
}

.Danger {
    color: #944317;
}
```

Now we can pass in which class we want to use as a prop and assign it within our button
Don't forget to import your css module
When assigning our classes we want to assign an array of them since we always want the button class
What we have to pass in through props is whether we want a success or danger button
```
const button = (props) => (
  <button 
    classname={[classes.Button, classes[props.btnType]].join(' ')}
    onClick={props.click}>{props.children}</button>  
)
```

Now our button should be ready, we just need to call it within our order summary




___
## 141. Implementing the Button Component
Now we will call our button component within the `<OrderSummary>` component

First we have to import the button to `<OrderSummary>`
Then we change the button we are using to use the one created
Next we have to assign the two properties our component is expecting `clicked` and `btnType`
We can pass in the `btnType` by hand but for `clicked` we want to dismiss the modal just like the `<Backdrop>` component did
So we can expect to receive the same method on that button (we can call this `purchaseCanceled`)
For the other we will have to create a method to handle our checkout but we can call it `purchaseContinued` 
```
import React from 'react'
import Aux from '../../../hoc/Aux';
import Button from '../../UI/Button/Button';

export const orderSummary = (props) => {
  const ingredientSummary = Object.keys(props.ingredients).map((igKey) => {
    return (
      <li key={igKey}>
        <span style={{textTransform: 'capitalize'}}>
          {igKey}
        </span>: {props.ingredients[igKey]}
      </li>
    )
  });
  return (
    <Aux>
      <h3>Your Order</h3>
      <p>A delicious burger with the following ingredients:</p>
      <ul>
        {/* list of burger ingredients  */}
        {ingredientSummary}
      </ul>
      <p>Continue to checkout?</p>
      <Button btnType="Danger" click={props.purchaseCanceled}>CANCEL</Button>
      <Button btnType="Success" click={props.purchaseContinued}>CONTINUE</Button>
    </Aux>
  )
}

export default orderSummary;
```

Now in our BurgerBuilder.js we need to pass these two click methods into the `<OrderSummary>` component
We already have a method to handle the cancel but we have to write one for continue
For now this method can just call an alert saying we continued
```
// Already exists
purchaseCancelHandler = () => {
  this.setState({purchasing: false});
}

// New
purchaseContinueHandler = () => {
  alert('You continued!');
}
```

Then we can pass these two methods into the `<OrderSummary>` component
```
<OrderSummary 
  ingredients={{...this.state.ingredients}}
  purchaseCanceled={this.purchaseCancelHandler}
  purchaseContinued={this.purchaseContinueHandler}
/>
```

Now if we add ingredients and click order now we can click continue to trigger the alert or cancel to dismiss the modal




___
## 142. Adding the Price to the Order Summary
We forgot to add the price to the order summary so we can add that really quickly
In order summary we can simply add it as a `<p>` element below the `ingredientSummary`
```
export const orderSummary = (props) => {
  const ingredientSummary = Object.keys(props.ingredients).map((igKey) => {
    return (
      <li key={igKey}>
        <span style={{textTransform: 'capitalize'}}>
          {igKey}
        </span>: {props.ingredients[igKey]}
      </li>
    )
  });
  return (
    <Aux>
      <h3>Your Order</h3>
      <p>A delicious burger with the following ingredients:</p>
      <ul>
        {/* list of burger ingredients  */}
        {ingredientSummary}
      </ul>
      <p><strong> Total Price: ${props.price.toFixed(2)}</strong></p>
      <>Continue to checkout?</>
      <Button btnType="Danger" click={props.purchaseCanceled}>CANCEL</Button>
      <Button btnType="Success" click={props.purchaseContinued}>CONTINUE</Button>
    </Aux>
  )
}
```

Then when we call `<OrderSummary>` we can pass price in as a prop
```
<OrderSummary 
  ingredients={{...this.state.ingredients}}
  price={this.state.totalPrice}
  purchaseCanceled={this.purchaseCancelHandler}
  purchaseContinued={this.purchaseContinueHandler}
/>
```




___
## 143. Adding a Toolbar
Now that we have completed the main burger builder section of the app we can start adding our toolbar to help with navigation whenever we get around to adding more pages to our app

To keep this separate from the burger portion of our application we will create a new folder within our components folder called 'Navigation' (which will hold all of our naviation based components obviously)
Within our Navigation the first component we are going to want to create will be the toolbar
Create: src/components/Navigation/Toolbar/Toolbar.jsx

What kind of component will this be?
We don't expect to manage any state within this toolbar so we can make it a functional component 
What do we want it to look like?
We know we will have a header div which will hold each part of our toolbar
Within the toolbar itself we will want a menu item to open the sidedrawer, a logo, and nav item which will contain our navigation links (list of links)
```
import React from 'react'

const toolbar = (props) => {
  return (
    <header>
      <div>Menu</div>
      <div>logo</div>
      <nav>
        ...
      </nav>
    </header>
  )
}

export default toolbar
```

Now we know we will need to create each of these as their own components so we can reuse them

Before we create any subcomponents lets finish styling the toolbar
create a css module for this component
```
.Toolbar {
  height: 56px;
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #703b09;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px;
  box-sizing: border-box;
  z-index: 90;
}

.Toolbar nav {
  height: 100%;
}
```
One thing to take note of is that the `z-index` has to be lower than whatever was chosen for the backdrop
This is important so that the backdrop will show above the toolbar

Now import this to our `Toolbar` component and apply it to the header
```
import React from 'react'
import classes from './Toolbar.module.css';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <div>Menu</div>
      <div>logo</div>
      <nav>
        ...
      </nav>
    </header>
  )
}

export default toolbar
```

Now we just have to call this toolbar to our layout component since the toolbar is a built in part to every page layout
```
import React from 'react';
import Aux from '../../hoc/Aux'; // HOC wrapper
import classes from './Layout.module.css';
import Toolbar from '../Navigation/Toolbar/Toolbar';

const layout = (props) => (
  // props needed to access props.children
  // Child elements be displayed as main content
  <Aux>
    {/* Navbar */}
    <Toolbar />
    <main className={classes.Content}>
      {/* Main content displayed here */}
      {props.children} 
    </main>
  </Aux>
);
  
export default layout;
```

Now if everything is saved and ran we will see a brown toolbar above our burger builder
One adjustment we can make is the burger is being rendered under the toolbar which can be fixed by adjusting the content margin in our layout.css
```
/* Main page content (like burger module */
.Content {
  /* padding to keep content away from navbar at top of page */
  margin-top: 72px;
}
```

Now if we save our burger should be positioned nicely




___
## 144. Using a Logo in Our Application 

Now we are going to create a logo component that we can use throughout our application
Since we may want to use it outside of our navigation component we are going to make it its own component
create: src/components/Logo/Logo.jsx

We are going to want to use an image for the logo (obviously) so we will need to create a folder to hold that asset as well (burgerlogo.png is 400x256px and attached to the lesson)
create: src/assets/images

Now we want to use this image in the logo.jsx component
First fill out the logo.jsx skeleton
To do that we will wrap the image in a div (so we can set a background color since the image has a transparent background) 
We could do something cool like pass the background color in via props for a dynamic logo but that is not what we are going to do here.
To display the image we can simply use an `<img>` tag within the wrapping div
Then it can point to the image that we will also import at the top of the page
```
import React from 'react';
import burgerLogo from '../../assets/images/burger-logo.png';

const logo = (props) => {
  return (    
    <div>
      <img src={burgerLogo} alt="MyBurger"/>
    </div>
  )
}

export default logo
```

Now add the logo.module.css file so we can add a background color of white and some sizing styling and apply the class to our div
```
.Logo {
  background-color: white;
  padding: 8px;
  height: 100%;
}

.Logo img {
  height: 100%;
}
```
(removed unnecessary return statement as well)
```
import React from 'react';
import classes from './Logo.module.css';
import burgerLogo from '../../assets/images/burger-logo.png';

const logo = (props) => (    
    <div className={classes.Logo}>
      <img src={burgerLogo} alt="MyBurger"/>
    </div>
  )

export default logo
```

Now we have to call this in our navigation bar instead of the logo text we are using currently
```
import React from 'react'
import classes from './Toolbar.module.css';
import Logo from '../../Logo/Logo';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <div>Menu</div>
      <Logo />
      <nav>
        ...
      </nav>
    </header>
  )
}

export default toolbar
```

We are going to make some adjustments to our logo within css for sizing
```
.Logo {
  background-color: white;
  padding: 8px;
  height: 80%;
  box-sizing: border-box;
  border-radius: 5px;
}

.Logo img {
  height: 100%;
}
```




___
## 145. Adding Reusable Navigation Items
Now we can start focusing on adding our reusable navigation items

We will put these items in their own component since we will want to reuse them in the sidedrawer later on
create: src/components/Navigation/NavigationItems/NavigationItems.jsx

Now inside of here we will need a react arrow function component with export
What will we want our output to look like?
We want to create an unordered list
Inside of that unordered list with be our individual list items which will contain a link and some text that will contain the link
```
import React from 'react'

const navigationItems = () => {
  return (
    <div>
      <ul>
        <li><a href="/">A link</a></li>
      </ul>
    </div>
  )
}

export default navigationItems
```
Technically you can outsource each individual menu item into their own components 
In order to make our lives with styling easier we can do that
create: src/components/Navigation/NavigationItems/NavigationItem/NavigationItem.jsx

Inside of this file we will create a component that makes a singular `<li>` listing for each menu item (will be called)
```
import React from 'react'

const navigationItem = (props) => {
  return (
    <div>
      <li><a href="/">A link</a></li>
    </div>
  )
}

export default navigationItem
```

Then back in `<NavigationItems>` we can call this singular `<NavigationItem>`
```
import React from 'react';
import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = () => {
  return (
    <div>
      <ul>
        <NavigationItem />
      </ul>
    </div>
  )
}

export default navigationItems
```

Now lets go ahead and add the styling for both of these component
create: src/components/Navigation/NavigationItems/NavigationItems.component.css
create: src/components/Navigation/NavigationItems/NavigationItem/NavigationItem.component.css

(starting with NavigationItems plural)
```
.NavigationItems {
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
  align-items: center;
  height: 100%;
}
```

Now for the individual NavigationItem
```
.NavigationItem {
  margin: 0;
  box-sizing: border-box;
  display: flex;
  height: 100%;
  width: 100%;
  align-items: center;
}

.NavigationItem a {
  color: white;
  text-decoration: none;
  height: 100%;
  padding: 16px 10px;
  border-bottom: 4px solid transparent;
  box-sizing: border-box;
  display: block;
}

.NavigationItem a:hover,
.NavigationItem a:active,
.NavigationItem a.active {
  background-color: #8F5C2C;
  border-bottom: 4px solid #40A4C8;
  color: white;
}
```

Now save, import and assign css classes:
(NavigationItems.jsx)
```
import React from 'react';
import classes from './NavigationItems.module.css';

import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = () => (
      <ul className={classes.navigationItems}>
        <NavigationItem />
      </ul>
  )

export default navigationItems
```

(NavigationItem.jsx)
```
import React from 'react';
import classes from './NavigationItem.module.css';

const navigationItem = (props) => (
    <li className={classes.navigationItem}><a href="/">A link</a></li>
  )

export default navigationItem
```

We still need to pass our props to our `<NavigationItem>` within `<NavigationItems>`
The props that we need are the caption to show and the link (will be passed as childre), the link item should lead to, and whether or not the active class is true or not (will be true if we are currently on that items page)
First get them set within `<NavigationItem>`
```
import React from 'react';
import classes from './NavigationItem.module.css';

const navigationItem = (props) => (
    <li className={classes.navigationItem}>
      <a 
        href={props.link}
        className={props.active ? classes.active : null}>{props.children}</a>
    </li>
  )

export default navigationItem
```

Now back in `<NavigationItems>` we have to no longer use a self closing tag so we can pass children into  `<NavigationItem>` and include our other props as well
```
import React from 'react';
import classes from './NavigationItems.module.css';

import NavigationItem from './NavigationItem/NavigationItem';

const navigationItems = () => (
      <ul className={classes.navigationItems}>
        <NavigationItem link="/" active>Burger Builder</NavigationItem>
        <NavigationItem link="/">Checkout</NavigationItem>
      </ul>
  )

export default navigationItems
```
Note above that for boolean values we can just include it as we did with active and if it is included it will be counted as true
So for the burger builder item active would be true but for the checkout item it would be false

Now we need to add the navigation items component to our toolbar and see if it worked
```
import React from 'react'
import classes from './Toolbar.module.css';
import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <div>Menu</div>
      <Logo />
      <nav>
        <NavigationItems />
      </nav>
    </header>
  )
}

export default toolbar
```

Now we have our items in the navbar and they work (they just go to the page we are already on)




___
## 146. Creating a Responsive Sidedrawer
Now that we have our desktop navigation handled we should start designing the sidedrawer we will use in mobile views
To do this we will create a new component
create: src/component/Navigation/SideDrawer/SideDrawer.jsx

This component will kind of consist of 2 components the sidedrawer, and the toggle button to show/hide the sidedrawer
We will also need a backdrop for the sidedrawer which we already have

First we will start working on the sidedrawer which we will always show and then make toggle later
For the sideDrawer we will create a normal functional component
This is because before we render we will have a conditional statement that will determine if the component should show a button or the actual sidedrawer
We will also apply classes to animate our sidedrawer
What do we want to display in the sidedrawer?
Well we want to put the logo and navigation items so we can start by importing both of those and adding them to a div
```
import React from 'react';

import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const sideDrawer = (props) => {

  return (
    <div>
      <Logo />
      <nav>
        <NavigationItems />
      </nav>
    </div>
  )
}

export default sideDrawer
```

Now we can work on some of the styling for the side drawer
create: src/component/Navigation/SideDrawer/Sidedrawer.module.css
```
.SideDrawer {
  position: fixed;
  width: 280px;
  max-width: 70%;
  height: 100%;
  left: 0;
  top: 0;
  z-index: 200; /*intentionally higher than backdrop z-index*/
  background-color: white;
  padding: 32px 16px;
  box-sizing: border-box;
  transition: transform 0.3s ease-out;
}

@media (min-width: 500px) {
  .SideDrawer {
    display: none;
  }
}

.Open {
  transform: translateX(0);
}

.Close {
  transform: translateX(-100%);
}
```

Now we have to import and apply these classes within our sidedrawer
```
import React from 'react';
import classes from './SideDrawer.module.css';

import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const sideDrawer = (props) => {

  return (
    <div className={classes.SideDrawer}>
      <Logo />
      <nav>
        <NavigationItems />
      </nav>
    </div>
  )
}

export default sideDrawer
```

Finally we have to call our component within our `<Layout>` component
```
import React from 'react';
import Aux from '../../hoc/Aux'; // HOC wrapper
import classes from './Layout.module.css';
import Toolbar from '../Navigation/Toolbar/Toolbar';
import SideDrawer from '../Navigation/SideDrawer/SideDrawer';

const layout = (props) => (
  // props needed to access props.children
  // Child elements be displayed as main content
  <Aux>
    {/* Navbar */}
    <Toolbar />
    <SideDrawer />
    <main className={classes.Content}>
      {/* Main content displayed here */}
      {props.children} 
    </main>
  </Aux>
);
  
export default layout;
```

Now if we save and look at our page from a mobile view (use button in dev tools or adjust window width), our sidedrawer should look like absolute ass
This is because we haven't adjusted any of our css for the logo or navigation items to accomidate more narrow displays




___
## 147. Working on Resonsive Adjustments
We really need to fix our horrible looking SideDrawer
To do adjust some of the components that sidedrawer calls to make them more mobile friendly

We will start with the Logo component
Insteading of setting the logo height within the css we are going to set the logo height when we call it so it can be more reusable and responsive
So in Logo.module.css we will actually bump the height up to 100%
```
.Logo {
  background-color: white;
  padding: 8px;
  height: 80%;
  box-sizing: border-box;
  border-radius: 5px;
}

.Logo img {
  height: 100%;
}
```

Then in the toolbar we will make our height adjustment
There are two ways we can adjust this
One way is to pass a prop that determines the height (we would also have to pass this prop any time `<Logo>` is called)
Then within the logo we could use an inline style to override the css class settting

Another way (that we will do) is to wrap our `<Logo>` calls within a div
Then we can either use inline styles or by setting css within Toolbar.module.css and SideDrawer.module.css by adding a className to the div
We will assign a class called 'Logo' to these wrapping divs then in the associated component.module.css we will set the .Logo height to 80% for the toolbar and 11% for the SideDrawer

Toolbar.jsx
```
import React from 'react'
import classes from './Toolbar.module.css';
import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <div>Menu</div>
      <div className={classes.Logo}>
        <Logo />
      </div>
      <nav>
        <NavigationItems />
      </nav>
    </header>
  )
}

export default toolbar

```
Toolbar.module.css
```
...
.Logo {
  height: 80%;
}
```

SideDrawer.jsx
```
import React from 'react';
import classes from './SideDrawer.module.css';

import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const sideDrawer = (props) => {

  return (
    <div className={classes.SideDrawer}>
      <div className={classes.Logo}>
        <Logo />
      </div>
      <nav>
        <NavigationItems />
      </nav>
    </div>
  )
}

export default sideDrawer
```
SideDrawer.module.css
```
.Logo {
  height: 11%;
}
```

Now our heights are much more appropriate for where the logo is being used




___
## 148. More About Responsive Adjustments
We have fixed the logo but we still have to fix the navigation items

Currently NavigationItems is only styled to look good on mobile devices
Since we won't be using NavigationItems all over the place like we might a logo it does not have to be as adjustable and finetuneable 
Instead we will only have a couple of states and we can use media queries to handle them

In NavigationItem.module.css (singular) we will adjust our css to be mobile first and then allow media queries to scale them up as needed
To do this we will take all of the existing css we have and copy it into a media query for `min-width: 500px` since it is for a desktop 
Then we can adjust the original css we had outside of the media query to work for narrow screens
After making the adjustments remove any duplicate styling we have between the css inside and outside of the media query
```
.NavigationItem {
  margin: 10px 0;
  box-sizing: border-box;
  display: block;
  width: 100%;
}

.NavigationItem a {
  color: #8F5C2C;
  text-decoration: none;
  width: 100%;
  box-sizing: border-box;
  display: block;
}

.NavigationItem a:hover,
.NavigationItem a:active,
.NavigationItem a.active {
  color: #40A4C8;
}

@media (min-width: 500px) {
  .NavigationItem {
    margin: 0;
    display: flex;
    height: 100%;
    width: auto;
    align-items: center;
  }

  .NavigationItem a {
    color: white;
    height: 100%;
    padding: 16px 10px;
    border-bottom: 4px solid transparent;
  }

  .NavigationItem a:hover,
  .NavigationItem a:active,
  .NavigationItem a.active {
    background-color: #8F5C2C;
    border-bottom: 4px solid #40A4C8;
    color: white;
  }
}
```

This is better but our nav items are still sitting next to each other because when they are rendered in NavigationItems they are not adjusted for mobile
So we need to adjust NavigationItems.module.css and make it more mobile friendly
We can just use a media query to change the flex flow for mobile to column and for desktop have it be row
```
.NavigationItems {
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
  flex-flow: column;
  align-items: center;
  height: 100%;
}

@media (min-width: 500px) {
  .NavigationItems {
    flex-flow: row;
  }
}
```

Some other small adjustments to make to keep spacing and whatnot looking correct
in SideDrawer.module.css
```
.Logo{
  height: 11%;
  margin-bottom: 32px;
}
```

Next we want to get rid of the original toolbar when going to mobile view so to do that we want to add a css class to Toolbar.module.css that will hide the class when the screen is below a certain size
To do this we will set a max-width that we apply a .DesktopOnly css class that is hidden
```
@media (max-width: 499px) {
  .DesktopOnly {
    display: none;
  }
}
```

Then we need to apply this class to our toolbar

```
import React from 'react'
import classes from './Toolbar.module.css';
import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <div>Menu</div>
      <div className={classes.Logo}>
        <Logo />
      </div>
      <nav className={classes.DesktopOnly}>
        <NavigationItems />
      </nav>
    </header>
  )
}

export default toolbar
```

Now our sidedrawer is looking much better




___
## 149. Reusing the Backdrop
Now we are going to add the backdrop to our sidedrawer
We already have a backdrop component that we can use but what is the best way to add it to the sidedrawer?
We should use it in the same way that we used it in the modal
There we called it alongside any content we displayed with the modal
Now we want to call it alongside any content displayed in the sidedrawer
We will need to import the backdrop to our sidedrawer
We want it to set as a sibling to our sidedrawer so we will also need to import the aux component to wrap the sidedrawer and backdrop with
When calling backdrop we should be passing in two props with it `props.show` and `props.clicked`
We can simply set `show` within our call to Backdrop
However for the clicked prop we will need that to be available to both the toolbar and the sideDrawer since the toolbar will also have a sideDrawer toggle method
So we have to put our `closeSideDrawer` method somewhere that has access to both of these components and can pass it down to both
The best place for this would be the `<Layout>` component since it has both components
This means it would probably be a good idea to turn the layout component into a class based component so we can utilize state to control whether we should show or hide the sidedrawer

To do that we simply have to import components from react
Then adjust our function call to be a class that extends component
Next we will need our render method which will return all the jsx we had before
Finally don't forget to adjust the name of the component in the export
```
import React, { Component}  from 'react';
import Aux from '../../hoc/Aux'; // HOC wrapper
import classes from './Layout.module.css';
import Toolbar from '../Navigation/Toolbar/Toolbar';
import SideDrawer from '../Navigation/SideDrawer/SideDrawer';

class Layout extends Component {
  render () {
    return (    // props needed to access props.children
      // Child elements be displayed as main content
      <Aux>
        {/* Navbar */}
        <Toolbar />
        <SideDrawer />
        <main className={classes.Content}>
          {/* Main content displayed here */}
          {this.props.children} 
        </main>
      </Aux>
    );
  }

}
  
export default Layout;
```

Now that it is switched over we can start implementing our method for handling the sidedrawer
We will create a method called `sideDrawerClosedHandler()`
We also know we will need to manage state so we can add a property to state called `showSideDrawer` which will be false initially (although we will set to true for now so we will be able to see it before we add the toggle to open the sidedrawer
Within our sideDrawerClosedHandler we can simply set `this.state.showSideDrawer` to false
```
state = {
  showSideDrawer: true
}

sideDrawerClosedHandler = () => {
  this.setState({showSideDrawer: false});
}
```
Now we can pass this method to our sideDrawer
```
<SideDrawer closed={this.sideDrawerClosedHandler}/>
```
Next we want to pass this from the sideDrawer down to the backdrop
```
<Backdrop show clicked={props.closed} />
```

Before this will work we have to bind the show property to the value for showSideDrawer in the layout state
So instead of having show set to true we should have it set to props.open (to not confuse it with show)
```
<Backdrop show={props.open} clicked={props.closed} />
```
Then we have to pass state.showSideDrawer down from layout to the SideDrawer for the backdrop to access
```
<SideDrawer 
  open={this.state.showSideDrawer}
  closed={this.sideDrawerClosedHandler}
/>
```

Now if we click the backdrop it will disappear but not the sidedrawer because we haven't linked the logic to hide that yet

In our SideDrawer.module.css there are two classes `.Open` and `.Close`
We will attach these classes conditionally to our component depending on if we want to show or hide the sidebar this will not only show and hide it but also apply a nifty animation
To implement this in the sideDrawer component (since it was already passed the status of whether it should be open or closed through the open prop)
We can have a variable which will store the classes that should be applied to the SideDrawer at any given time
We already know we always want `classes.SideDrawer` (as we have below before we update it in a sec) 
We will also include the `.Close` class by default
Then we will use an if statement to check if `props.open == true`
If it is true we will update our variabe to remove the `.Close` class and add the `.Open` class
```
import React from 'react';
import classes from './SideDrawer.module.css';
import Aux from '../../../hoc/Aux';

import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

import Backdrop from '../../UI/Backdrop/Backdrop';

const sideDrawer = (props) => {

  let attachedClasses = [classes.SideDrawer, classes.Close]

  if(props.open) {
    attachedClasses = [classes.SideDrawer, classes.Open]
  }

  return (
    <Aux>
      <Backdrop show={props.open} clicked={props.closed} />
      <div className={attachedClasses.join(' ')}>
        <div className={classes.Logo}>
          <Logo />
        </div>
        <nav>
          <NavigationItems />
        </nav>
      </div>
    </Aux>
  )
}

export default sideDrawer

```

Now when the page loads the sidedrawer will be showing by default and when we click the backdrop it will slide and hide away




___
## 150. Adding a SideDrawer Toggle Button

Now that we can get rid of the sidedrawer we need to add a button that shows the sidedrawer
This will take the place of the menu item currently in our toolbar
This item will be either shown or hidden based on the size of the screen
Take the time to practice yourself implementing this

What needs to be done?
First the menu item in our toolbar needs to be clickable
When it is clicked it needs to send a message to layout.state.showSideDrawer to set it to true (set to be false by default now)

Add an onClick listener to the menu item in the toolbar
Pass it a method to open the sideDrawer from a prop
In layout create a method that will set state.showSideDrawer to true
Then pass this method into the toolbar as the prop that we assigned
MY SOLUTION BELOW

Toolbar
```
import React from 'react'
import classes from './Toolbar.module.css';
import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <div onClick={props.openSideDrawer}>Menu</div>
      <div className={classes.Logo}>
        <Logo />
      </div>
      <nav className={classes.DesktopOnly}>
        <NavigationItems />
      </nav>
    </header>
  )
}

export default toolbar
```

layout
```
import React, { Component}  from 'react';
import Aux from '../../hoc/Aux'; // HOC wrapper
import classes from './Layout.module.css';
import Toolbar from '../Navigation/Toolbar/Toolbar';
import SideDrawer from '../Navigation/SideDrawer/SideDrawer';

class Layout extends Component {

  state = {
    showSideDrawer: false
  }

  sideDrawerClosedHandler = () => {
    this.setState({showSideDrawer: false});
  }

  sideDrawerOpenHandler = () => {
    this.setState({showSideDrawer: true});
  }

  render () {
    return (    // props needed to access props.children
      // Child elements be displayed as main content
      <Aux>
        {/* Navbar */}
        <Toolbar openSideDrawer={this.sideDrawerOpenHandler}/>
        <SideDrawer 
          open={this.state.showSideDrawer}
          closed={this.sideDrawerClosedHandler}
        />
        <main className={classes.Content}>
          {/* Main content displayed here */}
          {this.props.children} 
        </main>
      </Aux>
    );
  }

}
  
export default Layout;
```

Altered to Teacher solution to make following future lessons easier
He wanted to also display the button in the sidedrawer which means it needs to be a toggle not an assignment
Since this is a toggle for the sidedrawer and will also be in the sidedrawer we will make this a new component (this will allow us to make it a hamburger icon easier in the future as well)
create: src/component/Navigation/SideDrawer/DrawerToggle/DrawerToggle.jsx

For now fill it with the same content that we had before
```
import React from 'react'

const drawerToggle = (props) => {
  return (
    <div>Menu</div>
  )
}

export default drawerToggle
```

Then call this component in the toolbar instead of the menu button
```
import React from 'react'
import classes from './Toolbar.module.css';
import Logo from '../../Logo/Logo';
import NavigationItems from '../NavigationItems/NavigationItems';
import DrawerToggle from '../SideDrawer/DrawerToggle/DrawerToggle';

const toolbar = (props) => {
  return (
    <header className={classes.Toolbar}>
      <DrawerToggle />
      <div className={classes.Logo}>
        <Logo />
      </div>
      <nav className={classes.DesktopOnly}>
        <NavigationItems />
      </nav>
    </header>
  )
}

export default toolbar
```

Now we will add our click listener to the Menu placeholder div
It will activate a method that is passed via props
```
const drawerToggle = (props) => {
  return (
    <div onClick={props.clicked}>Menu</div>
  )
}
```

Now in the toolbar we need to pass this clicked method into the drawerToggle
Since the toolbar doesn't have access to the state it will also need to receive a method as a prop from layout which will toggle the value in state
```
<DrawerToggle clicked={props.drawerToggleClicked}/>
```

Now in layout we can define the method we need and pass it into our Toolbar component
It will simply use setState to set the value of `showSideDrawer` to be the opposite of its current value
```
sideDrawerToggleHandler = () => {
  this.setState((prevState) => {
    return {showSideDrawer: !prevState.showSideDrawer}
  });
}
```
Notice that we used the prevState value to get a copy of state so as to avoid updating the state based on the value of state which can cause some errors with asyncronous tasks 

Now we just have to pass this method into our toolbar as a prop
```
<Toolbar drawerToggleClicked={this.sideDrawerToggleHandler}/>
```

Now when we save and click the menu text the sidebar will slide into view and when we click the backdrop it will slide away




___
## 151. Adding a Hamburger Icon
We have a toggle button that works but lets update the icon to be something nicer looking like a hamburger icon
To do this we will use css and create a DrawerToggle.module.css to create a hamburger icon
```
.DrawerToggle {
    width: 40px;
    height: 100%;
    display: flex;
    flex-flow: column;
    justify-content: space-around;
    align-items: center;
    padding: 10px 0;
    box-sizing: border-box;
    cursor: pointer;
}

.DrawerToggle div {
    width: 90%;
    height: 3px;
    background-color: white;
}

@media (min-width: 500px) {
    .DrawerToggle {
        display: none;
    }
}
```
This code will create a div with 3 bars inside of it where each bar is a hamburger icon bar

For this to work we will need to update our DrawerToggle component as well
Instead of having a single div it will be a div with 3 div elements inside of it
We will also need to impor the css and assign the `.DrawerToggle` class to the outer div
```
import React from 'react'
import classes from './DrawerToggle.module.css';

const drawerToggle = (props) => {
  return (
    <div className={classes.DrawerToggle} onClick={props.clicked}>
      <div></div>
      <div></div>
      <div></div>
    </div>
  )
}

export default drawerToggle;
``` 




___
## 152. Improving the App - Introduction
We have a nice looking application that is suitable for both desktop and mobile
While building the application we tried to follow best practices and thought out the best way to structure our application
However there are some improvements we can make still for things to be better behind the scenes
There are also some questions that need answering like where can we use proptypes, pure components, and lifecycle hooks (why aren't we using them and should we be)




___
## 153. Prop Type Validation
Right now we are only doing proptype validation in the burger ingredient component
In there we make sure that the props we are receiving are strings

We don't do any validation anywhere else
The reason is we are not working on a project that will be used by other people, not a third party library, no developer team.
This means a lot of the reasons that you would want to use proptypes (checking that the correct props were passed) are not relevant
We may get some logical errors if we forget or assign an incorrect property
We can definitely add more prop type validation to our components if we want but it is totally optional




___
## 154. Improving Performance
What about PureComponents and shouldComponentUpdate?

If we look at our application most of our clicks do change the ui and should trigger an update in our component
Since the answer to shouldComponentUpdate is usually yes we would probably use more performance running the check only for the component to update anyway than we would save by stopping unnecessary updates

There is one place where we can save performance though
In our BurgerBuilder container we are rendering the modal every time we update the burger ingredients
However we don't need the modal and order summary to update if it is not visible
We only want to rerender the OrderSummary when the modal is shown
We can see when OrderSummary is rerendered by attaching a lifecycle hook to it
To do this we will convert it to a class based component
```
import React, { Component } from 'react'
import Aux from '../../../hoc/Aux';
import Button from '../../UI/Button/Button';

class OrderSummary extends Component {

  render () {

    const ingredientSummary = Object.keys(this.props.ingredients).map((igKey) => {
      return (
        <li key={igKey}>
          <span style={{textTransform: 'capitalize'}}>
            {igKey}
          </span>: {this.props.ingredients[igKey]}
        </li>
      )
    });

    return (
      <Aux>
        <h3>Your Order</h3>
        <p>A delicious burger with the following ingredients:</p>
        <ul>
          {/* list of burger ingredients  */}
          {ingredientSummary}
        </ul>
        <p><strong> Total Price: ${this.props.price.toFixed(2)}</strong></p>
        <p>Continue to checkout?</p>
        <Button btnType="Danger" click={this.props.purchaseCanceled}>CANCEL</Button>
        <Button btnType="Success" click={this.props.purchaseContinued}>CONTINUE</Button>
      </Aux>
    );
  }
}

export default OrderSummary;
```

Now just to see how often our order summary is updating we can use `componentDidUpdate()` with a `console.log()` for testing
```
componentDidUpdate(){
  console.log('[OrderSummary] Updated')
}
```

Now inside of our application we can see that whenever we add or remove ingredients order summary is updating as well as when we show/hide it
We really only need it to update when we show and hide it

Now we will check to see if keeping the modal from updating unecessarily will stop this log from hitting the console

To do this we will need to turn the Modal component into a class so we can implement `shouldComponentUpdate()`
```
import React, { Component } from 'react';
import classes from './Modal.module.css';
import Aux from '../../../hoc/Aux';
import Backdrop from '../Backdrop/Backdrop';

class Modal extends Component {
  render() {
    return (
      // Wrapping component that gets a class which simply puts this component and its children to the front of the page
      <Aux>
        <Backdrop show={this.props.show} clicked={this.props.modalClosed} />
        <div 
          className={classes.Modal} 
          style={{ 
            transform: this.props.show ? 'translateY(0)' : 'translateY(-100vh)', 
            opacity: this.props.show ? '1' : 0
            }}>
            {this.props.children}
        </div>
      </Aux>
    );
  }
} 

export default Modal
```

Now lets try to control UpdateSummary (which is in this modal) by preventing this modal from updating unneccessarily
We can add `shouldComponentUpdate()` which will accept `nextProps` and `nextState` as arguments
In here we will return the result of checking to see if nextProps.show is the same as the current props.show value
So if this comparison is true and they are different that will return true and the component will update
If the comparison is false and they are not different then false will be returned and the component won't update
We can also add `componentWillUpdate()` just to confirm that it is working
Note that this is a deprecated function
```
shouldComponentUpdate(nextProps, nextState) {
    return nextProps.show !== this.props.show;
}
componentWillUpdate(){
  console.log('[Modal] WillUpdate');
}
```

Now if we run our page and add/remove ingredients then we won't see the unneeded updating console logs




___
## 155. Using Component Lifecycle Methods
What about other component lifecycle methods like `componentDidMount` and `componentDidUpdate`?
Why don't we use them and when would we?
We will see some of them being used when we add http
Component did mount and component did update are both important for causing side effects
Side effects are things like reaching out and fetching data
There isn't anything like that in our application yet and we don't need to initialize things like that yet
Other things like will update aren't used too often
There are sometimes where maybe you would need to adjust your components state based on outside props but its not uncommon to see big applications that don't use them




___
## Changing The Folder Structure
What other changes can we implement
Layout could be considererd a container and does pass state down to them so it wouldn't necessarily be wrong
There is also an argument that Layout could be considered a higher order component since it is really just wrapping and organizing other components (like aux)
These are mainly semantic and doesn't really change how our application works

Because the teacher considers layout a higher order component since it only wraps other components he moved it into the hoc folder (make sure to adjust all affected imports)
Update App.jsx
```
import Layout from './hoc/Layout/Layout'; // Determine placement and layout of app elements
```

Update Layout.jsx
```
import React, { Component}  from 'react';
import Aux from '../Aux'; // HOC wrapper
import classes from './Layout.module.css';
import Toolbar from '../../components/Navigation/Toolbar/Toolbar';
import SideDrawer from '../../components/Navigation/SideDrawer/SideDrawer';
```

Doing this means that our Aux.jsx should also be moved to its own folder within the hoc folder
Make sure you fix the imports anywhere that Aux is imported (vscode should do this automatically just be sure to save all [ctrl + k, s])
If your ide doesn't handle this automatically just follow the errors until you have fixed all aux imports




___
## 157. Wrap Up
Now at this point we should have a nice baseline for our application before we start exploring all of the features to really unlock react
We used a bunch of core concepts like managing state, passing props, rendering components via other components etc
Being aware of how to structure components and communicate between them is crucial

We will learn how to fetch or send data through the web, how to manage state better, how to route, and a bunch of other stuff.




___
## 158. Useful Resources & Links
Find the finished code (and between steps) for this module on github: https://github.com/jnhthomp/burger-builder
