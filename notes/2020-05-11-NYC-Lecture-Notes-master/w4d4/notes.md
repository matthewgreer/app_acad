## Agenda
+ Error Handling and Chess Solutions
+ Overview of Testing & TDD
+ Setting up RSpec
+ Writing unit tests
+ RSpec Docs
+ Kahoot (https://play.kahoot.it/v2/?quizId=c590ac48-6b83-43f1-a51f-91b9bd2ce699)



## Overview
+ Why test?
  1. work on code without fear of breaking it (our own or others')
  2. facilitate collaboration
  3. documentation - good tests == good documentation; reference for what our code is meant to do
+ How to test?
  * types of tests:
    - unit: 80-90% of all tests; test class in isolation from other classes
      - our focus for today
    - integration: 5-15% of tests; test the interaction between two classes
    - end-to-end: test how the entire project is working together
+ What to test?
  * in unit tests: all public methods
    - don't test private methods (we can't call private methods from outside their class)
      - they'll be tested indirectly when we test our public methods
+ TDD
  * `red, green, refactor` workflow
    - red: write your test first, make sure it fails (no false positives)
    - green: write your code, make sure your code passes the test
    - refactor: refactor or clean up code


## Setup
1. Run `rspec --init`
  - creates `.rspec`and `spec/spec_helper.rb` 
2. In `.rspec` add:
  `--format documentation`
  `--color`
3. Create `lib/` folder for your code
4. Create `spec/<name>_spec.rb` file(s) for your tests
5. Create `Gemfile`, add `gem 'rspec'`, and run `bundle install`


## RSpec Docs
https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers

