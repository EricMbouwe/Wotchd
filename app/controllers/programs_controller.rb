class ProgramsController < ApplicationController
  before_action :require_login
  before_action :set_caller, only: [:index]
  before_action :set_title, only: [:index]

  def new
    @program = Program.new
  end

  def index
    if @caller == 'ungrouped'
      @programs = current_user.programs.no_group.ordered_by_most_recent
      @programs_amount = current_user.programs.no_group.total_hours
    else
      @programs = current_user.programs.ordered_by_most_recent
      @programs_amount = current_user.programs.total_hours
    end
  end

  def create
    @program = current_user.programs.create(program_params)

    if @program.save
      redirect_to programs_path(caller: 'full'), notice: 'program successfully created!'
    else
      render :new
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to programs_path(caller: 'full')
  end

  private

  def program_params
    params.require(:program).permit(:name, :amount, :group_id)
  end

  def set_caller
    @caller = params[:caller]
  end

  def set_title
    @title = @caller == 'full' ? 'My programs' : 'My shuffled programs'
  end
end
