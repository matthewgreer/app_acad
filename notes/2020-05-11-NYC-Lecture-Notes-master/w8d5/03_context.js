function barkingDog() {
  console.log(this);
  console.log('woof woof!');
}

// how would you invoke ^ function constructor style?
//  - you wouldn't, but if you really wanted to?
//    - new barkingDog();

function Dog(name) {
  this.name = name;
}

Dog.prototype.bark = function () {
  console.log(`${this.name} is barking!`);
};

Dog.prototype.barkAt = function (thing1, thing2) {
  console.log(`${this.name} is barking at ${thing1} and ${thing2}!`);
};


// Three different styles of function invokation
//  - context is different for these various styles
//      - Context means whatever 'this' refers to.

// function style
//  ex) barkingDog();
//  - context is the global object
//    - for node => global
//    - for browser => window

// constructor style
//  ex) const toby = new Dog("Toby");
//  - context is the 'new object/instance' that will be created

// method style
//  ex) toby.bark();
//  - context is the receiver of the method(bark).

// constructor function is the function that is used to create a new instance with additional properties that we define within the function.


function times(num, cb) {
  for (let i = 0; i < num; i++) {
    cb(); // callback invoked as a function style
  }
}

const toby = new Dog("Toby");
times(3, toby.bark);
// " is barking!" printed 3x
// toby.bark is being invoked function style and the context for function style invokation is the global object.

// bind is a method for functions
// - call it on a function and pass in a desired context(object which 'this' will refer to) and get back a bound function
// ex) someFunc.bind(ctx) => boundSomeFunc
// - *** bind returns another function. specifically a bound function / a function that bound context

function times(num, cb, ctx) {
  for (let i = 0; i < num; i++) {
    cb.bind(ctx)(); // callback invoked as a function style
  }
}

// Two additional ways to invoke a function (with a context bound):
//  - call and apply
// difference between bind and call
//  - bind produces a bound function
//  - call binds the context and invokes it right away
// difference between call and apply
//  - how you pass in subsequent arguments
//  - ex) someFunc.call(ctx, arg1, arg2, etc);
//  - ex) someFunc.apply(ctx, [arg1, arg2, etc]);

// all callbacks always invoked FUNCTION STYLE
// so, we use bind to bind context to the callback












function Dog() {
    this.name = 'Toby';
    this.info = "The goodest boy in the whole world";
    this.fluffRank = "extreme";
}

Dog.prototype.readStats = function () {
    console.log(this.info);
    console.log(this.fluffRank);
};

Dog.prototype.doTricks = function (trick1, trick2) {
    console.log(`${this.name} is so awesome. They can ${trick1} and ${trick2}`);
};


function TA() {
    this.name = 'Andy';
    this.info = "What a guy!";
    this.fluffRank = "depends how long since last shave";
}

toby = new Dog();
andy = new TA(); 