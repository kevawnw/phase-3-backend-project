class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.float :amount
      t.datetime :date
      t.integer :wallet_id
    end
  end
end
