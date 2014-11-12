class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to home_path
    else
      redirect_to login_path, :alert => exception.message
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
