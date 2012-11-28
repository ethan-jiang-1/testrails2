class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :track_no
      t.text :details
      t.references :customer
      t.date :order_date

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
