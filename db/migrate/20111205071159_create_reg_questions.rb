class CreateRegQuestions < ActiveRecord::Migration
  def change
    create_table :reg_questions do |t|
      t.text :body
      t.string :answer
      t.string :kind

      t.timestamps
    end
  end
end
