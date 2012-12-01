class CreateBlobPictures < ActiveRecord::Migration
  def change
    create_table :blob_pictures do |t|
      t.string :uuid, :limit => 32
      t.binary :data, :limit => 4.megabyte

      t.timestamps
    end
    add_index :blob_pictures, :uuid
  end
end
