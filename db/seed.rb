class Seeder

	def self.seed!
		self.user
		self.list
		self.group
		self.item
	end


	def self.user
		User.create(first_name: "Jacob",
					last_name: "Messinger",
					username: "MSNMessinger",
					mail: "jacob.messinger@itggot.se",
					password: "Jacob123"
					)

		User.create(first_name: "Vilhelm",
				last_name: "Melkstam",
				username: "Villevillekulla",
				mail: "vilhelm.melkstam@itggot.se",
				password: "Villhelm123"
				)
	end

	def self.list
		List.create(name: "Inköp",
					user_id: 1)
	end	

	def self.group
		Group.create(name: "Familjen")
	end

	def self.item
		Item.create(content: "Milk", list_id: 1)
		Item.create(content: "hej", list_id: 1)
	end

	def self.usergrouping
		Usergrouping.create(user_id: 1,
							list_id: 1)
	end
end