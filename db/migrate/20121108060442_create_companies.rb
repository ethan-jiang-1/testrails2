class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :location
      t.integer :logo_id


      t.timestamps
    end
    add_index :companies, :logo_id
  end
end
