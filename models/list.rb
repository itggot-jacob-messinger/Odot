class List

	include DataMapper::Resource 

	property :id, Serial
	property :name, String

	belongs_to :user
	belongs_to :group, :required => false
end