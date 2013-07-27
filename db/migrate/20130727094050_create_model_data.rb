class CreateModelData < ActiveRecord::Migration
  def change
    create_table :model_data do |t|
      t.boolean :boolean1
      t.boolean :boolean2
      t.date :date1
      t.date :date2
      t.datetime :datetime1
      t.datetime :datetime2
      t.decimal :decimal1
      t.decimal :decimal2
      t.float :float1
      t.float :float2
      t.integer :integer1
      t.integer :integer2
      t.string :string1
      t.string :string2
      t.time :time1
      t.time :time2
      t.timestamp :timestamp1
      t.timestamp :timestamp2
      t.text :text1
      t.text :text2

      t.timestamps
    end
  end
end
