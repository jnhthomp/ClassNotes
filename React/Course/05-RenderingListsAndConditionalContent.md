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




___
## 68. Adding Conditional Return Statements
Before we continue let's restructure the expenses component and we will extract the list logic to a new component just to make the expenses component a little more lean

To do that we will add an `<ExpensesList>` component to our project
create: `src/components/Expenses/ExpensesList.jsx`
create: `src/components/Expenses/ExpensesList.css`

For `ExpensesList.css` copy/paste the following: https://github.com/academind/react-complete-guide-code/blob/05-rendering-lists-conditional-content/extra-files/ExpensesList.css
```
.expenses-list {
  list-style: none;
  padding: 0;
}

.expenses-list__fallback {
  color: white;
  text-align: center;
}
```

Then in `ExpenseList.jsx` we will add our import, component function, and export statement

This is where the teachers approach being different starts to rub with our app
Since he has done the filtering seperately from mapping on his array he has an inbetween step where he can handle his `expensesContent` variable that we don't have
He wants to continue leaving the filter within `<Expenses>` and only pass the needed filtered array into `<ExpenesesList>` where it will be mapped
If we were to convert straight from how I have the project both the filtering and the mapping would be done in `<ExpensesList>` which is also fine, I just need to make those adjustments and pass in `yearFilter` into `<ExpensesList>` when I pass in the other data so I can filter within `<ExpensesList>`
I actually think this is a better approach anyway since if I wanted to reuse this list I wouldn't have to copy the filter functionality from `<Expenses>` I would simply need to pass a year into the component and the filter would work
First I need to remove the `expensesList` variable where I filter and map and the if statement that outputs the 'No Expenses Found' message from `<Expenses>`
```
import ExpensesFilter from './ExpensesFilter/ExpensesFilter';

const Expenses = (props) => {

  const initialYear = new Date().getFullYear().toString();

  const [yearFilter, setYearFilter ] = useState(initialYear);

  // useEffect method will run whenever the page reloads (such as after a state change)
  //useEffect(() => console.log(yearFilter));

  const yearSelectHandler = (yearSelected) => {
    setYearFilter((prevState) => {
      return yearSelected
    });
  };

  return (
    <Card className="expenses">
      <ExpensesFilter selected={yearFilter} onYearSelect={yearSelectHandler} />
      {expensesList}
    </Card>
  )
}

export default Expenses
```

For now I just dropped them both into `<ExpensesList>`
Next I want to make sure that `<ExpensesList>` has access to everything theses this variable and if statement need
We can see that the `expensesList` uses the `<ExpenseItem>` component when it is mapping so we will need to import that
```
import ExpenseItem from './ExpenseItem/ExpenseItem';
```
The next thing that I see is that I am accessing `props.expenses` to access the expenses array so I will need to make sure that is passed in when this component is called as well as `yearFilter` which is a variable from `<Expenses>` that should also be passed in as a prop and be adjusted accordingly
```
let expensesList = props.expenses.filter(el =>
    el.date.getFullYear().toString() === props.yearFilter).map((el) => {
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
```

Now we want to go back to `<Expenses>` and import our new component, call it, and be sure to pass in the variables it needs access to as props
```
import ExpensesList from './ExpensesList';
```

```
<ExpensesList expenses={props.expenses} yearFilter={yearFilter} />
```

Now it should be just about ready but we still need to return jsx from `<ExpensesList>` for it to be a valid component
Currently it build the expenses list and can tell if that list has items and should show an alternate message or not but it doesn't ever actually output that result

For our return we want to return and create an unorderd list and give this unordered list a className of `expenses-list`
Inside of this unordered list we want to output our `expensesList` just as we did before
```
return (
  <ul className="expenses-list">
    {expensesList}
  </ul>
);
```

At this point the teacher actually made a change to make his project closer to mine by showing the map results by default within the jsx return (still inline but pretty much the same approach as what I am doing I just use a variable and include filtering)
But his if statement will return the error message if there are no items in his `expenseList` just like mine since it is set to 0

The differnce here though is that his if statement will return alternate jsx instead of re-assigning the value of `expensesList` this is different because it avoids the original return statement of the component all together and gives a completely alternate return jsx 
Before we only wanted to change a small part so we couldn't take this approach

```
import './ExpensesList.css';
import ExpenseItem from './ExpenseItem/ExpenseItem';

const ExpensesList = props => {
  let expensesList = props.expenses.filter(el =>
    el.date.getFullYear().toString() === props.yearFilter).map((el) => {
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

  if (expensesList.length === 0) {
    return <h2 className="expenses-list__fallback">No Expenses Found For Selected Year</h2>
  }

  return (
    <ul className="expenses-list">
      {expensesList}
    </ul>
  );

}

export default ExpensesList
```

Now if the length of `expensesList` is 0 then we will avoid the components normal return statement entirelyand instead the component will return the jsx within the if statement

If you load the page it should work just as before
The only change suggestion to consider would be to get our project 100% in line with the teachers version we could remove filtering from here and set it equal to a variable within `<Expenses>` and pass that variable in instead of the current one but it is unecessary and a quick fix later if we need

One last tiny tweak is that since we are rendering an unordered list we want each `<ExpenseItem>` to be wrapped in a `<li>` tag by wrapping the card component call in `<ExpenseItem>`
```
import './ExpenseItem.css';
import ExpenseDate from './ExpenseDate';
import Card from '../../UI/Card';

const ExpenseItem = (props) => {

  return (
    <li>
      <Card className="expense-item">
        <ExpenseDate date={props.date} />
        <div className="expense-item__description">
          <h2>{props.title}</h2>
          <div className="expense-item__price">$ {props.amount}</div>
        </div>
      </Card>
    </li>
  );
}

export default ExpenseItem

```




___
## Assignment 4: Time To Practice: Conditional Content
Now that we know about conditional content we can practice
Currently there is a form at the top of the screen that is always show and used to add new expenses

We want to make it so that when a new expense is added and the 'Add Expense' button is clicked the data is still submitted but then the form is hidden from view
While the form is hidden there should be an 'Add Expense' button visible that when clicked brings the form back to view again
When the form is in view there should be a new button that says 'cancel'
when clicked this button hides the form from view and does not submit the form content as a new expense

Goals
1. 'Add Expense' button on form hides form after submitting data
2. 'Cancel' button on form hides form without submitting data
3. 'New Expense' button is displayed when form is hidden
4. When 'New Expense' button is clicked form is shown to user


My Solution
First I know that the expense form is displayed within the `<NewExpense>` component
From an organizational standpoint it would make sense to control whether the form is hidden or not from within the `<NewExpense>` component and if the form shouldn't be show then to hide/replace it there
However in order to get everything to re-render when needed it is necessary to change state to see these changes
We could always add state to our newExpense to help track which isn't too hard
First we need to import `useState`
```
import {useState} from 'react';
```

Then we want to add a variable to our state to track whether or not we are showing the form
This can be a simple boolean
```
const [showForm, setShowForm] = useState(true);
```

Now we want to add an if statement that shows a button instead of the form if `showForm` is false
```
if(!showForm){return <button>New Expense</button>}
```

We can test that this works simply by manually setting the default value for `showForm` to false in our `useState` statement
```
const [showForm, setShowForm] = useState(false);
```

Now we have the basic functionality switch set we can clean this up a little more so that it will be easier to implement
Right now the button that appears is not styled and we lose our background because when we call button we are no longer returning jsx wrapped in the `"new-expense"` class div
Instead of returning jsx we can adjust the value of a variable and put that variable within our jsx so that we don't have to rewrite that div
Then if we ever change the class name on that div we only have to change it in one place
We will make a new variable called `newExpenseContent` then we will write 2 if statements
one will be if `showForm==true` then we will set `newExpenseContent` to be filled with jsx for the `<ExpenseForm>` component
The other will be if `showForm==false` then we will set `newExpenseContent` to be the button
```
let newExpenseContent=null;
```
```
if(showForm){
  newExpenseContent=(<ExpenseForm onSaveExpenseData={saveExpenseHandler} />)
}
if(!showForm){
  newExpenseContent=(<button>New Expense</button>)
}
```

Then just remember to plug in the `newExpenseContent` into our returned jsx
```
return (
  <div className="new-expense">
    {newExpenseContent}
  </div>
);
```

Now we have the functionality totally working we just have to force it to happen at the correct time
The first thing we need to make happen is get the form to hide when we add a new expense
Remember to switch the default value of `showForm` back to true so we can see the form on page load again
```
const [showForm, setShowForm] = useState(true);
```

Now we need to create a function that will call `setShowForm` to change the value to false
```
const hideFormHandler = () => {
  setShowForm(false);
}
```
I also went ahead and made the opposite function to show the form since we will need that later
```
const showFormHandler = () => {
  setShowForm(true);
}
```

Now we can just call this `hideForm` function where needed
The first place we need it is when an expense is saved
at the very end of our `saveExpenseHandler` we can call this function to hide the form as the last action after submitting the data to `<App>` via the `onAddExpense` prop/function
```
const saveExpenseHandler = (enteredExpenseData) => {
  const expenseData = {
    ...enteredExpenseData,
    id: Math.random().toString()
  };
  props.onAddExpense(expenseData);
  hideFormHandler();
};
```

Now when we add an expense the expense will show up in our list still but the form will be hidden away immediately

Next we can add the show form function to the button that is displayed while the form is hidden
Since we already have both the button and the function we just have to connect them with `onClick`
```
if (!showForm) {
  newExpenseContent = (<button onClick={showFormHandler}>New Expense</button>)
}
```

The last thing to do is to add a new cancel button to our `<ExpenseForm>` which will hide the expense form as needed
We can actually just pass the `hideFormHandler` function in as a prop
Then activate that function as an `onClick`
```
if (showForm) {
  newExpenseContent = (<ExpenseForm onCancelFormHide={hideFormHandler} onSaveExpenseData={saveExpenseHandler} />)
}
```
Then just add this button above or below the add expense button in the form
```
<button onClick={props.onCancelFormHide}>Cancel</button>
```

Now all of the functionality should be there
The form is shown by default
If you click save it will save and then hide the form
If you click cancel it will hide the form without submitting
If you click new expense it will reshow the form

Here is my completed `<NewExpense>` component:
NewExpense.jsx
```
import { useState } from 'react';
import './NewExpense.css';
import ExpenseForm from './ExpenseForm';

const NewExpense = (props) => {
  let newExpenseContent = null;

  const [showForm, setShowForm] = useState(true);

  const hideFormHandler = () => {
    setShowForm(false);
  }

  const showFormHandler = () => {
    setShowForm(true);
  }

  const saveExpenseHandler = (enteredExpenseData) => {
    const expenseData = {
      ...enteredExpenseData,
      id: Math.random().toString()
    };
    props.onAddExpense(expenseData);
    hideFormHandler();
  };

  if (showForm) {
    newExpenseContent = (<ExpenseForm onCancelFormHide={hideFormHandler} onSaveExpenseData={saveExpenseHandler} />)
  }
  if (!showForm) {
    newExpenseContent = (<button onClick={showFormHandler}>New Expense</button>)
  }

  return (
    <div className="new-expense">
      {newExpenseContent}
    </div>
  );
};

export default NewExpense;
```

ExpenseForm.jsx only had one line change and that was to add the button it is a long component so I will only include the relevant snippet
ExpenseForm.jsx
```
...
       <div className="new-expense__control">
          <label>Date</label>
          <input 
            type="date" 
            min="2019-01-01" 
            max="2022-12-31" 
            value={userInput.enteredDate} 
            onChange={dateChangedHandler}
          />
        </div>
        <button onClick={props.onCancelFormHide}>Cancel</button> //<=This Button
        <button type="submit">Add Expense</button>
      </div>
    </form>
  );
};
```

Teacher Solution:
The teacher takes the same approach as me and thinks that we should be triggering the change for the form in our `<NewExpense>` component
In order to get started he just goes ahead and adds the button now

```
<div className="new-expense">
  <button>Add New Expense</button>
  <ExpenseForm onSaveExpenseData={saveExpenseHandler} />
</div>
```

Now the teacher is again on the same track as me and reasons that because we have two different states to maintain (one were the form is hidden and one where the form is showing) we will need to register and manage state in this component
First import `useState`
```
import { useState } from 'react';
```

Then we can call it within the component
Again the teacher agrees that the best bet is to use a boolean that simply tells whether the form should be shown or not with an initial value of false
```
const [isEditing, setIsEditing] = useState(false);
```

Then he creates a `startEditingHandler` which changes the value of `isEditing` to true
This is the same thing as my `showFormHandler`
```
const startEditingHandler = () => {
  setIsEditing(true);
}
```
This function should be triggered when the "Add New Expense" button that he created above is clicked so we can add the `onClick` prop to that button and point it at this function
```
<div className="new-expense">
  <button onClick={startEditingHandler}>Add New Expense</button>
  <ExpenseForm onSaveExpenseData={saveExpenseHandler} />
</div>
```
Now we can use the `isEditing` state to control which of the two elements below are show (button or form)

He does this inline with the && technique that we discussed earlier instead of changing the value of a variable like I do which he mentions is also valid or you could use a ternary expression inline
With the && technique remember it is `condition && returnedIfTruthy`
We want the button to show when `isEditing` is false so we can use `!isEditing && buttonStuff...`
We want the form to show when `isEditing` is true so we can use `isEditing && formStuff...`
```
<div className="new-expense">
  {!isEditing && <button onClick={startEditingHandler}>Add New Expense</button>}
  {isEditing && <ExpenseForm onSaveExpenseData={saveExpenseHandler} />}
</div>
```
Now when the page loads you see the button instead of the form and if you click the button you see the form

Now he is going to add the cancel button inside of the form and make sure when the form is submitted we also stop editing

Within `<ExpenseForm>` he adds a cancel button above the 'Add Expense' button
One thing he did that I did not do was set the type of the button to button just to ensure that it does not accidentally submit the form
Then he addsd a click handler which will execute a function when the button is pressed
We will put this function in the `<NewExpense>` component though so the button will need to get this function passed down from props he calls this `onCancel` but the name is up to you
```
...
<button type="button" onClick={props.onCancel}>Cancel</button>
<button type="submit">Add Expense</button>
```
Next we have to add this method to the `<NewExpense>` component and pass it down to the form so it can be used in the button
First we will go ahead and just add it to the form since we already have a name for it 
```
{isEditing && <ExpenseForm onSaveExpenseData={saveExpenseHandler} onCancel={stopEditingHandler} />}
```
Then we need to create the `stopEditingHandler` which will simply change the value of `isEditing` to false
This is just the opposite of the `startEditingHandler` above and the same as my `hideFormHandler`
```
const stopEditingHandler = () => {
  setIsEditing(false);
}
```

Lastly he needs to connect the `stopEditingHandler` to the `saveExpenseDataHandler` instead of calling the `stopEditingHandler` though he just manually sets `isEditing` to false with `setIsEditing`
I just kept it pointing at stopEditingHandler because if we wanted to do something else whenever we stop editing in the future we only have to make changes in one place
```
const saveExpenseHandler = (enteredExpenseData) => {
  const expenseData = {
    ...enteredExpenseData,
    id: Math.random().toString()
  };
  props.onAddExpense(expenseData);
  setIsEditing(false);
};
```
Now after doing all of this all buttons and functionality should work as expected




___
## 69. Demo App: Adding a Chart
Now our expense tracker is taking shape and is pretty much finished in that it has most of the core functionality and features
Part of the original state that is still missing is the chart that shows a graphical representation of our expenses per month
This is the part that we will cover next

To do this we will start by making a new component folder called `'chart'` since it will hold all of the components needed for the chart
There will be two main components for the chart
The first is the chart itself
The second is inside of the chart we have bars which will be their own component that are called and displayed inside the chart

Get the lesson CSS:
Chart.css: https://github.com/academind/react-complete-guide-code/blob/05-rendering-lists-conditional-content/extra-files/Chart.css
```
.chart {
  padding: 1rem;
  border-radius: 12px;
  background-color: #f8dfff;
  text-align: center;
  display: flex;
  justify-content: space-around;
  height: 10rem;
}
```
ChartBar.css: https://github.com/academind/react-complete-guide-code/blob/05-rendering-lists-conditional-content/extra-files/ChartBar.css
```
.chart-bar {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.chart-bar__inner {
  height: 100%;
  width: 100%;
  border: 1px solid #313131;
  border-radius: 12px;
  background-color: #c3b4f3;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}

.chart-bar__fill {
  background-color: #4826b9;
  width: 100%;
  transition: all 0.3s ease-out;
}

.chart-bar__label {
  font-weight: bold;
  font-size: 0.5rem;
  text-align: center;
}
```

Create the following four files
Create: src/components/Chart/Chart.css (copy/paste css from above)
Create: src/components/Chart/Chart.jsx
Create: src/components/Chart/ChartBar.css (copy/paste css from above)
Create: src/components/Chart/ChartBar.jsx

Now lets start with the `<Chart>` component
Start by just creating the component function and export statement
```
export const Chart = () => {
  return (
    <div>
      
    </div>
  )
}

export default Chart;
```

Now how should we approach this chart?
Within the chart we want to render chart bars but how?
Eventually we will import the `<ChartBar>` component so we can go ahead and add it now
```
import ChartBar from './ChartBar.jsx';
```

now we can add the chart className from our css file to our returned div
```
import './Chart.css';
import ChartBar from './ChartBar.jsx';
export const Chart = () => {
  return (
    <div className="chart">
      
    </div>
  )
}

export default Chart;
```

Nowe inside of this div is where we want our bars
We could render 12 chart bars which would be easy and dirty but we can make it cleaner and dynamic
Doing it this way means that we aren't necessarily restricted to months so we can display charts for other periods of time too like weeks or years
To do this we can say something like
When we use the `<Chart>` component in our application we should receive the data points that would be used as props
This would make the chart component pretty configurable and any components that use the chart can decide for themselves what kind of data to send/show
So to do this we will display our data dynamically by going through an array of data points and mapping them to a chart bar
We have done something similar before when rendering expenses so this isn't entirely new
Since we know we want to receive our data as props we can start writing as if we have that data and then push it in later

What we are going to want to do is receive these data points as an array from props, run `map` on that array and for each data point map it to a `<ChartBar>` component
In the most simple form that would look something like this:
```
props.dataPoints.map(dataPoint => <ChartBar />)
```
At this point we don't have any data passed to our component yet but since we are writing this we can decide now what we should receive from each data point
The important things to receive are the date and amount
These will both need to be passed to the `<ChartBar>` component as props so it knows how big to make each bar as well as where to place it within the `<Chart>` component
```
<ChartBar 
  value={dataPoint.value}
  label={dataPoint.label} //<= Will be a date value
/>
```

Now there are two more things that we still need to pass into here
In order for our chart to have any sense of scale we need to know how 'tall' to make it
This needs to be dynamic in that it will be equal to the number of the highest bar in the chart
To do this we will pass in a `maxValue` prop to `<ChartBar>` but set it initially as null
We will use logic later to extract the highest `dataPoint.value` value from our list and update it with that number
```
<ChartBar 
  value={dataPoint.value}
  maxValue={null}
  label={dataPoint.label} //<= Will be a date value
/>
```
The very last thing is one of the same things we needed to include when we were making our expenses list
This is a key that is used by react as a unique identifier for each instance of the component
Remember we just have to use the special keyword `key` prop and set a unique identifier
We can either use the date label since there will only be 1 bar for each period of time or we can use an id either one is fine
```
<ChartBar 
  key={dataPoint.label}
  value={dataPoint.value}
  maxValue={null}
  label={dataPoint.label} //<= Will be a date value
/>
```
When finished our `<Chart>` component should look like this:
```
import './Chart.css';
import ChartBar from './ChartBar.jsx';
export const Chart = () => {
  return (
    <div className="chart">
      {props.dataPoints.map(dataPoint =>( 
        <ChartBar
          key={dataPoint.label}
          value={dataPoint.value}
          maxValue={null}
          label={dataPoint.label} //<= Will be a date value
        />
      ))}
    </div>
  )
}

export default Chart;
```

Now we are set to start working on the `<ChartBar>` component and it should be receiving all the props it needs once we connect `<Chart>` to the rest of our app and pass it data




___
## 70. Adding Dynamic Styles
Now we have to build the `<ChartBar>` component
We can start by importing the css we downloaded last lesson as well as creating a component function that accepts props and exporting it
```
import './ChartBar.css';

const ChartBar = (props) => {
  return (
    <div>
      
    </div>
  )
}

export default ChartBar
```
For our return statement we want to include a `'chart-bar'` className to match our css 
Then within that div we want a nested div with a className of `'chart-bar__inner'`
nested within the `'chart-bar__inner'` div we need to include two children that are siblings (not nested within each other)
The first is `'chart-bar__fill'`
The second is `'chart-bar__label'`
```
    <div className="chart-bar">
      <div className="chart-bar__inner">
        <div className="chart-bar__fill"></div>
        <div className="chart-bar__label"></div>
      </div>
    </div>
```
The label div we just created will hold the label that we are passing into `<ChartBar>` via props so we can fill that now
```
<div className="chart-bar__label">{props.label}</div>
```
We  will also need to change the `chart-bar__fill` div
This will work by defining how much the chart bar will be filled and define the background color
There is still an important piece of information though and that is the overall height of the chart bar
Of course the bar element has a height itself which is 100% of the chart but how much we fill each bar depends on how close each data point is to the max value
We want to fill our chart bar by comparing our value for the given bar with the max value of the bars to be displayed
For example if the max value was 100 and the bar we were showing was 50 then it should be about half the height of the chart and the other bar
So we can use the thought process: 
```(currentBarValue/maxValue)*100=chart-bar__fillPercentage```

Lets make this function so we can start to pass values into our fill div
First we will make a placeholder variable to hold an initial value of 0%
This will be stored as a string value because we will pass it into our css which can only accept strings
```
let barFillHeight='0%'
```

Then we want to see if our `props.maxValue` is greater than 0 (double checking that our bars even have values)
If so then we can use the thought process above to extract a percentage from our known values
```
  if(props.maxValue > 0) {
    barFillHeight = Math.round((props.value/props.maxValue)*100)
  }
```
We also added `Math.round` to get an even number
Don't forget that we need a percentage sign on the end of this and it needs to be a string for `barFillHeight` to be how it was when we initialized it and so we can pass it in as a css value
Adding a '%' as a string to the end will add the symbol for us and convert it to a string
```
barFillHeight = Math.round((props.value/props.maxValue)*100) + '%';
``` 

Now we want to set this value as the css height value for our `chart-bar__fill` div
To do this we will set the style dynamically which we haven't done before
To do this we can add a `style` attribute on our element which is a default attribute
This is available in plain html but it works a little differently in react
the style attribute wants to receive an object instead of a string
This might look weird because of the double curly braces
The first set is signifying we will be inserting a js expression
The second set is signifying that expression will be an object
Within this object we should use the css property keynames as our keynames
The values will obviously set to the appropriate css values
In our case we want to set the css `height` property to the `barFillHeight` value we just created above
```
<div className="chart-bar__fill" style={{height: barFillHeight}}></div>
```
```
NOTE: Unrelated to the current lesson but if we wanted to set a css property that has a dash in it (like `background-color`) we would have to do it like this:

style={{'background-color': 'red'}}

We must add the quotes around it because adding a dash is not valid js and will throw an error but you can have a key that is a string which react will recognize and assign to the correct property
Alternatively you can also use the camel case version of that name 
style ={{backgroundColor: 'red'}}

We aren't using this property right now but is important to know
```

Now the `<ChartBar>` component is complete we just need to use the `<Chart>` component and pass in the data points it needs




___
## 71. Wrap Up & Next Steps
Now we need to use the chart and pass in our data points
To do this we will create yet another component that will hold the chart within expenses for us
This is because if we were to ever add an income maybe we would want to reuse the chart and this would make it easier
create: `src/componenets/Expenses/ExpensesChart.jsx `
Add the react component function knowing that we will need to receive props to pass onto the chart itself
We will be returning the chart itself so add that component to the return and make sure you are importing the file
```
import Chart from '../Chart/Chart.jsx';

export const ExpensesChart = (props) => {
  return (
    <Chart />
  )
}
```
Now we need to define the data points that are passed into the chart
To setup the data points in `<ExpensesChart>` we will create a new constant that is an array of objects 
Remember we expected an array in Chart because we ran `map` on the datapoints we passed in
Then on each of those datapoints we expected an object with multiple pieces of information
The information we are expecting it to have is a `label` and `value` key
`label` will correlate with a different month so we can prefill those with month names
`value` will initially be 0 and we will add to the values as we take in data
```
const chartDataPoints = [
  { label: 'Jan', value: 0 },
  { label: 'Feb', value: 0 },
  { label: 'Mar', value: 0 },
  { label: 'Apr', value: 0 },
  { label: 'May', value: 0 },
  { label: 'Jun', value: 0 },
  { label: 'Jul', value: 0 },
  { label: 'Aug', value: 0 },
  { label: 'Sep', value: 0 },
  { label: 'Oct', value: 0 },
  { label: 'Nov', value: 0 },
  { label: 'Dec', value: 0 }
]
```
For our data it would be best if we receive the `filteredExpenses` variable as a prop because it is already selected for a 12 month range as our chart is
We will use this to go through all of the expenses for a selected year
Determine the month it was in and add the value of the expense to the appropriate month in `chartDataPoints`
We will use a for loop for this
```
for (const expense of props.expenses) {

}
```

Now within the for loop we can extract the month because we are using a date object and dates have the functionality available to them and we can save this to a variable
```
for(const expense of props.expenses){
  const expenseMonth = expense.date.getMonth(); // Starting at 0 => Jan
}
```
remember getMonth will return a number correlating to the month but starting at 0 instead of 1
This is actually fine (and even better) because we are storing our months in an array which also starts at 0 so our months already line up without any changes

We can just use the month returned here as an index of `chartDataPoints` and be accessing the correct month 
For example `chartDataPoints[expenseMonth]` with a march expense would give us access to the march object
So we want to access that object and update that objects value by increasing it by the value of the current expense
```
for(const expense of props.expenses){
  const expenseMonth = expense.date.getMonth();
  chartDataPoints[expenseMonth].value += expense.amount;
}
```

Now whenever we receive an list of expenses it will go through and add all of their values to the appropriate month
Keep in mind that this list will need to be filtered by year as we do in `<Expenses>` because otherwise you would have months from multiple different years being added together instead of showing a single month

We can pass these `chartDataPoints` to our `<Chart>` component
```
return (
  <Chart dataPoints={chartDataPoints} />
)
```

You might also remember we had a `max-value` within our chart that we never assigned the value of
Now that we know all of the values that are being passed from `<ExpensesChart>` we can look at each month and determine which one has the highest value and what that value is

Within `<Chart>` component we will create a new variable to hold the highest value
```
const totalMaximum = 
```
One js tool we have is called `Math.max()` this will find the biggest number in a list of numbers but it expects a comma separated list and we have an array of objects 
That is ok because we can simply call `.map()` on our array of data points and at each object extract the value and add that to an array
```
const dataPointValues= props.dataPoints.map(el => el.value)
```
Now we have an array of values but `Math.max()` still wants a comma separated list
We can handle that by simply using the spread operator!
```
const totalMaximum = Math.max(...dataPointValues)
```
Note that you should be able to combine the two lines above into one line:
```
const totalMaximum = Math.max(...(props.dataPoints.map(el => el.value)));
```
Now we just need to plug the `totalMaximum` into our `maxValue` argument to `<ChartBar>`
```
<ChartBar
  key={dataPoint.label}
  value={dataPoint.value}
  maxValue={totalMaximum}
  label={dataPoint.label}
/>
```

Now the last thing to do is within our `<Expenses>` component to call our `<ExpensesChart>` component and pass in the data that it needs
Remember to first import it then add it between the filter and the list and pass in the filtered expenses
```
return (
  <Card className="expenses">
    <ExpensesFilter selected={yearFilter} onYearSelect={yearSelectHandler} />
    <ExpensesChart expenses={filteredExpenses} />
    <ExpensesList expenses={props.expenses} yearFilter={yearFilter} />
  </Card>
)
```
Except remember if you did it my way the `filteredExpenses` are actually in the `<ExpenseList>` component
That is ok we can fix that remember this is what we have in `<ExpensesList>`
```
let expensesList = props.expenses.filter(el =>
  el.date.getFullYear().toString() === props.yearFilter).map((el) => {
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
```
We are just passing the full list of expenses down to `<ExpensesList>` and filtering it there
We just need to remove the filter and add it to `<Expenses>` and set the result equal to a variable
Then we just need to pass that variable down to `<ExpensesList>` through props and run map on it
```
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
Add the filter to `<Expenses>` component
```
const filteredExpenses = props.expenses.filter(el => el.date.getFullYear().toString() === yearFilter);
```
pass the filtered list down to `<ExpensesList>` component
```
<Card className="expenses">
  <ExpensesFilter selected={yearFilter} onYearSelect={yearSelectHandler} />
  <ExpensesChart expenses={filteredExpenses} />
  <ExpensesList expenses={filteredExpenses} yearFilter={yearFilter} />
</Card>
```

Now the Expenses Tracker is complete!
That's not to say there aren't improvements or things that could be done better but there is still plenty to learn in further lessons