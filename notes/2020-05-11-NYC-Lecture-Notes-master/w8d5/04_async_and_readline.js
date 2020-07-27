// Asynchronous Code! 

// Synchronous code
// - run code line by line in the order they are defined

// Asyncronous code
// - allowing code to be run some other time
// - does not run until after all the synchronous codes has been executed
// - allows us to defer behavior until it should occur
// - this is where the concept of 'event loop' comes into play

// all sync code runs BEFORE any async code.

// console.log("Setting the timer...");

// // setTimeout is an async function available in global
// // setTimeout(callback, milliseconds);
// setTimeout(function () { 
//     console.log('times up!');
// }, 0);

// // while (true) {
// //   console.log('ok now really times up');
// // }
// console.log('ok now really times up');



















// readline and require libraries are provided by node environment NOT by browser

const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
// .question(prompt, callback)

rl.question("What do you think of JavaScript? ", (answer) => {
    console.log(`Thank you for your feedback: ${answer}.`);

    rl.question("What do you really think of JavaScript? ", answer => {
        console.log(`You said ${answer}. Thanks for your honesty.`);
        rl.close();
    });

}); 

// rl.close();
// rl.question was invoked, but rl.close() sync code closed the readline interface right away.