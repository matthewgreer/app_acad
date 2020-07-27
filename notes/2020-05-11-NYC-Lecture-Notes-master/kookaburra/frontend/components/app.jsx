import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter, Route, Switch } from 'react-router-dom';

import LaughFormContainer from './laughs/laugh_form_container';
import LaughIndexContainer from './laughs/laugh_index_container';
import LaughShow from './laughs/laugh_show';

const App = ({ store }) => {
  // debugger
  return (
    <Provider store={store}>
      <HashRouter>
        <>
          {/* <LaughFormContainer /> */}
          {/* <LaughIndexContainer /> */}
          <Switch>
            <Route path="/laughs/:laughId" component={LaughShow} />
            <Route path="/" component={LaughIndexContainer} />
          </Switch>
        </>
      </HashRouter>
    </Provider>
  );
};
export default App;