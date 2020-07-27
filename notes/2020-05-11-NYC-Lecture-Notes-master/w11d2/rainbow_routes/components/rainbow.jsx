import React from 'react';
import {
  Route,
  Link,
  NavLink,
  withRouter
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

const MyRoute = (props) => {
  debugger;
  const Component = props.component;
  // const relPath = window.location.href.split("#")[1];
  const relPath = props.location.pathname;

  return relPath === props.path ? <Component /> : null;
};

const MyRoute2 = withRouter(MyRoute);

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>

        <NavLink to='/red' >Red</NavLink>
        <NavLink to='/green' >Green</NavLink>
        <NavLink to='/blue' >Blue</NavLink>
        <NavLink to='/violet' >Violet</NavLink>

        <div id="rainbow">
          {/* <Route path="/red" component={Red} /> */}
          <MyRoute2 exact path="/red" component={Red} />
          <Route exact path="/green/:green_id" component={Green} />
          <Route exact path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
};

export default Rainbow;
