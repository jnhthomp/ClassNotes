//Create a pizza object that has four properties and three methods
const pizza = {
  toppings: ['pepperoni', 'pineapple'],
  size: 'large',
  crust: 'stuffed',
  sauce: 'red',

  addTopping(newTopping) {
    toppings.push(newTopping)
  },

  removeTopping(toppingIndex) {
    toppings = toppings.filter((topping, i) => i !== toppingIndex)
  },

  submitOrder(){
    console.log(`Making ${this.size} ${this.crust} crust pizza with ${this.sauce} sauce and ${this.toppings.join(',')}`);
  }
  
};