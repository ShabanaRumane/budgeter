class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :type, :transaction_type
    rename_column :transactions, :amount, :transaction_amount
  end
end
