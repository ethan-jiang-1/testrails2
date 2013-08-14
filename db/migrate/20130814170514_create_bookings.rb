class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :what
      t.string :state

      t.timestamps
    end
  end
end
