import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";

import App from "./components/app";

// const defaultState = {
//   entities: {
//     users: {
//       1: {
//         id: 1,
//         name: "Ada Lovelace",
//       },
//       2: {
//         id: 2,
//         name: "Grace Hopper",
//       },
//       3: {
//         id: 3,
//         name: "Richard Stallman",
//       },
//     },
//     laughs: {
//       1: {
//         id: 1,
//         body:
//           'who is screaming "log off" at my house. show yourself, coward. i will never log off',
//         author_id: 1,
//       },
//       2: {
//         id: 2,
//         body:
//           "hear this trolls: ive been secretly respecting the flag in the privacy of my garage for 12 hrs a day , maxing out its power to insane levels",
//         author_id: 2,
//       },
//       3: {
//         id: 3,
//         body:
//           "hi, grandma? can u come pick me up from my rap battle? it's over. no, i lost. he saw u drop me off & did a pretty devastating rhyme about it",
//         author_id: 3,
//       },
//     },
//   },
// };

document.addEventListener("DOMContentLoaded", () => {
  // debugger
  const store = configureStore({});

  // TESTING
  window.getState = store.getState;
  // TESTING

  const root = document.getElementById("root");
  ReactDOM.render(<App store={store} />, root);
});
