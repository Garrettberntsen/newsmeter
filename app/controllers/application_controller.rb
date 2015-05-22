class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
  	if current_user.nil?
  		redirect_to login_path, :notice => "You must first log in to access this page."
  	end
  end

  helper_method :current_user, :authenticate_user

end
