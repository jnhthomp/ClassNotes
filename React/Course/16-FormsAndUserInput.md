# Section 16: Working With Forms and User Input
Section github: https://github.com/academind/react-complete-guide-code/tree/16-working-with-forms
___
## 197. Module Introduction
This section will cover forms and handling user input
This might sound easy but is absolutely vital for a site and can be more difficult than you might think
Especaially if you have to check that data and let the user know if it is invalid or not

We won't learn any new features but will apply features to build good forms

This section will cover:
- What is complex about forms?
- How to handle input values and validation
- Some tools to help simplify forms




___
## 198. Our Starting Setup
You can find the starting project for this section here: https://github.com/academind/react-complete-guide-code/tree/16-working-with-forms/code/01-starting-project

If you install and run this app you will see a simple input box where you can input astring and hit submit

The code itself is very simple with just the most basic form and input being rendered in the `<App>` component

This section will not dive into semantic html and how to use the html for forms OR how to style forms

In this course section we will focus on react and how react deals with forms




___
## 199. What's So Complex About Forms?
Forms may seem simple but they can be quite complex
This is because forms and inputs can assume many different states
One or more inputs could be invalid or all of them could be valid
The state could even be unknown since you might need to validate the users input on a backend server
(ex: checking if an email address already exists when signing up)
These two states apply to not only the entire form, but to all the inputs in the form

When a form or inputs are invalid you may want to output specific error messages on each input and make sure it cannot be submitted or saved
But if the inputs are valid you do want it submitted and saved

Part of the complexity is when do you validate?
You could do it when the form is submitted, when the input loses focus, or on every keystroke or each change to an input

If you validate when the form is submitted you give the user a chance to enter their data before showing a warning
The downside is the feedback might be a little delayed or too late

If you validate when an input loses focus you again give the user a chance to enter a valid value
This can be good for things inputs that are empty or haven't received a value yet
But what if they enter an invalid value and the page is reloaded then they don't refocus?
The error message wouldn't show up in this case since it is being triggered on lose focus and the invalid input is never focused but still has a value

If you validate on every keystroke you provide quick direct feedback on every single keystroke but you are showing errors before the user has a chance to enter valid values
However if you only validate on keystroke for inputs that were previously marked invalid that quick direct feedback may be good