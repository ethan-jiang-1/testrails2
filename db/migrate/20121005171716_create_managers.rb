class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.references :employee

      t.timestamps
    end
    add_index :managers, :employee_id
  end
end
