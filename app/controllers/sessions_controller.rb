class SessionsController < ApplicationController

  include CurrentUserConcern

  def new
    render :new
  end

  def create
    @user = User.find_by(name: params[:name])
    
    if @user
      session[:user_id] = @user.id
      redirect_to events_path
    else
      flash[:alert] = "'" + params[:name] + "' : is a Wrong User Name !!"
      redirect_to session_new_path
    end
  end

  def destroy
    reset_session
    redirect_to session_new_path
  end
end