require 'data_mapper'
require './lib/repository/group_repository'
require './lib/entity/group_entity'

describe GroupRepository do

  before :each do
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.finalize
    DataMapper.auto_migrate!

    @group_repository = GroupRepository.new
  end

  context 'save' do
    it 'should save group to database' do
      @group_repository.save('Group1')
      @group_repository.save('Group2')

      groups = GroupEntity.all

      expect(groups.size).to eql(2)
      expect(groups[0].name).to eql('Group1')
      expect(groups[1].name).to eql('Group2')
    end
  end

  context 'find_all' do
    it 'should find all groups' do
      GroupEntity.create(name: 'Group_1')
      GroupEntity.create(name: 'Group_2')
      GroupEntity.create(name: 'Group_3')

      groups = @group_repository.find_all

      expect(groups.size).to eql(3)
      expect(groups[0].name).to eql('Group_1')
      expect(groups[1].name).to eql('Group_2')
      expect(groups[2].name).to eql('Group_3')
    end
  end

  context 'find_by_name' do
    it 'should find by name' do
      GroupEntity.create(name: 'Group 1')
      GroupEntity.create(name: 'Group 2')
      GroupEntity.create(name: 'Group 3')

      expect(@group_repository.find_by_name('Group 1').name).to eql('Group 1')
      expect(@group_repository.find_by_name('Group 2').name).to eql('Group 2')
      expect(@group_repository.find_by_name('Group 3').name).to eql('Group 3')
      expect(@group_repository.find_by_name('Group 4')).to be_nil
    end
  end

end