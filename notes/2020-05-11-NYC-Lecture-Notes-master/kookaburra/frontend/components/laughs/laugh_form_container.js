import { connect } from 'react-redux';
import { createLaugh } from '../../actions/laugh_actions';
import LaughForm from './laugh_form';


// const mapStateToProps = state => {
//   return {};
// };

const mapDispatchToProps = dispatch => {
  // debugger
  // closed over `dispatch`
  return {
    createLaugh: laugh => dispatch(createLaugh(laugh))
  };
};

export default connect(null, mapDispatchToProps)(LaughForm);
// connect gives 1st argument `store.getState`
// connect gives 2nd argument `store.dispatch`