# For the documentation check http://sinatrarb.com/intro.html
require 'money/bank/currencylayer_bank'
class ApplicationController < Sinatra::Base
	# This configuration part will inform the app where to search for the views and from where it will serve the static files
  	configure do
    	set :views, "app/views"
    	set :public_dir, "public"
	  end
	
	  before do		 #set result on load to an empty strinf
		@result= ''
		@message="Verify Currencies Or type conversion not supported"
	  end

	  
	#currencylayer api config
	mclb = Money::Bank::CurrencylayerBank.new
	mclb.access_key = ENV['ACCESS_KEY']
	mclb.update_rates				 		# Update rates (get new rates from remote if expired or access rates from cache)
	Money.default_bank = mclb				# Set money default bank to Currencylayer bank
	

	def CheckCurrencies?(from,to) 			# return boolean value telling if the conversion operation is allowed  or not 
		if from == 'USD' || from == 'CHF' 
			to == 'EUR'
		elsif from =='Choose' || to =='Choose'
			 false
		else
			true
		end
	end

	def Convert (amount , from , to)

		if CheckCurrencies?(from,to)

			Money.new( amount.to_i * 100, from).exchange_to(to).format 
		else
			
			return @message
		end
	end

	def Addconversion( amount , from , to, result) 		#save the operation into database 

		conversion=ConvertOperation.new
		conversion.amount,conversion.from,conversion.to,conversion.result = amount , from , to, result
		conversion.save
	end

	get '/' do
		erb :index

	end

	post '/' do

		@result = Convert(params[:amount],params[:from],params[:to])
		
		if @result != @message # verify before saving to database
		Addconversion(params[:amount],params[:from],params[:to],@result)
		end
		erb :index
	end

	get '/history' do
		
			@operations = ConvertOperation.all
			erb :history
	end


end