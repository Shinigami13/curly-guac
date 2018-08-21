class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_posts :posts do |y|
    t.string
    t.string :
    t.datetime
  end
end
