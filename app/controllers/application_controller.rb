# For the documentation check http://sinatrarb.com/intro.html
require 'money/bank/currencylayer_bank'
class ApplicationController < Sinatra::Base
	# This configuration part will inform the app where to search for the views and from where it will serve the static files
  	configure do
    	set :views, "app/views"
    	set :public_dir, "public"
	  end
	  before do
		@result= ''
	  end

	  
	#currencylayer api config
	mclb = Money::Bank::CurrencylayerBank.new
	mclb.access_key = ENV['ACCESS_KEY']
	mclb.update_rates # Update rates (get new rates from remote if expired or access rates from cache)
	Money.default_bank = mclb	# Set money default bank to Currencylayer bank
	Money.locale_backend = :i18n
	I18n.enforce_available_locales = false

	def CheckCurrencies?(from,to)
		if from == 'USD' || from == 'CHF'
			 to == 'EUR'
		else
			 true
		end
	end
	def Convert (amount , from , to)

		if CheckCurrencies?(from,to)

			Money.new( amount.to_i * 100, from).exchange_to(to).format 

		else

			 "we don't support this type of conversion "
	
		end
	end
	def Addconversion( amount , from , to, result)
		conversion=ConvertOperation.new
		conversion.amount,conversion.from,conversion.to,conversion.result = amount , from , to, result
		 
		conversion.save
	end

	get '/' do
		erb :index

	end

	post '/' do
		@result = Convert(params[:amount],params[:from],params[:to])
		Addconversion(params[:amount],params[:from],params[:to],@result)
		erb :index

	end
	get '/history' do
	@operations = ConvertOperation.all
    erb :history
	end



	
end