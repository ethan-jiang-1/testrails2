class AddManagerIdColumnToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :manager_id, :integer
    add_index :employees, :manager_id
  end
end
