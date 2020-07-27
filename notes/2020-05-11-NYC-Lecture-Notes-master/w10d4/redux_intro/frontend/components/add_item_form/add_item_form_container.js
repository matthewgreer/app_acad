import { connect } from 'react-redux';
import AddItemForm from './add_item_form';
import { addItem } from '../../actions/inventory_action';

const mdp = (dispatch) => {
  return {
    addItem: (name, price) => dispatch(addItem(name, price))
  };
};

export default connect(null, mdp)(AddItemForm);
// we are passing in null to connect function because connect function expects mapStateToProps as a first argument, but because we are not looking to provide any information from redux state, no need for us to create one, so passing in null as a placeholder.
