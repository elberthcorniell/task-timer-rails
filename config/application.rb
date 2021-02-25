require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskTimerRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0 
    config.api_only = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    TaskTimerRails::Application.config.session_store :cookie_store, key: '_session_key', expire_after: 14.days
    config.middleware.insert_before 0, Rack::Cors do
      allow do
         origins 'localhost:3001', 'localhost:3000' , 'http://127.0.0.1:3000', 'http://127.0.0.1:3001'
         resource '*', 
          headers: :any,
          methods: [:get, :post, :options, :delete],
          credentials: true
       end
    end# the framework and any gems in your application.

  end
end
