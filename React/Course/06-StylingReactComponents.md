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
