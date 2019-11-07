# For the documentation check http://sinatrarb.com/intro.html
require 'money/bank/currencylayer_bank'

class ApplicationController < Sinatra::Base
	# This configuration part will inform the app where to search for the views and from where it will serve the static files
  	configure do
    	set :views, "app/views"
    	set :public_dir, "public"
	  end
	  #
	  mclb = Money::Bank::CurrencylayerBank.new
	  mclb.access_key = ENV['ACCESS_KEY']
	  mclb.update_rates # Update rates (get new rates from remote if expired or access rates from cache)
	  mclb.cache = 'path/to/file/cache'


	 
	get '/' do
		erb :index
  	end

end