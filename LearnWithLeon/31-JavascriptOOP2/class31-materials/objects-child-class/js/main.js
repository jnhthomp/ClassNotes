class Animal {
  constructor(name) {
    this.name = name
  }
  speak() {
    console.log(`${this.name} makes a sound`)
  }
}

class DairyAnimal extends Animal {
  constructor(name){
    super(name)
    this.canMilk = true
  }

  milk(){
    console.log(this.canMilk ? 'Dispensing milk' : 'cannot be milked')
  }
}

class Cow extends DairyAnimal {
  constructor(name, color){
    super(name)
    this.color = color
  }
}

let brownCow = new Cow('Bessy', 'brown')
brownCow.name //=> 'Bessy' (from Animal class)
brownCow.canMilk //=> true (from DairyAnimal class)
brownCow.color //=> 'brown' (from Cow class)

