import {
    RECEIVE_CURRENT_USER,
    RECEIVE_ERRORS
} from '../actions/session_actions';

const _nullErrors = {
    id: null
};

const sessionErrorsReducer = (oldState = _nullErrors, action) => {
    Object.freeze(oldState);
    switch(action.type) {
        case RECEIVE_ERRORS:
            const errors = action.errors;
            return Object.assign({ errors });
        case RECEIVE_CURRENT_USER:
            return _nullErrors;
        default:
            return oldState;
    }
};

export default sessionErrorsReducer;