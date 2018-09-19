# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

add gem 'clearance'

bundle install
rake db:create:all
rake db:migrate
gem update --default


rails server 
sudo service postgresql start
localhost:3000

rails generate clearance:install

Follow steps:
Next steps:

1. Configure the mailer to create full URLs in emails:

    # config/environments/{development,test}.rb
    config.action_mailer.default_url_options = { host: 'localhost:3000' }

    In production it should be your app's domain name.

2. Display user session and flashes. For example, in your application layout:

    <% if signed_in? %>
      Signed in as: <%= current_user.email %>
      <%= button_to 'Sign out', sign_out_path, method: :delete %>
    <% else %>
      <%= link_to 'Sign in', sign_in_path %>
    <% end %>

    <div id="flash">
      <% flash.each do |key, value| %>
        <div class="flash <%= key %>"><%= value %></div>
      <% end %>
    </div>

3. Migrate:

    rake db:migrate


===============================================

Mailcatcher   ----->   https://mailcatcher.me/
(Don't include in Gem file, it will create conflict)

gem install mailcatcher
mailcatcher
Go to http://localhost:1080/
Send mail through smtp://localhost:1025

To set up your rails app, I recommend adding this to your environments/development.rb:

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }