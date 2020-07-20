import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(rootReducer, applyMiddleware(thunk));
};

// doesn't matter that rootReducer is called combineReducers in 
// root_reducer.js
// whatever name we give it when we import it on line 3 is what
// it's named here.

export default configureStore;