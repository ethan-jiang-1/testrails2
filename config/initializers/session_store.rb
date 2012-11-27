# Be sure to restart your server when you modify this file.

#TestRails2::Application.config.session_store :cookie_store, :key => '_TestRails2_session'
#TestRails2::Application.config.session_store :active_record_store, :key => '_TestRails2_session'

#use memcached for sessions instead of the cookie-based default,
#sudo apt-get install memcached or sudo yum install memcached
require 'memcache'
memcache_options = {
   :compression => true,
   :debug => false,
   :namespace => "mem-#{Rails.env}",
   :readonly => false,
   :urlencode => true
}

memcache_servers = ['localhost:11211']
CACHE = MemCache.new(memcache_options)
CACHE.servers= memcache_servers
TestRails2::Application.config.session_store :mem_cache_store ,:cache=>CACHE

# start memcached in debug mode
# sudo /etc/init.d/memcached stop
# memcached -vv -l localhost -p 11211 -m 256 -P /tmp/memcached.pid -u root


# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# TestRails2::Application.config.session_store :active_record_store


#options:
#  :xxxx_store  [:cookie_store|:active_record_store]
#  :key => "_yourapp_session"
#  :expire_after => 2.minutes

#AppName::Application.config.session_store :active_record_store
#AppName::Application.config.secret_token = 'really long random string'
#AppName::Application.config.cookie_secret = 'another really long random string'
