# Active Record Query Lecture

## Agenda
- Review Models/Associations
- What is an ORM?
- Active Record Methods
- Kahoot

### Review Models/Associations

### What is an ORM?
Stands for... Object Relational Mapping
Layer of abstraction that makes it easier to interact with a database,
rather than having to directly write SQL.

Gives access to methods we can run on object instances to expand functionality

### Active Record Methods
  - all, first, second, ..., last
    - Basic methods that can return specific instances or all instances

  - create!
      - extending the ability of create! method
      - using association we can bypass sourcing foregin_key
      - ex) Refer to seeds.rb
        - ny = Location.create!(name: 'New York, US')
        - previous way of creating a user
          - alvin = User.create!(username: 'Alvin', location_id: ny.id)
        - new way using associations
          - alvin = ny.users.create!(username: 'Alvin')
        - then, to create a laugh for Alvin,
          - alvin.laughs.create!(body: 'Hey Programmers!')

  - find(id) vs find_by(hash) / find_by_<column_name>(value)
    - `find` must take an id (Integer) as its argument. 
      - Returns loud error if not found
    - `find_by` takes a hash where we can define which columns' values we are filtering for
      - Can filter by multiple columns by passing multiple key/value pairs
      - returns `nil` if not found in database
    - `find_by_<column_name>` takes a value to filter by a specific column
      - returns `nil` if not found in database

  - where(string/hash)
    - can be called on a Model or ActiveRecord_Relation
    - will always return an AR relation array-like object
    - called on Model name or ActiveRecord_Relation
    - String
      - ("username = 'Peter'")
      - ("username = ?", 'Peter')
      - ("username = :name", name: 'Peter')
      - more complex queries ("name iLIKE 's%'")
    - Hash
      - (fname: 'Mashu')
      - inclusion: (username: ['Peter', 'Andy'])
        - if we want to find users with names of Peter and Andy
      - User.where(location: location_instance)
        - we can supply a hash where key is the association name and value is AR instance
    - where.not

  
  - What is an ActiveRecord_Relation?
   - The return value of running an AR query when multiple records are found
   - If a query returns a single instance, it is returned as that model instance
   - Allows for chaining different AR methods to continue our query

  - select
    - called on model or AR_Relation
    - just like the select clause with raw SQL
    - takes in symbol or string
      - ex)
        - User.select(:username).where(username: 'Peter')  

  - pluck
    - could take in a column as a symbol or string
    - Will "pluck" out only the data of columns and return as an Array
    - If we specify a single column, it will return a one dimensional array
    - If we specify multiple columns, it will return a 2D array, where each 
      subarray is filled with the values for each row from the columns specified
    - with no arguments, it will pluck all columns
  
  - joins
    SQL JOIN query to link users table to locations table:
      SELECT
        *
      FROM
        users
      JOIN
        locations ON locations.id = users.location_id;
    
    - the AR way:
      - single join:
        - `User.joins(:location)`
      - building a through association:
        - `Location.joins(users: :laughs)`
      - using already defined through-assocation: 
        - `Location.joins(:laughs)`
      - joining multiple associations:
        - `Model.joins(:association).joins(:another_association)`
        - `Model.joins(:assocation, :another_association)`

  - left_outer_joins
    - Used to include nil/null values from the right side of the join


  - group & having
    - As SQL:
      SELECT
        laughs.author_id, COUNT(laughs.id) AS 'total'
      FROM
        laughs
      GROUP BY
        laughs.author_id
      HAVING
        COUNT(laughs.id) >= 2;

    - using AR:
      Laugh
        .select('laughs.author_id,  COUNT(laughs.id) AS "total"')
        .group(:author_id)
        .having("COUNT(laughs.id) >= 2")

  - includes (solving N+1 queries)
    - Lets write a class method on Laugh model that prints laugh and the author
    - ex)
      first, self.all.each do |laugh| - demonstrating N+1 query
      secondly, self.includes(:author).each do |laugh|
        p "#{laugh.body} by #{laugh.author.username}"
      end
    - includes solves N+1 query by prefetching the associated data

  - association_ids & association_ids= methods 

  ## joins vs .includes
    - both will overcome N+1 problem
      - joins makes 1 query, .includes makes 2 queries

  ### Schema
    users         posts
    id  | name    id  | body  | author_id

    class User
      has_many :posts
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Post
    end

    EXAMPLE JOINS:
    `User.joins(:posts)`

    resulting table will be:
    users.id |  users.name  | posts.id  | posts.body  | posts.author_id |
    --------------------------------------------------------------------
    1        |  Andy        | 1         | Gday        | 1
    --------------------------------------------------------------------
    1        |  Andy        | 2         | Mate        | 1
    --------------------------------------------------------------------
    2        |  Toby        | 3         | Woof        | 2
    --------------------------------------------------------------------
    2        |  Toby        | 4         | Woof        | 2

    - Notice the user data repeats for each post

    EXAMPLE INCLUDES
    `User.all.includes(:posts)`
    
    users.id |  users.name          posts.id  | posts.body  | posts.author_id 
    -----------------------         -----------------------------------------
    1        |  Andy                    1      |  Gday       |  1
    -----------------------         -----------------------------------------
    1        |  Andy                    2      |  Mate       |  1
    -----------------------
    2        |  Toby                posts.id  | posts.body  | posts.author_id
    -----------------------         -----------------------------------------
    2        |  Andy                    3      |  Woof       |  2
                                    -----------------------------------------
                                        3      |  Woof       |  2


    EXAMPLE JOINS WITH AGGREGATE DATA
    `User
      .joins(:posts)
      .group(:name)
      .select('users.*, COUNT(posts.*) AS total_posts')`

    resulting table will be:
    users.id |  users.name  | total_posts 
    --------------------------------------
    1        |  Andy        | 2           
    --------------------------------------
    2        |  Toby        | 2           


    - Notice it returns 3 separate tables
      - The users table is unchanged
      - We then separate tables for Andy's and Toby's which get stored in their
        own space in memory

    - When to use each:
      - joins works best for aggregate data
      - includes is best fo fetching individual instances that you want to print
        or render information about
  
#### Rails Documentation
- [Rails Documentation](https://guides.rubyonrails.org/v5.2/active_record_querying.html)
