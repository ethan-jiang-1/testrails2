ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'stringio'
require 'test/unit'
if ENV['UNDER_HUDSON']
  require 'rubygems'
  require 'ci/reporter/rake/test_unit_loader'
end
#require File.dirname(__FILE__) + '/../lib/icalendar'

class ActiveSupport::TestCase
 # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

