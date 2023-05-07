class CreateFuels < ActiveRecord::Migration[7.0]
  def change
    create_table :fuels do |t|
      t.string :type_fuel, null: false
      t.decimal :price, null: false
      t.timestamps
    end
  end
end
