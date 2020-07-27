import entitiesReducer from './entities_reducer';

const rootReducer = (state = {}, action) => {
  // debugger
  return {
    entities: entitiesReducer(state.entities, action),
  };
};

export default rootReducer;

// {
//   entities: {
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
//   }
// }