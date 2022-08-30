class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create new]
  before_action :set_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: @test.questions.map(&:id)
  end

  def show
    render plain: @question.body
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(body: params[:question][:body])
    if @question.save
      render plain: "question is saved #{@question.id}"
    else
      render plain: "question not saved"
    end
  end

  def destroy
    if @question.destroy
      render plain: "question delete #{@question.id}"
    else
      render plain: "question not delete"
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: "not found"
  end
end
