function Animal(name) {
    // debugger;
    this.name = name;
};

Animal.prototype.eat = function () {
    console.log(this.name + ' is eating.');
};

function Cat(name) {
    this.name = name;
    // debugger;
    Animal.call(this, name);
}

function Surrogate() { }
Surrogate.prototype = Animal.prototype;
Cat.prototype = new Surrogate();
Cat.prototype.constructor = Cat;

module.exports = {
    Animal, // same as Animal: Animal,
    Cat
}