require './lib/entity/group_entity'
require './lib/model/group'

class GroupRepository

  def save(name)
    GroupEntity.create(name: name)
  end

  def find_all
    GroupEntity.find.map { |group_entity| Group.from_entity(group_entity) }
  end

  def find_by_name(name)
    group = GroupEntity.first(name: name)
    unless group.nil?
      Group.from_entity(group)
    end
  end

end