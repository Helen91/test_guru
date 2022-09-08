class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def start
    @user = User.last
    @test = Test.find(params[:id])
    @user.tests.push(@test)
    redirect_to @user.user_test(@test)
  end
end
