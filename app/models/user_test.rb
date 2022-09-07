class UserTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :question, optional: true

  before_update :before_update_set_next_question

  private

  def before_update_set_next_question
    questions = test.questions.order(:id)
    current_question_index = questions.find_index(question)
    self.question = questions[current_question_index + 1] if current_question_index
  end

end
