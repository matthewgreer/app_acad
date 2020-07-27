/* ------------------------------ CODE SNIPPETS ------------------------------ */

// add an event listener to mark all tolearns as completed
// $('#complete-all').on('click', event => {
//     $('li').removeClass('incomplete');
//     $('li').addClass('complete');
// });


// add event listeners to toggle each tolearn
// $('li').on('click', e => {
//     // debugger // examine `e`, look at the event's `currentTarget` and `target` properties
//     $(e.currentTarget).toggleClass('incomplete complete');
// });

// e.currentTarget is the element the event handler was placed on
// e.target is the element that triggered the event

// does this work for new lis?
const $newLi = $('<li>');
$newLi.append('pls work');
$newLi.addClass('incomplete');
$('ul').append($newLi);
// This li is defined after the event listener was added above
// so no event listener is attached to this new li

// ******************************************************
//          solution 1 - event bubble/propagation
// ******************************************************

/* Install the event listener on the parent `ul`
    - we can do this because of event bubbling / propagation
    - the event object that gets passed up the DOM tree has properties 
    that lets us access the element on which the event was triggered(target)
    and the element that is listening for the event (currentTarget)
*/


const toggleLi = e => { // this is a callback for our .on event listener
    // debugger
    const $li = $(e.target); // saving the el clicked on to a jQuery obj
    $li.toggleClass("incomplete complete");
}

// $('ul').on('click', toggleLi);

// ******************************************************
//          solution 2 - delegated event handler
// ******************************************************

/* Use a delegated event handler
    - child elements delegate event handling to an ancestor element
    - advantages of using a delegated event handler:
        1. can process events from descendant elements that are added to the document at a later time (after the event handler is installed)
        2. reduces overhead of installing many event handlers (which can slow page loading)
    - with event delegation, e.currentTarget can change: e.currentTarget === e.target
    - syntax: pass in 3 args to `.on()`: eventName, selector, eventHandler
        + the eventHandler won't be invoked when the event occurs directly on the bound (ancestor) element
        + instead, the eventHandler will be invoked for any descendant elements that match the selector
*/


// $('ul').on('click', 'li', e => {
//     // debugger // what is e.currentTarget here? what is e.target?
//     const $li = $(e.currentTarget)
//     $li.toggleClass('incomplete complete');
//     // by passing the child element li as an argument, we are changing the 
//     // currentTarget of this event listener
// });


// ********************************************************
//                 Add a form
// ********************************************************

// add an event listener to create a new tolearn using a form
const addToLearn = function (e) {
    e.preventDefault();
    // debugger
    const $form = $(e.target); // wraps our form in a jQuery object
    const $input = $form.find('input[type=text]'); // selects the text input
    const val = $input.val(); // saves its value to a variable
    $input.val(''); // clears the input on submission

    const $newLi = $('<li>');
    $newLi.text(val);
    $newLi.addClass('incomplete');
    $('ul').append($newLi);
};

// $('.todo-form').on('submit', addToLearn);

// ********************************************************
//                 All Together
// ********************************************************

// Install listeners all at once
$(applyListeners); 
// 4th use of `$`: add a document-ready callback
// This function will be invoked once DOM is fully loaded
// $(document).ready(applyListeners); <= alternative way of using ready style

function applyListeners() {
    $('.todo-form').on('submit', addToLearn);
    $('ul').on('click', 'li', toggleLi);
    $('#complete-all').on('click', event => {
        $('li').removeClass('incomplete');
        $('li').addClass('complete');
    });
    $('#fun-gif-button').on('click', () => {
        $('#fun-gif').show();
    })
};
// NOTE: by using a named function, we take advantage of hoisting
// This is why the $(ready) tag can be executed above.
// if written as a function expression i.e. const applyListeners = () => {},
// we would need to move line 97 below our function declaration


// applyListeners(); <= will not work if script tag is in head