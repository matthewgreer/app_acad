// There are a number of steps:

// Define a Surrogate class
// Set the prototype of the Surrogate (Surrogate.prototype = SuperClass.prototype)
// Set Subclass.prototype = new Surrogate()
// Set Subclass.prototype.constructor = Subclass

// Write a Function.prototype.inherits method that will do this for you.
// Do not use Object.create right now; you should deeply understand what the 
// new keyword does and how the __proto__ chain is constructed.This will help 
// you in the upcoming Asteroids project:
// Function.prototype.inherits = function (SuperClass, SubClass) {

Function.prototype.inherits1 = function (SuperClass) {
    function Surrogate() {};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};

Function.prototype.inherits = function (SuperClass) {
    this.prototype = Object.create(SuperClass.prototype)
    this.prototype.constructor = this;
};



// function MovingObject() {
//     function move() {
//       console.log('Wheeeeeee!');
//     }
// }

// function Ship() {
//     function shoot() {
//       console.log('Pew pew pew!');
//     }
// }
// Ship.inherits(MovingObject);

// function Asteroid() { 
//     function divide() {
//       console.log('More of me to love!');
//     }
//  }
// Asteroid.inherits(MovingObject);


// How would you test Function.prototype.inherits ? A few specs to consider:

// You should be able to define methods / attributes on MovingObject that ship 
// and asteroid instances can use.
// Defining a method on Asteroid's prototype should not mean that a ship can 
// call it.
// Adding to Ship or Asteroid's prototypes should not change MovingObject's
// prototype.
// The Ship and Asteroid prototypes should not be instances of MovingObject.
// After you have written Function.prototype.inherits using the surrogate trick,
// refactor your solution using Object.create.Make sure to test that your 
// updated solution works.

//   You'll be writing an inherits method again for Asteroids.

function Animal(name) {
    this.name = name;
};

function Cat(name) {
    this.name = name;
    // Animal.call(this, name); // delegate to Animal constructor logic but still make sure the context is set to Cat instance being constructed, not necessary to do only if want to re-use lot of logic in Animal
    // this.personality = personality;
}

Cat.inherits(Animal);

Animal.prototype.eat = function () {
    console.log(this.name + ' is eating.');
};


Cat.prototype.meow = function () {
    console.log('Meow!');
};

Animal.prototype.sleep = function() {
    console.log(this.name + ' is sleeping.')
};
// const garfield = Object.create(Cat.prototype);
// garfield.meow();



const garfield = new Cat('Garfield');

garfield.eat();
garfield.meow();
garfield.sleep();

// const noCat = new Animal('noCat');
// noCat.eat();
// noCat.meow();