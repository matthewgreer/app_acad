import { merge } from 'lodash';
import { ADD_ITEM, CLEAR_ALL } from '../actions/inventory_action';

const inventoryReducer = (state = {}, action) => {
  Object.freeze(state); // "please don't change me."
  // freezing your state is for good housekeeping making it immutable.

  // returns slice of state for inventory information 
  switch(action.type) {
    case ADD_ITEM:
      const { key, price, name } = action;
      const newItem = {
        [key]: { // for dynamically assigning key to newItem object
          name, // equivalent to name: name
          price, 
          id: key
        }
      };
      const newState = merge({}, state, newItem); 
      // combining state, and newItem onto {}. creating a brand new object

      return newState;
    case CLEAR_ALL:
      return {};
    default:
      return state;
  }
};

export default inventoryReducer;