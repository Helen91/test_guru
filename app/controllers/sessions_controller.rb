class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:redirect_url] || root_path
    else
      flash[:alert] = "Please email and password"
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    session[:redirect_url] = nil
    redirect_to login_path
  end

end