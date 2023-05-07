class AdministratorsController < ApplicationController
  def destroy
    Administrator.find(params[:id]).destroy

    flash[:notice] = 'Administrator was destroyed'

    redirect_to administrators_pages_path
  end

  def new; end

  def create
    Administrator.create(administrator_params)

    flash[:notice] = 'Administrator was created'

    redirect_to administrators_pages_path
  end

  def update
    administrator = Administrator.find(params[:id])

    administrator.update(administrator_params)

    flash[:notice] = 'Administrator was updated'

    redirect_to administrators_pages_path
  end

  def edit
    @administrator = Administrator.find(params[:id])
  end

  private

  def administrator_params
    params.require(:administrator).permit(Administrator.column_names.map(&:to_sym))
  end
end
