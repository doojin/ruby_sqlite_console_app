require 'data_mapper'

class GroupEntity
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, :required => true, :unique => true
end