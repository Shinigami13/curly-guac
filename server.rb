require 'sinatra'
require 'sinatra/activerecord'
enable  :sessions
require 'active_record'
set :database, 'sqlite3:practiceOne.sqlite3'
#ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])


get '/' do
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
email: params['email'],
password: params['password'],
name: params['name'],
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
  upassword = params['password']
  user = User.find_by(email: email)
  if user.password == upassword
    session[:user] = user
    redirect :account
  else
    p 'Invalid credentials'
    redirect '/'
  end
end


get '/account' do
  # email = params['email']
  # user_password = params['password']
  # user = Posts.find_by(email: email)
  # if
  #   user = Posts.new(
  #   email: params['email'],
  #   password: params['password'],
  #   first_name: params['name'],
  #   birthday: params['birthday']
  #   )
   # title = params['title'],
   # content = params['content'],
   # text = params['text'],
   # user = params['user'],
   # session[:user] = user
# else
  erb :account
end



get '/logout' do
    session[:user] = nil
    p 'user has logged out.'
    redirect '/'
  end

require './models'
