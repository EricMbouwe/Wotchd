class RegistrationsController < ApplicationController
  before_action :set_user, only: %i[:edit, :update, :destroy, :show]
  # before_action :require_login, except: %i[:new, create]

  def new
    @label_name = 'Sign Up'
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
      redirect_to root_path, notice: 'Operation failed.' 
    end
  end

  def edit
    @label_name = 'Update user'
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
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