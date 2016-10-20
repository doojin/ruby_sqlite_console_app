require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite::memory')

class User
  include DataMapper::Resource

  property :id,   Serial
  property :name, String
end

DataMapper.auto_migrate!

user = User.create(name: 'Dmitry')

users = User.all.each do |u|
  puts u.name
end