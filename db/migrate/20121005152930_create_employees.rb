class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :manager_id
      t.timestamps
    end

    add_index :employees, :manager_id
  end
end
