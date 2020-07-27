# Agenda
  - Yesterday's Solutions
  - CSS
  - The Box Model
  - Float
  - Flex
  - Position
  - Kookaburra Sign-in

## CSS
  - What is CSS?
    - Cascading Style Sheets
    - References the idea that a style with 'cascade' down through html
      elements to their child elements based on specificity

  - Why CSS?
   - HTML is our skeleton, or the structural component to our information
   - CSS is how we style that skeleton. Allows us to separate our presentation
    from our structure, which allows for greater customization

## The Box Model
  ### Selectors
  - are used to specify which element(s) from an html document we would like to select
  - there are different ways to select elements:

    - `div`
      - simpliest way to select an element by their element name
    - `*`
      - it's a wildcard for selecting all the elements
    - `.my-class`
      - add `class="my-class"` to h1 element
      - selects all the elements that have this class
    - `.my-class.other-class`
      - add `other-class` to h1 element
      - we can select elements with multiple classes by chaining them
    - `h1.my-class`
      - we can be more specific by defining which element with this class to apply the styles
      - element name has to be in the front
    - `#my-id`
      - add `id="my-id"` to h1 element
      - selects an element with an id
    - `h1#my-id`
      - same as how we stacked class with element name, we can also do it for ids
    - `h1.my-class#my-id`
      - we can also stack classes and an id
    - `h1[data-something="my value"]`
      - add `data-something="my value"` attribute to h1
      - we can select elements with their attribute

    - ancestry selectors
    - `div span`
      - add `span` element in first div
      - there are limited amount of elements we can use to write our document
        - which means that we will most likely reuse some elements
        - so, if we wish to select elements that is contained by some other element,
        - we can write `div span`
    - `div > span`
      - we might have a situation where from a descendent tree, (meaning an element having a child elements which also has it's own child elements) we might reuse some elements
        - and so if we want to select an element that is a direct child of some parent element,
        - we can write `div > span`

    - pseudo-class selector
      - a selector that selects elements that are in a specific state
      - e.g. they are the first element of their type, or they are being hovered over by the mouse pointer
    - `div:hover`
      - selects an element with hover state

    - pseudo-element selector
      - they act as if you had added a whole new HTML element into the document
    - `div::after`
      - selects the element's pseudo-element
      - we will talk more about this on the next topic: float

  ### Specificity Scoring
  - [Specificity Calculator](https://specificity.keegan.st/)

## notes on display property
- `display: block`
  - the element generates a block element box, generating line breaks both before an after the element
- `display: inline`
  - does not generate line breaks before or after themselves
  - the next element will be on the same line if there is space
  - width and height properties also will not apply
- `display: inline-block`
  - similar to `inline` it does nto generate line breaks before nor after
  - however, unlike inline, we are able to apply padding, margin, width and height


## Float
 - prior to flexbox, developers used float property to control the layout
 - You may see legacy styling that still uses float, so while flex or grid are
   more commonly used now, it is important to know how to use float also
  - Clearfix
    - clear property is used to clear anything that is either left or right or both sides of the element
    - it makes sure you are not next to anything
    - demonstrate using a span tag
      - include a span tag
    - then demonstrate using clearfix
      - we have a way to inject an element using pseudo-element selector

## Flex
  - Used to achieve similar behavior to float
  - We apply `display: flex` to an element to create a flex container

  - properties of flex container:
    - `display: flex`
    - flex-direction: row(default) | row-reverse | column | column-reverse
    - flex-wrap: nowrap(default) | wrap | wrap-reverse
    - flex-flow: <flex-direction> <flex-wrap>
      - example: `flex-flow: column wrap`
      - combines flex-direction and flex-wrap
    - justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly
      - defines the alignment along the main axis (based on flex direction)
    - align-items: flex-start | flex-end | center | stretch | baseline
      - defines the default behavior for how flex items are laid out along the cross-axis
    - align-content: flex-start | flex-end | center | space-between | space-around | space-evenly
      - similar to justify content, but along the cross axis

  - properties of flex items:
    - order: <integer>
    - flex-grow: <integer>
    - flex-shrink: <integer>
    - flex-basis: <px value> | auto(default)
      - overwrites the width(if row) or height (if column) of the element
    - flex: <flex-grow> <flex-shrink> <flex-basis>
    - align-self: auto | flex-start | flex-end | center | baseline | stretch
      - overwrites the alignment defined on align-items of the flex container

## Positioning
 - values we can set for `position` property are static(default), relative, absolute, fixed, and sticky:
  - static:
    -is how you normally see elements render (the default behavior)
  - relative:
    - allows us to position the element relative to the position it was originally placed
    - acts as a relative point for an absolutely positioned child element to position from
  - absolute:
    - looks for the closest ancestor element that has position property set to relative
      to find a reference point for it to position from
    - if it does not find any ancestor element, it will position relative to the window
  - fixed:
    - always positioned relative to the window, and stays fixed even when scrolling
    - example: a chat button on a website that remains in the same position while scrolling the page
  - sticky:
    - similar to position fixed, but stays in place until we reach a set point
