# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create!(first_name: "Admin", last_name: "Simple", email: "admin@gmail.com", password: "123456")
category = Category.create!(title: "Numbers")

test = Test.create!(title: "Count", level: 1, category_id: category.id)
question = test.questions.create(body: "1")
question.answers.create(
  [{body: "1", correct: true}, {body: "2", correct: false}, {body: "3", correct: false}]
)
