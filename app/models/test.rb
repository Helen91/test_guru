class Test < ApplicationRecord
  def self.for_category(name)
    categories = Category.where(title: name)
    tests = Test.find_by(category_id: categories)
   end
end
