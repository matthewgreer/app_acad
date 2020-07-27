## Lecture Agenda

1. What is the DOM?
2. What is jQuery?
3. jQuery Basics
4. 4 uses of $
5. ToLearn List and Event Listeners

## Useful 
DOCS
- jQuery Docs: https://api.jquery.com/


## Glossary:
+ DOM: 
  - Document Object Model
  - API for HTML & XML 
  - JS code can have access to the HTML content of the page
  - tree-like representation of elements on the page
  - after browser receives html file, it translates html to DOM that can be used to manipulate the elements on the frontend. 

+ Vanilla DOM Manipulation: 
  - using vanilla javascript (built in javascript functions) to manipulate the DOM
    without 3rd party libraries

+ DOM Event: 
  - any event that can happen during user interaction with a webpage 
    e.g. clicking, dragging, clicks
  - We can set event listeners to trigger callbacks on specific events 

+ Node:
https://developer.mozilla.org/en-US/docs/Web/API/Node
  - any type of object in the DOM tree or hierarchy

+ Document:
https://developer.mozilla.org/en-US/docs/Web/API/Document
  - `Document` or `The Document interface` represents any web page loaded in the browser and serves as an entry point into the web page's content, which is the DOM tree.

+ Element: https://developer.mozilla.org/en-US/docs/Web/API/Element
  - Element is the general base class from which all element objects in the document are inherited
  - `HTMLElement` inherits from Element
  - Another type of element is `SVGElement`

+ HTMLElements: 
https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement
  - list of HTMLElements: https://developer.mozilla.org/en-US/docs/Web/HTML/Element

## What is DOM?
- DOM stands for `Document Object Model`
- object-oriented & tree-like representation of elements on the page. 
- show `dom-tree png`. 
  - explains `HTMLElement === node`
- Document Object Model
    - * Object oriented representation of our HTML page.
    - * provides an interface for us to manipulate elements on page
    - easy to work with, can store properties and call methods on them
    - use `document.addEventListener("DOMContentLoaded", callback)` to execute js code after whole HTML page is loaded
    - * Every browser implements its own DOM, can be slightly/moderately different per browser


## What is jquery?
- JS library made in 2006. 
- high-level interface for manipulating the DOM
- More popular back then. Earlier in the history of the web, it was a lot harder to manipulate the DOM than it is now. All browsers had different ways of allowing JS to interact the DOM. jQuery is like a wrapper to paper over those browser differences and gives a single uniform API for manipulating the DOM. 
- Why gradually lost its uniqueness: 3 things(if asked.)
  https://www.ma-no.org/en/programming/javascript/is-jquery-going-to-die-in-2019
    - Javascript matured as a language, newer APIs came
    - Modern browsers like Google Chrome & Firefox came and they implemented JS consistently
    - Modern & advanced Javascript frameworks & libraries became a trend
- It's also important to learn how to use a third party library - a necessary skill for your career as a developer.
- today is important: 
    1. first time to use js for manipulating the web -- the original purpose of JS
- jQuery is just JS. (show the src file on `jQuery.com`)
- with better browser support for JS, we can use jQuery to manipulate the user's interface/experience easily by dynamically changing our HTML & CSS


## jQuery Basics

## 4 uses of $
  * `selector style`: any CSS selector: elementTagName, .class, #id
    - $('input');
    - $('.incomplete') or $('li.incomplete')
    - $('#complete-all')
  * `html creator style`
    - $('<li>'); 
    - also jQuery collection/element inside
  * `wrapper style`
    - wrap any DOM node/nodeList to use jQuery methods
    $($('li')[0]);
  * `ready style`
    - $(function) //make sure dont' invoke the function
    - doesn't invoke the function until the DOM is loaded. 

## Event Handling