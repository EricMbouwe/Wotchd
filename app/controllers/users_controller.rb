class UsersController < ApplicationController
  def Index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @label_name = 'Update user'
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end