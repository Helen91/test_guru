class AddCorrectQuestionsToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tests, :correct_questions, :integer
  end
end
