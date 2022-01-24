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




___
## 177. Sending a GET Request
Remember that a react app in the end is just a bunch of javascript
This means that anyway to send an http request in javascript that would be valid is valid here too
For example we can use a popular library like axios which is available on github
It makes sending http requests and dealing with responses easy

There is another way that is built in to javascript called the fetch api
This is something built into browsers and allows us to fetch (and send) data
We can use this to send http requests and handle their responses 

We will use this to get our movies
We can start simple and make sure that when we press the button we fetch and then display the movies

To do this we will get rid of `dummyMovies` and instead create a `fetchMoviesHandler`
```
const fetchMoviesHanlder = () => {

};
```

Inside here we can call a special method called `fetch()` which is made available to us by the browser
Inside of the function we need pass in the url that we want to request as a string
In this case we want to use the swapi api to get a list of films
The url to fetch this is: https://swapi.dev/api/films/
```
const fetchMoviesHanlder = () => {
  fetch('https://swapi.dev/api/films/');
};
```

We can also provide a second argument which allows us to pass in a js object 
This can allow us to pass in different options such as headers, or body, or change the http method
We won't need that here though since the default method is 'GET' which is all we need right now

But how do we handle the response
fetch returns a promise which allows us to react to the response or any errors we may get
A promise is a type of object which initially may not have a value but will eventually be populated with some kind of data
Promises are used to handle asyncronous tasks
With async tasks we cannot just immediately move onto the next line because we may not have yet received back the data we need for the request

To use this we add `.then()` to handle the response
This is a special js method used to handle async tasks
`.then()` will receive an anonymous arrow function as an argument and this function has access to a response value, which is whatever is returned by our `fetch()` method
This response value is an object which has several differnt values we can access
We can get the status code, a utility ok field which will be true if everything worked correctly and false if we got an error, and a body that contains the data returned from the request
We are interested in this `response.body` value which will contain json with the data we need
If you aren't familiar with json it stand for "JavaScript Object Notation"
This is simply a js object that is returned to us that contains data
We can then look at this object and manipulate it to get the data we are interested in
Here is an example of a js object (and should be the one we get back from this request when we make it)
```
 {
	"count": 6,
	"next": null,
	"previous": null,
	"results": [
		{
			"title": "A New Hope",
			"episode_id": 4,
			"opening_crawl": "It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....",
			"director": "George Lucas",
			"producer": "Gary Kurtz, Rick McCallum",
			"release_date": "1977-05-25",
			"characters": [
				"https://swapi.dev/api/people/1/",
				"https://swapi.dev/api/people/2/",
				"https://swapi.dev/api/people/3/",
				"https://swapi.dev/api/people/4/",
				"https://swapi.dev/api/people/5/",
				"https://swapi.dev/api/people/6/",
				"https://swapi.dev/api/people/7/",
				"https://swapi.dev/api/people/8/",
				"https://swapi.dev/api/people/9/",
				"https://swapi.dev/api/people/10/",
				"https://swapi.dev/api/people/12/",
				"https://swapi.dev/api/people/13/",
				"https://swapi.dev/api/people/14/",
				"https://swapi.dev/api/people/15/",
				"https://swapi.dev/api/people/16/",
				"https://swapi.dev/api/people/18/",
				"https://swapi.dev/api/people/19/",
				"https://swapi.dev/api/people/81/"
			],
			"planets": [
				"https://swapi.dev/api/planets/1/",
				"https://swapi.dev/api/planets/2/",
				"https://swapi.dev/api/planets/3/"
			],
			"starships": [
				"https://swapi.dev/api/starships/2/",
				"https://swapi.dev/api/starships/3/",
				"https://swapi.dev/api/starships/5/",
				"https://swapi.dev/api/starships/9/",
				"https://swapi.dev/api/starships/10/",
				"https://swapi.dev/api/starships/11/",
				"https://swapi.dev/api/starships/12/",
				"https://swapi.dev/api/starships/13/"
			],
			"vehicles": [
				"https://swapi.dev/api/vehicles/4/",
				"https://swapi.dev/api/vehicles/6/",
				"https://swapi.dev/api/vehicles/7/",
				"https://swapi.dev/api/vehicles/8/"
			],
			"species": [
				"https://swapi.dev/api/species/1/",
				"https://swapi.dev/api/species/2/",
				"https://swapi.dev/api/species/3/",
				"https://swapi.dev/api/species/4/",
				"https://swapi.dev/api/species/5/"
			],
			"created": "2014-12-10T14:23:31.880000Z",
			"edited": "2014-12-20T19:49:45.256000Z",
			"url": "https://swapi.dev/api/films/1/"
		},
		...
	]
}
```

As you can see it is slightly different from a regular js object but is very similar
The advantage of this is that it is very easy to translate it to a js object
Thankfully the response object that we receive has a built in method that will translate this for us
This is called `.json()` which will convert it for us
This does take time and will return another response

So we need our anonymous arrow function to return this response
```
const fetchMoviesHanlder = () => {
  fetch('https://swapi.dev/api/films/').then((response) => {
    return response.json();
  });
};
```

Since this is another promise we will need to attach another `.then()` method which will of course receive an anonymous arrow function
This anonymous arrow function will have access to a response object from the promise which should now be a javascript object
To keep things clear we will call this promise response 'data' instead
This should be an object that looks like the giant json object above
Looking at it we can see we will be interested in the array holding all of the movie objects which is stored under 'results' 
So we should be able to access this array with `data.results`

```  
const fetchMoviesHanlder = () => {
  fetch('https://swapi.dev/api/films/').then((response) => {
    return response.json();
  }).then((data) => {
    const movieList = data.results;
  }
  );
};
```

Now that we are able to access this list of movies we don't want to actually just save it as a variable
Instead we want to create a state and save this list of movies within that state like they were with `dummyData`
So we will need to import `useState`
Then initialize it and then update it with this `movieList` after these promises are finished completing

initialize state:
```
const [movies, setMovies] = useState([]);
```

Update our `fetchMoviesHandler` to save the result to this state:
```
const fetchMoviesHanlder = () => {
  fetch('https://swapi.dev/api/films/').then((response) => {
    return response.json();
  }).then((data) => {
    setMovies(data.results);
  }
  );
};
```

Now we just have to forward our movies from state to the `<MoviesList>` component instead of `dummyMovies`
```
<MoviesList movies={movies} />
```

Lastly we need to attach the handler to the button
```
<button onClick={fetchMoviesHandler}>Fetch Movies</button>
```

One final thing is that there is a slight difference in the naming of the data we are receiving and how we expect to receive that data in props
When we make the API request two of the fields are named `opening_crawl` and `release_date` but we expect to receive `openingText` and `releaseDate`

We have two options, we can either change our program to match the text we are receiving or we can change the text we are receiving to match the text
We will do the second by creating a `transformedMovies` constant and using `.map()` on our results
This `.map()` will create new objects from each object in the array
It will pull the information from that data and return only the information we are interested in with the naming we expect
We can see inside of `<MoviesList>` we need the following
- `id` (we will use 'episode_id' from the json object)
- `title` also 'title' in json
- `releaseDate` named 'release_date' in json
- `openingText` named 'opening_crawl' in json
```
const transformedMovies = data.results.map((movieData) => {
  return {
    id: movieData.episode_id,
    title: movieData.title,
    releaseDate: movieData.release_date,
    openingText: movieData.opening_crawl
  }
```

Then we can pass this into `setMovies` instead of the full results
```
const fetchMoviesHandler = () => {
  fetch('https://swapi.dev/api/films/').then((response) => {
    return response.json();
  }).then((data) => {
    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    }
    )
    setMovies(transformedMovies);
  }
  );
};
```

If you have passed the state value in and connected this handler to the button it should work but I am going to go through step by step one more time since it is a rather big function

First we are making a fetch request to the url that was provided by the swappi api in order to get a list of movies
```
fetch('https://swapi.dev/api/films/');
```
This will return a promise which is like an object that executes whenever it is fulfilled we use `.then()` to handle it
the method we pass into `.then` has access to the promise object that was returned called `response`
We transform this response into json using a built in function
```
fetch('https://swapi.dev/api/films/')
  .then((response) => {
    return response.json();
  });
```
This built in function also returns a promise so we have to use `.then` again to handle it
The result of this promise will be the js object which was converted from json so that is what we will be able to access within our `.then` method as `data`
```
fetch('https://swapi.dev/api/films/')
  .then((response) => {
    return response.json();
  })
  .then((data) => {
    return data
  });
```
This would return the whole js object but if we look at the json we expect we are only interested in `data.results` because that holds the array of movies
```
fetch('https://swapi.dev/api/films/')
  .then((response) => {
    return response.json();
  })
  .then((data) => {
    return data.results
  });
```
Now we have the array but the naming within each object is different from what we expect within `<MoviesList>` and we only really need certain data we will pull that data out by calling `.map` and creating a new object based on the data in each of these objects
```
fetch('https://swapi.dev/api/films/')
  .then((response) => {
    return response.json();
  })
  .then((data) => {
    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    })
});
```
Now that we have an object with the data we expect we save it to state
```
const fetchMoviesHandler = () => {

  fetch('https://swapi.dev/api/films/')
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      const transformedMovies = data.results.map((movieData) => {
        return {
          id: movieData.episode_id,
          title: movieData.title,
          releaseDate: movieData.release_date,
          openingText: movieData.opening_crawl
        }
      })

      setMovies(transformedMovies);
      
    });
};
```

Now just hook up the handler to the button, make sure you have state setup correctly, and pass the state value into `<MoveisList>` and everything should work




___
## 178. Using async/await
We are now sending a get request whenever the button is clicked
We mentioned that we are working with promises here and using this `.then` chain like we did above is fine but there is another syntax
This is called async await

To do this you put the `async` keyword in front of our function name and the the `await` keyword in front of the functions that need to be waited on before moving on

So we first need to mark the overall function as `async`
```
const fetchMoviesHandler = async() => {

  fetch('https://swapi.dev/api/films/')
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      const transformedMovies = data.results.map((movieData) => {
        return {
          id: movieData.episode_id,
          title: movieData.title,
          releaseDate: movieData.release_date,
          openingText: movieData.opening_crawl
        }
      })

      setMovies(transformedMovies);
      
    });
};
```
Then we use `await` on the `fetch` method and save the promise that is returned as `const response
```
const fetchMoviesHandler = async() => {

  const response = awaitfetch('https://swapi.dev/api/films/')
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      const transformedMovies = data.results.map((movieData) => {
        return {
          id: movieData.episode_id,
          title: movieData.title,
          releaseDate: movieData.release_date,
          openingText: movieData.opening_crawl
        }
      })

      setMovies(transformedMovies);
      
    });
};
```
Next we can use the `.json()` method on the response which we will also have to wait on a result from so we can again use `await` on this function and save the result to a `const data`
This allows us to get rid of our first `.then` statement since that was previously handing the `await` functionality
```
const fetchMoviesHandler = async() => {

  const response = await fetch('https://swapi.dev/api/films/')
  const data = await response.json()

    .then((data) => {
      const transformedMovies = data.results.map((movieData) => {
        return {
          id: movieData.episode_id,
          title: movieData.title,
          releaseDate: movieData.release_date,
          openingText: movieData.opening_crawl
        }
      })

      setMovies(transformedMovies);
      
    });
};
```
Now we are able to get rid of the next `.then` since we are already handling the result of our promise by storing it within data and js knows that it will take a second for data to have value
So we can now transform that data with `.map` and save the result to `transformedMovies` just as before
```
const fetchMoviesHandler = async () => {

  const response = await fetch('https://swapi.dev/api/films/')

  const data = await response.json()

  const transformedMovies = data.results.map((movieData) => {
    return {
      id: movieData.episode_id,
      title: movieData.title,
      releaseDate: movieData.release_date,
      openingText: movieData.opening_crawl
    }
  })

  setMovies(transformedMovies);
};
```
This has the same functionality as the `.then` chain and comes down to preference




___
## 179. Handing Loading & Data States
Currently when we load from scratch and then click 'Fetch Movies' there is an expected delay before the movies actually populate while we await the get request to complete as well as the data to be transformed from json

This is fine but feels a little strange as there is no indicator to tell the user that there is a loading period
Ours is fairly quick but could be much slower if the server took a while to respond

So how do we do this in react?
It comes down to managing state
We already have a state to hold our movies but we can manage a second piece of state to determine whether we are currently waiting for an action to complete or not
We aren't loading data when it initially loads to the screen so it should be initialized to false
```
const [isLoading, setIsLoading] = useState(false);
```
Whenever we call `fetchMoviesHandler` we can change that state to true before we start fetching the data and processing it
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);

  const response = await fetch('https://swapi.dev/api/films/')

  const data = await response.json()

  const transformedMovies = data.results.map((movieData) => {
    return {
      id: movieData.episode_id,
      title: movieData.title,
      releaseDate: movieData.release_date,
      openingText: movieData.opening_crawl
    }
  })

  setMovies(transformedMovies);
};
```
Then when we are done processing this data and saving it to our state we want to call `setIsLoading ` back to false
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);

  const response = await fetch('https://swapi.dev/api/films/')

  const data = await response.json()

  const transformedMovies = data.results.map((movieData) => {
    return {
      id: movieData.episode_id,
      title: movieData.title,
      releaseDate: movieData.release_date,
      openingText: movieData.opening_crawl
    }
  })

  setMovies(transformedMovies);
  setIsLoading(false);
};
```

Now we can use this state to render something like a loading spinner or text 

We can accomplish this by conditionally showing the `<MoviesList>` component if we are not loading (`isLoading: false`) and if we are loading then we will show some text
Then if we are loading we will simply output a paragraph that says "loading" for simplicity
```
return (
  <React.Fragment>
    <section>
      <button onClick={fetchMoviesHandler}>Fetch Movies</button>
    </section>
    <section>
      {!isLoading && <MoviesList movies={movies} />}
      {isLoading && <p>Loading...</p>}
    </section>
  </React.Fragment>
);
```

What if we want to show different content when we are not loading but have no movies yet 
This might look better than a blank area with no movies listed
So we can also check the length before outputting the `<MoviesList>` component

```
return (
  <React.Fragment>
    <section>
      <button onClick={fetchMoviesHandler}>Fetch Movies</button>
    </section>
    <section>
      {!isLoading && movies.length > 0 && <MoviesList movies={movies} />}
      {isLoading && <p>Loading...</p>}
    </section>
  </React.Fragment>
);
```

Then we can display some content such as a short paragraph whenever we are not loading and there are no movies
```
return (
  <React.Fragment>
    <section>
      <button onClick={fetchMoviesHandler}>Fetch Movies</button>
    </section>
    <section>
      {!isLoading && movies.length > 0 && <MoviesList movies={movies} />}
      {!isLoading && movies.length === 0 && <p>No movies found</p>}
      {isLoading && <p>Loading...</p>}
    </section>
  </React.Fragment>
);
}
```

Now our page will initially say 'No movies found'
Then when we click the button it will briefly say loading before displaying the list of movies




___
## 180. Handling Http Errors
Sometimes http errors can go wrong for many different reasons
Somtimes it is a network connection or getting an error code back from a server etc

Here is a list of responses you can get back from a server/api
https://developer.mozilla.org/en-US/docs/Web/HTTP/Status

200 codes tend to mean you were able to contact the server successfully and you should be getting your data

Somtimes you will get 400/500 codes which are errors telling you there is some kind of issue and different numbers mean different issues
If you get these you were able to contact the server and they were able to respond but there was something preventing that request from being processed  
This can be an authentication issue or some other where data cannot be returned

We can simulate this in our application by adding a typo to our url
Instead of using this:
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);

  const response = await fetch('https://swapi.dev/api/films/')
  ...
```
We will use this:
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);

  const response = await fetch('https://swapi.dev/api/film/')
  ...
```
This removes the s from the end of our url and swapi won't be able to recognize this request and should return an error

If we do this we will be stuck in a loading state and we can see that within the console we received a '404' error 

We should handle this or our app will always be in the loading state
To do this we will create a third state to handle errors (simply called `error`)
This will initially be null since we won't have an error at first since we haven't made any requests
```
const [error, setError] = useState(null);
```

Then within our `fetchMoviesHandler` after we set the loading state that is a good place to reset our error state to null 
This way we ensure it is always set to null when making a new request and we don't forget to clean out old errors
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);
  setError(null);
  ...
```
Now we need a way to capture these errors and recognize them from our expected response

If we were using the `.then` method that we had in one of the other lessons we would use something called `.catch()`
However when working with `async`/`await` we use something called `try`/`catch`

Will try some code and catch any potential errors in it
We want to try everything from fetch to resetting loading state
So we use the `try` keyword and put everything we want to try within
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);
  setError(null);

  try {
    const response = await fetch('https://swapi.dev/api/film/')

    const data = await response.json()

    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    })

    setMovies(transformedMovies);
    setIsLoading(false);
  } 
};
```
immediately after the try block we use the `catch` keyword which has access to the `error` argument
This will be any errors returned by the code inside of our `try` block
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);
  setError(null);

  try {
    const response = await fetch('https://swapi.dev/api/film/')

    const data = await response.json()

    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    })

    setMovies(transformedMovies);
    setIsLoading(false);
  } catch(error){
    
  }
};
```
This is kind of similar to an `if`/`else` statement
One issue is that the fetch api doesn't recognize status codes as error codes so this will not result in an error
We would still get an error trying to perform .map on data that does not exist but that is not how we should be looking for errors
Instead we want to look for these status codes as responses and trigger an error from that
The fetch api does not do that by default but axios would but unfortunately we are not using axios so we have to do this on our own
Remember that the response we get from the server is an object that has more than just the data we requested it also has a field called `status` and `ok`

`status` will hold whatever status code is returned by the server (we don't want anything) other than 200
`ok` is a boolean that will be true if there are no errors and false if there is an error

Within our try block we can see if the response contains either a `status` that is not equal to 200 or an `ok` of false
If this is the case we can throw a new error
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);
  setError(null);

  try {
    const response = await fetch('https://swapi.dev/api/film/')
    
    if (response.status !== 200) {
      throw new Error(`Something went wrong: Error ${response.status}`)
    }

    const data = await response.json()

    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    })

    setMovies(transformedMovies);
    setIsLoading(false);
  } catch(error){

  }
};
```
Now that we have generated an error if this error is created we will hit our `catch` block and it will receive this error
In that case we want update our state with this error message
This is attached to the error object itself
We will also want to set our `isLoading` state to false since even though we received an error we are no longer loadig any content
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);
  setError(null);

  try {
    const response = await fetch('https://swapi.dev/api/film/')

    if (response.status !== 200) {
      throw new Error(`Something went wrong: Error ${response.status}`)
    }

    const data = await response.json()

    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    })

    setMovies(transformedMovies);
    setIsLoading(false);
  } catch(error){
    setError(error.message);
    setIsLoading(false);
  }
};
```
Since we will be done loading regardless of an error or not we can actually set that state outside both of `try` AND `catch` so loading will be reset regardless of whether the fetch was successful or not
```
const fetchMoviesHandler = async () => {

  setIsLoading(true);
  setError(null);

  try {
    const response = await fetch('https://swapi.dev/api/film/')

    if (response.status !== 200) {
      throw new Error(`Something went wrong: Error ${response.status}`)
    }

    const data = await response.json()

    const transformedMovies = data.results.map((movieData) => {
      return {
        id: movieData.episode_id,
        title: movieData.title,
        releaseDate: movieData.release_date,
        openingText: movieData.opening_crawl
      }
    })

    setMovies(transformedMovies);
  } catch(error){
    setError(error.message);
  }
  setIsLoading(false);
};
```

Now lets output this error message if we have an error
We can use a conditional statement just like we have for our loading and movies list output
We will check to make sure we are not loading and that there is an error
If both these are true output a paragraph with the error message that is saved in state
```
return (
  <React.Fragment>
    <section>
      <button onClick={fetchMoviesHandler}>Fetch Movies</button>
    </section>
    <section>
      {!isLoading && movies.length > 0 && <MoviesList movies={movies} />}
      {!isLoading && movies.length === 0 && <p>No movies found</p>}
      {isLoading && <p>Loading...</p>}
      {!isLoading && error && <p>{error}</p>}
    </section>
  </React.Fragment>
);
```

How you handle errors exactly will depend on the api you are using
Some apis will send json data even when unsuccessful but swapi does not

As is this will also show 'No movies found' if we hit an error and we only want to display the error 
To fix this we will need to make sure that state error is falsey (null) before outputting 'No movies found'
```
return (
  <React.Fragment>
    <section>
      <button onClick={fetchMoviesHandler}>Fetch Movies</button>
    </section>
    <section>
      {!isLoading && movies.length > 0 && <MoviesList movies={movies} />}
      {!isLoading && movies.length === 0 && !error &&<p>No movies found</p>}
      {isLoading && <p>Loading...</p>}
      {!isLoading && error && <p>{error}</p>}
    </section>
  </React.Fragment>
);
```

Now that we are able to handle errors we can fix our typo, save our project, and be sure that errors will be handled if they happen

Let's clean up this section of conditionally outputting content by pulling these conditionals out of our jsx 
Instead we will simply output a `content` variable that changes based on our state values
Initially it will be 'No movies found' but then we will use if statements to evaluate whether it should be changed before displaying it in our jsx
```
import React, { useState } from 'react';

import MoviesList from './components/MoviesList';
import './App.css';

function App() {

  const [movies, setMovies] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const fetchMoviesHandler = async () => {

    setIsLoading(true);
    setError(null);

    try {
      const response = await fetch('https://swapi.dev/api/films/')

      if (response.status !== 200) {
        throw new Error(`Something went wrong: Error ${response.status}`)
      }

      const data = await response.json()

      const transformedMovies = data.results.map((movieData) => {
        return {
          id: movieData.episode_id,
          title: movieData.title,
          releaseDate: movieData.release_date,
          openingText: movieData.opening_crawl
        }
      })

      setMovies(transformedMovies);
    } catch(error){
      setError(error.message);
    }
    setIsLoading(false);
  };

  let content = <p>No movies found</p>
  if(isLoading){
    content = <p>Loading...</p>
  } else if (!isLoading && movies.length > 0){
    content = <MoviesList movies={movies} />
  } else if (!isLoading && movies.length === 0 && !error){
    content = <p>No movies found</p>
  } else if (!isLoading && error) {
    content = <p>{error}</p>
  }
  

  return (
    <React.Fragment>
      <section>
        <button onClick={fetchMoviesHandler}>Fetch Movies</button>
      </section>
      <section>
        {content}
      </section>
    </React.Fragment>
  );
}

export default App;
```