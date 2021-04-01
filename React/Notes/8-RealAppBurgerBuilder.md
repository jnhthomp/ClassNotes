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



