class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.float :balance
      t.datetime :date
      t.integer :user_id
      t.integer :category_id
      t.integer :main_budget_id
    end
  end
end
