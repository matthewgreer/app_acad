/* Function Demo */


/* Named functions */
// named functions get hoisted to the top of the file
// allows use earlier on in the file

console.log(square(10)); // ?

function square(num) {
  return num * num;
}



























/* Function expressions */
// (Variable assigned functions / anonymous functions)
// if try to invoke before, it will error out `Uncaught ReferenceError: Cannot access 'feedMe' before initialization`
// the context (`this`) in function-style invocation is the global scope, in browser it is window
const feedMe = function(food) {
  debugger;
  return 'Thanks for the ' + food + ' !';
};
// console.log(feedMe("pizza"));






















/* Es6 Arrow function expression */
const feedMe2 = (food) => {
  // debugger;
  return 'Thanks for the ' + food + ' !';
};
// feedMe2("food");
// fat arrow functions behave uniquely with context, preserve context from where it is invoked

// Functionally same as above
// If numArgs === 1, no parens needed
// If function body === 1 line, no curlies, and implicit return
const feedMe3 = food => 'Thanks for the ' + food + ' !'; 

const arrow = (arrowArg1, arrowArg2) => {
  // function body
};















// Method style invocation: invoke it on an object. The function has a receiver
// `this` in JS is similar to `self` in Ruby. 
// When you invoke a function method-style, `this` is the object that you invoked the method on
const andy = {
  favFood: 'pizza',
  sayHi: function () {
    debugger;
    console.log('Hi');
    console.log(this); // this === andy
  }
};










/* Constructor functions */

// Always name constructor functions starting with a capital letter
// This is a convention that makes things much easier!
// `this` refers to the object being constructed
function User(username, age) {
  // these are like @ (instance vars) in Ruby
  // these are properties for the user object we are creating
  // what is this?
  this.username = username;
  this.age = age;
  // debugger;
  // this.sayHello = function() {
  //   return `hello! my name is ${this.username}`;
  // }
  // if every User needs this function, inefficient to have it declared in constructor every time
}

// What about "instance" methods?
// `User.prototype.<name>` is similar to monkeypatching in Ruby
User.prototype.sayHello = function() {
  return `hello! my name is ${this.username}`;
};