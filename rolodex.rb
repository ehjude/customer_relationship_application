class Rolodex
	attr_reader :contacts
	@@index = 1
	
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@index
		@@index += 1
		@contacts << contact
	end

	def delete_contact(id)
		@contacts.each do |contact|
			if contact.id == id
				contact.first_name = ""
				contact.last_name = ""
				contact.email = ""
				contact.note = ""
			end
		end
	end

	def find_by_id(id)
		@contacts.each do |contact|
			if contact.id == id
				return contact.first_name	
			end
		end
	end

	def change_first_name(id, first_name)
		@contacts.each do |contact|
			if contact.id == id
				contact.first_name = first_name
			end
		end
	end
end

