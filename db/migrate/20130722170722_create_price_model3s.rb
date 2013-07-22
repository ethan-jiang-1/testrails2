class CreatePriceModel3s < ActiveRecord::Migration
  def change
    create_table :price_model3s do |t|
      t.integer :priceX
      t.integer :priceY

      t.timestamps
    end
  end
end
