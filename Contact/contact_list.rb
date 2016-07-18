require 'active_record'
require 'colorize'
require 'pp'
require_relative './contact'

class ContactList 
  
  def start
    case ARGV[0]
    when "new"
      add_new_contact
    when "list"
      list_all
    when "find"
      find_by_id
    when nil
      run
    else
      run
    end
  end
  
  def run
    puts "Select one of the options below to get started".blue
    puts " new      - Create a new contact".green
    puts " list     - List all contacts".red
    puts " find     - Find contact by id".green
    puts " search   - Look for a contact".red
    puts " update   - Update your contact".green
    puts " quit     - Exit Application".red
    print "> ".yellow
    input = STDIN.gets.chomp
    program_response(input)
  end

  def add_new_name
    print "Please enter the first and last name: ".blue
    name = STDIN.gets.chomp.to_s
  end

  def add_new_email
    print "Please enter the email address: ".blue
    email = STDIN.gets.chomp.to_s
  end

  def add_new_contact
    new_name = add_new_name
    new_email = add_new_email
    Contact.create(name: new_name, email: new_email)
    puts "\n"
    #puts "#{@new_name} and #{@new_email}, have been added.".green
    #puts "\n"
    run
  end

  def list_all
     Contact.all
     run
  end
  
  def find_by_id
    puts "Please enter the id number: ".blue
    print ">> ".yellow
    id = STDIN.gets.chomp
    puts Contact.find(id)

  end
  
  def search 
    puts "Please enter the person's name or email: ".blue
    term = STDIN.gets.chomp
    Contact.search_result(term)
  end
  
  def update
    puts "Please enter your id: ".blue
    id = gets.chomp.to_i
    puts "Please enter your name: ".blue
    new_name = gets.chomp
    puts "And your email: ".blue
    new_email = gets.chomp
    old_contact = Contact.find(id)
    #new_contact = Contact.new(new_name, new_email, id)
    new_contact = Contact.save(new_name, new_email)
    #puts "#{old_contact} has been changed to #{new_contact.inspect}".red
  end

  def program_response(response)
    option = response.downcase
    case option
    when 'new'
      add_new_contact
    when 'list'
      puts Contact.all
    when 'find'
      find_by_id
    when 'search'
      search
    when 'update'
      update
    when 'quit'
      puts 'Have a nice day!'.green
      exit
    else 
      puts "Sorry, that's not a valid option. Please try again.".red
      run
    end
  end

end