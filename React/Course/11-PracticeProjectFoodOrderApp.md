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


