class FeedbackMailer < ApplicationMailer
  def feedback(user, message)
    @user = user
    @message = message

    mail to: "admin@gmail.com"
  end
end
