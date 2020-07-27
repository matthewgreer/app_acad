## Agenda
1. Solutions / JS Questions
2. Callbacks Recap
3. Classes (ES6)
4. Context (styles of function invokation)
5. Bind!
6. Async
7. Readline + VSCode debugger demo 


### Extra notes on JS
```javascript
// place semi-colon at the end of expression
//  - function invokation is an expression
//  - return statement is an expression
//  - for assignment as well

// different ways to declare a function
function namedFunc() {
  return;
}

const annonymousFunc = function() {
  return;
};

const annonymousFunc2 = () => {
  return;
};

// example of using callback as an argument
[1, 2, 3].forEach(function(el) {
  console.log(el);
});

// rest/spread operator on js works similar to splat operator on ruby
// ... vs *

// i++ vs ++i
//  - both cases increments i by one
//  - return value is different
//    - let's say i = 0 (original)
//    - i++ returns 0 then incremented to i = 1
//    - ++i increments i then returns i = 1

// good convention to capitalize your constants.
//  - ex) const NUMS = [1, 2, 3, 4];

// 'const' is used for a security measures. Also shows good understanding of usage of the 'const' signal.
// good tip: use 'const' and if run into an error, convert it to 'let'.

// closure is when a function has access to all the variables in the scope inside of which it was declared.

// KAHOOT
// What is a callback?
//  - a function (used as an argument)
//  - an argument
//  - an object (everything that isn't primitive is an object)
//  - not a data type
```