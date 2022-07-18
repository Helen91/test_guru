class AddTestsReferenceToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :test, foreign_key: true, null: false
  end
end
