// const readline = require("readline");

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// function askIfGreaterThan(el1, el2, callback) {
//   reader.question(`Is ${el1} greater than ${el2}? (y/n) `, (response) => {
//     if (response === "y") {
//       callback(true);
//     } else {
//       callback(false)
//     }
//   });
// }

// function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
//   if (i === arr.length - 1) {
//     outerBubbleSortLoop(madeAnySwaps);
//   } else {
//     askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
//       if (isGreaterThan) {
//         arr[i], arr[i + 1] = arr[i + 1], arr[i];
//         madeAnySwaps = true;
//       }
//     });
//     innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
//   }

// }

// function absurtBubbleSort(arr, sortCompletionCallback) {
//   function outerBubbleSortLoop(madeAnySwaps) {

//   } 
// }


// ================= STARTING OVER ===================

const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(`Is ${el1} greater than ${el2}? Y or N?  `, (answer) => {
    if(answer === "Y") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], function (greaterThan) {
      if(greaterThan) {
        arr[i], arr[i + 1] = arr[i + 1], arr[i];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([7, 3, 8, 3, 2, 4, 3, 7, 9, 1, 10, 2], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});