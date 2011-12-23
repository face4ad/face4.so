class AddActiveOnUser < ActiveRecord::Migration
  def up
    add_column :users, :active, :boolean, :default => false
  end

  def down
    remove_column :users, :active
  end
end
