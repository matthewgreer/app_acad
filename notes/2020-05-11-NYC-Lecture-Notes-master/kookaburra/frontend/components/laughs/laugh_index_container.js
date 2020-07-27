import { connect } from 'react-redux';
import { fetchLaughs } from '../../actions/laugh_actions';

import LaughIndex from './laugh_index';

const mapStateToProps = (state) => {
  // debugger
  return {
    laughs: Object.values(state.entities.laughs),
    users: state.entities.users
  };
};

const mapDispatchToProps = (dispatch) => {
  // debugger
  return {
    fetchLaughs: () => dispatch(fetchLaughs())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(LaughIndex); 
// subscribes the react component to store
// under the hood it keeps track of if we've already mapped dispatch to props
