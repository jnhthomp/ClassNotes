# Section 19: Advanced Redux
Section github: https://github.com/academind/react-complete-guide-code/tree/18-diving-into-redux
___
## 250. Module Introduction
Last section we covered the basics of redux
This section we will dive a little deeper and explore some of the advanced concepts including:
1. Handling async tasks with redux
2. Where to put our code
3. Look at the redux devtools and how to use them




___
## 251. Redux & Side Effects (and Asynchronous Code)
Let's start with looking at async code and side effects in general (even with synchronous code) with regards to redux

Our reducer functions MUST be pure, side-effect free, synchronous functions
We have to be able to enter an input and receive an output without any async or side effects
The same input should always produce the same output without any side effects 

That does bring up an important question
What if we dispatch an action that does involve a side effect? (such as an http request)
Where should we put that code?
The reducer function is clearly not an option

There are two possible places we can put them
We can put them directly in the component (like with `useEffect` like we have before)
Then we only dispatch the action once that side effect is complete
OR
We write our own action creator functions and do not use the automatically generated ones that redux toolkit gives us
For these action creators redux does have a solution that allows us to perform side effects and run async tasks without changing the reducer function so it stays side effect free

We will look at both options in this section and so there will be a new project that we will start
See this github repo: https://github.com/academind/react-complete-guide-code/tree/19-advanced-redux/code/01-starting-project

We are going to build a basic react redux application and explore async code with redux