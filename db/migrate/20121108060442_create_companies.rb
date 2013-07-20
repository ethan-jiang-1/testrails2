class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :location
      t.references :picture


      t.timestamps
    end
    add_index :companies, :picture_id
  end
end
