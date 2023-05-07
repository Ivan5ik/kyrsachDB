class CreateLoyaltyPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :loyalty_programs do |t|
      t.string :name, null: false
      t.integer :bonus_count, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.timestamps
    end
  end
end
