Installation lines: 

`npm init --yes` - will make the package.json 
`npm install webpack webpack-cli react react-dom @babel/core babel-loader @babel/preset-env @babel/preset-react redux react-redux lodash` - installs everything you need for react redux 

Remember to: 
- Run the lines above to get the `package.json` appropriately set up 
- Run `webpack --watch --mode=development` to keep track of files  

Merge v. Object.assign: 
http://jsbin.com/uXaqIMa/2/edit?js,console

## What is Redux?
- JavaScript library
- State management system
- not connected to React component states

## Overview of file structure
- /components - holds all React components
- /store - redux store setup
- /reducers - functions for interacting with store
- /actions - POJO(Plain Old Javascript) that has key of type and holds information for updating redux store
- /util - hold things that doesn't fit in other places

## What causes our react component to re-render
- (internal, not redux state)state change
- props change (redux state change causes props change)
- parent component re-render