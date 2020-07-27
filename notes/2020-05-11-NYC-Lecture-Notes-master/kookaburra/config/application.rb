require_relative 'boot'

require 'rails/all'
# Line 3 above is the standard line, requiring in all the pieces of rails
# needed to set up our configuration


# # These lines instead of `require "rails/all"` removes the activestorage routes
# require "rails"
# # Include each railties manually, excluding `active_storage/engine`
# require "active_model/railtie"
# require "active_job/railtie"
# require "active_record/railtie"
# # require "active_storage/engine"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kookaburra
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators do |g|
      g.test_framework :rspec, # tells Rails to use Rspec for testing
      :fixtures => false, # turn this off (Rails' default way to generate test objects)
      :view_specs => false, # turn off Rails' auto-generation of spec files
      :helper_specs => false,
      :routing_specs => false,
      :controller_specs => true,
      :request_specs => false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
