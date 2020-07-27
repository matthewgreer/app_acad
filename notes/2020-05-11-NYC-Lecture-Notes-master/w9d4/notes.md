## Agenda
  
1. Solutions
2. What is AJAX?
3. AJAX Basics
4. Rails Review + Webpack
5. AJAX with Rails
6. Promises
7. Kahoot

## Notes

- What is AJAX?
  - stands for Async Javascript XML
  - Why do we use it?
    - It allows HTTP requests asynchronously 
    - makes a single web page with this functionality (Even if there is DB behind it, with AJAX by asking the data asynchronously we can accomplish the single web page)

- routes.rb: a custom route for search
- gifs_controller.rb: 

- Basic file trees in this demo(you need prcess to connect the frontend using js with the rails application)
  - `frontend directory` on the top level: a directory that has all JS files in which you write codes
  - app>assets>javascripts>`bundle.js(webpack)`: webpack will take care of all the js files from the frontend and bundle them up(check `webpack.config`)
  - app>assets>javascripts>`application.js`: `require file tree` will collect all the javascripts. `application.js` is for rails. It will conect the rails and make js files available for the views(views are still part of the frontend as concepts) in rails.  
  - `application.html.erb`: you need `<%= javascript_include_tag 'application' %>` to link the rails html to javascripts(attaching the `application.js` to html). it's still part of the view we are seeing on the browser. 


- Promises
  - AJAX uses promises. 
  - wrap asynchronous function. 
  - it allows us to wait for the AJAX request and then run the code that needs to be run.
  - all the callbacks we used such as success, errors are promises
  - if you use promieses, you can separate the concerns(success, errors), help us to dry our codes
  - and reorganize codes in asynchronous callbacks. 
  - allows us to chain reactions by using other methods to invoke after the first promise is done. 
  - `$.ajax promise-like object vs browser ajax regular promise object `
    - jquery ajax returns a promise-like object while browser ajax returns a normal promise object
    - browser ajax will use `.catch()` while jquery ajax will use `.fail()`
    - jquery ajax fail will return original promise
  - how to call success and error calls on ajax promise(2 ways):
    - `.then(cb1, cb2(optional))`: .then needs at least one func argument which is for the success call. The second arg is optional and it's for error call. For example: 
    - `GifAPIUtil.fetchSavedGifAJAX(title).then(successCB).fail(errorCB);`
    - `GifAPIUtil.fetchSavedGifAJAX(title).then(successCB, errorCB);`
    - These are functionally the same
  - how to call success and error calls on borwer built-in(default) promise(2 ways):
    - `GifAPIUtil.fetchSavedGifAJAX(title).then(successCB, errorCB);`
    - `GifAPIUtil.fetchSavedGifAJAX(title).then(successCB).catch(errorCB);`
    - These are also functionally the same. 