# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
#CurrencyLayer Access Key 
ENV['ACCESS_KEY'] ||= "faaa8581cf0ee2f9658a0e58b6d70415"

# Add the needed requirement to boot the app
require 'bundler/setup'
require 'rubygems'
require 'data_mapper'
require 'json'
Bundler.require(:default, ENV['SINATRA_ENV'])

# Setting DataMapper database connection

DATABASE_URL="postgres://ameni:ameni123@localhost/convertcurrencydb"
DataMapper.setup(:default,DATABASE_URL )
# Loading all the files in app folder
require_all 'app'
#upgrade database 
DataMapper.auto_upgrade!

#money deprecation issue 
Money.locale_backend = nil
I18n.enforce_available_locales = false #silence deprecation warnings