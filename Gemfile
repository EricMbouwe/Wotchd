source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching;https://github.com/karthi07/restaurant_page_js/issues/2 required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'coderay'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # adds
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # adds
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootstrap', '~> 4.4.1'
gem 'hirb'

# gems for authentication
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'rack-cors', require: 'rack/cors'

# added gems
gem 'better_errors', '~> 2.7', '>= 2.7.1'
gem 'gravatar_image_tag', '~> 1.2'
# gem 'simple_form', '~> 5.0', '>= 5.0.2'
gem 'guard', '~> 2.14'
gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false

# amazon gem for production
gem 'aws-sdk-s3', require: false

group :production do
  gem 'pg', '>= 0.18', '< 2.0'
end
