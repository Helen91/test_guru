# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(age: 10, first_name: 'Helo', last_name: 'word')
category = Category.create(title: "Ruby")
test = Test.create(title: "Ruby", level: 1, category_id: category.id)
user_test = UserTest.create(user_id: user.id, test_id: test.id)
question = Question.create(test_id: test.id, body: "how are you?")
answers = Answer.create(question_id: question.id, body: "fine", correct: true)