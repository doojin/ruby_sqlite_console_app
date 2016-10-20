require './lib/entity/group_entity'

class GroupRepository

  def save(name)
    GroupEntity.create(name: name)
  end

  def find_all
    GroupEntity.find.map { |group_entity| group_entity.name }
  end

end