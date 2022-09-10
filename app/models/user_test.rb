class UserTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true, foreign_key: "question_id"

  before_validation :before_validation_set_first_question, on: :create
  # before_validation :before_validation_set_next_question, on: :update

  def complited?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = p next_question
    save!
  end
end
  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_validation_set_next_question
    questions = test.questions.order(:id)
    current_question_index = questions.find_index(question)
    self.question = questions[current_question_index + 1] if current_question_index
  end

  def correct_answer?(answer_ids)
    correct_answers.count == correct_answers.count

    (correct_answers.count == correct_answers.where(id: answer_ids).count) &&
    correct_answers.count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end


