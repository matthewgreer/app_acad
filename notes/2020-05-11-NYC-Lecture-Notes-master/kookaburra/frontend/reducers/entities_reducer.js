import laughsReducer from './laughs_reducer';
import usersReducer from './users_reducer';

const entitiesReducer = (state = {}, action) => {
  // debugger
  return {
    laughs: laughsReducer(state.laughs, action),
    users: usersReducer(state.users, action)
  };
};

export default entitiesReducer;

// {
//     laughs: {
//       1: {
//         body: 'haha',
//         authorId: 1,
//       }
//     },
//     users: {
//       1: {
//         name: 'hi',
//         laughIds: [1]
//       }
//     }
// }