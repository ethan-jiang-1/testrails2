class AddRoleColumnToUserAdmin < ActiveRecord::Migration
  def change
    add_column :user_admins, :role, :string
  end
end
