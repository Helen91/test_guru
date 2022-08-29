class QuestionsController < ApplicationController
  before_action :set_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: @test.questions.map(&:id)
  end

  def show
    @question = @test.questions.find(params[:id])
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
    @question = @test.question.find(params[:id])
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

   def rescue_with_test_not_found
    render plain: "not found"
  end
end
