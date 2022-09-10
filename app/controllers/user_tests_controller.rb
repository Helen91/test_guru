class UserTestsController < ApplicationController
  before_action :set_user_test, only: %i[show result update]

  def show
  end

  def result
  end

  def update
    @user_test.accept!(params[:answer_ids])
    render :show
  end

  private
  
  def set_user_test
    @user_test = UserTest.find(params[:id])
  end
end
