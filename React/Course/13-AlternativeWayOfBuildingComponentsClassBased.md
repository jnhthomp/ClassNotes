# Section 13: An Alternative Way of Building Components: Class-based Components
Section github: https://github.com/academind/react-complete-guide-code/tree/13-class-based-cmp
___
## 163. Module Introduction
In this section we are going to learn how to builld components in an alternative way
So far we have built components as functions
However in react you can also define components as classes

One important note: This is 100% optional and in most modern react projects you will probably not use this
You can skip this section but know that you will see a lot of class based components in older projects
This is because class based components used to be required but there has recently been a shift to functional components

This section will cover:
- What class based components are and why they exist
- How to work with class based components
- Error boundaries (require class based components but we will not build a lot of these)

This section holds a lot of information about reacts past, how to build class, based components, why they exist, and how they work




___
## 164. What & Why
Class based components are an alternative to functional components
So far our components have looked like this:
```
function Product(props) {
  return <h2>Hello there!</h2>
}
```
Or if you used arrow function components:
```
const Product = (props) => {
  return <h2>Hello there!</h2>
}
```
These are equivalent and are both functional components because they are both ways of expressing a function

Just as functional components are regular js functions that return jsx
Class based components are regular js CLASSES that return jsx
These are defined like this:
```
class Product extends Component {
  render() {
    return <h2>Hello there!</h2>
  }
}
```

Here we are defining a component by creating a class
Classes are not a react feature they are a feature of js
They provide a render method that provides the jsx we want to return

Remember functional components are the default and modern way of building components but it is important to know about class based components
There is really no reason to use class based components other than personal preference and error boundaries which are not common

You can build anything that can be built with functional components with class based components, you just may need a slightly different approach

But why do they exist?
Class based components exist because they used to be required and used to be the only way to manage state and side effects
In React 16.8 "React Hooks" were introduced which allowed state to be managed by functional components
This brought features to functional componets that before could only be used in class based components

An important notes is that class based components cannot use these hooks that were introduced to help functional components
This is really important and why we generally have to take a different approach when using class based components