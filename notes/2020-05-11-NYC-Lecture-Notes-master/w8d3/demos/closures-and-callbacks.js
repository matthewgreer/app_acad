
// CALLBACKS
  // functions that are given to other functions as arguments
  // similar to procs in Ruby
  // not to be confused with `callbacks` in Rails

// Lets write a function that takes a callback...
function takesCallback(callback) {
  callback();
}

// Now lets write our callback!
function thisIsACallback() {
  console.log("hello");
}
// takesCallback(thisIsACallback); invoked with callback

// takesCallback(function() { console.log('something'); });
// defining a callback argument inline as we invoke `takesCallback`


// CLOSURES
// function below is an example of returning a function that "closes over" `order`.
// function dinerBreakfast() {
//   let order = `I'd like cheesy scrambled eggs please.`; // this variable is being reassigned every time the function in line 27 is invoked
//   console.log(order);
//   debugger
//   return function (food) { // whenever declaring a function, it will close over any variables existing or declared (in this case, `order`) in the same scope
//     debugger
//     order = `${order.slice(0, order.length - 8)} and ${food} please.`;
//     console.log(order);
//   };
// };

function dinerBreakfast(eggType) {
  let order = `I'd like ${eggType} please.`; // this variable is being reassigned every time the function in line 27 is invoked
  console.log(order);
  return function (food) { // whenever declaring a function, it will close over any variables existing or declared (in this case, `order`) in the same scope
    debugger
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(eggType);
  };
};