require 'sinatra'
require 'sinatra/activerecord'
enable  :sessions
require 'active_record'
set :database, 'sqlite3:practiceOne.sqlite3'
#ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

#post/get '/'
get '/' do
  @users = User.all
  p @users
  erb :home
end

post '/' do
end

#/post/get signup
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
#get/post '/login'
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

#get/post '/acount'
get '/account' do
  erb :account
end

post '/account' do
  @posts = Post.new(
title: params['title'],
content: params['content'],
)
@posts.save
redirect '/posts'
end

#get/post '/logout'
  get '/logout' do
      session.clear
      redirect '/'
    end

  post '/logout' do
    redirect '/logout'
  end

#two to make sure,

  get '/posts' do
  erb :posts
  p 'am i working?'
  end

  get '/profile' do
    @user = User.find(session[:id])
    @blog = Profile.where(user_id: session[:id])
    @posts = Post.where(user_id: session[:id]).limit(20)
    #or range.reverse?
    erb :profile
  end


#get/post 'delete'
  get '/delete' do
    erb :delete
  end

  delete '/delete' do
    erb :delete
  end

#
get '/search' do
  erb :search
end

#get '/search/:tag'
#end

private
def user_exists?
    (session[:id] != nil) ? true : false
end

def current_user
    User.find(session[:id])
end


require './models'
