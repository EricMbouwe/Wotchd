class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]

  def show
    @user = User.find(params[:id])
    @total = @user.programs.sum(:amount)
  end

  def new
    @user = User.new
    @button = 'Sign Up'
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @button = 'Update'
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User sucessfully updated'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'User was successfully deleted.'
  end

  def details
    @user = current_user
    @day = @user.programs.daily.total_hours
    @week = @user.programs.weekly.total_hours
    @month = @user.programs.monthly.total_hours
    @year = @user.programs.yearly.total_hours

    flash[:notice] = "watched today: #{@day} hours"
    flash[:notice] = "watched this week: #{@week} hours"
    flash[:notice] = "watched this month: #{@month} hours"
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end
end
