source :rubygems


gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'json'
gem 'foreman'
gem 'data_mapper'
gem 'pony'
gem 'rack-recaptcha', :require => 'rack/recaptcha'

group :development do
  gem 'rest-client'
  gem 'travis-lint'
  gem 'mailcatcher'
  gem 'rerun'
  gem 'rb-inotify', '~> 0.8.8'
end

group :development, :test do
  gem 'sqlite3'
  gem 'dm-sqlite-adapter'
end

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

