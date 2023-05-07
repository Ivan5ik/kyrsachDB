class CreateCurrentDateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :current_date_transactions do |t|
      t.bigint :client_id, null: false
      t.string :loyalty_program_id, null: false
      t.integer :count_bonus, null: false
      t.timestamps
    end
  end
end
