import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';

// attach event listener to the page using vanilla JS
document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  // const hello = React.createElement('h1', null, 'React is up!');
  // const hello = <h1>React is still up!</h1>; 
    // using jsx here but browsers can't read jsx
    // babel will turn this back to es5 syntax when it transpiles the code(React.createElement())
  ReactDOM.render(<App name='Leo' />, root); // ReactDom.render can only take a single React component
});