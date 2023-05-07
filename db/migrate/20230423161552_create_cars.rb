class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.integer :graduation_year, null: false
      t.integer :year_license_plate, null: false
      t.integer :tank_volume, null: false
      t.float :engine_power, null: false
      t.string :type_fuel, null: false
      t.bigint :client_id, null: false
      t.timestamps
    end
  end
end
