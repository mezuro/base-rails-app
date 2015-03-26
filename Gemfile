source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.2.2'

# For user authentication and everything else
gem 'devise', '~> 3.4.0'

# Kalibro integration
gem 'kalibro_client'

# PostgreSQL integration
gem "pg", "~> 0.18.1"

# Twitter Bootstrap for layout
gem 'twitter-bootstrap-rails', :git => 'https://github.com/seyhunak/twitter-bootstrap-rails.git'

# Chart generation
gem "chart-js-rails", "~> 0.0.6"

# JQueryUI
gem 'jquery-ui-rails', '~> 5.0.0'

# colorpicker
gem 'colorpicker', '~> 0.0.5'

# Memcached
gem "dalli", "~> 2.7.0"

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Rails Html Sanitizer for HTML sanitization
gem 'rails-html-sanitizer', '~> 1.0'

# Sends a email whenever there is a unexpected exception
gem 'exception_notification', '~> 4.0.1'

# Google Analytics
gem 'google-analytics-rails', '~> 0.0.6'

# Browser language detection
gem 'http_accept_language'

group :test do
  # Easier test writing
  gem "shoulda-matchers", '~> 2.8.0'

  # Test coverage
  gem 'simplecov', require: false

  # Simple Mocks
  gem 'mocha', require: 'mocha/api'

  # Test coverage report
  gem "codeclimate-test-reporter", require: nil
end

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exceptions page and /console in development
  gem 'web-console', '~> 2.0.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Test framework
  gem 'rspec-rails', '~> 3.2.0'

  # Fixtures made easy
  gem 'factory_girl_rails', '~> 4.5.0'

  # Deployment
  gem 'capistrano', "~>3.3.3", require: false
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm', "~>0.1.0"

  # JavaScript unit tests
  gem "konacha", "~> 3.3.0"

  # Better error interface
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Acceptance tests
group :cucumber do
  gem 'cucumber-rails', '~> 1.4.0'
  # cleans the database
  # Version fixed at 1.3. See:
  # https://github.com/DatabaseCleaner/database_cleaner/issues/317
  gem 'database_cleaner', '~> 1.3.0'
  gem 'poltergeist', '~> 1.6.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'
