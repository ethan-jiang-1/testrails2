class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, :polymorphic => true
      t.string :external_url
      t.string :asset_path
      t.timestamps
    end
  end
end
