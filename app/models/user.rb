class User < ApplicationRecord
  def test_level(num)
    Test.where(level: num)
  end
end
