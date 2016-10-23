require './lib/entity/user_entity'
require './lib/entity/group_entity'
require './lib/model/user'

class UserRepository

  def save(user)
    UserEntity.create(name: user.name, gender: user.gender, group_entity_id: user.group.id)
  end

  def find_all
    UserEntity.find.map { |user_entity| User.from_entity(user_entity) }
  end

end