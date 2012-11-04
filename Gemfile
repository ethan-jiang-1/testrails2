source 'https://rubygems.org'

gem 'rails', '3.2.8'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
  gem "rails_admin"
end


group :test, :development do
  gem "rspec-rails"
  gem "require_relative"
  gem "factory_girl_rails",  "=1.7.0"
  gem "capybara"
end

gem "pg"

group :active_record do
  platforms :jruby do
    #gem 'activerecord-mysql2-adapter'
    #gem 'activerecord-jdbcmysql-adapter'
    #gem 'mysql'
    #gem "activerecord-jdbcsqlite3-adapter" #, :platforms => :jruby
    #gem "jdbc-sqlite3"  #, :platforms => :jruby
    #gem "jruby-openssl" #, :platforms => :jruby
  end
  platforms :ruby, :mswin, :mingw do
    #gem 'sqlite3'
    #gem 'activerecord-mysql2-adapter'
    #gem 'mysql2'
    #gem 'mysql'
  end
end


gem 'geocoder'
gem 'gmaps4rails'
gem 'jquery-rails'
gem 'json'
gem "fastercsv"
gem "rails_admin"
gem "devise"

gem "ruby-prof", :platform => :ruby  #ruby-prof failed to be compiled in jruby
