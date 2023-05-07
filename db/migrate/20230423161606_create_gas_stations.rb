class CreateGasStations < ActiveRecord::Migration[7.0]
  def change
    create_table :gas_stations do |t|
      t.string :address, null: false
      t.integer :count_availability, null: false
      t.bigint :history_order, null: false
      t.timestamps
    end
  end
end
