class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.integer :quantity
      t.decimal :total
      t.string :credit_card_number
      t.string :credit_card_exp

      t.timestamps
    end
  end
end
