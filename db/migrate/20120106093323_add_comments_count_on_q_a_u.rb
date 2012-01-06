class AddCommentsCountOnQAU < ActiveRecord::Migration
  def up
    add_column :questions, :comments_count, :boolean, :default => 0
    add_column :answers, :comments_count, :boolean, :default => 0
    add_column :users, :comments_count, :boolean, :default => 0
  end

  def down
    remove_column :questions, :comments_count
    remove_column :answers, :comments_count
    remove_column :users, :comments_count
  end
end
