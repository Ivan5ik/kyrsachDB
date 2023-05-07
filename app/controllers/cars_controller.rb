class CarsController < ApplicationController
  def destroy
    Car.find(params[:id]).destroy

    flash[:notice] = 'Car was destroyed'

    redirect_to cars_pages_path
  end

  def new; end

  def create
    Car.create(car_params)

    flash[:notice] = 'Car was created'

    redirect_to cars_pages_path
  end

  def update
    car = Car.find(params[:id])

    car.update(car_params)

    flash[:notice] = 'Car was updated'

    redirect_to cars_pages_path
  end

  def edit
    @car = Car.find(params[:id])
  end

  private

  def car_params
    params.require(:car).permit(Car.column_names.map(&:to_sym))
  end
end
