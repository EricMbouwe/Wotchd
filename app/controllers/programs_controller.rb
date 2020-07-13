class ProgramsController < ApplicationController
  before_action :require_login

  def new
    @program = Program.new
  end

  def index
    caller = params[:caller]
    @title = caller == 'full' ? 'My programs' : 'Shuffled programs'
    @programs = current_user.programs.grouped.ordered_by_most_recent if caller == 'grouped'
    @programs = current_user.full_programs.ordered_by_most_recent if caller == 'full'
    @programs = current_user.programs.no_group.ordered_by_most_recent if caller == 'ungrouped'

    @programs_amount = current_user.programs.total_hours if caller == 'full'
    @programs_amount = current_user.programs.no_group.total_hours  if caller == 'ungrouped'
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
    @program = Program.find(param[:id])
    @program.destroy
    redirect_to programs_path
  end

  def program_params
    params.require(:program).permit(:name, :amount, :group_id)
  end
end
