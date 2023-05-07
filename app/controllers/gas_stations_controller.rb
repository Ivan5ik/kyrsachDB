class GasStationsController < ApplicationController
  def destroy
    GasStation.find(params[:id]).destroy

    flash[:notice] = 'Gas station was destroyed'
    redirect_to gas_stations_pages_path
  end

  def new; end

  def create
    GasStation.create(gas_station_params)

    flash[:notice] = 'Gas station was created'

    redirect_to gas_stations_pages_path
  end

  def update
    gas_station = GasStation.find(params[:id])

    gas_station.update(gas_station_params)

    flash[:notice] = 'Gas station was updated'

    redirect_to gas_stations_pages_path
  end

  def edit
    @gas_station = GasStation.find(params[:id])
  end

  private

  def gas_station_params
    params.require(:gas_station).permit(GasStation.column_names.map(&:to_sym))
  end
end
