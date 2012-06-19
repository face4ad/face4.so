class AddUserIdOnCategory < ActiveRecord::Migration
  def up
    add_column :categories, :user_id, :integer
  end

  def down
    remove_column :categories, :user_id
  end
end
