class AddCounterOnRegQuestions < ActiveRecord::Migration
  def up
    add_column :reg_questions, :correct_counter, :integer, :default => 0
    add_column :reg_questions, :wrong_counter, :integer, :default => 0
  end

  def down
    remove_column :reg_questions, :correct_counter
    remove_column :reg_questions, :wrong_counter
  end
end
