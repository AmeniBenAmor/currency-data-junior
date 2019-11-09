#hisotry of conversions table
class ConvertOperation
	include DataMapper::Resource

	property :id,         Serial    # An auto-increment integer key
	property :amount,     String   
	property :from,       String   
	property :to,         String  
	property :result,     String    
	
	


end

DataMapper.auto_upgrade!

DataMapper.finalize
