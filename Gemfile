source 'https://rubygems.org'

gem 'rails', '3.2.13'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'

  #assets in rails_admin?
  gem "rails_admin"


  #bootstrap
  gem "twitter-bootstrap-rails", '2.2.6'

  #gem "therubyrhino"             #rhio engine - good for jruby
  gem "therubyracer"              #google v8   - good for MRI
  gem "less-rails"                # sprockets (what rails 3.1 uses for its asset pipeline) supports LESS

end


group :test, :development do
  gem "rspec-rails"
  gem "require_relative"
  gem "factory_girl_rails"
  gem "capybara"

  gem "ruby-prof", :platform => :ruby  #ruby-prof failed to be compiled in jruby, code profiler
  gem "annotate"
end

#bootstrap



#jquery
gem 'jquery-rails'
gem 'jquery-ui-rails'

#db
gem 'mysql2'

#utilities - backend
gem 'geocoder'
gem 'gmaps4rails'
gem 'json'
gem "fastercsv"                 #csv: mime type for Comma_separated Values
gem "awesome_print"
gem "simple_form"
gem "uuidtools"


#utilities - back/frontend
gem "bootstrap-datepicker-rails"
#gem "in_place_editing"

#plugins
gem "rails_admin"
gem "devise"
