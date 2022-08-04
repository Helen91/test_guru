class Test < ApplicationRecord
  def self.for_category(name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id AND categories.title = '#{name}'").order(id: "DESC")
   end
end
