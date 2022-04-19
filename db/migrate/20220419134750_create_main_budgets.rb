class CreateMainBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :main_budgets do |t|
      t.integer :balance
    end
  end
end
