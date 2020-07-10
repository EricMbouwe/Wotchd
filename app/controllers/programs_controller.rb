class ProgramsController < ApplicationController
  def new
    @program = Program.new
  end

  def index
    @user = User.find(params[:id])
    @programs = Program.all.ordered_by_most_recent
    @programs_nogroup = Program.all.no_group.ordered_by_most_recent
    @user_programs = @user.programs.ordered_by_most_recent
    @user_programs_nogroup = @user.programs.no_group.ordered_by_most_recent
  end

  def create
    @user = User.find(session[:id])
    # @program = @user.programs.build(program_params)

    @program = @current_user.program.create(
      name: params[:name],
      amount: params[:amount],
      group: params[:group]
    )

    if @program.save
      redirect_to programs_path, notice: 'program successfully created!'
    else
      redirect_to new_program_path, alert: @program.errors.full_messages.join('. ').to_s
    end
  end

  def edit
    @program = Program.find(param[:id])
  end

  def show
    @program = Program.find(param[:id])
  end

  def update
    @program = Program.find(param[:id])
  end

  def destroy
    @program = Program.find(param[:id])
  end

  def program_params
    params.require(:program).permit(:name, :amount, :group)
  end
end
