// Write a method Function.prototype.curry(numArgs).
//  This should return a function that will:

//   Collect up arguments until there are numArgs of them,
//   If there are too few arguments still, it should return itself.
//   When there are numArgs arguments, it should call the original function.

//   Write a version that uses Function.prototype.apply and another one that
//    uses ... (the spread operator).

Function.prototype.curry1 = function (numArgs) {
    let arr = [];
    let that = this;

    return _curry;

    function _curry(arg) {
        arr.push(arg);

        if (arr.length === numArgs) {
            return that.apply(null, arr);
        } else {
            return _curry;
        }
    }
}

// function boringAddThreeNumbers(num1, num2, num3) {
//   return num1 + num2 + num3;
// }
// console.log(boringAddThreeNumbers.curry(3)(4)(4)(5));

Function.prototype.curry = function (numArgs) {
    let arr = [];
    let that = this;

    return _curry;

    function _curry(arg) {
        arr.push(arg);

        if (arr.length === numArgs) {
            return that(...arr);
        } else {
            return _curry;
        }
    }
}

function boringAddThreeNumbers(num1, num2, num3) {
  return num1 + num2 + num3;
}
console.log(boringAddThreeNumbers.curry(3)(4)(4)(5));