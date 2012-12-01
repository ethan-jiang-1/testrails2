class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :imageable, :polymorphic => true
      t.string :uuid,  :limit => 36
      t.string :image_type, :limit => 16
      t.string :store_type,  :limit => 10
      t.string :store_uri
      t.timestamps
    end
    add_index :pictures, :uuid
  end
end
