require 'active_record'
require 'pry'
require 'csv'
require 'pg'

class Contact < ActiveRecord::Base

  belongs_to :contact_list

  validates :name, presence: true
  validates :email, presence: true
=begin 
    def find(id)
      #result = @@conn.exec_params("SELECT * FROM contact WHERE id = $1::int;", [id]).to_a
      #puts result
    end
=end
    def search_result(term)
      result = Contact.("SELECT * FROM contact WHERE name LIKE $1 OR email LIKE $1", [term])
      pp result
    end
end

