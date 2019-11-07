# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
#CurrencyLayer Access Key 
ENV['ACCESS_KEY'] ||= "1124ff9784721bf56ed92f432f6acd15"

# Add the needed requirement to boot the app
require 'bundler/setup'
require 'rubygems'
require 'data_mapper'
Bundler.require(:default, ENV['SINATRA_ENV'])

# Setting DataMapper database connection
# Having trouble with database or you want to change the adapter ?! check https://datamapper.org/getting-started.html

DataMapper.setup(:default, 'postgres://ameni:ameni123@localhost/convertcurrencydb')
# Loading all the files in app folder
require_all 'app'
DataMapper.auto_upgrade!