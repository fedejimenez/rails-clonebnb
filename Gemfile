source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 5.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# gem 'hiredis'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :de`velopment

#  ##################################################
#       Non default gems added to the project
#  ####################################################

#Use Clearance Engine (Rails authentication with email & password)
gem "clearance"

# Use Bootstrap
# gem 'bootstrap', '~> 4.1.1'
gem 'bootstrap-sass', '~> 3.4.1'

# Use fontawesome
gem 'font-awesome-rails'
# Use Jquery
gem 'jquery-rails'

# Use Figaro (Protecting keys)
gem 'figaro'

# Use faker
gem 'faker', :git => 'https://github.com/stympy/faker.git'

# Use pagination
gem 'kaminari'

# Use CarrierWave for image uploading
gem 'carrierwave', '~> 1.3'
# Use mini_magick to resize images
gem 'mini_magick'

# Use acts as bookable for bookings
# gem 'acts_as_bookable'
# problem with activerecord > 5

# Use Braintree for payments
gem 'braintree'

# Framework Bulma for CSS
# gem "bulma-rails", "~> 0.6.2" 



# Postgresql version downgraded to be compatible with ActiveRecord
# gem 'pg', '~>0.18.0'

gem 'activerecord'
# gem 'heroku'
gem 'sidekiq'
gem 'rails_12factor'
gem 'pg_search'
gem 'fog-aws'

# Use Omniauth 
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'


##################################################


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
