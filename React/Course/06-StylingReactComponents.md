# Section 6: Styling React Components
Section github: https://github.com/academind/react-complete-guide-code/tree/06-styling
___
## 74. Module Introduction
React is not just about putting components together and making sure the logic works correctly
It might be the most important part but it is also important to be able to know how to style apps
An app that looks good and does the job will go a lot further than one that is stricly functional but not good to look at
There is also some baseline css and styling knowledge necssary just to get the page to not be jumbled as well

There are a few different techniques to style components dynamically and styling them so that other components are not affected by specific components styles

We will discuss how you can set styles in a specific or dynamic way and switch styles 
For example if a user input an invalid input then you could color the field red based on that

Then we will dive into two popular approaches for scoping styles to components
We will set them up so that they only affect the component and are not added as global styles

We will have a look at a third party library called 'styled components`
This will allow us to setup prestyled components with their own scoped styles

We will also have a look at a concept called css modules

To dive into styling we will need a demo project and just to mix things up we will use a prepared demo project
This will save us time from having to do things we know how to do already from scratch and be more interesting than continuing in the same project we have been working in
It is very plain and just has a card with an input box labeled 'course goal' and a button to submit that goal
Then when that goal is submitted it lists it down below with other goals
You can delete goals by clicking on them
Feel free to look for the starting code for our project before we start working

## Personal Note: Creating a new project
I had some issues with creating a new react app this time
I wasn't able to simply use the `$npx create-react-app appname` as expected
I tried that command and then ended up doing:
`$npm uninstall -g create-react-app`
`$npm install -g create-react-app`
`$create-react-app course-goal-list`

I had also cloned into the teachers github and switched to the branch for this section (06-styling)
Now that I have that branch available and an empty project I just copy/move everything from the teachers example demo project to the new project I just created
This is really just everything in the `src` folder so just move that over and delete the old one and you should be good to go
Make sure you run `$npm install` before running `$npm start` just to be sure you have any third party packages needed although there shouldn't be anything too crazy included by default

If I am not mistaken you should also be able to just grab the section from github (be sure you are grabbing the project files only) and `$npm install`
Assuming you have node installed it should set up the project for you to jump in that way as well




___
## 75. Setting Dynamic Inline Styles
Once the project is all set up and ready to go we can start messing with styles

One thing we may want to do is change the way styles are applied
Right now we are using regular css with regular css selectors (such as class)
Also styles even though they are imported into components are not scoped to those components
This means if we had two components both with the same class name the class would be applied to both components

We will set styles dynamically starting in the `<CourseInput>` component
Currently within this component when we press the button it will still add a new goal even if the text box is empty
In most applications we will want to avoid this and give the user feedback telling them the input is incorrect
We will build this and set styles dynamically so the user is aware and it looks nicer

Wthin `<CourseInput>` the `formSubmitHandler` is what is used to define any actions taken when the button is clicked to submit the user input
So here is where we want to put a check and validate the user input
We want to do this before the `props.onAddGoal` function so the goal does not get added if it is empty

This should be simple enough with an if statement and check the length of the text the user submitted
One thing to do before that though is to trim any whitespace from the beginning or end of the string
We can do this with a built in function called `.trim()`
Then we can check the length and if it is 0 we want to interupt this function with a return
```
const formSubmitHandler = event => {
  event.preventDefault();
  if (enteredValue.trim().length === 0) {
    return;
  }
  props.onAddGoal(enteredValue);
};
```

Now our page should be unable to add empty goals or goals that only contain whitespace characters such as tab or space
However we don't give the user any feedback to let them know why their submission isn't working

For that we want to use styling and add the following if the user input is invalid:
- a red border 
- a red background to the input
- red color to label 

How can we do this?
We could add an extra piece of state to `<CourseInput>` which would be an indicator for whether the last value entered by the user was valid or not

Since this is true or false we can use a boolean and can have it initially be true so we aren't giving the user an error straight away
```
const [isValid, setIsValid] = useState(true);
```

We only want to change `isValid` to false when a user inputs an invalid input
So to do that we can change the value of this state variable to false within our if statement that is triggered if the input is invalid
```
const formSubmitHandler = event => {
  event.preventDefault();
  if (enteredValue.trim().length === 0) {
    setIsValid(false);
    return;
  }
  props.onAddGoal(enteredValue);
};
```

Now when this is false we want to add a style
The easiest way to do this is to add this to the inline style
Remember to do this we can simply add a `style` property to the html tag/component then pass in an object with the style options we would like to apply

The first place we will do this is on the label
This is where we can add our trick that will apply styles dynamically
Instead of just passing in something like `color: 'red'` to our style object we can instead pass in a jsx ternary expression
This will just check if `isValid` is false and if it is then it will set the style to red, otherwise it will set the color to black
Remember ternary expressions are written `thingToCheck ? ifTruthyDo : ifFalsyDo`
We can apply that to our situation by using:
```
<label style={{color: !isValid ? 'red' : 'black'}}>Course Goal</label>
```
Now we should be able to dynamically set the label to the red color
We still have to change `isValid` back to true whenever a valid input is entered though so the error doesn't persist
We will add that later but for now lets add the rest of the dynamic styling
Go ahead and apply the same logic to change the border and background color of the input field on your own
When finished it should look like and be almost the exact same as what we did with the label
Remember to use the js property names instead of css property names 
For background colors use `salmon` for when `isValid` is false and `transparent` for when `isValid` is true
```
<input 
  style={{borderColor: !isValid ? 'red' : 'black', backgroundColor: !isValid ? 'salmon' : 'transparent'}} 
  type="text" 
  onChange={goalInputChangeHandler} 
/>
```

Next lets fix the `isValid` check to return to true when the text entered is no longer invalid
We could do this on submit but there is a better place to do this
Instead we can see that the input field has an `onChange` event that runs `goalInputHandler` whenver anything is typed into the field
So we can use the goal input handler and check the value of the field and if it is a valid input (it has a length even after trimming white characters) we can set `isValid` to true
```
const goalInputChangeHandler = event => {
  if(event.target.value.trim().length > 0){
    setIsValid(true);
  }
  setEnteredValue(event.target.value);
};
```

Now if we submit an invalid input we will get our red styling but if we type something valid the red border and coloring immediately goes away
Also note that just typing spaces or tabs will not remove the red styling since those are whitespace which is great

Now one issue with this approach is that it makes us do our of our styling inline and overwrites the styling in our css file
We could obviously copy or colors from the css file but that is not ideal and requires copy/paste and then our css file is only setting an initial style
We only want to set conditional styling when the input is invalid but want to use the css we already have when the input is valid
We will cover this in the next lesson




___
## 76. Setting CSS Classes Dynamically
Now alternatively to setting inline styles we can instead apply classes
This is a little cleaner since inline styles can get messy and difficult to keep clean

What we can do to accomplish this is very similar to the last lesson only instead of applying a single style we want to change the `className` 
We could have a class in our css file called `"invalid"` or something similar that gets applied when necessary and applies the regular classes all other times

First lets prepare a class within `CoursInput.css` that does just that
```
.form-control.invalid input{
  border-color: red;
  background: #ffd7d7;
}

.form-control.invalid label {
  color: red;
}
```
This might look weird and how css works is not in the scope of this class but I will explain this snippet as best I can
This will look for a div with the class `form-control` and also an `invalid` class attached to the same div
Then on any `input` fields within that div the first set of style options would be applied
On any `label` fields within that div the second set of style options would be applied
You can see within our form we do infact have a div with the `form-control` class name and inside there are both input and label fields within that can receive the styling
The only thing we have to do is add the `invalid` class to the parent div when needed
```
<form onSubmit={formSubmitHandler}>
  <div className="form-control">
    <label style={{color: !isValid ? 'red' : 'black'}}>Course Goal</label>
    <input 
      style={{borderColor: !isValid ? 'red' : 'black', backgroundColor: !isValid ? 'salmon' : 'transparent'}} 
      type="text" 
      onChange={goalInputChangeHandler} 
    />
  </div>
  <Button type="submit">Add Goal</Button>
</form>
```

So how do we apply the `invalid` class dynamically?
First delete the old styling that we had appied before to `<input>` and `<label>`
```
...
  <label>Course Goal</label>
  <input type="text" onChange={goalInputChangeHandler} />
...
```

Now on the div where we want to apply the `invalid` class we will need to use an expression instead of a string so it can utilize logic to be dynamic
For this expression we want the final result to have two different outcomes
When isValid is true we want the string to be `'form-control'` only
When isValid is false we want the string to be `'form-control invalid'`
To do this we will use backticks (`` same key as ~) and create something called a template literal

Template literals are used to construct strings except they allow us to inject js logic into them much like how we can inject js logic into jsx with brackets `{}`
To do this inside of the backticks we type anything we want to be a normal string as normal but any js logic goes inside of brackets preceeded by a dollar sign like this: 
```
`Normal string here ${js logic here}`
```

Since we always want the `form-control` class we can add that to the regular string part
For the js logic we want to use a ternary expression that simply adds a string that says 'invalid' when `isValid` is false much like below
Otherwise we don't want to add another class and just enter an empty string
When finished the div should look like:
```
<div className={`form-control ${!isValid ? 'invalid' : ''}`}>
  <label>Course Goal</label>
  <input type="text" onChange={goalInputChangeHandler} />
</div>
```

Now when `isValid` is true our div will only have the class `'form-control '` but when `isValid` is false our div will have the classes `'form-control invalid'`

Now if done correctly you should see that with an invalid entry we still get our error styling but when valid input is detected it immediately goes back to the default styling

This technique is very powerful because we are working with css style sheets and classes instead of inline styles which is generally a better practice