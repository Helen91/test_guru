class User < ApplicationRecord

  has_many :user_tests
  has_many :tests, through: :user_tests

  def tests_by_level(level)
    Test.joins("INNER JOIN user_tests ut ON ut.user_id = #{id} AND ut.test_id = tests.id")
        .where(level: level)
  end
end
