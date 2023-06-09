class CreateAdministarators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :position, null: false
      t.timestamps
    end
  end
end
