class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path, :alert => exception.message
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
