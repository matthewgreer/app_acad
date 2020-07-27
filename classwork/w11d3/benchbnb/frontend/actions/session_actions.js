export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

import * as APIUtil from "../util/session_api_util"

export const receiveCurrentUser = (currentUser) => {
    return {
        type: RECEIVE_CURRENT_USER,
        currentUser
    }
};

export const logoutCurrentUser = () => {
    return {
        type: LOGOUT_CURRENT_USER,
    }
};

export const receiveErrors = (errors) => {
    return {
        type: RECEIVE_ERRORS,
        errors
    }
};

// no idea how to handle the errors here, just copied from solution

export const login = user => dispatch => APIUtil.login(user)
    .then((user) => dispatch(receiveCurrentUser(user)));
    

export const logout = _ => dispatch => APIUtil.logout()
    .then(() => dispatch(logoutCurrentUser()));

export const signup = user => dispatch => APIUtil.signup(user)
    .then((user) => dispatch(receiveCurrentUser(user)));
