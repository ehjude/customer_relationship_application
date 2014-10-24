class Rolodex
	attr_reader :contacts
	@@index = 1000
	
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end
end