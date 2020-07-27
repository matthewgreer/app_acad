import React from 'react';

class LaughForm extends React.Component {
  constructor(props) {
    // debugger
    super(props)

    this.state = { body: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (e) => {
      this.setState({ [field]: e.target.value });
    };
  }

  handleSubmit(e) {
    // debugger
    e.preventDefault();
    const newLaugh = {
      body: this.state.body,
    }
    this.props.createLaugh(newLaugh);
    this.setState({ body: "" })
  }

  render() {
    // debugger
    return (
      <>
        <h2>Make a new laugh!</h2>
        
        <form onSubmit={this.handleSubmit}>
          <label htmlFor="laugh-body">Body</label>
          <input
            type="text"
            id="laugh-body"
            onChange={this.update("body")}
            value={this.state.body}
          />

          <button>Send it!</button>
        </form>
      </>
    );
  }

}

export default LaughForm;