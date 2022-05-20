## Due 5/10
Read / Do: JS Way Ch. 09: https://github.com/thejsway/thejsway/blob/master/manuscript/
  ```js
  // Complete the following program to add the definition to the Dog class
  // Dogs taller than 60 emote "Grrr! Grrr!" when they bark, other ones yip "Woof! Woof!".

  class Dog{
    constructor(name, species, size){
      this.name = name;
      this.species = species
      this.size = size
    }

    bark(){
      if(this.size > 60){
        return 'Grrr! Grrr!'
      } else{
        return 'Woof! Woof!'
      }
    }
  }

  const fang = new Dog("Fang", "boarhound", 75);
  console.log(`${fang.name} is a ${fang.species} dog measuring ${fang.size}`);
  console.log(`Look, a cat! ${fang.name} barks: ${fang.bark()}`);

  const snowy = new Dog("Snowy", "terrier", 22);
  console.log(`${snowy.name} is a ${snowy.species} dog measuring ${snowy.size}`);
  console.log(`Look, a cat! ${snowy.name} barks: ${snowy.bark()}`);
  ```
  ```js
  // Character inventory
  // Improve the example RPG to add character inventory management according to the following rules:

  // A character's inventory contains a number of gold and a number of keys.

  // Each character begins with 10 gold and 1 key.

  // The character description must show the inventory state.

  // When a character slays another character, the victim's inventory goes to its vanquisher.

  // Here's the expected execution result.

  //=> 'Welcome to the adventure! Here are our heroes:'
  //=> 'Aurora has 150 health points, 25 as strength and 0 XP points, 10 gold and 1 key(s)'
  //=> 'Glacius has 130 health points, 30 as strength and 0 XP points, 10 gold and 1 key(s)'
  //=> 'A wild monster has appeared: it's named Spike'
  //=> 'Spike attacks Aurora and causes 20 damage points'
  //=> 'Aurora has 130 health points left'
  //=> 'Spike attacks Glacius and causes 20 damage points'
  //=> 'Glacius has 110 health points left'
  //=> 'Aurora attacks Spike and causes 25 damage points'
  //=> 'Spike has 15 health points left'
  //=> 'Glacius attacks Spike and causes 30 damage points'
  //=> 'Glacius eliminated Spike and wins 10 experience points, 10 gold and 1 key(s)'
  //=> 'Aurora has 130 health points, 25 as strength and 0 XP points, 10 gold and 1 key(s)'
  //=> 'Glacius has 110 health points, 30 as strength and 10 XP points, 20 gold and 2 key(s)'
  class Character {
    constructor(name, health, strength) {
      this.name = name;
      this.health = health;
      this.strength = strength;
      this.xp = 0; // XP is always zero for new characters
      this.inventory = {this.gold: 10, this.keys: 1};
    }

    // Attack a target
    attack(target) {
      if (this.health > 0) {
        const damage = this.strength;
        console.log(
          `${this.name} attacks ${target.name} and causes ${damage} damage points`
        );
        target.health -= damage;
        if (target.health > 0) {
          console.log(`${target.name} has ${target.health} health points left`);
        } else {
          target.health = 0;
          const bonusXP = 10;
          console.log(
            `${this.name} eliminated ${target.name} and wins ${bonusXP} experience points, ${target.inventory.gold} gold and ${target.inventory.keys} key(s)`
          );
          this.xp += bonusXP;
        }
      } else {
        console.log(`${this.name} can't attack (they've been eliminated)`);
      }
    }
    // Return the character description
    describe() {
      return `${this.name} has ${this.health} health points, ${this
        .strength} as strength and ${this.xp} XP points`;
    }
  }

  const aurora = new Character("Aurora", 150, 25);
  const glacius = new Character("Glacius", 130, 30);

  console.log("Welcome to the adventure! Here are our heroes:");
  console.log(aurora.describe());
  console.log(glacius.describe());

  const monster = new Character("Spike", 40, 20);
  console.log("A wild monster has appeared: it's named " + monster.name);

  monster.attack(aurora);
  monster.attack(glacius);
  aurora.attack(monster);
  glacius.attack(monster);

  console.log(aurora.describe());
  console.log(glacius.describe());
  ```
  ```js
  // Account list
  // Let's build upon a previous account object exercise. 
  // A bank account is still defined by:

  // - A name property.
  // - A balance property, initially set to 0.
  // - A credit method adding the value passed as an argument to the account balance.
  // - A describe method returning the account description.
  
  // Write a program that creates three accounts: 
  // one belonging to Sean, 
  // another to Brad 
  // and the third one to Georges. 
  
  // These accounts are stored in an array. 
  // Next, the program credits 1000 to each account and shows its description.

  class Account{
    constructor(name){
      this.name = name;
      this.balance = 0
    }

    credit(val){
      this.balance += val
    }

    describe(){
      console.log(`owner: ${this.name}, balance: ${this.balance}`)
    }
  }

  const sean = new Account('Sean')
  const brad = new Account('Brad')
  const georges = new Account('Georges')

  let accounts = [sean, brad, georges]
  accounts.forEach(account=> {
    account.credit(1000);
    account.describe();
  })
  ```

Submission Links
Paid Client/Volunteer/Open Source: https://docs.google.com/forms/d/e/1FAIpQLSeVqfClPktHdfm-JX2jyKz-QFI6e55D3Gw1EKKVkwf7KO410w/viewform

Professional Links: https://docs.google.com/forms/d/e/1FAIpQLSdhpDy8HzDDpwMlnpwB5lWNU_92UNiCZq11gj_1Ik6MGzVkjg/viewform


## DUE 5/17
Read / Do: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Asynchronous/Async_await
Watch / Do: https://youtu.be/vn3tm0quoqE
TYPE OUT ALL THE EXAMPLES!!!
Do: Make an independent repo for daily coding challenges
Do: 100Hours description and wireframe

Want to Push?
Read / Do: https://javascript.info/async

## DUE 5/19
READ: Modern Javascript For Dinosaurs - https://medium.com/the-node-js-collection/modern-javascript-explained-for-dinosaurs-f695e9747b70
WATCH: Node.js Crash Course (just get through it) - https://youtu.be/fBNz5xF-Kx4

## DUE 5/24
Do: Start prepping THE BANK
Do: Complete Your Professional Links (https://forms.gle/Pt7kwXndftDedcbX8
)
Do: Make node-backend-simple-json more readable
Do: Make a coinflip game where the randomization happens server side
Do: How to handle errors with async/await
Do: Setup/update node.js with node 18

## Bonus
Read / Do: Eloquent JS Ch. 06: https://eloquentjavascript.net/06_object.html
Do: Codewars Array Ladder (search array problems) - 8kyu, 7kyu, 6kyu, 7kyu, 8kyu  