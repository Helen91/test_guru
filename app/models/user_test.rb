class UserTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true, foreign_key: "question_id"

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  PART_TEST_COMPLIT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def percent_of_completion
    (correct_questions.to_f / test.questions.count) * 100
  end

  def current_question_number
    test.questions.order(id: :asc).find_index(current_question) + 1
  end

  def success?
    percent_of_completion >= PART_TEST_COMPLIT
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end
end
