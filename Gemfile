source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem "rails_admin"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'


group :test, :development do
  gem "rspec-rails"
  gem "require_relative"
  gem "factory_girl_rails",  "=1.7.0"
  gem "capybara"
end

#gem "foreigner"

gem "fastercsv"
gem "rails_admin"
gem "devise"

gem "ruby-prof", :platform => :ruby  #ruby-prof failed to be compiled in jruby

group :active_record do
  platforms :jruby do
    #gem 'activerecord-mysql2-adapter'
    gem 'activerecord-jdbcmysql-adapter'
    gem 'mysql'
    #gem "activerecord-jdbcsqlite3-adapter" #, :platforms => :jruby
    #gem "jdbc-sqlite3"  #, :platforms => :jruby
    gem "jruby-openssl" #, :platforms => :jruby
  end
  platforms :ruby, :mswin, :mingw do
    #gem 'sqlite3'
    #gem 'activerecord-mysql2-adapter'
    gem 'mysql2'
  end
end

#gem "passenger", #, :platforms => :jruby
#gem "mongrel", "1.2.0.pre2"

gem 'geocoder'
gem 'gmaps4rails'
