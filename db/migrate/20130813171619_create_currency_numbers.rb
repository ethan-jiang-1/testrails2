class CreateCurrencyNumbers < ActiveRecord::Migration
  def change
    create_table :currency_numbers do |t|
      t.float :float1
      t.float :float2
      t.decimal :decimal1, :precision => 10, :scale =>2
      t.decimal :decimal2, :precision => 10, :scale =>2
      t.integer :integer1
      t.integer :integer2

      t.timestamps
    end
  end
end
