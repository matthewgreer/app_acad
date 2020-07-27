// simple myBind with arrow fn
// this implementation will not be allowed on test
// Function.prototype.myBind = function (ctx) { // method-style invocation
//   // `this` refers to the function instance
//   console.log(this);
//   debugger;
//   return () => { // return a copy of func that is perm bound to a certain ctx
//     debugger;
//     return this.apply(ctx); // important to explicitly return when invoked
//   }
// };

function sayHello() {
  console.log(`${this.name} says hi!`);
}

const obj = {
  name: 'Garfield'
}

// myBind with function keyword
Function.prototype.myBind = function (ctx) {
  debugger;
  let that = this; // explicitly saving ctx and closing over it with function declaration below
  return function () { // es5 anon func, can't preserve context like fat-arrow
    debugger;
    return that.apply(ctx); // `call` and `apply` are ways to invoke the function with the context passed in
  }
};

const boundSayHello = sayHello.myBind(obj); // call `myBind` on specific function so `this` is that function instance in myBind
boundSayHello();
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   meow() {
//     console.log(`${this.name} says meow!`);
//   }
// }


// const curie = new Cat("Curie");
// setTimeout(curie.meow.myBind(curie), 1000);
