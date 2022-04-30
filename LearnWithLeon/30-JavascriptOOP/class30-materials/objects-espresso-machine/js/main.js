// Create an espresso machine class that 
// makes machines with 4 properties and 3 methods

class MakeEspressoMachine{
  constructor(color, make, model, price){
    this.color = color
    this.make = make
    this.model = model
    this.price = price
  }

  turnOn(){
    console.log('powering on...')
  }
  steam(){
    console.log('steaming...')
  }
  brew(){
    console.log('brewing...')
  }
}

let gaggia = new MakeEspressoMachine('red', 'Gaggia', 'Classic Pro', 400)
console.log(gaggia)