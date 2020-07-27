import React from 'react';
import { connect } from 'react-redux';
import { fetchLaugh } from '../../actions/laugh_actions';

class LaughShow extends React.Component {
  componentDidMount() {
    // debugger;
    this.props.fetchLaugh(this.props.match.params.laughId);
  }
  
  componentDidUpdate(prevProps) {
    // debugger;
    if (this.props.match.params.laughId !== prevProps.match.params.laughId) {
      this.props.fetchLaugh(this.props.match.params.laughId);
    }
  }

  render() {
    // debugger;
    return <p>{this.props.laugh.body}</p>;
  }
}

const msp = (state, ownProps) => {
  const laughId = ownProps.match.params.laughId;
  const laugh = state.entities.laughs[laughId] || {};

  return {
    laugh
  };
};

const mdp = (dispatch) => {
  return {
    fetchLaugh: id => dispatch(fetchLaugh(id))
  };
};

export default connect(msp, mdp)(LaughShow);