# frozen_string_literal: true

class User < ApplicationRecord
  include Auth
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test"

  has_secure_password 

  def tests_by_level(level)
    tests.where(level: level)
  end
  
  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
