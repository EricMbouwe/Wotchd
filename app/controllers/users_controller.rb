class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]
  before_action :set_programs, only: [:details]
  before_action :set_caller, only: [:details]

  def show
    @user = User.find(params[:id])
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

  def details
    if @caller == 'day'
      @day = @progs.daily.total_hours
      flash[:notice] = "Watched Today: #{@day} hours"
    elsif @caller == 'week'
      @week = @progs.weekly.total_hours
      flash[:notice] = "Watched This Week: #{@week} hours"
    else
      @month = @progs.monthly.total_hours
      flash[:notice] = "Watched This Month: #{@month} hours"
    end
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end

  def set_programs
    @progs = current_user.programs
  end

  def set_caller
    @caller = params[:caller]
  end
end
