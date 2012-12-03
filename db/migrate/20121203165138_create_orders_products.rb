class CreateOrdersProducts < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.references :order
      t.references :product

      t.timestamps
    end
    add_index :orders_products, :order_id
    add_index :orders_products, :product_id
  end
end
