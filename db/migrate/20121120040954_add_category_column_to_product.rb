class AddCategoryColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category, :string
    add_column :products, :price, :float
  end
end
