class CreateLocationRelations < ActiveRecord::Migration
  def change
    create_table :location_relations do |t|
      t.integer :loc_from_id
      t.integer :loc_to_id

      t.timestamps
    end
    add_index :location_relations, :loc_from_id
    add_index :location_relations, :loc_to_id
  end
end



