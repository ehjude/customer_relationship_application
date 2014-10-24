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

	def find_by_id(id)
		@contacts.each do |contact|
			if contact.id == id
				return contact.first_name	
			end
		end
	end


end