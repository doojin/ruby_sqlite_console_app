require './lib/entity/user_entity'
require './lib/entity/group_entity'
require './lib/model/user'

class UserRepository

  def save(user)
    UserEntity.create(name: user.name, gender: user.gender, group_entity: GroupEntity.first(name: user.group))
  end

  def find_all
    UserEntity.find.map do |user_entity|
      User.new(user_entity.name, user_entity.gender, user_entity.group_entity.name )
    end
  end

end