class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validate :answer_count

  privete
  
  def answer_count
    if answers.size.zero? || answers.size > 4
      errors.add(:answers) 
    end
  end
end
