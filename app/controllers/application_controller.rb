class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    if params[:email]
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
  	 current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def session_is
    session[:yes]=[] if session[:yes]==nil 
    session[:no]=[] if session[:no]==nil 

  end

  helper_method :current_user
end
