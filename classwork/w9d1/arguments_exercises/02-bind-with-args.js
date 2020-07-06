// Rewrite your myBind method so that it can take both bind - time arguments 
//  and call - time arguments.

Function.prototype.myBind1 = function (ctx) {
      const that = this;
      const bindArgs = Array.from(arguments).slice(1);
      
      return function _myBind() {
            const callArgs = Array.from(arguments);
            return that.apply(ctx, bindArgs.concat(callArgs));
            //use apply
      };
};

Function.prototype.myBind2 = function (ctx, ...bindArgs) {
      const that = this;
      
      return function (...callArgs) {
        return that.apply(ctx, bindArgs.concat(callArgs));
      };
};

// A few examples:
      class Cat {
        constructor(name) {
          this.name = name;
        }

        says(sound, person) {
          console.log(`${this.name} says ${sound} to ${person}!`);
          return true;
        }
      }

      class Dog {
        constructor(name) {
          this.name = name;
        }
      }

      const markov = new Cat("Markov");
      const pavlov = new Dog("Pavlov");

      markov.says("meow", "Ned");
      // Markov says meow to Ned!
      // true

      // bind time args are "meow" and "Kush", no call time args
      markov.says.myBind(pavlov, "meow", "Kush")();
      // Pavlov says meow to Kush!
      // true

      // no bind time args (other than context), 
      //  call time args are "meow" and "a tree"
      markov.says.myBind(pavlov)("meow", "a tree");
      // Pavlov says meow to a tree!
      // true

      // bind time arg is "meow", call time arg is "Markov"
      markov.says.myBind(pavlov, "meow")("Markov");
      // Pavlov says meow to Markov!
      // true

      // no bind time args (other than context), call time args are "meow" and "me"
      const notMarkovSays = markov.says.myBind(pavlov);
      notMarkovSays("meow", "me");
      // Pavlov says meow to me!
      // true


// Solve it first using the arguments keyword.

// Within your myBind method, you'll have to define a new, anonymous function 
//  to be returned. Be careful: using arguments inside the anonymous function 
//  will not give you the arguments passed to myBind, because arguments is reset 
//  on every function invocation (just like this).

// That makes sense, because there are two arrays of arguments you care about: 
//  the extra arguments passed to myBind, and 
//  the arguments passed when the bound function is called.

// const bindArgs = Array.from(arguments).slice(1);
// args = Array.prototype.slice.call(arguments);


// Once you've done that, write a second version using the ... rest operator.

// Function.prototype.myBind1 = function (ctx, ...bindArgs) {

// }
