import React from 'react';
import DogDetail from './dog_detail'; 
import { fetchDogGif } from './util';

// component state -> internal data for a component
  // we can mutate/update/add to state
  // can pass data from state to child components as props

// classical component
class DogIndex extends React.Component { // Component needs to have capital 'C' 
  constructor(props) {
    super(props); 
      // need to invoke super to have access to 'this' within the constructor
      // if we invoke with props passed in, we will have access to this.props
    // debugger
    // set initial state
    this.state = {
      totalVotes: 0,
      gif: null,
      selected: 'Corgi'
    };

    this.addVote = this.addVote.bind(this); 
      // bind in constructor to only bind once
      // we could bind within the render but then we would bind everytime the component re-renders

    this.breeds = [
      "Cabadoodle",
      "Corgi",
      "Pug",
      "Shiba"
    ];
  }

  componentDidMount() {
    // debugger
    fetchDogGif().then(res => {
      // debugger
      this.setState({ gif: res.data.image_url }); // updating state will trigger a re-render
    });
  }

  componentDidUpdate() {
    // debugger

    // this will cause an infinite update, everytime we get a new gif, that triggers another componentDidUpdate, which fetches another gif, etc
    // fetchDogGif().then(res => {
    //   // debugger
    //   this.setState({ gif: res.data.image_url }); // updating state will trigger a re-render
    // }); 
  }

  addVote() {
    // this.state.totalVotes += 1; // DON'T DO THIS
    // debugger 
    const { totalVotes } = this.state; // destructuring - will create local variable 'totalVotes' equal to this.state.totalVotes
    this.setState({ totalVotes: totalVotes + 1 }); 
      // setState takes in optional callback as second arg
  }

  // all components must have a render method
  render() {
    // if (!this.state.gif) return null;
    // debugger
    const breedLis = this.breeds.map((breed, idx) => {
      if (this.state.selected === breed) {
        return <DogDetail key={idx} breed={breed} addVote={this.addVote} />;
      } else {
        return <li key={idx} onClick={() => this.setState({ selected: breed })}>{breed}</li>;
      }
    });

    const image = this.state.gif ? <img src={this.state.gif} /> : null;

    return (
      <>
        <h1>Dog Breeds</h1>
        <h2>Total Votes: {this.state.totalVotes}</h2>

        <ul>
          {breedLis}
        </ul>
        {image}
      </>
    );
  }
}

export default DogIndex;