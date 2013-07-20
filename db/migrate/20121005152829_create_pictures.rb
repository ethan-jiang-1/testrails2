class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :imageable, :polymorphic => true
      t.string :uuid,         :limit => 36
      t.string :content_type, :limit => 16
      t.string :store_loc,    :limit => 10
      t.string :store_uri
      t.binary :local_data, :limit => 4.megabyte

      t.timestamps
    end
    add_index :pictures, :uuid
  end
end
