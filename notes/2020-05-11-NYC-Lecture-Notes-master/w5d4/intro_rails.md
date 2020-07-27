# Where we are now in the course
- Ruby + OOP
- SQL
- Models      <-------- YOU ARE HERE :^)
- Controllers
- Views
- HTML
- JavaScript (lang of modern app, getting into frontend from here)
- CSS
- jQuery
- React
- Redux
- Full-stack projects (backend + frontend!)


# What is Rails?
MVC web application framework
- provides a lot of prewritten code for us
- lets us get started on an app quickly and easily
- make decisions for us (opiniontive)
- naming conventions
- really great for beginners to learn the structure of full stack and web-development
- MVC
  - Models
  - Views
  - Controllers

--Today's focus on Models(M)---
yesterday we learned ORM concept: what is ORM?
> Object Relational Mapping:
> system translates sql(data) into objects(ruby)
> ORM is not only specific to Ruby

We recommend to install rails 5 instead of 6
you can check it in your gemfile `gem 'rails', '~> 5.2.4', '>= 5.2.4.2'`

# Rails Documentation
- https://guides.rubyonrails.org/
- https://api.rubyonrails.org/

It will be very useful not just for today but also for your fullstack project later!


# Rails Commands 
## step 1. create your project in the right directory you want
`rails new kookaburra -G --database=postgresql`
  - This creates a directory containing all rails structure and dependecies needed
  - `-G` : no git repo inside your project
  - `--database=postgresql` : you are using database postgres

## step 2. add gems
`gem 'pry-rails'`
`gem 'annotate'` (use by running `bundle exec annotate --models`)
  - neither of these is necessary but both are very useful

## step 3. bundle exec rails db:create
`bundle exec rails db:create`
  - creates development and test databases
  - if successful, you should see: 
    `Created database 'kookaburra_development'`
    `Created database 'kookaburra_test'`

## step 4. migration 
- Migration files construed the tables for your database
- You can setup the same database on a different machine by running these files in order
- if we name our migrations along conventions, Rails will fill out the boilerplate code for us. e.g. create_users -> will fill in with the create_table method automatically

`bundle exec rails g migration createLaughs`
  - `g` : short for generate
  - `createLocations`: 'create' will create a basic structure of table change
  - **table names are Always PLURAL**
  - Inside `def change`, design how we want to change the database and describe here what table should look like
    - `t.timestamps`=> shortcut to create `created_at` and `updated_at`
    ```rb
    class CreateLaughs < ActiveRecord::Migration[5.2]
      def change
        create_table :laughs do |t|
          t.string :body, null: false
          t.integer :author_id, null: false

          t.timestamps
        end
        add_index :laughs, :author_id
      end
    ends
    ```

`bundle exec rails db:migrate`
  - this will create/update `schema.rb`
  
`bundle exec rails db:migrate:status` => check the status of migration 

*when do we use index on tables?*
we use add_index(indexing) on specific columns for speed-lookup
use `unique: true` for column that should be unique 

## step 5. build models
1. create model files inside app > models 
2. set up `class` and class name is always **SINGULAR** and all models inherit from ApplicationRecord
3. set up `validates`(this vaidation will run whenever we try to save some information to database such as using `.save` or `.save!`)

## step 6. test validations on console
`bundle exec rails c`
  - `c` :short for `console`

### useful console commands
for more info check out rails guide basics > chapeter 5. CRUD(create, read, update, delete)
* `.save`
* `.save!`
* `.all`
* `.create!`(pass arguments here)
* `.first`
* `.last`
* `.find(id)` ex Location.find(2)
* `.find_by(hash)` ex Location.find_by(id:2) 

ActiveRecord gives **getter** and **setter** for all the columns in the tables. 
For example, `locations` table has colums of `id`, `name`, `created_at` and `updated_at`
```rb
Location.name
Location.id
Location.create_at
Location.updated_at 
```

## step 7. Associations on models
Through assocations, you can fetch the corresponding information easily. 
syntatic sugar version>
```rb
  belongs_to :location, 
  foreign_key: :location_id,
  primary_key: :id,
  class_name: :Location
```
  long-hand version>
```rb
  belongs_to(:location, {
     foreign_key: :location_id,
     primary_key: :id,
     class_name: :Location
   })
```
create a method named with the first argument and receives two arguments
* first arg is for the name of the method
* second arg is hash with sepecific information

### belongs_to AND has_many
direct associations 

* `belongs_to`: the model that has foreign_key always has `belongs_to` to other model
* `has_many` : the model the foreign_key is pointing to has `has_many` in their class

* in User model class>
```rb
belongs_to :location, 
  foreign_key: :location_id,
  primary_key: :id,
  class_name: :Location
```

* in Location model class>
```rb
has_many :users,
  foreign_key: :location_id,
  primary_key: :id,
  class_name: :User
```

### has_many through
indirect association

- In Location model class
```rb
  has_many :users,
  foreign_key: :location_id,
  primary_key: :id,
  class_name: :User

  has_many :laughs,
  through: :users,
  source: :laughs
```
- `User` is an intermidiate model between `Laugh` and `Location`
- Even though `Location` and `Laugh` are not directly associated, `Location` has many `laughs` through the direct association with `users` and through the `users`, `Location` reach to the `Laugh` 



# Useful Gems
Make sure to install these within group:development and/or group:test.
We don't necessarily want these in our production environment.

* `gem 'pry-rails`
  - replaces default irb testing environment with pry(`bundle exec raills console`)
* `gem 'annotate'` 
 - adds corresponding table schema to model file
  * `bundle exec annotate --models`



# Associations 
take a look at the relationships between the tables(look at the schema digram below )

`users` belongs to `locations` because users have `location_id`
`laughs` belongs to `users` because laughs have `author_id`
Through assocations, you can fetch the corresponding information easily.

- belongs_to <:name>, <options> - use on class with foreign key
- has_many <:name>, <options> - inverse of belongs_to relationship
- has_one <:name>, <options> - inverse of belongs_to relationship
- <options> typically include:
    - primary_key: <:id>,
    - foreign_key: <:foreign_key>,
    - class_name: <:ClassName>
We can also add additional constraints to the options hash, e.g. optional: true

# Kookaburra schema diagram
https://dbdiagram.io/d/5ee17a439ea313663b3a5ca7































## Backup code snippets


# sample migration file
class CreateSqueaks < ActiveRecord::Migration[5.2]
  def change
    create_table :squeaks do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.timestamps
    end
    add_index :squeaks, :author_id
  end
end



# models: validations and associations
class Location < ApplicationRecord
    validates :name, presence: true

    has_many :users,
      foreign_key: :location_id,
      primary_key: :id,
      class_name: :User

    has_many :squeaks,
      through: :users,
      source: :squeaks
end

class User < ApplicationRecord
    validates :username, presence: true

    has_many :squeaks,
      foreign_key: :author_id,
      primary_key: :id,
      class_name: :Squeak

    belongs_to :location,
      foreign_key: :location_id,
      primary_key: :id,
      class_name: :Location
end

class Squeak < ApplicationRecord
    validates :body, presence: true

    belongs_to :author,
      foreign_key: :author_id,
      primary_key: :id,
      class_name: :User
end
```