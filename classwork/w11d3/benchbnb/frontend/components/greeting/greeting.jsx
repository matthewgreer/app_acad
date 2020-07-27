import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logoutUser }) => {
  
  if (currentUser) {
    return (
      <div>
        <h2>Welcome {currentUser}!</h2>
        <ul>
          <li>
            <button onClick={() => logoutUser()}>Log Out</button>
          </li>
        </ul>
      </div>
    )
  } else {
    return (
      <div>
        <h2>Welcome!</h2>
        <p>You've found the world's most dysfunctional, poorly-made website. Congratulations!</p>
        <p>You can click below, but nothing will happen. Ha ha. No users here!</p>
        <p>Why, you ask? Shoddy training and shitty instructions!</p>
        <p>LOL. Our 'full stack developer' doesn't know shit about this.</p>
        <p><Link to={`/api/users`} >Sign Up!</Link></p>
        <p><Link to={`/api/session/new`} >Sign In!</Link></p>
        <p><Link to=""> </Link></p>
      </div>
    )
  }
}

export default Greeting;
