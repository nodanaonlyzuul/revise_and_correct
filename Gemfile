source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'bootstrap-will_paginate', '~> 1.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt',  '~> 3.1.7'
gem 'twitter', '~> 6.2'

group :development, :test do
  gem 'pry', '~> 0.11.3'
  gem 'thin', '~> 1.7', '>= 1.7.2'
  gem 'rspec-rails', '~> 3.7'
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
end

group :test do
  gem 'shoulda-matchers', '~> 3.0'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'bullet', '~> 5.7', '>= 5.7.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
