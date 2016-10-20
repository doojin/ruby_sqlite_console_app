require 'data_mapper'
require './lib/repository/user_repository'
require './lib/model/user'
require './lib/entity/user_entity'

describe UserRepository do

  before :each do
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.auto_migrate!

    @user_repository = UserRepository.new
  end

  context 'save' do
    it 'should save user to database' do
      @user_repository.save(User.new('Dmitry', :male))
      @user_repository.save(User.new('Tanires', :female))

      users = UserEntity.all

      expect(users.size).to eql(2)

      expect(users[0].name).to eql('Dmitry')
      expect(users[0].gender).to eql(:male)

      expect(users[1].name).to eql('Tanires')
      expect(users[1].gender).to eql(:female)
    end
  end

  context 'find_all' do
    it 'should find all users' do
      UserEntity.create(name: 'User1', gender: :male)
      UserEntity.create(name: 'User2', gender: :female)
      UserEntity.create(name: 'User3', gender: :male)

      users = @user_repository.find_all

      expect(users.size).to eql(3)

      expect(users[0].name).to eq('User1')
      expect(users[0].gender).to eq(:male)

      expect(users[1].name).to eq('User2')
      expect(users[1].gender).to eq(:female)

      expect(users[2].name).to eq('User3')
      expect(users[2].gender).to eq(:male)
    end
  end

end