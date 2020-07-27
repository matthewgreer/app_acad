## Agenda
1. Review (everything's coming together!)
2. Frontend routing
3. Building a Route component
4. React-Router


## Order of operation
**Don't memorize this list, Digest the flow**
1. making HTTP request returns HTML, also loads JavaScript
2. DOMContentLoaded event callback (Configuration process)
  - create the redux store
    - reducer setup happens while configuring redux store
  - hook react to DOM
  - wrap all components in Provider to gain access to redux store
3. hit MSP and MDP while rendering container/connected component (Collecting props)
  - MSP - provides data from redux state and have it available as our props
    - runs every time update in redux state
  - MDP - provides methods, which interacts with redux dispatch as our props
    - runs only once during setup
4. hit constructor for our presentation component, then render(), 
5. then componentDidMount() - LaughIndex Component
6. dispatches action(thunk action/function)
  - intercepted by thunk middleware
  - since action is function, so the middleware invokes the action passing in dispatch
  - invokes ajax request
7. hits the backend and returns json data
    - (backend) router -> controller -> models -> db -> models -> controller -> views -> controller -> frontend
8. ajax promise handles response from the server
  - if correct data gets returned, success callback gets invoked
  - with the returned data, the regular action creator returns an action pojo 
9. dispatches action(pojo)
  - intercepted by thunk middleware, but since action is not a function, it is passed to next middleware(logger) or if there is no more middlewares, then the action is passed to the root reducer
10. hit reducers
  - root reducer then invokes all of intergrated reducers
  - resource reducers will return updated slice of redux state (SHOULD return normalized state)
11. redux state is updated (hits container)
  - when redux state changes, MSP is invoked again
  - MSP will provide updated props
12. Presentational Component re-renders
  - because props has changed, it causes our presentational component to re-render
13. we see the change on the browser with those updated data


## React Router / Frontend Router
- a frontend routing library for React
- lets us define the ui based on the browser's location (url)
- ENTIRELY different from backend router


## Key components in React Router
- **routers**
    - `<HashRouter>`
- **route matchers**
    - `<Route>`
      - renders the component if location.pathname matches the path prop
      - provides route information(history, location, match) as props to your component
    - `<Switch>`
      - renders the first path match
- **route changers (navigation)**
    - `<Link>`
    - `<NavLink>`
    - `<Redirect>`


## Props that a `<Route>` _receives_:
- these control rendering
- `component`
- `path`
- `exact`
- `render`


## Props that a `<Route>` _passes_ to the wrapped component: 
- these make routing info accessible to the rendered component
- `match`
- `location`
- `history`

## Difference between NavLink and Link
- NavLink provides class="active" attribute to your anchor tag

## Tips on debugging your error
- trace back your data flow using debuggers (this is why you need explicit returns)