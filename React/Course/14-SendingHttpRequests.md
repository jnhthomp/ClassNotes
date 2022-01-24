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




___
## 181. Using useEffect() For Requests
One thing that is a little unrealistic about our application is that we are waiting to fetch this data when a button is pressed
However usually you want to get the data for the user when the page or component is loaded

To immediately fetch data we can use `useEffect` since we can make this run when the component is first mounted AND fetching data is a side effect that does change the components state

We learned that this is exactly what `useEffect` is for
It is fine to have the fetch this way when attached to a button but if this function was called in the body it would lead to an infinite loop

That is because the body would call this fetch function which would change the state which would make the body re-run, which would call the fetch method etc...

So if we want to run this function automatically within the body so a user doesn't have to interact with it we need to use `useEffect`

Be sure to import `useEffect` and then call it after we have initialized state
```
function App() {

  const [movies, setMovies] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    first;
  
//  return () => {
//    second;
//  }
  }, [third]);
  
  ...
```

Now we need to fill in this `useEffect` function
First we can fill out what should happen which is to perform the `fetchMoviesHandler` since we already have it defined we don't need to copy/paste, we can just call the existing function
```
  useEffect(() => {
    fetchMoviesHandler();
  
//  return () => {
//    second;
//  }
  }, [third]);
```

Now we don't want this method to be called everytime the component is re-evaluated
We only want it to run whenever the component is first evaluated
To do this we use an empty dependency array
Now if we were to reload our application it will in fact run on page load but this isn't the best practice because we haven't listed our dependencies within the dependency array
we should add `fetchMoviesHandler` as a pointer in case for some reason it were to change
It won't change in our example but in other projects it might
```
useEffect(() => {
  fetchMoviesHandler();

  // return () => {
  //   second;
  // };
}, [fetchMoviesHandler]);
```

However remember that functions are js objects and that they are recreated every time a component is rerendered so if `<App>` component were to be re-rendered the function would actually be changed 
To prevent this we have previously used `useCallback` on the function which we do not want to be recreated with component re-renders

To do this we simply wrap our anonymous function within a `useCallback` function and then provide a list of dependencies to monitor like with `useEffect`
```
const fetchMoviesHandler = useCallback(async () => {

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
}),[];
```
We don't have any external dependencies within this function so we don not have to list any
All of the variables are created inside of this function and all of the functions referenced are default js/react functions that will not change

We do need to make sure that `fetchMovieHandler` is listed before `useEffect` since it is a const and exist/must be loaded into memory for `useEffect` to be able to call it
```
import React, { useState, useEffect, useCallback } from 'react';

import MoviesList from './components/MoviesList';
import './App.css';

function App() {

  const [movies, setMovies] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  const fetchMoviesHandler = useCallback(async () => {

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
  },[]);

  useEffect(() => {
    fetchMoviesHandler();

    // return () => {
    //   second;
    // };
  }, [fetchMoviesHandler]);

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

Now our component will load the list when the page loads and we can reload it manually




___
## 182. Preparing the Project For The Next Steps
In our application we are only getting data
However usually in applications we will also want to send data

To do this the teacher has provided an updated version of the project
This comes with a new component that is a form that takes in the same data fields as we are receiving and outputting from the star wars api
Along with a few new functions within `<App>` 

Update your application to match this by using this snapshot:
https://github.com/academind/react-complete-guide-code/tree/14-sending-http-requests/code/06-preparing-the-project-for-the-next-steps

The star wars api we have been using is just  dummy api for getting data
It will not accept data coming in because it does not want people submitting data to it

https://firebase.google.com/pricing
In order to set up an api to use that we can post to we will use a service called firebase
This is a service provided by google that is a backend we can use
It gives us a full backend app with an api that we can use to post to
There is a free plan we can select which will give us the features that we need

Now we can create a new project (I will name mine 'react-http' but it is up to you)
You can also disable google analytics for this project as we won't need them

We are not building a complicated app here we are just using this as a free to use no code backend

Now in the console for our project we will use the 'Realtime Database' (found for me under 'Build' menu but may change)
This has a rest api like what we have been using

Inside of this menu we can click 'Create Database' and select 'Start in Test Mode' otherwise we won't be able to send requests

This sets up a simple data base with a url we can use to talk to the database but this is deceiving since we said we cannot talk to a database from our front end
This is a link to an api which will talk to the database for us

We can use this to create new movies but we won't be able to fetch movies from there
If we replace the swapi api link with this link and add '/movies.json' to the end it will create a new node on the database
```
 const response = await fetch('https://react-http-rest-of-url.firebaseio.com/movies.json');
```

This is a dynamic rest api which we can configure by using different segments by creating different nodes in our database
This means we can create the database just by adding stuff to it and it will manage the content for us as long as we add it correctly
'.json' is required and firebase specific because it needs the '.json' or our requests will fail
We can get our data from here but if we use the url we won't get any data and will try to map empty results

We are not getting an error response code from firebase because this is not an error on their end, there is just no data to output

We will update our application to allow us to send movies to this url with post requests so they are saved to the database
Then when we fetch from that same database the movies will display




___
## 183. Sending a Post Request
Now we want to send a post request when we click 'Add Movie'

We already have an `addMovieHandler` that is triggered when the button is clicked
This button will collect the data from the form and output it in the console as a single object
Note that the id is missing, this will be added by firebase automatically

In the `addMovieHandler` we want to create our method to send this object off to firebase

To do this we use the `fetch` method again
Remember this method doesn't only perform GET requests, it can also performed POST requests by providing a js object with our options specified
Normally it may be a good idea to have the GET and POST functionality outside of the `<App>` component so it can be reused and keep `<App>` clean but for the demo we will leave it here

We will send a fetch request to the same url that we get the data from and provide the js object to specify that we want to use a POST method intsead of a GET method
```
function addMovieHandler(movie) {
  fetch('https://react-http-82bca-default-rtdb.firebaseio.com/movies.json', {
    method: 'POST'
  });
}
```
Whenever we send a post request to firebase it will create the resource for us in the database
What happens when you send a post request is dependent on the api/url you are using
Creating a resource is a feature of firebase and other apis will need to be configured to do so to allow this creation

With post methods we are expected to provide a body, that is the content that we want to post to the database
However firebase does not want a js object (like `movie` which is the object containing the values entered by the user)
Instead firebase will expect json
So we have to convert our movie js object to json

In order to do this we can use a utility method from javascript
This allows us to convert a js object to valid json by using `JSON.stringify()` and passing in the object you want to convert
```
function addMovieHandler(movie) {
  fetch('https://react-http-82bca-default-rtdb.firebaseio.com/movies.json', {
    method: 'POST',
    body: JSON.stringify(movie)
  });
}
```

Last we need to add a header
This will tell firebase what kind of content is coming and is technically not required by firebase but many rest apis require this header
```
function addMovieHandler(movie) {
  fetch('https://react-http-82bca-default-rtdb.firebaseio.com/movies.json', {
    method: 'POST',
    body: JSON.stringify(movie),
    headers: {
      'Content-Type': 'application/json'
    }
  });
}
```

Now the outline of our function is ready
There are a few other touches 
Remember that `fetch` is an async task so we need to mark the function as such with async/await or using `.then()`
When we send this fetch we will still get a response from firebase so we can save that response to a variable
That response will be json so we will need to convert it and store it (again await)
Then we can output that data in the console
```
async function addMovieHandler(movie) {
  const response = await fetch('https://react-http-82bca-default-rtdb.firebaseio.com/movies.json', {
    method: 'POST',
    body: JSON.stringify(movie),
    headers: {
      'Content-Type': 'application/json'
    }
  });
  
  const data = await response.json();
  console.log(data)
}
```
Now when we add data and press the button we can see in the console that we get a weird reply
But we can also see in firebase that there is now a movies section with a subsection matching the weird name we got in console
If you expand this then you can see the movie data that was entered
The weird name that we received is the automatically generated id of the object we created and added to our backend database

If we click 'Fetch Movies' now we will still get an error
This is expected and makes sense because the format of the movie data that we were expecting is different
We are calling `.map` on `data.results` which may not exist because we are using a different api which will structure results differently
We can see how we are supposed to structure this logging the data object after we convert results from json
```
const fetchMoviesHandler = useCallback(async () => {
    setIsLoading(true);
    setError(null);
    try {
      const response = await fetch('https://react-http-82bca-default-rtdb.firebaseio.com/movies.json');
      if (!response.ok) {
        throw new Error('Something went wrong!');
      }

      const data = await response.json();
      console.log(data);
  ...
```
In this case we receive an object where the id is a key holding another object 
This means our data is not being stored in an array as we expected it to be
We can transform it so it is in an array though
First we will initialize an empty array
Then create a for loop to loop through all the keys in data
Then for each of these keys we will pull the data out and assign it to a new object that matches the data we expect
Then we will push this object into the array we initialized
```
const fetchMoviesHandler = useCallback(async () => {
  setIsLoading(true);
  setError(null);
  try {
    const response = await fetch('https://react-http-82bca-default-rtdb.firebaseio.com/movies.json');
    if (!response.ok) {
      throw new Error('Something went wrong!');
    }

    const data = await response.json();
    
    const loadedMovies = [];

    for (const key in data){
    loadedMovies.push({
      id: key,
      title: data[key].title,
      openingText: data[key].openingText,
      releaseDate: data[key].releaseDate
    })
  }
  ...
```

Now we have `loadedMovies` which is an array of objects like `transformedMovies` used to be
So we can get rid of `transformedMovies` and save `loadedMovies` to state instead

Now if we save and reload we should be able to get our movies from our database as well as add new movies to it

There are a few other improvements we could make such as error handling to the `POST` method, make new movies fetch automatically when a movie is submitted etc.