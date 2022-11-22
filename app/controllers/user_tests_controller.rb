class UserTestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user_test, only: %i[show result update gist]

  def index
    @user_tests = UserTest.all
  end

  def show
  end

  def result
  end

  def update
    @user_test.accept!(params[:answer_ids])

    if @user_test.completed?
      TestsMailer.completed_test(@user_test).deliver_now
      redirect_to result_user_test_path(@user_test)
    else
      render :show
    end
  end
    

  def gist
    result = GistQuestionServices.new(@user_test.current_question, client: Octokit::Client.new(access_token: ENV["ACCESS_TOKEN"]))
    flash_options = if result.success?
        url = result.url
        Gist.create(question: @user_test.current_question, user: current_user, url: url )
        { notice: view_context.link_to(t('.success'), url) }
      else
        { alert: t('.failure') }
      end
    redirect_to @user_test, flash_options
  end

  private

  def set_user_test
    @user_test = UserTest.find(params[:id])
  end
end
