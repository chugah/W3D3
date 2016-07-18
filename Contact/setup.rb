require 'pry' # in case you want to use binding.pry
require 'active_record'
require_relative 'contact'
require_relative 'contact_list'

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'contact',
  username: 'devone',
  password: 'devone',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

ActiveRecord::Schema.define do
  drop_table :contact if ActiveRecord::Base.connection.table_exists?(:contact)
  create_table :contact do |t|
    t.column :name, :string
    t.column :email, :string
    t.timestamps null: false
  end
end

puts 'Setup DONE'