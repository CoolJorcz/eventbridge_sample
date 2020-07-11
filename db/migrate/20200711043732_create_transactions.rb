class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :sale_price, null: false
      t.timestamp :purchase_date, default: ->{ 'CURRENT_TIMESTAMP' }
      t.bigint :transaction_id, null: false
      t.string :customer_email, null: false
      t.references :book, null: false

      t.timestamps
    end
  end
end
