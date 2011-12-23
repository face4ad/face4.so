class AddConfirmUser < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      t.confirmable
    end
    add_index :users, :confirmation_token,   :unique => true
  end

  def down
    remove_column :users, :confirmable
  end
end
