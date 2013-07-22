class CreatePriceModel1s < ActiveRecord::Migration
  def change
    create_table :price_model1s do |t|
      t.integer :price1
      t.integer :price2
      t.integer :price3
      t.integer :price4
      t.integer :price5

      t.timestamps
    end
  end
end
