class AddIndexToEmailFieldOnOrders < ActiveRecord::Migration[6.0]
  def change
    change_table :orders do |t|
      t.index :email, unique: true
    end
  end
end
