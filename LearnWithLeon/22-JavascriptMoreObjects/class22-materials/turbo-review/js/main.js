// *Variables*
// Declare a variable and assign it to your fav drink as a string. 
// Make sure there is no whitespace on either side of the string, 
// and print the value to the console
let favDrink = 'RedBull'
console.log(favDrink.trim())

// Declare a variable, assign it a string of multiple words, 
// and check to see if one of the words is "apple".
// and check to see if one of the words is "apple".
let stringOfWords = 'this is a string of words'
console.log(stringOfWords.includes('apple'))

// *Functions*
// Create a function that returns rock, paper, or scissors as randomly as possible
const rps = () => {
  const play = Math.floor(Math.random() * 3)
  if(play === 0){
    return 'rock'
  } else if (play === 1){
    return 'paper'
  } else {
    return 'scissors'
  }
}
// console.log(rps());

// *Conditionals*
//Create a function that takes in a choice (rock, paper, or scissors) 
// and determines if they won a game of rock paper scissors 
// against a bot using the above function
const playRPS = (choice) => {
  let botChoice = rps()
  if ((botChoice === 'rock' && choice !== 'paper') || 
      (botChoice === 'paper' && choice !== 'scissors') || 
      (botChoice === 'scissors' && choice !== 'rock')){
    return `${choice} vs ${botChoice}: lose`
  } else if (botChoice === choice) {
    return `${choice} vs ${botChoice}: tie`
  } else {
    return `${choice} vs ${botChoice}: WIN!`
  }
}

// console.log(playRPS('rock'))
// console.log(playRPS('paper'))
// console.log(playRPS('scissors'))


// *Loops*
// Create a function that takes an array of choices. 
// Play the game x times where x is the number of choices in the array. 
// Print the results of each game to the console.

const multiRPS = (choiceArr) => {
  choiceArr.forEach((el) => {
    console.log(playRPS(el))
  })
}

multiRPS(['rock','paper','scissors',
          'rock','paper','scissors',
          'rock','paper', 'scissors']);