require 'active_record'
require_relative './setup'
require_relative './contact'
require_relative './contact_list'


contact_list = ContactList.new
contact_list.run
