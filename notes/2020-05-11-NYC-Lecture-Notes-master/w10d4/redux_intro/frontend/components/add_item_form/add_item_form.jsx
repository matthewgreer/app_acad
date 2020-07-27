import React from "react";

// an example of a controlled component
// - is a presentational component that track internal state and use that state to hold values for input fields

class AddItemForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: "", price: "" }; // internal component state, not redux state
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault(); // preventing from browser to refresh
    // debugger;
    const { name, price } = this.state;
    this.props.addItem(name, price);
  }

  update(field) {
    return e => {
      this.setState({ [field]: e.target.value });
    };
  }

  render() {
    return (
      <form className="add-form" onSubmit={this.handleSubmit}>
        <label>
          Name
          <input
            type="text"
            onChange={this.update("name")}
            value={this.state.name}
          />
        </label>
        <label>
          Price
          <input
            type="text"
            onChange={this.update("price")}
            value={this.state.price}
          />
        </label>
        <input type="submit" value="Add New Item" />
      </form>
    );
  }
}

export default AddItemForm;
