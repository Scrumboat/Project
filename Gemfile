source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'vestal_versions', :git => 'git://github.com/laserlemon/vestal_versions'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# twitter bootstrap
gem 'simple_form'
gem 'bootstrap-sass'


# Deploy to heroku from travis
# gem 'heroku-headless'

# for Money paremeters
gem 'money-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'execjs'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

#gem 'jquery-rails'
gem "jquery-rails", "2.3.0"
gem 'rails3-jquery-autocomplete'
gem "bcrypt-ruby", "~> 3.0.1"
gem "orm_adapter", "~> 0.4.0"
gem "railties", "~> 3.2.13"
gem "warden", "~> 1.2.1"
gem "devise", "~> 2.2.4"
gem 'figaro'
gem "nested_form", :git => 'https://github.com/ryanb/nested_form.git'
gem 'prawn'
gem 'pdf-merger'

group :development, :test do
  # Pretty printed test output
  gem 'sqlite3'
  gem 'rake', "~> 10.0.4"
  gem "rspec-rails", ">= 2.0.1"
  gem 'capybara'
  gem "nokogiri", "~> 1.5.9"
  gem 'launchy'
  gem 'database_cleaner'
  gem 'turn', :require => false  
end

group :test do
  gem 'cucumber-rails', :require => false
end

group :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
