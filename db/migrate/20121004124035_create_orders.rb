class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :track_no, :limit => 36
      t.text :details
      t.references :customer
      t.references :employee
      t.date :order_date

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
