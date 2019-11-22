class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.string :category
      t.string :location
      t.date :transaction_date
      t.decimal :transaction_amount,  precision: 8, scale: 2

      t.timestamps
    end
  end
end
