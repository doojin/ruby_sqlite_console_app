require './lib/model/group'

class User
  attr_accessor :name, :gender, :group

  def initialize(name, gender, group)
    @name = name
    @gender = gender
    @group = group
  end

  def self.from_entity(user_entity)
    User.new(user_entity.name, user_entity.gender, Group.from_entity(user_entity.group_entity))
  end

end