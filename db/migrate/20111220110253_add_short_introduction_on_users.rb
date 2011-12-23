class AddShortIntroductionOnUsers < ActiveRecord::Migration
  def up
    add_column :users, :introduction, :string
  end

  def down
    remove_column :users, :introduction
  end
end
