class User < ApplicationRecord
  def tests(level)
    Test.joins("INNER JOIN user_tests ut ON ut.user_id = #{id} AND ut.test_id = tests.id")
        .where(level: level)
  end
end
