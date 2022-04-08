//Create a constructor with 4 properties and 3 methods
function Pizza (size, crust, sauce){
  this.toppings = []
  this.size = size
  this.crust = crust
  this.sauce = sauce

  this.addTopping = function(newTopping){

    this.toppings.push(newTopping);
  }

  this.removeTopping = function(toppingIndex){
    this.toppings = this.toppings.filter((topping,i) => i !== toppingIndex)
  }

  this.submitOrder = function(){
    console.log(`Making ${this.size} ${this.crust} crust pizza with ${this.sauce} sauce and ${this.toppings.join(', ')}`);
  }
}

// Make a pizza
let dominos = new Pizza('large', 'traditional', 'bbq')
console.log(dominos)

// Add toppings
dominos.addTopping('pepperoni')
dominos.addTopping('pineapple')
dominos.addTopping('mushroom')
console.log(dominos.toppings)

// Remove a topping
dominos.removeTopping(dominos.toppings.indexOf('pineapple'))
console.log(dominos.toppings)

// Submit order
dominos.submitOrder()



