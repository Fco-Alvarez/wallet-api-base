# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 6.1.7'

gem 'bcrypt', '~> 3.1', '>= 3.1.16'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'discard', '~> 1.2', '>= 1.2.1'
gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
gem 'jsonapi-serializer', '~> 2.2'
gem 'jwt', '~> 2.3'
gem 'pagy', '~> 5.10.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'brakeman', '~> 5.3', '>= 5.3.1'
  gem 'listen', '~> 3.3'
  gem 'rails_best_practices', '~> 1.23', '>= 1.23.1'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'faker', '~> 2.23'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21.2', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
