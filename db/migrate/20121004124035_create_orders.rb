class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :product
      t.references :customer

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
