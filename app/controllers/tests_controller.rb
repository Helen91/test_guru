class TestsController < ApplicationController
  before_action :set_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
  end

  def start
    @user = User.last
    @user.tests.push(@test)
    redirect_to @user.user_test(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
