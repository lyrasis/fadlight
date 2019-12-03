# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# arclight
gem 'arclight', '~> 0.3.0'
gem 'blacklight_range_limit', '~> 7.1'

# rails
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'sass-rails', '~> 5.0'
gem 'tether-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'dotenv-rails'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'solr_wrapper', '>= 0.3'
end

gem 'bootstrap', '~> 4.0'
gem 'devise'
gem 'devise-guests', '~> 0.6'
gem 'jquery-rails'
gem 'popper_js'
gem 'rsolr', '>= 1.0', '< 3'
gem 'twitter-typeahead-rails', '0.11.1.pre.corejavascript'

gem 'blacklight-locale_picker'
