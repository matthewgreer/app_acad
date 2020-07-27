import { connect } from 'react-redux';
import Cart from './cart';
import { clearAll } from '../../actions/inventory_action';

const msp = (state) => {
  return {
    items: state.cart.map( id => state.inventory[id] )
  };
};

const mdp = (dispatch) => {
  return {
    clear: () => dispatch(clearAll())
  };
};

export default connect(msp, mdp)(Cart);