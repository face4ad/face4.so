class AddCounterCache4QAndA < ActiveRecord::Migration
  def up
    add_column :users, :questions_count, :integer, :default => 0
    add_column :users, :answers_count, :integer, :default => 0
    add_column :questions, :answers_count, :integer, :default => 0
  end

  def down
  end
end
