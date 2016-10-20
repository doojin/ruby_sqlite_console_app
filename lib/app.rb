require 'data_mapper'
require './lib/model/user'
require './lib/repository/group_repository'
require './lib/repository/user_repository'
require './lib/data_mapper_setup'

set_up_data_mapper

user = User.new('Dmitry', :male, '4103BD')

group_repository = GroupRepository.new
group_repository.save('4102BD')
group_repository.save('4103BD')

user_repository = UserRepository.new
user_repository.save(User.new('Dmitry', :male, '4103BD'))
user_repository.save(User.new('Dmitry', :male, '4103BD'))
user_repository.find_all.each { |u| puts "#{u.name} - #{u.gender} - #{u.group}" }

puts group_repository.find_all