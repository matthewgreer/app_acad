import { RECEIVE_USERS, RECEIVE_USER } from "../actions/user_actions";
import { merge } from "lodash";
import { ADD_LAUGHS } from "../actions/laugh_actions";
export default (state = {}, action) => {
    switch (action.type) {
        case ADD_LAUGHS:
            // since the add laughs action returns users, this reducer must respond
            // debugger
            return action.users;
        default:
            return state;
    }
};