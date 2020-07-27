function boringAddThreeNumbers(num1, num2, num3) {
    return num1 + num2 + num3;
}

// currying saves arguments and invokes function when args have been collected
function addThreeNumbers(firstNum) {
    return function(secondNum) {
        return function(thirdNum) {
            return firstNum + secondNum + thirdNum;
        }
    }
}

// boringAddThreeNumbers(1, 2, 3);
// returns 6
// addThreeNumbers(1);
// ƒ(secondNum) {
//     return function (thirdNum) {
//         return firstNum + secondNum + thirdNum;
//     }
// }
// addThreeNumbers(1)(2);
// ƒ(thirdNum) {
//     return firstNum + secondNum + thirdNum;
// }
// addThreeNumbers(1)(2)(3); // successive invocation 3 times
// 6


const addThreeNumbersAgain = num1 => {
    return num2 => {
        return num3 => {
            return num1 + num2 + num3;
        }
    }
};

function continuousAdd() { // calculator "creator/generator" function
    debugger;
    const args = []; // `args` array gets closed over by `_curriedAdd` function once `continuousAdd` is invoked
    // `_` refers to function handled inside 
    return function _curriedAdd(num) { // this func declaration closes over `args`
        debugger;
        args.push(num); // add new num to array
        console.log(args.reduce((acc, el) => {
            return acc + el;
        }));
        return _curriedAdd; // referencing same function defined above
    }
}

// const calculator = continuousAdd();
// calculator
// ƒ _curriedAdd(num) {
//     args.push(num);
//     console.log(args.reduce((acc, el) => {
//         return acc + el;
//     }));
//     return _curriedAdd;
// }
// calculator(1);
// 1 // returns 1 
// ƒ _curriedAdd(num) {
//     args.push(num);
//     console.log(args.reduce((acc, el) => {
//         return acc + el;
//     }));
//     return _curriedAdd;
// }
// calculator(2);
// 3 // returns 1 + 2
// ƒ _curriedAdd(num) {
//     args.push(num);
//     console.log(args.reduce((acc, el) => {
//         return acc + el;
//     }));
//     return _curriedAdd;
// }
// calculator(3);
// 6 // returns 1 + 2 + 3
// ƒ _curriedAdd(num) {
//     args.push(num);
//     console.log(args.reduce((acc, el) => {
//         return acc + el;
//     }));
//     return _curriedAdd;
// }