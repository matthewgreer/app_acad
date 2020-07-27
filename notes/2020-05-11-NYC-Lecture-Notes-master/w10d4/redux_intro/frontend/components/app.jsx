import React from "react";
// import Inventory from "./inventory/inventory_list";
import InventoryContainer from "./inventory/inventory_container";
// import Cart from "./cart/cart";
import CartContainer from "./cart/cart_container";
import { Provider } from 'react-redux';

// what is a prop?
// - pieces of information that we are giving to components.

// Provider is a special component borrowed from react-redux library which allows all of its child components access to Redux store

const App = ({ store }) => {
  return (
    <Provider store={store}>
      <main className="app">
        <h1>Redux Shopping</h1>
        {/* <Cart /> */}
        <CartContainer />
        {/* <Inventory /> */}
        <InventoryContainer />
      </main>
    </Provider>
  );
};

export default App;
