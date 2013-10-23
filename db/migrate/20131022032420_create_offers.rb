class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.string :state
      t.string :state_message
      t.integer :price_per_night
      t.integer :price_from_mmc
      t.integer :price_from_opr
      t.string :comment

      t.timestamps
    end
  end
end
