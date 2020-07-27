function Animal(name) {
    this.name = name;
};

Animal.prototype.eat = function () {
    console.log(this.name + ' is eating.');
};

function Cat(name) {
    this.name = name;
    // Animal.call(this, name); // delegate to Animal constructor logic but still make sure the context is set to Cat instance being constructed, not necessary to do only if want to re-use lot of logic in Animal
    // this.personality = personality;
}

// // Make Cat inherit from Animal here.
// // want Cat to access all the methods/functions defined on Animal prototype
// // Approach #1
// // Cat.prototype = Animal.prototype; // will have all Animal prototype methods
// // all Cats and all Animals will have same methods, adding methods to Cat prototype will add to Animal prototype

// // Approach #2
// // Cat.prototype = new Animal(); // create an object where `__proto__` points to Animal prototype
// // running Animal constructor every time creating a new child class that inherits from Animal
// // if Animal constructor has a lot of logic can be expensive to run

// // Surrogate way
// // avoid executing all of parent constructors logic when inheriting
function Surrogate() {} // no code in constructor, makes it less expensive than any constructor that would have logic inside
Surrogate.prototype = Animal.prototype;
// new keyword creates an object that has a pointer to the prototype of that class
Cat.prototype = new Surrogate();  // override Cat's prototype and setting to instance of Surrogate class
Cat.prototype.constructor = Cat; // reassign prototype's constructor to Cat

// // be back 12:06

// Cat.prototype.meow = function () {
//     console.log('Meow!');
// };

// Animal.prototype.sleep = function() {
//     console.log(this.name + ' is sleeping.')
// };

// Object.create way, not allowed for test
// Cat.prototype = Object.create(Animal.prototype);
// Cat.prototype.constructor = Cat;

// const garfield = Object.create(Cat.prototype); // takes in one argument which is prototype


// es6 class syntax, syntactic suger for prototypal inheritance, also not allowed for test
// class Animal {
//     constructor(name) {
//         this.name = name;
//     }
    
//     eat() {
//         console.log(this.name + ' is eating.');
//     }
// }

// class Cat extends Animal { // this sets up inheritance chain in same way as Surrogate method
//     constructor(name, coatColor) {
//         super(name);
//         this.coatColor = coatColor;
//     }

//     meow() {
//         console.log('Meow');
//     }
// }


const garfield = new Cat('Garfield');
garfield.eat();
garfield.meow();
garfield.sleep();

const noCat = new Animal('noCat');
noCat.eat();
noCat.meow();