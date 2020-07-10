class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end

  def create
    @group = Group.create(
      name: params[:name],
      icon: params[:icon]
    )

    if @group.save
      redirect_to groups_path, notice: 'group created'
    else
      redirect_to new_group_path, alert: @group.errors.full_messages.join('. ').to_s
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update
      redirect_to group_path, notice: 'group succefully updated'
    else
      redirect_to edit_group_path, alert: 'failed to update group'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end