class Group

  attr_accessor :id, :name

  def initialize(name)
    @name = name
  end

  def self.from_entity(group_entity)
    group = Group.new(group_entity.name)
    group.id = group_entity.id
    return group
  end

end