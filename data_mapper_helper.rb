require 'data_mapper'
require 'dm-migrations'

#DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.dirname(__FILE__))}/db.sqlite")
DataMapper.finalize
