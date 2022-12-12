class FeedbackController < ApplicationController
  def new
  end

  def create
    FeedbackMailer.feedback(current_user, params[:message]).deliver_now
    redirect_to root_path
  end
end
