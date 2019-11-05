# this is a simple model example
# check https://datamapper.org/getting-started.html
class Model
	include DataMapper::Resource

	property :id,         Serial    # An auto-increment integer key
	property :title,      String    # A varchar type string, for short strings
end