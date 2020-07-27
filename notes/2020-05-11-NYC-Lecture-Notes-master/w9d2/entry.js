const PI = require('./prototypal_inheritance');
const Curry = require('./currying');
// command used to generate webpack bundle file:
// `webpack entry.js -o bundle.js` creates `bundle.js` at top level
// `webpack entry.js` will create a `dist/main.js` bundle file
// webpack makes all code function-scoped and doesn't allow users to interact with our code
// production mode IGNORES debugger, add `--mode=development` to make it development mode
// to not have to run webpack to bundle every time while working, add `--watch`
// one-line command of all above: `webpack entry.js -o bundle.js --mode=development --watch`
// how to stop webpack from running? `ctrl + c`
const Cat = PI.Cat;

// FOR TESTING ONLY, EXTREMELY IMPORTANT!
window.Cat = Cat; // manually and intentionally set things on the window to be able to test on the chrome console
// DEBUGGING: think logically/rationally about what/how/why my data is what it is
// drop debuggers in EVERY STEP involved and inspect all values that are involved

const garfield = new Cat('garfield');
console.log(garfield.name);