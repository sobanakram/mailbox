source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> #{`cat .ruby-version`.strip}"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.2.2'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'aws-sdk-s3', "~> 1.95", require: false
gem 'devise', '~> 4.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.12'

gem 'mailgun-ruby', '~> 1.1'

gem 'trestle', "~> 0.9"
gem 'trestle-active_storage', "~> 3.0"
gem 'trestle-auth', "~> 0.4"
gem 'trestle-tinymce', "~> 0.3"

# Use postgres as the database for production
gem 'pg', "~> 1.2"

gem 'discard', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.7', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', "~> 11.1", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'better_errors', "~> 2.9"
  gem 'binding_of_caller', "~> 1.0"
  gem 'listen', "~> 3.5"
  gem 'web-console', '~> 4.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', "~> 2.1"
  gem 'spring-watcher-listen', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
