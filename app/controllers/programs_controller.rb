class ProgramsController < ApplicationController
  def new
    @program = Program.new
  end

  def index
    # @programs_amount = Program.total_hours
    # @programs_amount = Program.sum(:amount)
    
    caller = params[:caller]
    @programs = current_user.programs.grouped.ordered_by_most_recent if caller == 'grouped'
    @programs = current_user.full_programs.ordered_by_most_recent if caller == 'full'
    @programs = current_user.programs.no_group.ordered_by_most_recent if caller == 'ungrouped'
  end

  def create
    @program = current_user.programs.create(program_params)

    if @program.save
      redirect_to programs_path(caller: 'full'), notice: 'program successfully created!'
    else
      # redirect_to new_program_path, alert: @program.errors.full_messages.join('. ').to_s
      render :new
    end
  end

  def destroy
    @program = Program.find(param[:id])
    @program.destroy
    redirect_to programs_path
  end

  def program_params
    params.require(:program).permit(:name, :amount, :group)
  end

end
