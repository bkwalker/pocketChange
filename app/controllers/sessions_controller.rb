class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user.save
      session[:user_id] = user.id
      notice = "Signed in!"
      logger.debug "URL to redirect to:"
      redirect_to root_path, :notice => notice
    else
      raise "Failed to login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
