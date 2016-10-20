require 'data_mapper'

class UserEntity
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :gender,   Enum[:male, :female], default: :male
end