// Create a Netflix TV Show class with a constructor 
// that makes Netflix TV Shows with 4 properties and 3 methods
class NetflixTvShow{
  constructor(title, description, category, rating) {
    this.title = title
    this.description = description
    this.category = category
    this.rating = rating
  }

  play(){
    console.log(`Now playing: ${this.title}`)
  }

  recommend(){
    console.log(`Watch ${this.title} about ${this.description}!`)
  }

  addToList(){
    console.log(`${this.title} added to your list`)
  }
}

