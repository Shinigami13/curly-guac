class CreateUsersTable < ActiveRecord::Migration[5.2]

def full_name
  @first_name = :first_name
  return @first_name
end


  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :password_hash
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :users, :email, unique true
  end
end




## THIS IS IMPORTANT THIS IS DATABASES WORK
## STUDY THIS
