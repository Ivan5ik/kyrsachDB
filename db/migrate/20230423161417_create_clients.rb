class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :address, null: false
      t.string :credit_card, null: false
      t.timestamps
    end
  end
end
