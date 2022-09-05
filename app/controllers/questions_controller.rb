class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create new]
  before_action :set_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(body: params[:question][:body])
    if @question.save
      render plain: "question is saved #{@question.id}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(body: params[:question][:body])
      redirect_to @question
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
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
