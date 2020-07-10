class RegistrationsController < ApplicationController
  before_action :set_user, only: %i[:edit, :update, :destroy, :show]
  # skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    @button = 'Create User'
    render :new
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      flash[:alert] = "Could not save user"
      redirect_to new_registration_path
    end
  end

  def edit
    @user = User.find(params[:id])
    @button = 'Update user'
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

end