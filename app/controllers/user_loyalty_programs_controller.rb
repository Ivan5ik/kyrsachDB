class UserLoyaltyProgramsController < ApplicationController
  def destroy
    UserLoyaltyProgram.find(params[:id]).destroy

    flash[:notice] = 'User Loyalty Program was destroyed'

    redirect_to user_loyalty_programs_pages_path
  end

  def new; end

  def create
    UserLoyaltyProgram.create(user_loyalty_program_params)

    flash[:notice] = 'User Loyalty Program was created'

    redirect_to user_loyalty_programs_pages_path
  end

  def update
    user_loyalty_program = UserLoyaltyProgram.find(params[:id])

    user_loyalty_program.update(user_loyalty_program_params)

    flash[:notice] = 'User Loyalty Program was updated'

    redirect_to user_loyalty_programs_pages_path
  end

  def edit
    @user_loyalty_program = UserLoyaltyProgram.find(params[:id])
  end

  private

  def user_loyalty_program_params
    params.require(:user_loyalty_program).permit(UserLoyaltyProgram.column_names.map(&:to_sym))
  end
end
