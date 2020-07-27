### Agenda
+ Databases
+ SQL Overview 
+ Setting up the database
+ Writing Queries
+ Postgres Docs (https://www.postgresql.org/docs/12/index.html)


### Why do we use databases?
+ A database allow us to persist data 
+ Once we have data stored, we need a way to interface with the database


### What is SQL?
+ Structured Query Language: A programming language designed to manage data in a relational database.
+ Allows us to insert, look up, update and remove information through a very standardized interface.


### Relational Databases

+ **Relational databases** organize data into tables that house data belonging to one category.
  - A table represents a collection of data.
  - Each row in a table is one unit (aka record) of data in a table.
  - Each column in one attribute of the collection.
  - EX: `dog_table.png`
  

+ A **primary key** is a row's unique identifier. 
  - Every table has a primary key column (conventionally just called 'id').
  - Most relational database systems have an auto-increment feature to ensure the primary keys are always unique.
  

+ **Foreign keys** are used to reference a primay key (id) in another table. 
  - indicates a relationship between data in different tables
  - EX: `foreign_key.png`


+ **Join tables** are used to keep track of a many-to-many relationship. 
  - Each row represents (and creates) one link between two tables.
    - Ids from other tables may appear more than once to represent multiple relationships.
  - Join tables should consist of at least 3 columns: its own primary key, and two foreign keys.
  - Join tables != join query
  - EX: `join_table.png`


+ **Schema**: A schema is a description of what tables your database will have, what columns each table will have, and the column data type.


### Setting up postgres database
+ Tomorrow we will using SQLite 
  - better for lightweight projects
+ Today we will be using PostgreSQL (the one with an elephant)
  - run database creation file (`./import_db.sh`)
  - open postgres with `psql <db_name>` 
  - a few useful commands:
    - `\d`: list tables in db
    - `\d NAME`: describe table
    - `\q`: quit

### Writing Queries (nyc_db/challenges.sql)
+ Single table queries
+ Subqueries and Joins
+ Grouping
  - `GROUP BY`: like compressing all the rows having a column in common into one output row
  - 
+ `WHERE` vs. `HAVING`
  - `WHERE`: filter rows before any grouping (grouping not necessary)
  - `HAVING`: exclude records after grouping (can only be used after a `GROUP BY` clause)

### SQL Order of Operations
+ `FROM`
+ `JOIN`
+ `WHERE`
+ `GROUP BY`
+ `HAVING`
+ `SELECT`
+ `ORDER BY`
+ `LIMIT`
