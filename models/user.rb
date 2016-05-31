class User

include DataMapper::Resource 

	property :id, Serial
	property :first_name, String, required: true
	property :last_name, String, required: true
	property :username, String, required: true, unique: true
	property :mail, String, required: true, unique: true
	property :password, BCryptHash, required: true

	has n, :usergroupings
	has n, :group, through: :usergroupings          
end