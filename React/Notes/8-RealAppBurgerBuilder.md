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