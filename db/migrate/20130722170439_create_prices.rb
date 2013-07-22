class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :heir_id
      t.string :heir_type
      t.integer :base_price

      t.timestamps
    end
  end
end
