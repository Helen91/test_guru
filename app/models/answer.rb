class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_count, if: :new_record?

  scope :correct, -> { where(correct: true) }

  private

  def max_count
    if question.answers.size >= 4
      errors.add(:max_count, "4 answers max")
    end
  end
end
