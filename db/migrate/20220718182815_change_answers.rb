class ChangeAnswers < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :question, foreign_key: true, null: false
    add_column :answers, :correct, :boolean, default: false, null: false
  end
end
