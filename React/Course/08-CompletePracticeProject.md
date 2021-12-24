# Section 8: Time to Practice: A Complete Practice Project
Section github: https://github.com/academind/react-complete-guide-code/tree/08-practice-project
___
## 89. Module Introduction
It is time to practice what we have learned
We have learned quite a bit about the core features that make up react
We now have enough knowledge to start buildling our own simple react projects
To practice these concepts we will use a dedicated project
It is relatively simple but will require you to use all of the core information we have learned

We are going to build a relatively simple (but not too simple) application
It is an application where you can add fictional users 
They will have a username and an age
These users will be added to a list and displayed
When attempting to enter an invalid user there are multiple forms of validation and a modal that gives information on why the validation failed
If you input a successful user then the form input fields are reset

While you can skip this module to move onto new concepts it is a good idea to do this module for the practice
The teacher also encourages us to try this on our own and see if we are successful
If you do then don't worry about the styling so much 
The main thing to worry about is that the functionality is there, components are working, and the logic behind the scenes is working

Short:
- Ability to add users via form
  - user has username
  - user has age
  - Form input is reset on successful submission
- Users are displayed as a list underneath add user form
- If attempting to add an invalid user there is a pop up
  - warns user username and age shouldn't be empty
  - has "okay" button to dismiss
  - Can also dismiss by clicking on the backdrop
  - entering a negative age gives a different error
