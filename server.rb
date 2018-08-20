require 'sinatra'
require 'sinatra/activerecord'
# require 'securerandom'
enable :sessions

set :database, 'sqlite3:practiceOne.sqlite3'

get '/' do
p 'Frank Sinatra is mother fucking running in this BITCH!!!'
  @users = User.all
  p @users
  erb :home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  user = User.new(
name: params['full_name'],
email: params['email'],
password: params['password'],
first_name: params['first_name'],
last_name: params['last_name'],
birthday: params['birthday']
  )
user.save
redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  email = params['email']
  user_password = params['password']
  user = User.find_by(email: email)
  if user.password == user_password
    session[:user] = user
    redirect :account
  else
    p "Invalid credentials"
    redirect '/'
  end
end


get '/account' do
  erb :account
end



get '/logout' do
    session[:user] = nil
    p "user has logged out."
    redirect '/'
  end

require './models'
