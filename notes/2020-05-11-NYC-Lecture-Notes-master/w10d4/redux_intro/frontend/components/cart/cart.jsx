import React from "react";

const Cart = ({ items = [], clear }) => {
  return (
    <section className="cart">
      <h4>My Cart</h4>
      <button className="clear-button" onClick={clear}>Clear</button>
      <ul>
        {items.map(item => (
          <li key={item.id}>
            {item.name}: {item.price}
          </li>
        ))}
      </ul>
    </section>
  );
};

export default Cart;
