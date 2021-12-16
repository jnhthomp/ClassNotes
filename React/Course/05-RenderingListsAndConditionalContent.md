# Section 5: React State & Working With Events
Section github: https://github.com/academind/react-complete-guide-code/tree/05-rendering-lists-conditional-content
___
## 63. Module Introduction
Now we know how to build components and work with multiple components 
We also know how to work with state and handle multiple events

Now we are going to cover rendering lists and conditional content
We will look at how we will output arrays of data on our page and how we can output different content based on different conditions

We will continue working on the application we had previously started and should finish it this module after adding these features





___
## 64. Rendering Lists of Data\
Currently our application may be rendering a list of data but it is static and not dynamic

Remember in `<App>` we have an array holding expense objects and we pass the array down to `<Expenses>`?
In section 3 assignment 1 we were supposed to use this data to call `<ExpenseItem>` components for each object in the array
The teacher hardcoded it by hand, manually called all 4 instances of `<ExpenseItem>` component, and hardcoded which values went to which instance

However I automated it to not copy/paste by going within `<ExpenseItem>` and using `.map()` on the array to return jsx that uses values from that array as props within an `<ExpenseItem>` component
When we do this it runs through the array and creates an expense item component using the data from each of the objects as expected
```
## Teacher Version
<ExpenseItem
  title={props.items[1].title}
  amount={props.items[1].amount}
  date={props.items[1].date}
/>

## My version
let expensesList = props.expenses.map((el) => {
  return (
    <ExpenseItem
      key={el.id}
      date={el.date}
      title={el.title}
      amount={el.amount}
    />
  );
});
```

If you did use the teachers approach we want to convert to my approach
I will write out how the teacher does it and make any necessary changes to my project

The first step is to pass our list of expenses down from `<App>` to `<Expenses>` 
Luckily both us and the teacher are already doing this via props when we initially call `<Expenses>`
```
//teacher has prop named 'item' instead of `expenses`
<Expenses expenses={expenses}/> 
```

Now we want to use this array that we have passed and render one expense item per item in the array

The first thing to do to accomplish this is to add some curly braces as a child of our `<Card>` component (below `<ExpensesFilter>`)
These curly braces allow us to insert a js expression 
I think it is cleaner to take the expression out of the return statement and just use a variable in the curly braces but the teacher leaves it within the return statement
Either way will work but I think mine is cleaner and keeps the returned jsx section more tidy
```
<Card className="expenses">
  <ExpensesFilter selected={yearFilter} onYearSelect={yearSelectHandler} />
  {expensesList}
  // Teacher has each expense items listed like this x4
  //<ExpenseItem
  //  title={props.items[0].title}
  //  amount={props.items[0].amount}
  //  date={props.items[0].date}
  ///>
</Card>
```

Now if you are taking my approach or if you are taking the teachers approach we need to create the same thing the only difference is I am saving the created thing to a variable and passing that variable in instead of creating the thing directly within the jsx

What we need to do now is cycle through the array and create a call for `<ExpenseItem>` based on the data in each object of the array
To do this we will use a method available to arrays called `.map()`
What this method does is cycle through each item in an array, perform a function on it, and return a result which is stored in a new array
For example:
```
ogArray = [1, 2, 3];
newArray = ogArray.map((el)=>el*2);
console.log(newArray) //=>[2, 4, 6]
```

`.map()` can accept an argument (which is usually called `e` or `el` but can be anything)
this argument refers to the current item of the array that we are on
So the first time we are going through it looks like this:
```
newArray = ogArray.map(([1])=>[1]*2);
// returns '2' and adds it to the end of newArray
// console.log(newArray) //=> [2]
```
Then the second time:
```
newArray = ogArray.map(([2])=>[2]*2)
// returns '4' and adds it to the end of newArray
// console.log(newArray) //=> [2, 4]
```
Then finally the third time:
```
newArray = ogArray.map(([3])=>[3]*2)
// returns '6' and adds it to the end of newArray
// console.log(newArray) //=> [2, 4, 6]
```

We want to do the same thing here but instead of a number `el` will be an object and we will want to extract the relevant data from the object and pass it into `<ExpenseItem>` as we call it
Then each iteration will return an instance of `<ExpenseItem>` that has the appropriate data and add it to a new array which we will save
Luckily if we put an array of valid jsx elements then React will be able to render that for us without us doing anyting

Lets take a look at the data we will be receiving 
The array from `<App>` looks like this:
```
const expenses = [
  { id: '85540',title: 'Car Insurance', amount: 135.35, date: new Date(2021, 2, 28) },
  { id: '83918',title: 'Toilet Paper', amount: 94.12, date: new Date(2021, 3, 12) },
  { id: '92370',title: 'New TV', amount: 799.49, date: new Date(2021, 8, 8) },
  { id: '34495',title: 'New Desk (Wooden)', amount: 450, date: new Date(2021, 5, 15) },
]
```
And we want to create something that looks like this: 
```
      <ExpenseItem
        key={id} // Will be discussed later why we need this
        date={date}
        title={title}
        amount={amount}
      />
```
We can see that the `id`, `date`, `title`, and `amount` values are all within the `<ExpenseItem>` and also within the object from the element

So lets try running `.map` on our array of objects
We know we have access to this array via props since it was passed in from `<App>`
Then we need to write the function that `.map()` will accept which will have access to the `el` variable (current array item) if we include it as an argument
This function should simply return the same jsx as above (just a call to `<ExpenseItem>`) with the included data that we can access with `el.` just like any other object
```
let expensesList = props.expenses.map((el)=>{
  return (
    <ExpenseItem 
      key={el.id}
      date={el.date}
      title={el.title}
      amount={el.amount}
    />
  );
})
```
This will create an array of valid jsx with the appropriate data just like we want

Now our page should continue loading and showng the list but this means that we can now change this array dynamically to change the data that is shown on the screen especially if we were to add it to `<App>` state




___
## 65. Using Stateful Lists
Now how can we update the expenses array when a new expense is being added?
We will have to make changes to `<App>` since that is where the array lives
Inside of there we have an `addExpenseHandler()` from the previous section where we output a `console.log()` of the expense once one is made with the top section
Obviously this has access to a new expense we would want to add but how can we add it to the expenses array?
Obviously we can't just add it to the array because react won't update components just because a variable changes
Instead we have to add `expenses` to the `<App>` components state so that way when we make changes to that array they are reflected in the application

To add state we will need to add an import statement
```
import {useState} from 'react;
```

Then we will do something a little different and remove our `expenses` component and store it outside of our `<App>` component function
We will also rename it to an all caps `INITIAL_EXPENSES`
This will just be dummy data we can use to initialize our state with
```
...
import NewExpense from './components/NewExpense/NewExpense';

const INITIAL_EXPENSES = [
  { id: '85540', title: 'Car Insurance', amount: 135.35, date: new Date(2021, 2, 28) },
  { id: '83918', title: 'Toilet Paper', amount: 94.12, date: new Date(2021, 3, 12) },
  { id: '92370', title: 'New TV', amount: 799.49, date: new Date(2021, 8, 8) },
  { id: '34495', title: 'New Desk (Wooden)', amount: 450, date: new Date(2021, 5, 15) },
]

const App = () => {
  ...
```

Now inside of our `<App>` component we want to call `useState` and initialize it with our dummy values
```
const [expenses, setExpenses] = useState(INITIAL_EXPENSES); 
```

Now that we have our expenses saved to state and a way to update those expenses we can start adding new expenses within our `addExpenseHandler()`
Remember that when we are updating an object or array we want to pass a function into `setExpense()` so we can utilize `prevState` instead of just adding the values or may not update correctly
This function that we pass in as an argument will receive `prevState` as an argument and then return an array with the new expense at the beginning and using the spread operator with `prevState` to fill in the remaining values
```
const addExpenseHandler = (expense) => {
  setExpenses((prevState)=>{
    return ([expense, ...prevState]);
  });
```

Now our state will update using old data correctly instead of using potentially outdated versions of state

Now since we are using our `<Expenses>` state to pass in information to the array we were already displaying it should be dynamic and we should be able to add new items to it

Note: When doing this I noticed that there is a bug with date since it is by default saved as GMT
If you are in a far enough timezonne (like eastern) you may want to specify that for a quick fix so the correct date shows for now
To do this in the `<ExpenseForm>` where we set the date I just used a template literal to add a timezone to the end of the timezone (line 7)
This isn't the best fix since if someone were to use this in a different timezone it would still be wrong but it will work for now 
```
 const submitHandler = (event) => {
    event.preventDefault()

    const expenseData = {
      title: userInput.enteredTitle,
      amount: userInput.enteredAmount,
      date: new Date(`${userInput.enteredDate} EST`) // Adds timezone so correct date shows
    };

    props.onSaveExpenseData(expenseData);

    setUserInput({
      enteredTitle: '',
      enteredAmount: '',
      enteredDate: ''
    })
  }
```




___
## 66. Understanding "Keys"
You may have noticed that in the `<App>` `INITIAL_EXPENSES` array objects I have a value for `id`

Also when creating a new expense object we assign `id: Math.random()toString()` within `<NewExpense>`

This is because of a concept called keys which react uses on lists of components, especially dynamically rendered ones

This is used so that react can know which component to interact with if it needs to target a specific instance component (say like to delete or edit a specific expense)

The teacher hadn't added them yet at this point so if you were following him you may not have these keys assigned to the expenses listed within the `INITIAL_EXPENSES` array
If that is the case then you should be getting a warning in the console when your page loads that says something like:
```
Warning: Each child in a list should have a unique 'key' prop
```

What happens when this warning is active is that instead of targetting an individual instance of a component to rerender data like when adding an expense all of the instances of `<Expense>` are targetted and totally rerendered
If `<Expense>` had state within it that it was managing then any changes made within would be lost when changes are made to other instances

So how do we fix it?
All you have to do is go to where we are rendering our instances of `<ExpenseItem>` and assign a special prop called `key` luckily we already have an id value we can use from when we received the `enteredExpenseData` within `<NewExpense>` by assigning `id: Math.random().toString()` as mentioned above
We simply have to assign that value to key the same way we assigned `title`, `amount`, and `date`
```
let expensesList = props.expenses.map((el) => {
  return (
    <ExpenseItem
      key={el.id} // <=Assign key here - el.id is from Math.random and should be fairly unique
      date={el.date}
      title={el.title}
      amount={el.amount}
    />
  );
});
```

If you make these changes you should see that any new divs rendered to the screen are the only divs that are updating
To get rid of the error message simply make sure that there is an `id` value within the `INITIAL_EXPENSES` array as well




___
## Assignment 3: Time to Practice: Working with Lists
Time to practice what you learned about outputting list content.

Now we have learned how to output lists of data the challenge is to try to make the filter work correctly
That is if 2021 is the selected year in the filter then only expenses from 2021 are shown etc.

There are 2 hints:
1. You can filter arrays with the `.filter()` method (look this up if you aren't familiar)
2. You shouldn't think too complicated - you should not change the overall expenses array. Instead you might want to show a new array based on the full expenses array which would be a subset of the full expenses array for the chosen filter. 

My Solution:
Since we don't want to change the `expenses` array from state we only want to filter through it
We can try to utilize the `filter()` method
`filter()` will accept a check on an element and if it returns true add it to an array that is returned after all elements are processed. 
This is kind of like a selective version of map except you aren't making changes to the data although they can be used as alternatives to each other if you set it up with the right if statements
what we want to check is that the year of the element we are checking is equal to the year being shown if it is then we want that returned to an array we wil run our already existing map function on
so to do  that we would use something like
```
array.filter((el) => el.date.getFullYear() == yearFilter)
```

we can just plug this in right where we are creating our `<ExpenseItems>` within `<Expenses>` and since `yearFilter` is tied to state when it is updated we should get a rerender and don't have to worry about this not updating
```
  let expensesList = props.expenses.filter(el => el.date.getFullYear() == yearFilter).map((el) => {
    return (
      <ExpenseItem
        key={el.id}
        date={el.date}
        title={el.title}
        amount={el.amount}
      />
    );
  });
```

Now when you use the dropdown the correct years should be filtered out and if you add ones outside of the year currently displayed you will see them as soon as you switch to that year


Teacher Solution:
The teacher also chooses to start in the `<Expenses>` component and filter based on `props.expenses` where before he had the expenses list being written in-line he now chooses to create a new const called `filteredExpenses` where he will run the filter method called on `props.expenses`
```
const filteredExpenses = props.items.filter()
```

Now to fill in the argument for the filter method
The filter method will accept a function that has the current element available then you make a comparison and if that comparison returns true that element is returned
So we want to check if the date for an expense has a year that matches our filterd year
He takes the same approach and runs the `getFullYear()` on expenses except he does convert it to a string with `toString()` which allows him to use strict equality which is much better
```
const filteredExpensees = props.items.filter (expense => {
  return exepense.date.getFullYear().toString() === filteredYear;
});
```

Now instead of mapping `props.items` the teacher then maps the `filteredExpenses` array he just created which is what we did




___
## 67. Outputting Conditional Content
Now our filter is working but when we look at pages that have no data (such as if we never added any expenses for the year 2019 or something)it is just kind of blank 
It would be better if we had some kind of messag like "No Expenses Within Given Time Period" to display IF there are no expences

The teacher wants to do this in-line with our jsx return

We cannot use if statements in jsx expressions but we can use ternary operators which will work
remember ternary operators work by `condition ? execute if true : execute if false`

So first we will set the condition which is that the length of our filtered expenses list is 0
If that is true and it is 0 then we want to output a short sentence explaining that there were no expenses
If that is false and expensesList.length > 0  then we will output the expensesList as normal
```
expensesList.length === 0 ? <p>No Expenses Found</p> : expensesList
```

If we replace our original jsx `expensesList` variable call with this expression then we will get exactly the functionality we were looking for
```
<Card className="expenses">
  <ExpensesFilter selected={yearFilter} onYearSelect={yearSelectHandler} />
  {expensesList.length === 0 ? <p>No Expenses Found For Time Period</p> : expensesList}
</Card>
```

The teacher then shared another trick/approach we can use
It turns out that in js if you use `comparison && return` and if the comparison turns out to be true then the return is returned
It basically works like a short if statement so we could instead turn our ternary expression into 2 of these short expressions
```
{expensesList.length === 0 && <p>No Expenses Found</p>}
{expensesList.length > 0 && expensesList}
```
Keep in mind that the teacher still has his `filteredExpenses` list being mapped inline with his jsx return so his looks like:
```
{filteredList.length === 0 && <p>No Expenses Found</p>}
{filteredList.length > 0 && 
  filteredList.map((el) => (
      <ExpenseItem
        key={el.id}
        date={el.date}
        title={el.title}
        amount={el.amount}
      />
    );
  );}
```

This can start to get really busy so I think that he is going to transition to doing it closer to my way to clean up his jsx return statement a little bit

The teacher decided to make a new variable called `expensesContent` that is assigned a default value of our message of no content being found
We can return this value within our jsx and have it show as normal as I have been doing with `expensesList`
```
let expensesConst = <p>No Expenses Found</p>
```

Now before the return statement he adds an if statement to check if his `filteredExpenses.length > 0` and if so then return the jsx `.map` stuff he is doing up top

For me it is a little more simple
Since I already have the returned `<ExpenseItem>` calls stored in a variable and it is my filterd list I can just show it as I have been except if it has a length of 0 set expensesList to be the 'No Expenses Found' message
```
import { useState, useEffect } from 'react';
import './Expenses.css';
import ExpenseItem from './ExpenseItem/ExpenseItem';
import Card from '../UI/Card';
import ExpensesFilter from './ExpensesFilter/ExpensesFilter';

const Expenses = (props) => {

  const initialYear = new Date().getFullYear().toString();

  const [yearFilter, setYearFilter ] = useState(initialYear);

  // useEffect method will run whenever the page reloads (such as after a state change)
  //useEffect(() => console.log(yearFilter));

  let expensesList = props.expenses.filter(el => 
    el.date.getFullYear().toString() === yearFilter).map((el) => 
      {
        return (
          <ExpenseItem
            key={el.id}
            date={el.date}
            title={el.title}
            amount={el.amount}
          />
        );
      }
  );

  const yearSelectHandler = (yearSelected) => {
    setYearFilter((prevState) => {
      return yearSelected
    });
  };

  if (expensesList.length === 0){
    expensesList = <p>No Expenses Found For Time Period</p>
  }

  return (
    <Card className="expenses">
      <ExpensesFilter selected={yearFilter} onYearSelect={yearSelectHandler} />
      {expensesList}
    </Card>
  )
}

export default Expenses
```

The teachers solution is similar except instead of setting `expensesList`
He instead sets `expensesContent` and it is initially equal to the 'No Expenses Found' string
Then he checks the length of his filtered expenses with an if statement and if is long enough those expenses are mapped to `<ExpenseItem>` calls
```
const filteredExpenses = props.items.filtere((expense) => {
  return expense.date.getFullYear().toString() === filteredYear:
});

let expensesContent = <p>No Expenses Found</p>

if(filteredExpensees.length > 0) {
  expensesContent = filteredExpenses.map((expense) => (
    <ExpenseItem
      key={expense.id}
      title={expense.title}
      amount={expense.amount}
      date={expense.date}
    />
  ));
}
```
Both these approaches do the same thing in just about the same way so either approach should be fine
