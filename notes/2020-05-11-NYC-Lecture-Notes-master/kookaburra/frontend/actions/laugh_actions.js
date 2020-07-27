import * as laughAPIUtil from '../util/laugh_api_util';

export const ADD_LAUGH = 'ADD_LAUGH'; // variables fail loudly!
export const ADD_LAUGHS = 'ADD_LAUGHS';


// action creators
const addLaugh = laugh => {
  // debugger;
  return {
    type: ADD_LAUGH,
    laugh: laugh
  };
};

const receiveLaughs = payload => {
  // debugger
  // we extract the two top level keys from the payload, which now contains users and laugh
  return {
    type: ADD_LAUGHS,
    laughs: payload.laughs,
    users: payload.users
  };
};

// thunk action creators
export const fetchLaughs = () => {
  // debugger
  return (dispatch) => { // dispatch comes from middleware
    // debugger
    // now our fetch will return users as well as laughs under separate keys in the payload because of the way we wrote `index.json.jbuilder`
    return laughAPIUtil.fetchLaughs().then((payload)=> {
      // the argument to success callback will be the responseJSON from the server. In this case, payload === responseJSON
      // debugger
      return dispatch(receiveLaughs(payload));
    });
  };
};

export const createLaugh = (laugh) => {
  // debugger
  return (dispatch) => {
    // debugger
    return laughAPIUtil.createLaugh(laugh).then((laugh)=> {
      // debugger
      return dispatch(addLaugh(laugh));
    });
  };
};

export const fetchLaugh = (id) => {
  return (dispatch) => {
    return laughAPIUtil.fetchLaugh(id).then((laugh) => {
      return dispatch(addLaugh(laugh));
    });
  };
};

window.addLaugh = addLaugh;