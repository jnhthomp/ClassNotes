# Section 5: Styling React Components & Elements
____
## 64. Module Introduction

So far we have learned about creating components and creating/outputting dynamic content
We touched on styling our application with inline styles and stylesheets
One thing we will look at is dynamically adjusting styles and classnames
We will also look at working around restrictions of inline styles or using css styles and having global styles




____
## 65. Outlining the Problem Set
Back in our first-react-app project that we were working on 
We have a button that toggles the cards and 3 cards

One issue with the button is that when we hover over it does not change its styles
This is because we did use inline styles for this button and one shortcoming of that is that we cannot use sudo selectors
This means we can't use things like ``` button::hover ``` to set special css rules
The advantage of course is the styling is appied to only this button
The alternative would be to use a stylesheet but if we were to use ``` button::hover ``` then it would affect the look of all of our buttons and we only want to style this one

Another thing we want to look at is what if we wanted to change our style dynamically
For example what if we want a green background color if we are about to show Person with a click and a red background color if we are about to remove Person with a click

We will see how we can dynamically change these styles in the next lecture




____
## 66. Setting Styles Dynamically

Now lets look at how we can change the color of the button depending on whether we will hide or show Person elements
The approach we will take will be to set the background color of the button to green by default
Then if there showPersons is true we will set the color to red
Also would be a good idea for the text color to be white for legibility

First get the default background color set and add the changed text color
```
const style={
  backgroundColor: 'green',
  color: 'white',
  font: 'inherit',
  border: '1px solid blue',
  padding: '8px',
  cursor: 'pointer' 
};
```

Now the color is green if the people are hidden but doesn't change
Since we already have an if statement that handles showPersons being true we can add our css change there
After we make our change to persons simply add the following to make a change to our style as well
```
style.backgroundColor = 'red';
```

Now when we click our button the color will change depending on if the Persons elements are showing or not

Another thought here is there is nothing stopping us from having dynamic class names or that is a list of classes with predefined styles and changing the class names inside our components to update the style at once which we will touch in the next lecture




____
## 67. Setting Class Names Dynamically
We can also set class names dynamically

Let's create a new class to change one of our paragraphs 