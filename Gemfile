source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

#bcrypt
gem 'bcrypt', '3.1.9'
gem 'bcrypt-ruby', '3.1.2', :require => 'bcrypt'


gem 'byebug'
#database
gem 'pg'

#messaging system
gem 'mailboxer'

#authentication
gem 'devise'
# venmo api
gem 'omniauth'
gem 'omniauth-venmo'
gem "venmo-api"

#authorization
gem 'pundit'

gem 'web-console'
gem 'spring'

#misc stuff that can't hurt
gem 'gravatar_image_tag'
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
#mysterious tzinfo-data error will be solved
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
# gem for code coverage
gem 'simplecov', :require => false, :group => :test

#pagination for search and displaying posts
gem 'will_paginate'

# capybara for testing
gem 'capybara'
gem 'faker'

# carrierwave for image uploading
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'rmagick'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # rspec-rails testing framework
  gem 'rspec-rails', '~> 3.0'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails', :require => false
  gem 'database_cleaner'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
  # rspec-rails testing framework
  gem 'rspec-rails', '~> 3.0'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails', :require => false
  gem 'database_cleaner'
end

group :production do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'rails_12factor'
end

