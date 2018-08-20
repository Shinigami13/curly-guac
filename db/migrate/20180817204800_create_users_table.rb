class CreateUsersTable < ActiveRecord::Migration[5.2]

module ProfileInfo
  attr_accessor :fullname :first_name :last_name :email :birthday


def full_name
  return @first_name + " " + @last_name
end

# def birthday
  #mm/dd/yyyy
    #month
    #day
    #year
  # end


  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_hash
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :users, :email, unique true
  end
end

class user1
  include ContactInfo
end

class admin1
  include ContactInfo
end

class

## THIS IS IMPORTANT THIS IS DATABASES WORK
## STUDY THIS
