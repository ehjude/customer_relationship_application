require_relative './contact.rb'
require_relative './rolodex.rb'

class CRM
	attr_reader :name
	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end


# ==============================
# DISPLAY CONTACTS
# ==============================
	def main_menu
		while true
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7
			choose_option(input)
		end
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

	def choose_option(option)
		case option
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_all_contacts
			when 4 then display_contact
			when 5 then display_attribute
			when 6 then delete_which_contact
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

# ==============================
# DISPLAY CONTACTS
# ==============================

	def display_all_contacts
		@rolodex.contacts.each do |user|
			puts "First Name:#{user.first_name}" 
			puts "Last Name: #{user.last_name}"
			puts "Email Address:#{user.email}" 
			puts "Note: #{user.note}"
		end
	end

	def display_contact
		puts "What is the ID of the contact you want to display?"
		display_id = gets.chomp.to_i			
		
		@rolodex.contacts.each do |user|
			if user.id == display_id	
				puts "First Name:#{user.first_name}" 
				puts "Last Name: #{user.last_name}"
				puts "Email Address:#{user.email}" 
				puts "Note: #{user.note}"
			end
		end		

	end

# ==============================
# MODIFY CONTACTS
# ==============================
	def modify_contact
		print_modify_contact
  	modify_attribute = gets.chomp.to_i

  	if modify_attribute == 5  	
  		main_menu 
  	else 
	  	puts "Are you sure you want to change this attribute [Y/N]"
	  	confirm = gets.chomp
	  	if confirm.downcase == "y"
	  		modify_contact_option(modify_attribute)
	  	else
	  		modify_contact
	  	end
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
		puts "---------------------"		
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

	def modify_first_name
		puts "What is the id of the person whose name you want to change?"
		modify_id = gets.chomp.to_i
		name = @rolodex.find_by_id(modify_id)
		puts "#ID #{modify_id}'s first name is: #{name}"
		puts "What do you want to change this name to?"
		new_first_name = gets.chomp
		@rolodex.change_first_name(modify_id, new_first_name)
	end

# ==============================
# DISPLAY ATTRIBUTES
# ==============================

	def display_attribute
		print_display_attribute
		show_attribute = gets.chomp.to_i

		if show_attribute == 5  	
  		main_menu 
  	else 
  		print_attribute(show_attribute)
  	end
	end

	def print_display_attribute		
		puts "---------------------"
		puts "What attribute do you want to find a user by (enter a number)"		
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		puts "[5] Cancel"
		puts "---------------------"		
	end

	def print_attribute(attribute_choice)
		case attribute_choice
			when 1 then display_first_name
			when 2 then display_last_name	
			when 3 then display_email_name	
			when 4 then display_name				
		end
	end

	def display_first_name
		puts "What first name do you want to search for?"
		first_name = gets.chomp
	end

# ==============================
# DELETE CONTACTS
# ==============================

	def delete_which_contact
		puts "What is the ID of the contact you want to delete?"
		user_id = gets.chomp.to_i
		@rolodex.delete_contact(user_id)
	end

end


crm = CRM.new("Bitmaker Labs")
crm.main_menu

