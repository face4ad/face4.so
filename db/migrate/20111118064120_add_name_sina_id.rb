class AddNameSinaId < ActiveRecord::Migration
  def up
    add_column :users, :name,      :string
    add_column :users, :sina_id,   :integer
    add_column :users, :sina_name, :string
    add_index  :users, :name
    add_index  :users, :sina_id
    add_index  :users, :sina_name
  end

  def down
  end
end
