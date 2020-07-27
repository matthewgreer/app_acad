import { postUser, 
  postSession, 
  deleteSession
 } from '../utils/session';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

// action creators -- return actions (POJOS) with type (& payload)

const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user  // shorthand assigned -- user: *whatever values a user has*
});

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});


// thunk action creators -- 

export const createNewUser = formUser => dispatch => postUser(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => postSession(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => deleteSession()
  .then(() => dispatch(logoutCurrentUser()));