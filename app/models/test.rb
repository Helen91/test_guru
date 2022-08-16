class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id", optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  scope :easy, -> { where(level: 0..1)}
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY)}
  scope :by_category_title, -> (title) { joins(:category).where(category: { title: title }) }

  def self.for_category(title)
    by_category_title(title).order(id: "DESC").pluck(:title)
  end
end
