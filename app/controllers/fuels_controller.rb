class FuelsController < ApplicationController
  def destroy
    Fuel.find(params[:id]).destroy

    flash[:notice] = 'Fuel was destroyed'

    redirect_to fuels_pages_path
  end

  def new; end

  def create
    Fuel.create(fuel_params)

    flash[:notice] = 'Fuel was created'

    redirect_to fuels_pages_path
  end

  def update
    fuel = Fuel.find(params[:id])

    fuel.update(fuel_params)

    flash[:notice] = 'Fuel was updated'

    redirect_to fuels_pages_path
  end

  def edit
    @fuel = Fuel.find(params[:id])
  end

  private

  def fuel_params
    params.require(:fuel).permit(Fuel.column_names.map(&:to_sym))
  end
end
