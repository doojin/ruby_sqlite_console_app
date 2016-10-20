require 'data_mapper'

class UserEntity
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :gender,   Enum[:male, :female], default: :male

  belongs_to :group_entity
end