class SessionsController < ApplicationController
  before_action :require_login, except: %i[new create]

  def new
    render :new
  end

  def create
    input = params[:name]
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      redirect_to @user, alert: 'You have successfully logged in.'
    else
      flash[:alert] = "User #{input} is not found!"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_path
  end
end
