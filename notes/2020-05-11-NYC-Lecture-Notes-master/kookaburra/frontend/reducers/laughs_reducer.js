import { ADD_LAUGH, ADD_LAUGHS } from '../actions/laugh_actions';

const laughsReducer = (state = {}, action) => {
  // debugger
  Object.freeze(state);
  switch (action.type) {
    case ADD_LAUGH:
      // debugger
      // const newLaugh = action.laugh;
      return Object.assign({}, state, action.laugh);
    case ADD_LAUGHS:
      // debugger
      return action.laughs; // `action.laughs` is a POJO from the database
    default:
      return state;
  }
};

export default laughsReducer;
// {
//  1: {
//       body: 'haha',
//       authorId: 1,
//     }
// }

