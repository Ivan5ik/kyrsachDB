class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.bigint :client_id, null: false
      t.bigint :car_id, null: false
      t.bigint :gas_station_id, null: false
      t.bigint :fuel_id, null: false
      t.integer :fuel_volume, null: false
      t.datetime :datatime_refueling, null: false
      t.bigint :total_cost, null: false
      t.bigint :administrator_id, null: false
    end
  end
end
