class SessionsController < ApplicationController
  def new
  end

  def create
    username = User.find_by(username: params[:username])
    if username.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid username/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to attractions_url, notice: "Logged out"
  end
end
