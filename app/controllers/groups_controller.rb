class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all.order_by_name
  end

  def create
    @group = Group.create(group_params)

    if @group.save
      redirect_to groups_path, notice: 'group created'
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @group = Group.find(params[:id])
    @programs = @group.programs.all.ordered_by_most_recent
    @group_amount = @programs.total_hours
    # @group_amount = @group.programs.where("user_id = @user.id")
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def group_params
    params.require(:group).permit(:name, :avatar)
  end
end
