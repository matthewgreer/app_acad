import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // PHASE 1 = dumb
  // store.dispatch = addLoggingToDispatch(store);
  
  // PHASE 2 = dumber
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// PHASE 1
// In todo_redux.jsx, do the following steps:

  // Write a new function addLoggingToDispatch that receives the store as an argument
  // Save store.dispatch as a local variable
  // Return a function that receives an action as an argument
    // Log store.getState() - this is the old state
    // Log the action
    // Call your local copy of store.dispatch, passing it the action
    // Log store.getState() again - this is the new state
  // Inside the "DOMContentLoaded" callback reassign store.dispatch to your new function, passing in the store

// Test your code: If you interact with the app, can you see the old state, action, and new state in the console ? 
// *** Uhhh. Nope. Nada. Not a thing.

// const addLoggingToDispatch = store => {

//   const storeDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     storeDispatch(action);
//     console.log(store.getState());
//   }
// }

// PHASE 2 (the worsening)

// addLoggingToDispatch should return a function that receives the next middleware as an argument.
// This inner function will return yet another function that receives the action
// Inside all of this we will need to do the logging and invoke the next middleware with the action

// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });

// If the current middleware is addLoggingToDispatch, what is the result of addLoggingToDispatch(store)(dispatch) ?
// *** I have no fucking idea this is incomprehensible.  
//   What is next inside the logging function?
// *** another incomprehensible thing? who the fuck knows? i hope it involves a huge circular saw and the fuckwit that called this teaching software engineering.

//   return Object.assign({}, store, { dispatch });
// };