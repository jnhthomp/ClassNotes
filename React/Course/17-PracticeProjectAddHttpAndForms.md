# Section 17: Practice Project: Adding Http & Forms To The Food Order App
Section github: https://github.com/academind/react-complete-guide-code/tree/17-practice-food-order-http-forms
___
## 214. Module Introduction
Now we will apply what we have learned in the last couple of sections to our existing project
We will add to our food order application that we started a few sections ago

In the food order app we will add a basic checkout form
This form will allow the user to enter their name and address so they can checkout
Then that form will be validated submitted to our firebase backend via http
We will also make our meals data retrieved from this firebase db as well instead of hardcoding them into the app

If you skipped previous sections make sure you are set up with firebase
Also be sure that you have a realtime database ready to connect to with the read and write rules set to true



___
## 215. Moving "Meals" to the Backend
Now we are going to start implementing the features mentioned

The first thing we will do is implement fetching the meals data from a backend
For this in the firebase console we can add a new node manually called meals
Then we can hit the plus again to add data and nest it

Remember the list of dummiy meals is currently stored in `<AvailableMeals>`
For example:
```
meals
|-m1
  |-name: "Sushi"
  |-description: "Finest fish and veggies"
  |-price: 22.99
|-m2
  ...
```

Now the meals are on the backend
Next we will want to retrieve these meals and use the result for our meals list