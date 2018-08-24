source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
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
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


# HS2 gems
gem "opal-jquery", git: "https://github.com/opal/opal-jquery.git", branch: "master"
gem 'opal', github: 'janbiedermann/opal', branch: 'es6_import_export'
gem 'opal-autoloader', github: 'janbiedermann/opal-autoloader', branch: 'master'
gem 'hyper-business', github: 'janbiedermann/hyper-business', branch: 'ulysses'
gem 'hyper-gate', github: 'janbiedermann/hyper-gate', branch: 'ulysses'
#gem 'hyper-international', github: 'janbiedermann/hyper-international', branch: 'ulysses'
gem 'hyper-react', github: 'janbiedermann/hyper-react', branch: 'ulysses'
gem 'hyper-resource', github: 'janbiedermann/hyper-resource', branch: 'ulysses'
gem 'hyper-router', github: 'janbiedermann/hyper-router', branch: 'ulysses'
#gem 'hyper-spectre', github: 'janbiedermann/hyper-spectre', branch: 'master'
gem 'hyper-store', github: 'janbiedermann/hyper-store', branch: 'ulysses'
gem 'hyper-transport-actioncable', github: 'janbiedermann/hyper-transport-actioncable', branch: 'ulysses'
gem 'hyper-transport-store-redis', github: 'janbiedermann/hyper-transport-store-redis', branch: 'ulysses'
gem 'hyper-transport', github: 'janbiedermann/hyper-transport', branch: 'ulysses'
gem 'opal-webpack-compile-server', github: 'janbiedermann/opal-webpack-compile-server', branch: 'master'

#  Hyperloop gems
# gem "opal-jquery", git: "https://github.com/opal/opal-jquery.git", branch: "master"
# gem 'hyperloop', git: 'https://github.com/ruby-hyperloop/hyperloop', branch: 'edge'
# gem 'hyper-react', git: 'https://github.com/ruby-hyperloop/hyper-react', branch: 'edge'
# gem 'hyper-component', git: 'https://github.com/ruby-hyperloop/hyper-component', branch: 'edge'
# gem 'hyper-router', git: 'https://github.com/ruby-hyperloop/hyper-router', branch: 'edge'
# gem 'hyper-store', git: 'https://github.com/ruby-hyperloop/hyper-store', branch: 'edge'
# gem 'hyperloop-config', git: 'https://github.com/ruby-hyperloop/hyperloop-config', branch: 'edge'
# gem 'opal_hot_reloader', git: 'https://github.com/fkchang/opal-hot-reloader.git'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.3.1', require: false

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

  gem 'foreman'
end

group :test do
  # Coveralls coverage
  gem 'coveralls', require: false
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
