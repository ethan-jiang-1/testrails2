class CreatePriceModel2s < ActiveRecord::Migration
  def change
    create_table :price_model2s do |t|
      t.integer :priceA
      t.integer :priceB
      t.integer :priceC

      t.timestamps
    end
  end
end
