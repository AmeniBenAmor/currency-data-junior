#hisotry of conversions table
require 'dm-core'
require 'dm-validations' 

class ConvertOperation
	include DataMapper::Resource

	property :id,         Serial    # An auto-increment integer key
	property :amount,     String   
	property :from,       String   
	property :to,         String  
	property :result,     String    

	validates_presence_of :from
	validates_presence_of :to
	validates_presence_of :result

	


end

DataMapper.auto_upgrade!

DataMapper.finalize
