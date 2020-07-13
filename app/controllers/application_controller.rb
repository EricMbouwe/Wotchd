class ApplicationController < ActionController::Base
  # before_action :require_login
 
  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged-in to access this section'
      redirect_to root_path
    end
  end

  def logged_in?
    @current_user ? true : false
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

end
