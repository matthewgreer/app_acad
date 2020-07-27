## Object Oriented Programming

**Agenda**
1. Yesterday's solutions
2. Abstraction and Encapsulation
3. public, private, and protected methods 
4. Inheritance / Modules
5. Polymorphism
6. Preparing for the day's project

## 4 Principles of OOP
Abstraction, Encapsulation, Inheritance and Polymorphism

### Abstraction
- taking larger pieces of inter-connected system into smaller pieces
- “An abstraction denotes the essential characteristics of an object that distinguish it from all other kinds of object and thus provide crisply defined conceptual boundaries.”

### Encapsulation
- keeping the public interface of our object distinct from our private interface

  #### public, private, and protected methods
  - public
    - methods which are accessible on the object both inside and outside.
  - private
    - methods can only be called inside of the class definition.
    - methods can only be called implicity
      - exception: writer methods
      - other exception: [], ==, <, etc... because it alone has it's own meaning/identity
  - protected
    - like private that it can't be called from outside
    - but, can be called on other instances of the class

### Inheritance
- using shared logic between different classes

  #### super
  - if we call super in the method on subclass Ruby will run the method of same name in superclass with self being the instance of subclass
  - if you use it with no argument, default behavior is it takes the incoming arugment and pass it as an argument to the super-class version
  
  #### Module
  - set of methods that you can mix-in to any classes

### Polymorphism
- another name: duck-typing

### Preparing for the day's project
1. SKIP Error Handling!!
2. Start with Class Inheritance then Chess(two-days project)
- specifically, for chess project, pay attention to the UML diagram which outlines what properties each class should have.
- typos on UML diagram
  - on Pawn move_dirs -> moves
  - on Piece symbol -> Symbol