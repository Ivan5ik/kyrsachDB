class Car < ApplicationRecord
  def car_name
    brand + " " + model
  end
end
