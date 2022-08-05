class Test < ApplicationRecord

  has_many(:questions)
  belongs_to :category
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  def self.for_category(name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id AND categories.title = '#{name}'").order(id: "DESC")
   end
end
