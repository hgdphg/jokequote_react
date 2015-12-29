class SessionController < ApplicationController
  def new
    id = session[:user_id]
    if id
      redirect_to homepage_path
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to homepage_path
    else
      redirect_to login_path, alert: "Invalid username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    redirect_to homepage_path
  end
end
