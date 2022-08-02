class User < ApplicationRecord
  def tests(level)
    Test.where(id: UserTest.where(user_id: self.id).pluck(:test_id), level: level)
  end
end
