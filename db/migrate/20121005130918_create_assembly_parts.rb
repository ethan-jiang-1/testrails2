class CreateAssemblyParts < ActiveRecord::Migration
  def change
#TODO: Rail_admin failed to handle a model (table) without primary key - the id... wait till i have time to deal with it - but removing primary key for pure relationship table (not model) is recommended by Rails, otherwise there will be some side-effect when you query...
#   create_table :assembly_parts, :id => false do |t|
    create_table :assembly_parts do |t|
      t.references :assembly
      t.references :part

    end
    add_index :assembly_parts, :assembly_id
    add_index :assembly_parts, :part_id
  end
end
