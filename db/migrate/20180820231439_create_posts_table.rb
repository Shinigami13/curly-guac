class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_posts :posts do |y|
    t.string :title
    t.string :content
    t.string :user
    t.datetime :created_at
    t.datetime :updated_at

  end
end
