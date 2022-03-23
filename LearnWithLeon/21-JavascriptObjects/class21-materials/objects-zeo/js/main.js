 // Create a stopwatch object that has 
//    four properties 
//    and three methods

const stopwatch  = {
  color: 'black',
  brand: 'casio',
  minutes: 0,
  seconds: 0,
  
  increaseMinutes: function() {
    this.minutes++
  },

  increaseSeconds: function() {
    this.seconds++
  },

  ouputTime: function() {
    console.log(`CurrentTime: ${this.minutes}:${this.seconds}`)
  }
}

stopwatch.increaseMinutes()
stopwatch.increaseSeconds()
stopwatch.ouputTime()

const stopwatchAlt = {};
stopwatchAlt.color = 'black';
stopwatchAlt.brand = 'casio';
stopwatchAlt.minutes = 0;
stopwatchAlt.seconds = 0;

stopwatchAlt.increaseMinutes = function() {
  stopwatchAlt.minutes++
}
stopwatchAlt.increaseSeconds = function () {
  stopwatchAlt.seconds++
}
stopwatchAlt.outputTime =  function(minutes, seconds) {
  console.log(`${minutes}:${seconds}`)
}


stopwatchAlt.increaseMinutes()
stopwatchAlt.increaseSeconds()
stopwatchAlt.outputTime(stopwatchAlt.minutes, stopwatchAlt.seconds)