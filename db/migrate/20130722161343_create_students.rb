class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :course
      t.integer :duratoin
      t.string :day_job
      t.string :type

      t.timestamps
    end
  end
end
