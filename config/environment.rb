# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
#CurrencyLayer Access Key 
ENV['ACCESS_KEY'] ||= "fb3bf98504f3467b760050e5e1105858"

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
DataMapper.auto_upgrade!