require 'data_mapper'
require './lib/model/user'
require './lib/repository/user_repository'
require './lib/data_mapper_setup'

set_up_data_mapper

user = User.new('Dmitry', :male)

user_repository = UserRepository.new
user_repository.save(user)
user_repository.find_all.each { |u| puts u }