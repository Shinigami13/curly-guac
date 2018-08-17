require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'

set :database, 'sqlite3:practiceOne.sqlite3'

get '/' do
p 'Frank Sinatra is mother fucking running in this BITCH!!!'
erb :home
end

get '/variables' do
p 'In this BITCH!!!'
erb :variables
end

get '/variable' do
erb :variable
end


require './models'
