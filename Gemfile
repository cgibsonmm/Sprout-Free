source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'


# styling
gem 'bootstrap', '~> 4.1.3'
gem 'font_awesome5_rails'
gem 'gravtastic'
gem 'trix-rails', require: 'trix'
gem 'shrine'
gem "aws-sdk-s3", "~> 1.2", require: false
gem 'jquery-fileupload-rails'
gem 'local_time'
gem 'haml-rails'
gem "breadcrumbs_on_rails"
gem 'browser', '2.0.3'

# auth

gem 'devise'
gem 'the_big_username_blacklist'
gem "administrate"
gem 'cancancan'
gem 'rolify'

gem 'jquery-atwho-rails'


# Added for checking memory leaks
# gem 'derailed'

gem 'pg'

# Gen
gem 'friendly_id', '~> 5.2.0'
gem 'jquery-rails'
gem 'acts_as_list'
gem 'gon'
gem 'jquery-ui-rails'
gem 'simple_form'
gem 'pagy'
gem 'sidekiq'

# gem 'ransack', github: 'activerecord-hackery/ransack'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
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
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'poltergeist'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :development do
  gem 'redis-rails'
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem "letter_opener"
  gem "better_errors"
  gem "binding_of_caller"
  gem 'bullet'
  gem 'annotate'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'scout_apm'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
