class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  # before_action :require_login
 
  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged-in to access this section'
      redirect_to new_session_path
    end
  end

  def logged_in?
    @current_user ? true : false
  end

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end


  # def require_login
  #   # session[:user_id] = nil
  #   if session[:user_id]
  #     true
  #   else
  #     redirect_to new_session_path
  #     false
  #   end
  # end
end
