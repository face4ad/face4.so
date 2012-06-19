class AddPostCountToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :posts_count, :integer
  end
end
