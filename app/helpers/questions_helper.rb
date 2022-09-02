module QuestionsHelper
  def question_header(action, test)
    case action
    when "new"
      "Create New #{test.title} Question"
    when "edit"
      "Edit #{test.title} Question"
    end
  end
end
