class LoyaltyProgramsController < ApplicationController
  def destroy
    LoyaltyProgram.find(params[:id]).destroy

    flash[:notice] = 'Loyalty programs was destroyed'
    redirect_to loyalty_programs_pages_path
  end

  def new; end

  def create
    LoyaltyProgram.create(loyalty_program_params)

    flash[:notice] = 'Loyalty programs was created'

    redirect_to loyalty_programs_pages_path
  end

  def update
    loyalty_program = LoyaltyProgram.find(params[:id])

    loyalty_program.update(loyalty_program_params)

    flash[:notice] = 'Loyalty programs was updated'

    redirect_to loyalty_programs_pages_path
  end

  def edit
    @loyalty_program = LoyaltyProgram.find(params[:id])
  end

  private

  def loyalty_program_params
    params.require(:loyalty_program).permit(LoyaltyProgram.column_names.map(&:to_sym))
  end
end
