module UserTestsHelper
  def percent_of_completion
    (@user_test.correct_questions.to_f / @user_test.test.questions.count) * 100
  end

  def current_question_number
    @user_test.test.questions.order(id: :asc).find_index(@user_test.current_question) + 1
  end
end
