require 'sinatra'
require 'sinatra/activerecord'
enable  :sessions
require 'active_record'
set :database, 'sqlite3:practiceOne.sqlite3'
#ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

# def full_name
#   first_name + " " + last_name
# end

#post/get '/'
get '/' do
  @users = User.all
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
  # @user = User.create
  user = User.new(
first_name: params['first_name'],
last_name: params['last_name'],
email: params['email'],
password: params['password'],
birthday: params['birthday']
  )
#session[:user].id = @user.id
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
content: params['content']
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
    # @user = User.find(session[:user].id)
    # @blog = Profile.where(user_id: session[:id])
    @posts1 = Post.all
  erb :posts
  end

put '/posts' do
@posts1 = Post.where(user_id: session[:user]).limit(20)
redirect '/posts'
end

  get '/profile' do
    $user = User.find(session[:id])
    $blog = Profile.where(user_id: session[:id])
    $posts = Post.where(user_id: session[:id]).limit(20)
    #or range.reverse?
    erb :profile
  end


#get/post 'delete'
  get '/delete' do
    @user = User.find_by(email: params[:email])[:id]
if params[:password] == @user.upassword
    User.destroy(session[:id])
    session.clear
    redirect '/'
else
    redirect '/'
end
end

  delete '/delete' do
    erb :delete
  end

#
get '/search' do
  @posts1 = Post.where(user_id: session[:id]).limit(20)
  erb :search
end

# def self.search(search)
# 	where("name LIKE ?", "%#{search}%")
# 	where("content LIKE ?", "%#{search}%")
# end

#get '/search/:tag'
#end

# private
# def user_exists?
#     (session[:id] != nil) ? true : false
# end

# def current_user
#     User.find(session[:id])
# end


require './models'
