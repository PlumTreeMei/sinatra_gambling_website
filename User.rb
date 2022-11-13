require 'sinatra'
require "dm-core"
require "dm-migrations"
configure :development do
  #setup sqlite database
  DataMapper.setup(:default,"sqlite3://#{Dir.pwd}/User.db")
end
configure :production do
  #setup ENV[ ] database
  DataMapper.setup(:default,URI.parse("postgres://xbuclrefkilasj:07c073f8a8ee5adb076b37d0a36b8e528ea17a29aac1aa35e39eac92ffed8cfc@ec2-44-206-214-233.compute-1.amazonaws.com:5432/da70n24h0g187j"))
end


class User
  include DataMapper::Resource
  property(:name,Text, :key=>true)
  property(:psw,Text)
  property(:accWin,Integer)
  property(:accLoss,Integer)
  property(:accProfit,Integer)
end
DataMapper.finalize