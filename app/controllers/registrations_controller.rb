class RegistrationsController < ApplicationController

  def create
    @user = User.create!(
      name: params[:name], 
      email: params[:email], 
      password: params[:password],
    )

    if @user
      session[:user_id] = @user.id
      redirect_to root
    else
      flash[:alert] = 'operation failed'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end