# Section 1: Getting Started
course github: https://github.com/academind/react-complete-guide-code
section github: https://github.com/academind/react-complete-guide-code/tree/01-getting-started
___
## 1. Welcome to the course
Welcome to the react.js course led by Maximilian Schwarzmüller
In the first course section we will go through what is react and why we use it as well as what is in this course and what kind of content it includes
This will give both an overview of both react and the course
Then after this section we will get into detail about react
There is no prior react knowledge necessary but it is important to have some basic javascript knowledge
If you are a little rusty with javascript then section 2 will help you brush up

Complete Course github can be found at: https://github.com/academind/react-complete-guide-code




___
## 2. What is React.js?
React is a javascript library which can be used to build web (and native) user interfaces
This means that it allows you to create very modern, interactive, modular user interfaces
It is easy for users to use and they don't have to wait for things to load because everything is on a single page

Some React.js websites might feel like a mobile app because there are smooth transitions and everything flows smoothly from one page to the next instead of having to wait for things to load
Websites didn't used to be like this and usually when you clicked a page you would have to wait for the server to send that page back
With react you have components that can fetch and send data from a server and have only that small component update instead of having to reload the whole page
This means you could just have the main page where the content sits change while users navigate the site and everything else would stay in place
This makes pages much more quick and responsive
JS allows us to run logic within the users browser which means we have a lot of control over changing what the user sees
JS can directly manipulate the DOM which is the HTML structure of the page
This allows us to change what the user sees without fetching a new html page
We don't need to request a new page to present something different to the user




___
## 3. Why React Instead of "Just Javascript"?

Here the teacher has built a very small sample project to illustrate the differences between vanilla js and js empowered by react
You can access these files here: https://github.com/academind/react-complete-guide-code/tree/01-getting-started/code/react-vs-vanilla-js-example

In the app you can see that there is a very basic looking webpage with a card and a button
If you click the button a modal pops up with a button to close the modal displayed on the modal

To do this in js there is the html page but there is a very large very ugy create modal function which when pressed generates the html elements needed and pushes them to the dom
This is only with 1 "Todo" section
If there were more sections then it would become much more complicated

In react this is done with just a few components and a small method and we can easily add more sections and have them function independentally of each other while only having to write the code once

The main issue is that with Javascript we have to write every single step that is taken (selecting an element => getting the content => building an element => adding etc...)
With react much of this is automated and easily done with very little code or complexity
You can also repeat repetive tasks or generated items extremely easy since it is so modular

React allows us to create custom html components (that each have access to their own methods) that can be reused
This is much easier to create, maintain, and reuse




___
## 4. Building Single-Page Applications (SPAs) With React
Because things are easier and modular in react we very often build something called Single Page Applications
This means that the user is never brought to a whole new page, only the content within the page is reloaded, moved, added, taken away, or modified.
This makes the app flow much better and gives the user a more fluid experience
Instead of using react to just control a single part of a page we can use react to control the entire page that the user sees




___
## 5. Exploring React.js Alternative (Angular/Vue)
This course covers react but there are several alternatives that are 'similar'
React is quite lean and not all features are built in (like routing)
Some of these features are managed by the community and must be added to projects as extra third party libraries

An alternative with more built in features would be Angular (the teacher Maximilian also has a course on this)
Angular is also component based but is more complete with more features built in
The amount of things included in angular can make it overkill for smaller projects but has more built in features
Angular also uses typescript (syntax is slightly different)
This can be beneficial for large projects since you don't need to rely on the community as much and you can expect features to exist and work as they should

Vue is like a mixture of angular and react
It is a component based ui framework as well 
It has more built in features than React but not as many as Angular
It includes core features like routing 
Is a little less popular than Angular and React

Depending on what you are building and the size and features of your project will depend on what the best choice is for a given project

React is probably the most popular but all three are great




___
## 6. Join Our Online Learning Community
As a student of this course you also get free access to our "Academind Community" on Discord: https://academind.com/community/

There, you can find like-minded people, discuss issues, help each other, share progress, successes and ideas and simply have a good time!

I believe that you learn the most if you don't learn alone but find learning partners and other people with similar interests. 
Our community is a great place for this - it's the perfect complimentary resource for this course.

Joining it is of course free and 100% optional.




___
## 7. About This Course & Course Outline
Here is an overview of what this course will cover
There are three main categories of course sections
(these are not direct course sections our outlines but rather an organization of the concepts that will be taught)

1. Basics & Foundation (Introducing Key Features)
    - Components & Building UIs
    - Working with events & Data
    - `props` and `state`
    - Styling React Apps & Components
    - Introduction into "React Hooks"
2. Advanced concepts (Building for Production)
    - Working with 'Side Effects', 'Refs', & More React Hooks
    - React's Context API & Redux
    - Handle User Input with Forms, Http Requests & 'Custom Hooks'
    - Routing, Deployment, NextJS, & More
3. Summaries & Refreshers (Optimizing Your Time)
    - Javascript Refresher
    - ReactJS Summary

There are also the following along the way:
- Theory/Small Demos & Examples
- More Realistic (Bigger) Example Projects
- Challenges & Exercises




___
## 8. The Two Ways (Paths) Of Taking This Course
1. Standard (Recommended)
    - Start in lecture 1 section 1 and continue lecture by lecture in order
    - The course was made so that each section builds upon each other and you learn react step by step
    - Skip Javascript Refresher module if you don't need it
    - Use React Summary module at the end to summarize what you learned or to refresh knowledge in the future
      - Does not dive as deeply into concepts but gives good wrap up
2. Summary Approach (If you are in a hurry)
    - Start with the react summary module at the end 
      - Is built so that you could start with this and understand it but gives concise & compressed way to learn react but not as deep
      - Gives full overview of react in  4 hours of videos
    - Take js refresher if you think you need it
    - Go through full course after going through the summary when you have more time or going to specific sections leave you confused the most




___
## 9. Getting The Most Out Of This Course
Here are a few tips and tricks to get the most out of this course
- Watch the videos at your pace
  - There are speed controls that you can speed up or slow down, pause rewind or repeat
- Code Along & Practice (without being told)
  - Often times you will be challenged to try something on your own before being told but remember to try things on your own without being prompted
- Debug Errors & Explore Solutions 
  - also use code attachments found in last lecture of every module
    - These comes as links from github where you can download code snapshots
- Help and Learn Together
  - Use the community discord or the Udemy Q&A
  - Don't just ask but try to answer questions as well. This will help you get better.




___
## 10. Setting Up The Course Dev Environment (Code Editor)
For writing React code you will need a code editor
Any ide can be used (Atom, Sublime, VisualStudio Code)
VisualStudio Code will be used by the teacher (and me)
Standard installation (brew on mac exe on windows)
If using Windows Subsystem for Linux (WSL) as your development environment then VSCode is able to intgrate with that really well
You can tweak the appearance a little
Open any folders that hold our projects with the vscode editor
This is easy if you are in terminal you can use the command from within the project directory:
```
$code .
```

There are themes available in preferences => color theme but there are others that are available as extensions
There are two other extensions which will help with code formatting

The first is called "Prettier - Code formatter"
This will help remove redundant whitespace and help keep code clean and readable
Check settings and search for format
Then set your default formatter to prettier

The other is called is called "Material Icon Theme" extension
You can download and enable this and will just change your file icon look and is 100% option (although prettier is too)




___
<h3><center> ---Section 1 Complete--- </center></h3>