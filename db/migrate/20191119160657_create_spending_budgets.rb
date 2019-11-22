class CreateSpendingBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :spending_budgets do |t|
      t.string :budget_type
      t.string :category
      t.string :budget_classification
      t.decimal :budget_classification_amount, precision: 8, scale: 2
      t.decimal :budget_daily_amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
