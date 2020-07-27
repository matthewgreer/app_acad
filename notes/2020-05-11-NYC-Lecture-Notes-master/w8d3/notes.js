// ***JAVASCRIPT***

// - Javascript is an object oriented programming language.

// - Before Javascript, websites were essentially static, with very little way 
// to interact with them.

// - Javascript was developed by Netscape and introduced to the world in 1995 in 
// order to make websites more interactive for the end user.

// - It was originally known as Mocha, then LiveScript, before finally settling 
// on the Javascript name

// - Despite the name, it is in no way related to the coding language Java.

// - Standardised with ECMAScript, with the current version being ECMAScript 2019

// - It allows us to make interactive websites, and is essential for frontend 
// development.Features like drag and drop require javascript to function
// - With the development of Node.js, it can now also be used to run the 
// backend of our web applications too


// DIFFERENCES BETWEEN JS AND RUBY
// - Explicit returns
// - You have to "declare" your variables
// - Use semicolons
// - `camelCase` instead of`snake_case`
// - `==` and `===` (use the latter _almost_ always!)
// - No negative indexing
// - String Interpolation
// - Ruby => `puts 'stuff'`, JS => `console.log('stuff')`
// - Data Types - `primitives` and`objects`
// - `this` in JS vs`self` in Ruby
// - 7 Falsey values

// FALSEY RUBY VALUES: nil, false

// THE FALSEY SEVEN:
// 1. false
// 2. 0
// 3. null
// 4. NaN
// 5. undefined
// 6. ""
// 7. -0 (negative zero)


// == VS === DEMO
// What will these result in?
// 0 == '0'
// 0 == []
// 0 == ''
// '0' == []
// '0' == ''

// `===` will check datatype, if not same will return false
// `==` uses `typecasting`, force into similar datatype
// always use `===`


// SEMICOLON DEMO
// example of bug:
// const x = function(num) { return 3 * num }; // remove this semi-colon and compare the outcome of the console.log statements
// (10 + 5) > 20 ? console.log("Big") : console.log("small");
// console.log(x);  // what will this print?

// const x = function(num) { return 3 * num }(10 + 5) > 20 ? console.log("Big") : console.log("small");


// JS DATATYPES
// PRIMITIVE TYPES: immutable and not an object, no methods on them
// 1. Boolean
// 2. null
// 3. undefined
// 4. Number
// 5. string
// 6. Symbol

// PRIMITIVES DEMO
// "Javascript Rocks!".toUpperCase(); // JS temporarily converts primitives to object and calls method on it and returns a new string
// "hello" === "hello" // returns true
// new String('hello') === new String('hello'); // returns false, can't compare objects with `===` in JS, uses objectId for comparison


// OBJECTS DEMO
// Consider our old friend the array...


// VARIABLE DECLARATION


// FUNCTIONS


// HOISTING

// let favFood = 'Taco';
// if (true) {
//   // console.log(favFood);
//   let favFood = 'Pizza';
//   console.log(favFood);
// }
// console.log(favFood);


// CLOSURES AND CALLBACKS

// function dinerBreakfast() {
//   const foods = ["cheesy scrambled eggs"];
//
//   return (newFood) => {
//     if (newFood) {
//       foods.push(`and ${newFood}`);
//       return `I'd like ${foods.join(" ")} please.`;
//     }
//     return `I'd like ${foods} please.`;
//   };
// }



















// WAT Video: https://www.destroyallsoftware.com/talks/wat
