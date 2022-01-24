# Section 14: Sending Http Requests
Section github: https://github.com/academind/react-complete-guide-code/tree/14-sending-http-requests
___
## 173. Module Introduction
At this point we should have a good understanding of how react works and how to use it
However so far we have only used local data/dummy data

Now we will start working on how we can connect our react application to a backend
Pretty much every application needs to fetch or store data from or to a database

This section covers sending http requests from our application to a backend

This section will cover:
- How do react apps interact with databases?
- Learn how to send http requests and work with responses
- How to handle errors and loading states




___
## 174. How To (Not) Connect To A Database
Before jumping in to any code or demo we will understand how react apps communicate with databases
It may not work how you think it does
Browser-side apps NEVER talk directly to databases

If you have a react app and some data base (SQL, No,SQL, MongoDB) you will want to connect to it
However you should not and will never see this done unless it is a highly insecure application
This is because if you were to do that then that means database credentials would be exposed since they would need to be stored in the browser in order to access the database

Here is an article discussing this: https://academind.com/tutorials/hide-javascript-code

So how do we communicate with a database?
We supply a backend application that runs on a server (not the users browser like the react application)
This backend application is something like NodeJS or PHP
This backend will do the talking to the database and store the credentials since users of our website are not able to access this backend code




___
## 175. Using the Star Wars API
MUST READ:
In the next lecture, you will be introduced to our demo backend that will be used in this course section: The Star Wars API.

I will use this page: https://swapi.dev/

Loading this page (and hence accessing this backend) might fail - if that is the case for you, you can use this alternative: https://swapi.py4e.com/




___
## 176. Our Starting App & Backend
Max has prepared a dummy starter app for us to use that is fairly straightforward
Currently it uses dummy data but we will prepare it to use real data with a real api
You can find the starting code here: https://github.com/academind/react-complete-guide-code/tree/14-sending-http-requests/code/01-starting-project

Currently this application doesn't do anything
`<App>` simply has a non-functional button that says 'fetch movies' (no `onClick` handler attached)
Then it outputs a `<MoviesList>` component which accepts an array of objects that each contain data about a movie
`<MovieList>` accepts this array and maps each object to a call for a `<Movie>` component to output details about the movie

Right now `<App>` is passing dummy data to `<MoviesList>`
We want to change this and fetch data for movies
We can get our feet wet with this by using swapi.dev as mentioned in the previous lecture

It is important to know that this is an api, it is a backend but it itself is not a database
API stands for Application Programming Interface
It has clearly defined rules on how to achieve certain results and tasks
There are two different standards for API's Rest, and GraphQL
These are two different standards for how a backend should expose its data

Swapi is a rest api which means there are urls that we can send a request to and receive data back in return
Different urls will give us different data

To learn more about API's see this article/video: https://academind.com/tutorials/rest-vs-graphql

With swappi we can send a request like this: `swapi.dev/api/films`
This will give us a list of films
To understand what you can do with an API that you have not made yourself you need to read the documentation for it