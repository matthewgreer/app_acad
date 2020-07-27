Function.prototype.inherits = function (Parent) {
    function Surrogate() { }
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};

// fat arrow function is NOT allowed for JS assessment in `myBind`
Function.prototype.myBind = function (context, ...bindArgs) { // can pass in args that are also bound to that func forever
    const that = this;
    return function (...callArgs) { // this fn closed over `context`,`bindArgs`,`that` 
        return that.apply(context, bindArgs.concat(callArgs));
    };
};

function bindTest(a,b,c,d) {
    return this + a + b + c + d;
}

const bound = bindTest.myBind("this", "a", "b"); // `myBind` returns func in line 10
const thing = bound("c", "d");
// console.log(thing); // console logs `undefined`




function twoArgs(cat, dog) {
    // does stuff
}
// const garfieldTwoArgs = twoArgs.bind(null, garfield); // specific custom func for specific cat object

// 'thisabcd' would get console logged

Function.prototype.myCurry = function (numArgs) {
    let nums = [];
    let fcn = this;
    return function _myCurry(el) {
        nums.push(el);
        if (nums.length < numArgs) {
            return _myCurry;
        } else {
            return fcn(...nums);
        }
    };
};

Function.prototype.myApply = function (context, args = []) {
    return this.bind(context)(...args);
};

Function.prototype.myCall = function (context, ...args) {
    return this.bind(context)(...args);
};