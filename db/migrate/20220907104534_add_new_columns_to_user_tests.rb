class AddNewColumnsToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_tests, :question, foreign_key: true
    add_column :user_tests, :correct_questions, :integer, default: 0
  end
end
