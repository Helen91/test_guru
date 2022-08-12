class Answer < ApplicationRecord
  belongs_to :question
  
  validates :body, presence: true
  validate :max_count
  
  scope :correct, -> { where(correct: true) }

  private
  
  def max_count
    if self.class.where(question_id: question_id).size >= 4
      errors.add(:max_count) 
    end
  end
end
