class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :manager_id
      t.string :email
      t.string :phone
      t.references :company
      t.references :picture

      t.timestamps
    end

    add_index :employees, :manager_id
    add_index :employees, :company_id
    add_index :employees, :picture_id
  end
end
