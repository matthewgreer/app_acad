import React from "react";
import ReactDOM from "react-dom";
import App from "./components/app";
import store from './store/store';
// import rootReducer from './reducers/root_reducer';
import { addItem, clearAll } from './actions/inventory_action';
import { addToCart } from './actions/cart_action';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  window.store = store; // for testing purpose
  window.addItem = addItem;
  window.clearAll = clearAll;
  window.addToCart = addToCart;

  ReactDOM.render(<App store={store} />, root);
});
