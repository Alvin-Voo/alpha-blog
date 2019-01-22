class ApplicationController < ActionController::Base

  # methods defined here are available for all child controllers

  helper_method :current_user, :logged_in? # declare these as available helper methods to view as well

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end
