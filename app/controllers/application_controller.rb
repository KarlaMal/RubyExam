class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  def current_user
    if session[:userid]
      return User.find(session[:userid])
    end
    return false
  end

  def require_login
    if !session[:userid]
      redirect_to login_path
    else
      @user = User.find(session[:userid])
    end
  end

  # add to controller:  before_action :require_login
end
