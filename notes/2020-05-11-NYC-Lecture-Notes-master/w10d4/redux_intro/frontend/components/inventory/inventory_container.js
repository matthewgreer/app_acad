import { connect } from 'react-redux';
import { addToCart } from '../../actions/cart_action';
import InventoryList from './inventory_list';
// container/connected component

// a function for taking information from state from redux store and inserting as part of props for the presentational component that we are connecting.
const mapStateToProps = (state) => {
  return {
    inventory: Object.values(state.inventory) // converting to an array so our presentational component can easily iterate through
  };
};

// a function for providing ways for components to communicate with our redux store. These ways will be part of props.
const mapDispatchToProps = (dispatch) => {
  return {
    addToCart: (id) => dispatch(addToCart(id))
  };
};

// example of currying
const containerFunc = connect(mapStateToProps, mapDispatchToProps);
const containerComponent = containerFunc(InventoryList);

export default containerComponent;