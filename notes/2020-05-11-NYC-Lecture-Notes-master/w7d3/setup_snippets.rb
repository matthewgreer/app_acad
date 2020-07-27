# 1. Add gems to Gemfile

# Add these gems to the Gemfile under the appropriate group (don't forget to `bundle install` after):
group :development, :test do
  gem 'rspec-rails' # Rails version of rspec
  gem 'factory_bot_rails' # automatically creates model instances and places into test DB
  gem 'rails-controller-testing' # provides handy testing methods
end

group :test do
  gem 'capybara' # for integration tests
  gem 'faker' # generates fake data for seeding (your test or dev DB)
  gem 'launchy' # key method: `save_and_open_page` will automatically open page in browser
  gem 'shoulda-matchers' # nice one-liners for testing
end

# 2. bundle install

# 3. generate rspec files

# after you run `bundle exec rails g rspec:install`, add configurations to `.rspec` file
--color # adds color to specs 
--format documentation # organizes specs

# 4. config/database.yml (why do we need this file?)

# 5. config/applications.rb

# Add this config to `config/application.rb` within Applicaiton class
config.generators do |g|
  g.test_framework :rspec, 
    :fixtures => false, # turn this off (Rails' default way to generate test objects)
    :view_specs => false, # turn off Rails' auto-generation of spec files
    :helper_specs => false,
    :routing_specs => false,
    :controller_specs => true,
    :request_specs => false
    
end

# 6. generate factories
# https://github.com/thoughtbot/factory_bot_rails
# spec/factories/*.rb

# spec/factories/users.rb 

FactoryBot.define do
  factory :user do
    username { Faker::StarWars.character }
    password "starwars"
    association :location, factory: :location
  end
end

# 7. spec/rails_helper.rb

# Within the existing RSpec.configure
RSpec.configure do |config|
  # add this line:
  config.include FactoryBot::Syntax::Methods
end

# outside the existing RSpec.configure
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails # -> use with.library :active_record, :active_model, and :action_controller
    # with.library :active_record
    # with.library :active_model
    # with.library :action_controller
  end
end