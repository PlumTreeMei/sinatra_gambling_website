require "dm-core"
require "dm-migrations"

DataMapper.setup(:default,"sqlite3://#{Dir.pwd}/User.db")

class User
  include DataMapper::Resource
  property(:name,Text, :key=>true)
  property(:psw,Text)
  property(:accWin,Integer)
  property(:accLoss,Integer)
  property(:accProfit,Integer)
end
DataMapper.finalize