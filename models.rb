  require 'bcrypt'
  class User < ActiveRecord::Base
  include BCrypt
  has_many :posts

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
    end
  end

 #this is unique information if I have anything to say about it
  class Post < ActiveRecord::Base
  	belongs_to :user
  end
