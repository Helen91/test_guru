class Admin::QuestionsController < Admin::BaseController

  before_action :set_test, only: %i[create new]
  before_action :set_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
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

  def question_params
    params.require(:question).permit(:body)
  end
end
