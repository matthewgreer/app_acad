import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const store = createStore(rootReducer);
// store.dispatch method will invoke rootReducer passing in store.getState(), action

export default store;