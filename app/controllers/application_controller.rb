class ApplicationController < ActionController::Base
  def require_login
    return true unless session[:user_id].nil?

    flash[:notice] = 'You most log in to access this page.'

    redirect_to new_session_path
    false
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end
end
