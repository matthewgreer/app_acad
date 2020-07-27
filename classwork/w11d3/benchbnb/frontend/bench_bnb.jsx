import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
    const store = configureStore();

    // TESTES TESTES ONE TWO... THREE?
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    // END OF TESTES

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);
});




