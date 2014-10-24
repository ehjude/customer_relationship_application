require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name
	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu 
		puts "Welcome to #{@name}"
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"	
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end

	def main_menu
		while true
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7
			choose_option(input)
		end
	end

	def choose_option(option)
		case option
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_all_contacts
			when 4 then display_contact
			when 5 then display_attribute
			when 6 then delete_contact
		else
			puts "Invalid option. Try again!"
			return
		end
	end

	def add_contact
		print "First Name: "
		first_name = gets.chomp
		print "Last Name: "
		last_name = gets.chomp
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp

		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
		end
	end

	def print_modify_contact		
		puts "---------------------"
		puts "[1] Modify first name"
		puts "[2] Modify last name"
		puts "[3] Modify email"
		puts "[4] Modify note"
		puts "[5] Cancel"
		puts "What attribute do you want to modify (enter a number)"
	end

	def modify_contact
		print_modify_contact
  	modify_attribute = gets.chomp.to_i

  	main_menu if modify_attribute == 5  	
  	
  	puts "Are you sure you want to change this attribute [Y/N]"
  	confirm = gets.chomp
  	if confirm.downcase == "y"
  		modify_contact_option(modify_attribute)
  	else
  		modify_contact
  	end
	end

	def modify_contact_option(option)
		case option
			when 1 then modify_first_name
			when 2 then modify_last_name
			when 3 then modify_email
			when 4 then modify_note
			when 5 then	main_menu
		end
	end


end

crm = CRM.new("Bitmaker Labs")
crm.main_menu

