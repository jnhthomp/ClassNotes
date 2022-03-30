// Create a Tony Hawk Pro Skater constructor 
// that makes fighting game characters 
// with 4 properties and 3 methods
function MakeSkater(name, boardColor, style, stance){
  this.name = name
  this.boardColor = boardColor
  this.style = style
  this.stance = stance

  this.move1 = function(){
    console.log('kickflip')
  }

  this.move2 = function(){
    console.log('pop-shove it')
  }

  this.move3 = function () {
    console.log('impossible')
  }
}

let bamMargera = new MakeSkater('Bam', 'black/red', 'street', 'regular');