require './lib/entity/user_entity'
require './lib/model/user'

class UserRepository

  def save(user)
    UserEntity.create(name: user.name, gender: user.gender)
  end

  def find_all
    UserEntity.find.map { |user_entity| User.new(user_entity.name, user_entity.gender) }
  end

end