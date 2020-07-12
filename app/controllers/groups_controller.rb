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
      # redirect_to new_group_path, alert: @group.errors.full_messages.join('. ').to_s
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @programs = @group.programs.all.ordered_by_most_recent
    # @total_amount = @programs.sum(:amount) 

    # @programs.each do |program| do
    # total
    # program.amount += total
    # end
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
    params.require(:group).permit(:name, :icon)
  end
end