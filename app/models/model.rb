#hisotry of conversions table
class ConvertingHistory
	include DataMapper::Resource

	property :id,         Serial    # An auto-increment integer key
	property :from,       String   
	property :to,         String  
	property :result,     String    
  
end

DataMapper.finalize
