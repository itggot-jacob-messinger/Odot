class Item

	include DataMapper::Resource 

	property :id, Serial
	property :content, String
	belongs_to :list
end