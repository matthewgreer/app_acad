import { ADD_TO_CART } from '../actions/cart_action';
import { CLEAR_ALL } from '../actions/inventory_action';

const cartReducer = (state = [], action) => {
  Object.freeze(state);
  
  switch(action.type) {
    case ADD_TO_CART:
      // action = {type, id}
      const newState = state.slice(); // making a new array copy of state
      newState.push(action.id);

      return newState;
    case CLEAR_ALL:
      return [];
    default:
      return state;
  }
};

export default cartReducer;