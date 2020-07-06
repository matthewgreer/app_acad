// sum
// Write a sum function that takes any number of arguments:

// sum(1, 2, 3, 4) === 10;
// sum(1, 2, 3, 4, 5) === 15;
// Solve it first using the arguments keyword, then rewrite your solution 
//  to use the ...rest operator.

function sum () {
    let total = 0;

    for (let i = 0; i < arguments.length; i++) {
        total += arguments[i];
    }
    return total;
}

function sumV2 (...args) {
    let total = 0;

    for (let i = 0; i < args.length; i++) {
        total += args[i];
    }

    return total;
}

// console.log(sum(1, 2, 3, 4, 5));
// console.log(sumV2(1, 2, 3, 4));