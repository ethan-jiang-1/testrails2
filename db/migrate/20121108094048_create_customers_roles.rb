class CreateCustomersRoles < ActiveRecord::Migration
  def change
    create_table :customers_roles, :id=>false do |t|
      t.references :customer
      t.references :role

    end
    add_index :customers_roles, :customer_id
    add_index :customers_roles, :role_id
  end
end
