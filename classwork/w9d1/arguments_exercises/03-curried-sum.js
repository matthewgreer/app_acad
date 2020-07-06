// Write a curriedSum function that takes an integer(how many numbers to sum) 
//  and returns a function that can be successively called with single arguments 
//  until it finally returns a sum.That is:

// const sum = curriedSum(4);
// sum(5)(30)(20)(1); // => 56


// Hint: curriedSum(numArgs) should:
//   Define an empty array, numbers.
//   Defines a function, _curriedSum that:
//     Closes over numArgs and numbers.
//     Takes a single number as an argument.
//     Appends this to numbers each time.
//     If numbers.length === numArgs, it sums the numbers in the array and 
//      returns the result.
//     Else, it returns itself.
//   Returns _curriedSum.
  
// If you're confused, think of it this way: _curriedSum keeps collecting arguments 
//  and returning itself until it has enough arguments, at which point it actually 
//  does the required work of summing.

function curriedSum (numArgs) {
    let numbers = [];
    return _curriedSum;

    function _curriedSum (arg) {
        // debugger
        numbers.push(arg);

        if (numbers.length === numArgs) {
            let total = 0;

            numbers.forEach ((ele) => {
                total += ele;
            });
            return total;
        } else {
            return _curriedSum;
        }
    }
}   

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56