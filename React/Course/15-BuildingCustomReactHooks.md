# Section 15: Building Custom React Hooks
Section github: https://github.com/academind/react-complete-guide-code/tree/15-building-custom-react-hooks
___
## 186. Module Introduction
We will continue diving deeper and deeper into react

Another core feature of react and something you will use while building applications are custom hooks
Up to this point we have worked a lot with hooks such as
`useState`, `useReducer`, `useEffect`, `useContext` etc.

Rememeber that we can only use react hooks in component functions and in custom hooks
Before we said we would cover that later and now we are there

This section will cover
- What & why?
- Building a custom hook
- Custom hook rules and practices




___
## 187. What Are Custom Hooks?
First we need to clarify what these are before we discuss why we use them
They are just functions but they are functions that contain 'stateful' logic
You can build custom hooks outsource stateful logic into reuseable functions

Unlike regular functions custom hooks can use other react hooks and react state
With custom hooks you can outsource logic you might use in different components to a custom hook
Then this custom hook can be used within different components
Think of it as a mechanism to reuse logic
It is like a regular function except we are allowed to use react hooks inside
