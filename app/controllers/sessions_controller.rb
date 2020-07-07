class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by(name: params[:name])
    
    if @user
      session[:user_id] = @user.id
      redirect_to new_registration_path, notice: "You have successfully logged in."
    else
      redirect_to new_session_path, notice: "Something went wrong, try again."
    end
  end
   
  def logged_in
    @current_user ? true : false
  end

  def destroy
    reset_session
    flash[:notice] = "You have successfully logged out."
    redirect_to new_session_path
  end
end