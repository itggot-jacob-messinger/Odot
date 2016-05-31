class Seeder

	def self.seed!
		self.user
		self.list
		self.group
	end


	def self.user
		User.create(id: 1,
					first_name: "Jacob",
					last_name: "Messinger",
					username: "MSNMessinger",
					mail: "jacob.messinger@itggot.se",
					password: "Jacob123"
					)

		User.create(id: 2,
				first_name: "Vilhelm",
				last_name: "Melkstam",
				username: "Villevillekulla",
				mail: "vilhelm.melkstam@itggot.se",
				password: "Villhelm123"
				)
	end

	def self.list
		List.create(id: 1,
					name: "Inköp",
					user_id: 1
			)
	end	

	def self.group
		Group.create(id: 1,
					name: "Familjen")
	end


end
