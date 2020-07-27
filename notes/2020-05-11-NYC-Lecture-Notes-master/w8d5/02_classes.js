// Reasons why we learn ES5 syntax
//  1. a lot of code bases will still have ES5 syntax
//  2. newer class syntax hides deeper concept of how classes work for JS
//     and ES5 unveils it more for us.

// function Cat(name, owner) {
//     this.name = name;
//     this.owner = owner;
// }

// Cat.prototype.cuteStatement = function () {
//     return `${this.owner} loves ${this.name}. :3`;
// };

// Cat.prototype.meow = function () {
//     return 'meow';
// };


// TODO: Refactor to ES6 class syntax 
// 'class' keyword came with ES6
class Cat {

  constructor(name, owner) {
    this.name = name;
    this.owner = owner;
  }

  cuteStatement() {
    return `${this.owner} loves ${this.name}. :3`;
  }

  meow() {
    return 'meow';
  }

}

const garfield = new Cat("Garfield", "Josh");
garfield.meow();