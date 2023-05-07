class CreateUserLoyaltyPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_loyalty_programs do |t|
      t.bigint :client_id, null: false
      t.bigint :loyalty_program_id, null: false
      t.integer :count_bonus, null: false
      t.timestamps
    end
  end
end
