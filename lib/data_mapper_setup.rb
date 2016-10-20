require 'data_mapper'

def set_up_data_mapper
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'sqlite::memory:')
  DataMapper.auto_migrate!
end