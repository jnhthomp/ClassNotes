// *Variables*
// Declare a variable and assign it to a sentance as a string. 
// Alert if the sentance is a question
let sentence = 'This is a question'
sentence.includes('?') && alert(sentence)


// Declare a variable, assign it a string of multiple words, 
// replace every "jr. dev" with "software engineer", 
// and print it to the console
let anotherSentence = 'random word jr. dev more words jr. dev'
console.log(anotherSentence.replaceAll('jr. dev', 'software engineer'))

// *Functions*
// Create a function that returns rock, paper, or scissors 
// as randomly as possible
function rps(){
  let play = Math.floor(Math.random() * 3)
  if(play === 0){
    return 'rock'
  } else if(play === 1){
    return 'paper'
  } else {
    return 'scissors'
  }
}
console.log(rps())

// *Conditionals*
// Create a function that takes in a choice (rock, paper, or scissors) 
// and determines if they won a game of rock paper scissors against a bot 
// using the above function
function playRPS(userChoice){
  let botChoice = rps()
  if(userChoice === botChoice){
    return `${userChoice} vs ${botChoice}: You tie`
  } else if((userChoice === 'rock' && botChoice === 'scissors') ||
            (userChoice === 'paper' && botChoice === 'rock') ||
            (userChoice === 'scissors' && botChoice == 'paper')){
    return `${userChoice} vs ${botChoice}: You win`
  } else {
    return `${userChoice} vs ${botChoice}: You lose 😢`
  }
}

// console.log(playRPS('rock'))
// console.log(playRPS('paper'))
// console.log(playRPS('scissors'))

//*Loops*
// Create a function that takes an array of choices. 
// Play the game x times where x is the number of choices in the array. 
// Print the results of each game to the console.
function playRPSxTimes(arr){
  arr.forEach((el) => { 
    console.log(playRPS(el))
  })
}

let rpsArr = ['rock', 'paper', 'scissors',
              'rock', 'paper', 'scissors',
              'rock', 'paper', 'scissors' ]

playRPSxTimes(rpsArr)