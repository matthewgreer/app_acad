export const ADD_ITEM = 'ADD_ITEM';
export const CLEAR_ALL = 'CLEAR_ALL';
// this is for preventing spelling errors.

// action object
// export const addEggs = {
//   type: ADD_ITEM,
//   name: 'eggs',
//   price: 10,
//   key: Math.floor(Math.random() * 1000) // for a unique identifier
// };

// action creator - a function that returns an action
export const addItem = (name, price) => {
  return {
    type: ADD_ITEM,
    name, // syntactic sugar for name: name, price: price
    price,
    key: Math.floor(Math.random() * 1000)
  };
};

export const clearAll = () => {
  return {
    type: CLEAR_ALL
  };
};