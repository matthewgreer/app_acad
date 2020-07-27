import React from 'react';

class DogDetail extends React.Component {
  constructor(props) {
    super(props); // gives us access to 'this' and 'this.props' within the constructor

    this.state = {
      votes: 0
    };

    this.addBreedVote = this.addBreedVote.bind(this);
  }

  componentWillUnmount() {
    // debugger
  }

  addBreedVote() {
    // debugger
    this.setState({ votes: this.state.votes + 1 }); // increments votes for each dog breed
    this.props.addVote(); // addVote from DogIndex, passed to DogDetail via props, increments total votes
  }

  render() {
    // debugger
    return <li onClick={this.addBreedVote}>{this.props.breed}: {this.state.votes}</li>
  }

}

export default DogDetail;