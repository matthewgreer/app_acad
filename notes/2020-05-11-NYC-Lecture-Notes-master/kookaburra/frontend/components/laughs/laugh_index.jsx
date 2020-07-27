import React from 'react';

class LaughIndex extends React.Component {

  constructor(props) {
    // debugger
    super(props);
  }

  componentDidMount() { 
    // invoked after component has rendered first time / mounted
    // debugger
    this.props.fetchLaughs();
  }

  render() {
    // debugger
    if (this.props.laughs.length == 0) {
      return <span>No laughs yet!</span>;
    }

    const laughLis = this.props.laughs.map(laugh => {
      const author = this.props.users[laugh.author_id];

      return <li key={laugh.id}>{laugh.body}  :  {author.username}</li>
    });

    return <ul>{laughLis}</ul>;
  }

};

export default LaughIndex;