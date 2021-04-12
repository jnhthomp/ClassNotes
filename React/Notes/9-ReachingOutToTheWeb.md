# Section 9: Reaching Out to the Web (HTTP / Ajax)
___
## 159. Module Introduction
This module will cover how to send http requests from our react application to a server
Because React allows us to create the front end of our web application and because it often times supports single page web applications it is easy for the lines between it and the backend to get blurred
Sometimes it will be important to send http or ajax requests from our react frontend to our serverside backend

___
## 160. Understanding Http Requests in React
How does sending http requests work in react? (typically)
In multipage react applications there isn't anything particularly special that needs done
In single page appliations there are times where the react app and the server need to communicate
When a react app sends a request to a server it isn't returned an html page
Instead we receive json data (or we would send json data to create something on the server) 
[Here is a short video about json if interested by Web Dev Simplified basically json is just an object structure: https://youtu.be/iiADhChRriM]

Our server is usually a restful api
This means it exposes some api endpoints which we can query and get back a result in a json object




___
## 161. Understanding Our Project and Introducing Axios
Attached to this lesson there is a download for a small project (see project section of react repo)

In order to install and run simply:
 1. Download the project
 2. Run `$npm install` within the project directory to install node_modules
 3. Run `$npm run start` within the project directory to run app

When it loads it should be a white page with 3 cards at the top (each saying Title in bold and author underneath)
Then below these three cards is a singular wide card that says title in bold with content underneath
Below that is an input box with the title Add a post 
This box has input fields for title, content, and a dropdown arrow selector for author and a button for add post

There is some dummy content but we want to load the post data from a server
For the purpose of THIS lesson we will use a dummy api site called jsonplaceholder.typicode.com
In the next section we will set up some real api calls

The website jsonplaceholder.typicode.com allows you to send requests to get dummy data or simulate storing dummy data (but you won't be storing anything actually)
Here are the routes available with this api:
```
All HTTP methods are supported. You can use http or https for your requests.

GET	    /posts
GET	    /posts/1
GET	    /posts/1/comments
GET	    /comments?postId=1
POST	  /posts
PUT	    /posts/1
PATCH	  /posts/1
DELETE	/posts/1
```

We will need a way to send these requests in order to use these routes
Javascript basically has two options for this
The first is the `XMLHttpRequest` object
This can be used to construct your own ajax requests, have them sent to a url, and then handle the response
This can be quite cumbersome
The second option is to use a package called Axios
This is a third party js library that you can add to any js project
To use it we first have to install it with: (shut down server if you have it running)
```
npm install axios --save
```




___
## 162. Creating an Http Request to GET Data
Now lets make an http request to the url for dummy data
Where do we even put the request?
Maybe if we look at the lifecycle hooks one will work.
One such hook we can use for side effects (such as an http request) is `componentDidMount()`
This is a good place to cause side effects but not a good place to update state
We still will update the state once the data has been retrieved because we WANT to update the page
This method should be the best place to send an http request

In our blog container lets implement `componentDidMount()` in order to send the ajax request after the blog component is finished rendering

First we will have to import axios to Blog.js
```
import React, { Component } from 'react';
import axios from 'axios';
```

Now we are able to use it in `componentDidMount()`
axios has a `.get` method that is used from doing get requests as suggested by the name
We can use the method and pass in a url as a string 
We expect to get a json object returned but while we think we should be able to just set the `.get` request equal to a variable to hold the json object because of the asynchronous nature of a get request and the syncrhonous nature of js this doesn't play nice together
This is actually a wanted behavior because that does keep our app from being stuck waiting for that request to finish and the rest of the page can continue loading while the request fetches data
Axios uses something called promises in order to handle these ansynchronous requests
This promise is handled by the `.then` method (just chained to the end of the request)
This `.then` method will perform a function that will execute on the received response object (the result of the promise)
For now we just want to print the result of the promise
```
componentDidMount () {
  axios.get('https://jsonplaceholder.typicode.com/posts').then(response => console.log(response));
}
```
Now if we save and reload we can see an object in our terminal
Expanding this will show it came from the url that we requested from jsonplacholder
