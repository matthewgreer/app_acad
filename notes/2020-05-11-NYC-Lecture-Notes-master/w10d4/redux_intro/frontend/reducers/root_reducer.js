import { combineReducers } from 'redux';
import inventoryReducer from "./inventory_reducer";
import cartReducer from "./cart_reducer";

// EVERY ACTION HITS EVERY REDUCER
// WE DO NOT INVOKE OUR REDUCERS. store dispatch does

// Two ways to configure the root reducer

// first way
// const rootReducer = (state = {}, action) => {
//   // return state;
  
//   return {
//     inventory: inventoryReducer(state.inventory, action),
//     cart: cartReducer(state.cart, action)
//   };

// };
// export default rootReducer;

// second way
export default combineReducers({
  cart: cartReducer,
  inventory: inventoryReducer
});

// same as
// const rootReducer = combineReducers({
//   cart: cartReducer,
//   inventory: inventoryReducer
// });

// export default rootReducer;
