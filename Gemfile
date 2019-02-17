source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'


# styling

gem 'materialize-sass', '~> 1.0.0'
gem 'material_icons'

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

# @ mentions
gem 'tribute'
gem 'social-share-button'

# auth

gem 'devise'
gem 'the_big_username_blacklist'
gem "administrate"
gem 'cancancan'
gem 'rolify'

gem 'public_activity'

# Added for checking memory leaks
# gem 'derailed'

gem 'pg'
gem 'puma_worker_killer'
gem 'newrelic_rpm'

# Gen
gem 'friendly_id', '~> 5.2.0'
gem 'jquery-rails'
gem 'acts_as_list'
gem 'jquery-ui-rails'
gem 'simple_form'
gem 'pagy'
gem 'sidekiq'


# Default Gems
# gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
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
  gem 'rb-readline'
  gem 'faker'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing'
  gem 'rspec-sidekiq'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper' # <- New!
  gem 'factory_bot_rails'
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
  gem 'derailed_benchmarks'
end

group :production do
  gem 'scout_apm'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
