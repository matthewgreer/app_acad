## Agenda
+ TDD and Poker Solutions
+ Big O Concepts
+ Big O Example
+ Asymptotic Analysis, a 'How To'
+ Analysis of BSearch and Merge Sort
+ Analysis of Subsets and Permutations
+ Kahoot



## Big O Concepts
+ What is Big O analysis?
  * asymptotic analysis of algorithmic space & time complexity
  * how quickly the runtime grows relative to the input as the input gets arbitrarily large

+ Why do we need Big O?
  1. way to compare to efficiency of algorithms
  2. it comes up in interviews
    
+ Common Classifications (in order from most to least efficient)
  * O(1) constant - most efficient runtime
  * O(log n) logarithmic - ex) binary search
  * O(n * log n) linearithmic - ex) merge sort
  * O(n^2) Quadratic - ex) double nested loop
  * O(n^k) Polynomial - ex) n times nested loop
  * O(2^n) Exponential - ex) subsets
  * O(n!) Factorial - ex) permutations



## Big O Example
^ listed above


## How to Do Asymptotic Analysis
* O(n^2 + 1) => O(n^2)
* O(n * n^3) => O(n^4)
* O(n + log(n)) => O(n)
* O(n! / ((n - 2)! * 2!)) => O(n^2)

1. combine like terms
2. drop constants
3. drop non-dominant terms
4. consider yourself with worst-case runtime
5. space complexity is less of a concern than time complexity most of the time
    ** exception: space complexity is a concern when you are handling big data (large amount of data)


## BSearch and Merge Sort



## Subsets and Permutations



## Kahoot



## Resources
[Big O Cheatsheet](https://www.bigocheatsheet.com/)

[Desmos](https://www.desmos.com/calculator)

[Time Complexity Slides](https://docs.google.com/presentation/d/1rY6VDdGND5HNjOmXgc_moqhabJnGhHLkgzN3rynYq8E/edit#slide=id.p)

[Kahoot](https://play.kahoot.it/v2/?quizId=f3c6b30d-9a4f-489f-8ffb-74702ea7bde1)