class CreateAssemblyParts < ActiveRecord::Migration
  def change
#   create_table :assembly_parts, :id => false do |t|
    create_table :assembly_parts do |t|
      t.references :assembly
      t.references :part

      t.timestamps
    end
    add_index :assembly_parts, :assembly_id
    add_index :assembly_parts, :part_id
  end
end
