//Create a street fighter constructor that makes fighting game characters with 4 properties and 3 methods
function MakeCharacter(name, health, power, defense, attk1, attk2, attk3){
  this.name = name
  this.health = health,
  this.power = power,
  this.defense = defense

  this.lightAttk = function(){
    console.log(`${attk1}`)
  }
  this.heavyAttk = function () {
    console.log(`${attk2}`)
  }
  this.specialAttk = function () {
    console.log(`${attk3}`)
  }
}

let ken = new MakeCharacter('ken', 100, 75, 60, 'jab', 'haymaker', 'saiyan')
console.log(Object.keys(ken).forEach(key => console.log(`key: ${key} value: ${ken[key]}`)))
ken.specialAttk()