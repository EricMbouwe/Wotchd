class RegistrationsController < ApplicationController
  before_action :set_user, only: %i[:edit, :update, :destroy]
  before_action :require_login, except: %i[:new, create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create!(
      name: params[:name], 
      email: params[:email], 
      password: params[:password],
    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      flash[:alert] = 'operation failed'
      redirect_to new_registration_path
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    set_user
    @user.destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_login
    # session[:user_id] = nil
    if session[:user_id]
      true
    else
      redirect_to new_session_path
      false
    end
  end

end