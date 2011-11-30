source 'http://rubygems.org'

gem 'rails', '>= 3.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'rake', '0.9.2.2'

# Deploy with Capistrano
 gem 'capistrano'

# devise plugin for authentification
 gem 'devise' 

# pagination for the atom
gem 'will_paginate', '>= 3.0.pre'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# rails 3.1 uses default JQuery so this line is to use RJS instead, also 
# 
gem 'prototype-rails'

group :development do
  #gem 'webrat'
  gem 'sqlite3'
end

group :test do
  gem 'sqlite3'
end

group :production do
  gem 'unicorn'
  gem 'sqlite3'
end
