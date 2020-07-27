# Lecture Agenda

1. Abstract Data Types vs Data Structures
2. Stacks & Queues
3. Nodes & Trees
4. DFS & BFS

---

## Abstract Data Types vs. Data Structures

`Abstract Data Type`: Defines a set of properties and interactions with some information (i.e. the blueprint)

`Data Structure`: Actual implementation of the concept, with all of the properties (i.e. the building itself)

---

## Passenger Car "ADT"

* Allow passengers to enter and exit vehicle
* Accelerate
* Decelerate
* Direct

---

## Passenger Car "Data Structure"

---

![Camry](https://mycarboard.com/wp-content/uploads/2017/12/AwesomeAmazingGreat-1999-Toyota-Camry-LE-87K-MILES-4-CYLINDERS-1-OWNER-NO-RESERVE-GETS-GREAT-GAS-MILEAGE-CLEAN-RUNS-DRIVES-GREAT-2017-20182017-201820172018.jpg)

---

![Tesla](https://www.cstatic-images.com/car-pictures/xl/usc70tsc024b021001.png)

---

![Flintstone](https://media.giphy.com/media/10hDCVo7lTQlIk/giphy.gif)

---

![Reliant Robin](https://hips.hearstapps.com/roa.h-cdn.co/assets/16/02/1452787848-reliant.gif)

---

## What data structure could we use to implement these ADTs?

* Set
* Dictionary

---

## Example: Stacks

![stacks](https://camo.githubusercontent.com/08034c7ae610ca661572cf1458e3e36aa5ee5e0d/68747470733a2f2f6d656469612e67697068792e636f6d2f6d656469612f336f68687765526773394f5a6c644c7761732f67697068792e676966)

![Pancakes](/w3d5/images/stack_pancakes.jpeg)

---

## Stack (ADT)

Overview: Sequential collection of objects. All operations take place at one end (LIFO).

![stack_diagram](/w3d5/images/stack_diagram.png)

![stack_gif](/w3d5/images/stack.gif)

---

### Stack (ADT) -- Sequential, LIFO

**Properties**:

* `push(el)`:  Add element to top of stack
* `pop`: Remove and return element from top of stack
* `peek`:  Return top element of the stack, without removing it
* `size`: Return the current size of the stack
* `empty?`: Return true or false depending on whether or not stack is empty

---

## Code Review of Stack

---

## Example: Queues

![grocery_line](/w3d5/images/queue-example.jpg)

---

## Queue (ADT)

Overview: Sequential collection of objects. Removal at one end, insertion at the other (FIFO).

![queue_diagram](/w3d5/images/queue_diagram.png)

![queue_gif](/w3d5/images/queue.gif)

---

### Queue (ADT) -- Sequential, FIFO

**Properties:**

* `enqueue(el)`:  Add element to back of queue
* `dequeue`: Remove and return element from front of queue
* `show`:  Show the entire queue (but don't return it! Why wouldn't we want to return it?)
* `size`: Return the current size of the queue
* `empty?`: Return true or false depending on whether or not queue is empty

---

## Code Review of Queue

---

## Trees

---

## What makes up a Tree ADT

* Composed of nodes that store information
* Each node has (optionally) one parent and (optionally) many children
* Depth

![binary_tree](/w3d5/images/binary-tree.png)

![file_tree](/w3d5/images/file_tree.jpg)

---

## Node

* The basic unit comprising a tree
* Typically holds a value and references to its children
* The root node _is_ the tree (and every other node is a sub-tree).
* **internal nodes** vs. **leaf nodes**

---

## Is the root node a leaf node or an internal node?

---

Which nodes are leaves?
Which nodes are internal?

![binary-tree](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Trees/pix/tree1.bmp)

---

## "Do we need a `Tree` class?"

---

## A simple Node implementation

![node_demo_img](/w3d5/images/node_demo.png)

---

## Algorithms & Methods

---

`Algorithm`: General approach and process to problem solving operations (ex. Binary Search)

`Function/Method`: Concrete implementation, in a specific language, of an algorithm (Binary Search in Ruby)

---

## Tree Traversal Algorithms (Search)

* Breadth-first Search (BFS)
* Depth-first Search (DFS)

---

## Today's projects: Knight's Travails

![knight_travails](/w3d5/images/knight-travails.gif)

---

## Thank You 👋
