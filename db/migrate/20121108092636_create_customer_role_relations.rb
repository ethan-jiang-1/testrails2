class CreateCustomerRoleRelations < ActiveRecord::Migration
  def change
    create_table :customer_role_relations do |t|
      t.references :customer
      t.references :role

      t.timestamps
    end
    add_index :customer_role_relations, :customer_id
    add_index :customer_role_relations, :role_id
  end
end
