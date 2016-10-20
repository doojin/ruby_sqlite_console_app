require 'data_mapper'
require './lib/repository/user_repository'
require './lib/model/user'
require './lib/entity/user_entity'

describe UserRepository do

  before :each do
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.finalize
    DataMapper.auto_migrate!

    @group_repository = GroupRepository.new
    @user_repository = UserRepository.new
  end

  context 'save' do
    it 'should save user to database' do
      @group_repository.save('Group 1')
      @group_repository.save('Group 2')
      @user_repository.save(User.new('Dmitry', :male, 'Group 1'))
      @user_repository.save(User.new('Tanires', :female, 'Group 2'))

      users = UserEntity.all

      expect(users.size).to eql(2)

      expect(users[0].name).to eql('Dmitry')
      expect(users[0].gender).to eql(:male)
      expect(users[0].group_entity.name).to eql('Group 1')

      expect(users[1].name).to eql('Tanires')
      expect(users[1].gender).to eql(:female)
      expect(users[1].group_entity.name).to eql('Group 2')
    end
  end

  context 'find_all' do
    it 'should find all users' do
      UserEntity.create(name: 'User1', gender: :male, group_entity: GroupEntity.create(name: 'Group 1'))
      UserEntity.create(name: 'User2', gender: :female, group_entity: GroupEntity.create(name: 'Group 2'))
      UserEntity.create(name: 'User3', gender: :male, group_entity: GroupEntity.create(name: 'Group 3'))

      users = @user_repository.find_all

      expect(users.size).to eql(3)

      expect(users[0].name).to eq('User1')
      expect(users[0].gender).to eq(:male)
      expect(users[0].group).to eq('Group 1')

      expect(users[1].name).to eq('User2')
      expect(users[1].gender).to eq(:female)
      expect(users[1].group).to eq('Group 2')

      expect(users[2].name).to eq('User3')
      expect(users[2].gender).to eq(:male)
      expect(users[2].group).to eq('Group 3')
    end
  end

end