class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  def self.for_category(name)
    joins(:category).where(category: { title: name }).order(id: "DESC")
  end
end
